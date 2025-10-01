#!/usr/bin/env python3
"""
Ground Truth Accuracy Evaluator
Compares SQL and Cypher results against ground truth using algorithmic comparison
"""

import json
import logging
import re
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Any

class GroundTruthAccuracyEvaluator:
    def __init__(self, sample_size=None, model_name=None):        
        logging.basicConfig(
            level=logging.INFO,
            format='%(levelname)s:%(name)s:%(message)s'
        )
        self.logger = logging.getLogger(__name__)
        self.model_name = model_name
        
        self.sample_size = sample_size
        if sample_size:
            self.logger.info(f"Running in SAMPLE mode with {sample_size} items per level")
        
        self.processed_count = 0
        
        self.ground_truth_files = {
            'easy': '/home/lam/oldKG/database/structured_database/bfsi_ground_truth_easy.json',
            'medium': '/home/lam/oldKG/database/structured_database/bfsi_ground_truth_medium.json',
            'hard': '/home/lam/oldKG/database/structured_database/bfsi_ground_truth_hard.json'
        }
        
        # Create output paths based on model name
        if self.model_name:
            model_folder = self.model_name.split('/')[-1] if '/' in self.model_name else self.model_name
            base_output = f'/home/lam/oldKG/output/{model_folder}'
            self.logger.info(f"Using model-based output path: {base_output}")
        else:
            base_output = '/home/lam/oldKG/output'
            self.logger.info(f"Using default output path: {base_output}")
        
        self.sql_files = {
            'easy': f'{base_output}/sql/bfsi_sql_imp_easy.json',
            'medium': f'{base_output}/sql/bfsi_sql_imp_medium.json',
            'hard': f'{base_output}/sql/bfsi_sql_imp_hard.json'
        }
        
        self.cypher_files = {
            'easy': f'{base_output}/cypher/bfsi_cypher_imp_easy.json',
            'medium': f'{base_output}/cypher/bfsi_cypher_imp_medium.json',
            'hard': f'{base_output}/cypher/bfsi_cypher_imp_hard.json'
        }

    def _load_json_file(self, file_path: str) -> List[Dict]:
        """Load JSON file safely"""
        try:
            self.logger.info(f"Attempting to load file: {file_path}")
            with open(file_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
                self.logger.info(f"Successfully loaded {len(data)} items from {file_path}")
                return data
        except Exception as e:
            self.logger.error(f"Error loading {file_path}: {e}")
            return []
    
    def _extract_figure(self, text):
        """Extract numeric value from text answer - based on evaluation.ipynb logic"""
        if not text or text == "" or text is None:
            return 0.0
        
        text_str = str(text).strip()
        if 'None' in text_str or text_str.lower() == 'none' or text_str == "":
            return 0.0
        
        # Find all numbers in the text
        numbers = re.findall(r"-?\d+\.?\d*", text_str)
        numbers = [float(num) for num in numbers if num]
        
        if len(numbers) >= 1:
            return numbers[0]
        elif len(numbers) == 0:
            return 0.0
        else:
            return numbers
    
    def _normalize_answer(self, answer: Any) -> str:
        """Normalize answer for comparison"""
        if answer is None or answer == "" or answer == []:
            return "0"
        
        if isinstance(answer, str):
            if answer.strip().lower() in ['none', '', 'null']:
                return "0"
            return answer.strip()
        
        if isinstance(answer, (int, float)):
            # Remove unnecessary .0 for whole numbers
            if isinstance(answer, float) and answer.is_integer():
                return str(int(answer))
            return str(answer)
        
        if isinstance(answer, list) and len(answer) > 0:
            # Handle list format from implementation results
            first_result = answer[0]
            if isinstance(first_result, dict):
                values = list(first_result.values())
                if values:
                    return self._normalize_answer(values[0])
            else:
                return self._normalize_answer(first_result)
        
        return str(answer)
    
    def _algorithmic_compare(self, ground_truth: Any, implementation_result: Any) -> bool:
        """Compare answers using algorithmic approach instead of LLM"""
        
        # Normalize both answers
        gt_normalized = self._normalize_answer(ground_truth)
        impl_normalized = self._normalize_answer(implementation_result)
        
        # Direct string comparison (case-insensitive)
        if gt_normalized.lower() == impl_normalized.lower():
            return True
        
        # Numeric comparison using extract_figure logic
        try:
            gt_num = self._extract_figure(gt_normalized)
            impl_num = self._extract_figure(impl_normalized)
            
            # Compare as floats with small tolerance for floating point precision
            if isinstance(gt_num, (int, float)) and isinstance(impl_num, (int, float)):
                return abs(float(gt_num) - float(impl_num)) < 1e-9
                
        except (ValueError, TypeError):
            # If numeric comparison fails, fall back to string comparison
            pass
        
        # Fallback: check if the strings contain the same essential content
        gt_clean = re.sub(r'[^\w\d]', '', gt_normalized.lower())
        impl_clean = re.sub(r'[^\w\d]', '', impl_normalized.lower())
        
        return gt_clean == impl_clean

    def _compare_with_ground_truth(self, query: str, result: Any, ground_truth: Any, query_id: str, query_type: str) -> Dict:
        """Use algorithmic comparison instead of LLM to compare result against ground truth"""
        
        self.logger.info(f"Processing {query_type.upper()} query ID: {query_id}")
        
        try:
            # Use algorithmic comparison
            is_correct = self._algorithmic_compare(ground_truth, result)
            assessment = 'CORRECT' if is_correct else 'INCORRECT'
            
            self.logger.info(f"Query {query_id}: GT='{ground_truth}' vs Result='{result}' -> {assessment}")
            
            self.processed_count += 1
            if self.processed_count % 10 == 0:
                self.logger.info(f"Progress: {self.processed_count} comparisons completed")
            
            return {
                'id': query_id,
                'query': query,
                'ground_truth': ground_truth,
                f'{query_type}_result': result,
                'assessment': assessment,
                'type': query_type
            }
        except Exception as e:
            self.logger.error(f"Failed on query {query_id}: {e}")
            return {
                'id': query_id,
                'query': query,
                'ground_truth': ground_truth,
                f'{query_type}_result': result,
                'assessment': 'INCORRECT',
                'type': query_type,
                'error': str(e)
            }

    def evaluate_difficulty_level(self, difficulty: str) -> Dict[str, Any]:
        """Evaluate accuracy for a specific difficulty level"""
        self.logger.info(f"Evaluating {difficulty.upper()} level")
        
        ground_truth_data = self._load_json_file(self.ground_truth_files[difficulty])
        sql_results = self._load_json_file(self.sql_files[difficulty])
        cypher_results = self._load_json_file(self.cypher_files[difficulty])
        
        if not ground_truth_data:
            self.logger.error(f"Failed to load ground truth data for {difficulty}")
            return {}
        
        ground_truth_lookup = {item['id']: item for item in ground_truth_data}
        sql_lookup = {item['id']: item for item in sql_results if 'answer' in item}
        cypher_lookup = {item['id']: item for item in cypher_results if 'answer' in item}
        
        all_results = []
        processed_count = 0
        
        for gt_item in ground_truth_data:
            if self.sample_size and processed_count >= self.sample_size:
                self.logger.info(f"Reached sample limit of {self.sample_size} items")
                break
                
            query_id = gt_item['id']
            query = gt_item['query']
            ground_truth_answer = gt_item['answer']
            
            if query_id in sql_lookup:
                sql_item = sql_lookup[query_id]
                sql_result = sql_item['answer']
                result = self._compare_with_ground_truth(
                    query, sql_result, ground_truth_answer, query_id, 'sql'
                )
                all_results.append(result)
            
            if query_id in cypher_lookup:
                cypher_item = cypher_lookup[query_id]
                cypher_result = cypher_item['answer']
                result = self._compare_with_ground_truth(
                    query, cypher_result, ground_truth_answer, query_id, 'cypher'
                )
                all_results.append(result)
            
            processed_count += 1
        
        self.logger.info(f"Processing complete. Processed {len(all_results)} comparisons")
        
        sql_comparisons = [r for r in all_results if r['type'] == 'sql']
        cypher_comparisons = [r for r in all_results if r['type'] == 'cypher']
        
        sql_stats = {
            'correct': len([r for r in sql_comparisons if r['assessment'] == 'CORRECT']),
            'incorrect': len([r for r in sql_comparisons if r['assessment'] == 'INCORRECT']),
            'total': len(sql_comparisons)
        }
        cypher_stats = {
            'correct': len([r for r in cypher_comparisons if r['assessment'] == 'CORRECT']),
            'incorrect': len([r for r in cypher_comparisons if r['assessment'] == 'INCORRECT']),
            'total': len(cypher_comparisons)
        }
        
        sql_accuracy = (sql_stats['correct'] / sql_stats['total'] * 100) if sql_stats['total'] > 0 else 0
        cypher_accuracy = (cypher_stats['correct'] / cypher_stats['total'] * 100) if cypher_stats['total'] > 0 else 0
        
        results = {
            'difficulty': difficulty,
            'sql_evaluation': {
                'total_comparisons': sql_stats['total'],
                'correct': sql_stats['correct'],
                'incorrect': sql_stats['incorrect'],
                'accuracy_percentage': round(sql_accuracy, 2),
                'detailed_comparisons': sql_comparisons
            },
            'cypher_evaluation': {
                'total_comparisons': cypher_stats['total'],
                'correct': cypher_stats['correct'],
                'incorrect': cypher_stats['incorrect'],
                'accuracy_percentage': round(cypher_accuracy, 2),
                'detailed_comparisons': cypher_comparisons
            }
        }
        
        self.logger.info(f"{difficulty.upper()}: SQL {sql_accuracy:.1f}% | Cypher {cypher_accuracy:.1f}%")
        return results

    def evaluate_all_levels(self, sample_size=None) -> Dict[str, Any]:
        """Evaluate accuracy across all difficulty levels"""
        if sample_size:
            self.sample_size = sample_size
            self.logger.info(f"Running evaluation with sample size: {sample_size} per level")
        
        estimated_comparisons = (365 + 365) * 3  # Approximate total comparisons
        if self.sample_size:
            estimated_comparisons = self.sample_size * 2 * 3
        
        self.logger.info("Starting ground truth accuracy evaluation")
        self.logger.info(f"Using algorithmic comparison (no LLM required)")
        self.logger.info(f"Estimated comparisons: {estimated_comparisons}")
        start_time = datetime.now()
        
        all_results = {}
        
        sql_totals = {'correct': 0, 'total': 0}
        cypher_totals = {'correct': 0, 'total': 0}
        
        for difficulty in ['easy', 'medium', 'hard']:
            level_results = self.evaluate_difficulty_level(difficulty)
            if level_results:
                all_results[difficulty] = level_results
                
                sql_totals['correct'] += level_results['sql_evaluation']['correct']
                sql_totals['total'] += level_results['sql_evaluation']['total_comparisons']
                cypher_totals['correct'] += level_results['cypher_evaluation']['correct']
                cypher_totals['total'] += level_results['cypher_evaluation']['total_comparisons']
        
        sql_overall_accuracy = (sql_totals['correct'] / sql_totals['total'] * 100) if sql_totals['total'] > 0 else 0
        cypher_overall_accuracy = (cypher_totals['correct'] / cypher_totals['total'] * 100) if cypher_totals['total'] > 0 else 0
        
        end_time = datetime.now()
        evaluation_time = (end_time - start_time).total_seconds()
        
        comprehensive_results = {
            'timestamp': end_time.isoformat(),
            'evaluation_duration_seconds': round(evaluation_time, 2),
            'overall_summary': {
                'sql_accuracy': {
                    'total_comparisons': sql_totals['total'],
                    'correct_answers': sql_totals['correct'],
                    'accuracy_percentage': round(sql_overall_accuracy, 2)
                },
                'cypher_accuracy': {
                    'total_comparisons': cypher_totals['total'],
                    'correct_answers': cypher_totals['correct'],
                    'accuracy_percentage': round(cypher_overall_accuracy, 2)
                },
                'comparison': {
                    'sql_vs_cypher_diff': round(sql_overall_accuracy - cypher_overall_accuracy, 2),
                    'better_performer': 'SQL' if sql_overall_accuracy > cypher_overall_accuracy else 'Cypher' if cypher_overall_accuracy > sql_overall_accuracy else 'Equal'
                }
            },
            'difficulty_breakdown': all_results
        }
        
        # Create output path based on model name
        if self.model_name:
            model_folder = self.model_name.split('/')[-1] if '/' in self.model_name else self.model_name
            output_path = f'/home/lam/oldKG/output/{model_folder}/ground_truth_accuracy_evaluation.json'
            # Ensure directory exists
            import os
            os.makedirs(os.path.dirname(output_path), exist_ok=True)
        else:
            output_path = '/home/lam/oldKG/output/ground_truth_accuracy_evaluation.json'
            
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(comprehensive_results, f, indent=2, ensure_ascii=False)
        
        self.logger.info(f"Results saved to: {output_path}")
        return comprehensive_results

    def print_summary_report(self, results: Dict[str, Any]):
        """Print a comprehensive summary report"""
        print("\n" + "="*80)
        print("GROUND TRUTH ACCURACY EVALUATION REPORT")
        print("="*80)
        
        overall = results['overall_summary']
        sql_acc = overall['sql_accuracy']
        cypher_acc = overall['cypher_accuracy']
        comparison = overall['comparison']
        
        print(f"OVERALL ACCURACY RESULTS:")
        print(f"   SQL Accuracy:    {sql_acc['correct_answers']:,}/{sql_acc['total_comparisons']:,} ({sql_acc['accuracy_percentage']:.1f}%)")
        print(f"   Cypher Accuracy: {cypher_acc['correct_answers']:,}/{cypher_acc['total_comparisons']:,} ({cypher_acc['accuracy_percentage']:.1f}%)")
        print(f"   Performance Gap: {abs(comparison['sql_vs_cypher_diff']):.1f}% ({comparison['better_performer']} performs better)")
        print(f"   Evaluation Time: {results['evaluation_duration_seconds']:.1f}s")
        
        print(f"\nBREAKDOWN BY DIFFICULTY:")
        print("-" * 80)
        
        for difficulty in ['easy', 'medium', 'hard']:
            if difficulty in results['difficulty_breakdown']:
                level = results['difficulty_breakdown'][difficulty]
                sql_eval = level['sql_evaluation']
                cypher_eval = level['cypher_evaluation']
                
                print(f"{difficulty.upper()}:")
                print(f"   SQL:    {sql_eval['correct']:,}/{sql_eval['total_comparisons']:,} ({sql_eval['accuracy_percentage']:.1f}%) - Correct:{sql_eval['correct']} | Incorrect:{sql_eval['incorrect']}")
                print(f"   Cypher: {cypher_eval['correct']:,}/{cypher_eval['total_comparisons']:,} ({cypher_eval['accuracy_percentage']:.1f}%) - Correct:{cypher_eval['correct']} | Incorrect:{cypher_eval['incorrect']}")
                print()
        
        print("="*80)
        print("GROUND TRUTH ACCURACY EVALUATION COMPLETE")
        print("="*80)

def main():
    """Main execution function"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Ground Truth Accuracy Evaluator')
    parser.add_argument('--sample', type=int, help='Sample size per difficulty level (omit for full evaluation)')
    
    args = parser.parse_args()
    
    evaluator = GroundTruthAccuracyEvaluator(sample_size=args.sample)
    
    results = evaluator.evaluate_all_levels()
    
    evaluator.print_summary_report(results)
    
    # Dynamic output path based on model name
    if hasattr(evaluator, 'model_name') and evaluator.model_name:
        model_folder = evaluator.model_name.split('/')[-1] if '/' in evaluator.model_name else evaluator.model_name
        output_path = f"/home/lam/oldKG/output/{model_folder}/ground_truth_accuracy_evaluation.json"
    else:
        output_path = "/home/lam/oldKG/output/ground_truth_accuracy_evaluation.json"
    print(f"\nDetailed results saved to: {output_path}")

if __name__ == "__main__":
    main()