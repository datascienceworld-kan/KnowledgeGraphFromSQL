"""
CombinedAgent - Runs SQLAgent, CypherAgent, and GroundTruthAccuracyEvaluator simultaneously.

This script executes all three components in parallel threads to process
natural language queries and evaluate accuracy.
"""

import threading
import time
import sys
import os
import json
from datetime import datetime

sys.path.append(os.path.dirname(__file__))

from SQLAgent import SQLAgent
from CypherAgent import CypherAgent
from GroundTruthAccuracyEvaluator import GroundTruthAccuracyEvaluator


class CombinedAgentRunner:
    """Runs SQLAgent, CypherAgent, and GroundTruthAccuracyEvaluator simultaneously in separate threads."""
    
    def __init__(self):
        """Initialize the combined agent runner."""
        self.sql_agent = None
        self.cypher_agent = None
        self.accuracy_evaluator = None
        self.sql_thread = None
        self.cypher_thread = None
        self.accuracy_thread = None
        self.start_time = None
        self.sql_complete = False
        self.cypher_complete = False
        self.accuracy_complete = False
        self.sql_success = False
        self.cypher_success = False
        self.accuracy_success = False
        
        self.sql_stats = {
            'easy': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'db_time': 0, 'tokens': 0},
            'medium': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'db_time': 0, 'tokens': 0},
            'hard': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'db_time': 0, 'tokens': 0}
        }
        self.cypher_stats = {
            'easy': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'db_time': 0, 'tokens': 0},
            'medium': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'db_time': 0, 'tokens': 0},
            'hard': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'db_time': 0, 'tokens': 0}
        }
        
    def run_sql_agent(self):
        """Run SQL Agent in a separate thread."""
        print(f"[SQL] Starting SQL Agent at {datetime.now().strftime('%H:%M:%S')}")
        try:
            self.sql_agent = SQLAgent()
            
            if not self.sql_agent.test_connection():
                print("[SQL] Failed to connect to PostgreSQL database.")
                self.sql_complete = True
                return
            
            print("[SQL] SQLAgent initialized and connected successfully!")
            
            self._process_sql_queries()
            
            self.sql_success = True
            print(f"[SQL] SQL Agent completed successfully at {datetime.now().strftime('%H:%M:%S')}")
            
        except Exception as e:
            print(f"[SQL] Error in SQL Agent: {e}")
        finally:
            self.sql_complete = True
    
    def run_cypher_agent(self):
        """Run Cypher Agent in a separate thread."""
        print(f"[CYPHER] Starting Cypher Agent at {datetime.now().strftime('%H:%M:%S')}")
        try:
            self.cypher_agent = CypherAgent()
            
            if not self.cypher_agent.test_connection():
                print("[CYPHER] Failed to connect to Neo4j database.")
                self.cypher_complete = True
                return
            
            print("[CYPHER] CypherAgent initialized and connected successfully!")
            
            self._process_cypher_queries()
            
            self.cypher_success = True
            print(f"[CYPHER] Cypher Agent completed successfully at {datetime.now().strftime('%H:%M:%S')}")
            
        except Exception as e:
            print(f"[CYPHER] Error in Cypher Agent: {e}")
        finally:
            self.cypher_complete = True
    
    def run_accuracy_evaluator(self):
        """Run Ground Truth Accuracy Evaluator in a separate thread."""
        print(f"[ACCURACY] Starting Ground Truth Accuracy Evaluator at {datetime.now().strftime('%H:%M:%S')}")
        
        print("[ACCURACY] Waiting for SQL and Cypher agents to complete...")
        while not (self.sql_complete and self.cypher_complete):
            time.sleep(2)
        
        if not (self.sql_success and self.cypher_success):
            print("[ACCURACY] Cannot run accuracy evaluation - one or both agents failed")
            self.accuracy_complete = True
            return
        
        print("[ACCURACY] Both agents completed, starting accuracy evaluation...")
        
        try:
            self.accuracy_evaluator = GroundTruthAccuracyEvaluator()
            
            print("[ACCURACY] GroundTruthAccuracyEvaluator initialized!")
            
            results = self.accuracy_evaluator.evaluate_all_levels()
            
            self.accuracy_evaluator.print_summary_report(results)
            
            self.accuracy_success = True
            print(f"[ACCURACY] Accuracy Evaluator completed successfully at {datetime.now().strftime('%H:%M:%S')}")
            
        except Exception as e:
            print(f"[ACCURACY] Error in Accuracy Evaluator: {e}")
        finally:
            self.accuracy_complete = True
    
    def _process_sql_queries(self):
        """Process SQL queries (replicated from SQLAgent main)."""
        files_config = [
            {"path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_easy.json", "level": "easy"},
            {"path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_medium.json", "level": "medium"},
            {"path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_hard.json", "level": "hard"}
        ]
        
        for file_config in files_config:
            file_path = file_config["path"]
            level = file_config["level"]
            
            print(f"[SQL] Processing {level} level queries...")
            
            file_results = []
            
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                
                for item in data:
                    query = item.get('query', '')
                    item_id = item.get('id', '')
                    
                    if not query:
                        continue
                    
                    result = self.sql_agent.query(query, return_raw=True)
                    
                    output_record = {
                        'query': query,
                        'sql_command': result.get('sql_query', '') if result.get('success', False) else '',
                        'answer': result.get('answer', '') if result.get('success', False) else '',  # Use simplified answer instead of results
                        'id': item_id,
                        'llm_generation_time': result.get('llm_generation_time', 0) if result.get('success', False) else 0,
                        'sql_execution_time': result.get('sql_execution_time', 0) if result.get('success', False) else 0,
                        'total_token': result.get('total_tokens', 0) if result.get('success', False) else 0,
                        'success': result.get('success', False)
                    }
                    
                    file_results.append(output_record)
                
                output_file = f"/home/lam/oldKG/output/sql/bfsi_sql_imp_{level}.json"
                os.makedirs(os.path.dirname(output_file), exist_ok=True)
                
                with open(output_file, 'w', encoding='utf-8') as f:
                    json.dump(file_results, f, indent=2, ensure_ascii=False)
                
                successful = sum(1 for r in file_results if r['success'])
                failed = len(file_results) - successful
                llm_time = sum(r['llm_generation_time'] for r in file_results if r['success'])
                sql_time = sum(r['sql_execution_time'] for r in file_results if r['success'])
                tokens = sum(r['total_token'] for r in file_results if r['success'])
                
                self.sql_stats[level] = {
                    'total': len(file_results),
                    'successful': successful,
                    'failed': failed,
                    'llm_time': llm_time,
                    'db_time': sql_time,
                    'tokens': tokens
                }
                
                print(f"[SQL] {level.capitalize()}: {successful}/{len(file_results)} successful")
                
            except Exception as e:
                print(f"[SQL] Error processing {level}: {e}")
        
        print(f"[SQL] Summary completed - check output/sql/ for results")
    
    def _process_cypher_queries(self):
        """Process Cypher queries (replicated from CypherAgent main)."""
        files_config = [
            {"path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_easy.json", "level": "easy"},
            {"path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_medium.json", "level": "medium"},
            {"path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_hard.json", "level": "hard"}
        ]
        
        for file_config in files_config:
            file_path = file_config["path"]
            level = file_config["level"]
            
            print(f"[CYPHER] Processing {level} level queries...")
            
            file_results = []
            
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                
                for item in data:
                    query = item.get('query', '')
                    item_id = item.get('id', '')
                    
                    if not query:
                        continue
                    
                    result = self.cypher_agent.query(query, return_raw=True)
                    
                    output_record = {
                        'query': query,
                        'cypher_command': result.get('cypher_query', '') if result.get('success', False) else '',
                        'answer': result.get('answer', '') if result.get('success', False) else '',  # Use simplified answer instead of results
                        'id': item_id,
                        'llm_generation_time': result.get('llm_generation_time', 0) if result.get('success', False) else 0,
                        'cypher_execution_time': result.get('cypher_execution_time', 0) if result.get('success', False) else 0,
                        'total_token': result.get('total_tokens', 0) if result.get('success', False) else 0,
                        'success': result.get('success', False)
                    }
                    
                    file_results.append(output_record)
                
                output_file = f"/home/lam/oldKG/output/cypher/bfsi_cypher_imp_{level}.json"
                os.makedirs(os.path.dirname(output_file), exist_ok=True)
                
                with open(output_file, 'w', encoding='utf-8') as f:
                    json.dump(file_results, f, indent=2, ensure_ascii=False)
                
                successful = sum(1 for r in file_results if r['success'])
                failed = len(file_results) - successful
                llm_time = sum(r['llm_generation_time'] for r in file_results if r['success'])
                cypher_time = sum(r['cypher_execution_time'] for r in file_results if r['success'])
                tokens = sum(r['total_token'] for r in file_results if r['success'])
                
                self.cypher_stats[level] = {
                    'total': len(file_results),
                    'successful': successful,
                    'failed': failed,
                    'llm_time': llm_time,
                    'db_time': cypher_time,
                    'tokens': tokens
                }
                
                print(f"[CYPHER] {level.capitalize()}: {successful}/{len(file_results)} successful")
                
            except Exception as e:
                print(f"[CYPHER] Error processing {level}: {e}")
        
        print(f"[CYPHER] Summary completed - check output/cypher/ for results")
    
    def run_both(self):
        """Run all three components simultaneously."""
        print("Starting Combined Agent Runner with 3 parallel tasks")
        print("=" * 80)
        
        self.start_time = time.time()
        
        self.sql_thread = threading.Thread(target=self.run_sql_agent, name="SQLAgent")
        self.cypher_thread = threading.Thread(target=self.run_cypher_agent, name="CypherAgent")
        self.accuracy_thread = threading.Thread(target=self.run_accuracy_evaluator, name="AccuracyEvaluator")
        
        print("Starting SQL Agent thread...")
        self.sql_thread.start()
        
        print("Starting Cypher Agent thread...")
        self.cypher_thread.start()
        
        print("Starting Accuracy Evaluator thread (will wait for agents)...")
        self.accuracy_thread.start()
        
        self._monitor_progress()
        
        self.sql_thread.join()
        self.cypher_thread.join()
        self.accuracy_thread.join()
        
        self._print_final_summary()
        
        if self.cypher_agent:
            self.cypher_agent.close()
    
    def _monitor_progress(self):
        """Monitor and display progress of all three components."""
        print("\nMONITORING PROGRESS:")
        print("-" * 70)
        
        while not (self.sql_complete and self.cypher_complete and self.accuracy_complete):
            sql_status = "Complete" if self.sql_complete else "Running"
            cypher_status = "Complete" if self.cypher_complete else "Running"
            accuracy_status = "Complete" if self.accuracy_complete else ("Waiting" if not (self.sql_complete and self.cypher_complete) else "Running")
            
            elapsed = time.time() - self.start_time
            print(f"\rTime: {elapsed:.1f}s | SQL: {sql_status} | Cypher: {cypher_status} | Accuracy: {accuracy_status}", end="", flush=True)
            
            time.sleep(2)
        
        print()
    
    def _print_final_summary(self):
        """Print comprehensive final summary of all components."""
        total_time = time.time() - self.start_time
        
        print("\n" + "=" * 120)
        print("COMPREHENSIVE COMBINED AGENTS SUMMARY REPORT")
        print("=" * 120)
        
        print(f"Total Parallel Execution Time: {total_time:.2f} seconds")
        print(f"SQL Agent: {'Success' if self.sql_success else 'Failed'}")
        print(f"Cypher Agent: {'Success' if self.cypher_success else 'Failed'}")
        print(f"Accuracy Evaluator: {'Success' if self.accuracy_success else 'Failed'}")
        
        if self.sql_success and self.cypher_success and self.accuracy_success:
            print("\n" + "=" * 120)
            print("DETAILED STATISTICS BY DIFFICULTY LEVEL")
            print("=" * 120)
            
            for level in ['easy', 'medium', 'hard']:
                sql_stats = self.sql_stats[level]
                cypher_stats = self.cypher_stats[level]
                
                print(f"\n{level.upper()} LEVEL COMPARISON:")
                print("-" * 80)
                
                print(f"   Total Queries:")
                print(f"      SQL:    {sql_stats['total']:>3}")
                print(f"      Cypher: {cypher_stats['total']:>3}")
                
                sql_success_rate = (sql_stats['successful']/sql_stats['total']*100) if sql_stats['total'] > 0 else 0
                cypher_success_rate = (cypher_stats['successful']/cypher_stats['total']*100) if cypher_stats['total'] > 0 else 0
                
                print(f"   Successful Queries:")
                print(f"      SQL:    {sql_stats['successful']:>3}/{sql_stats['total']} ({sql_success_rate:.1f}%)")
                print(f"      Cypher: {cypher_stats['successful']:>3}/{cypher_stats['total']} ({cypher_success_rate:.1f}%)")
                
                print(f"   Failed Queries:")
                print(f"      SQL:    {sql_stats['failed']:>3}/{sql_stats['total']} ({100-sql_success_rate:.1f}%)")
                print(f"      Cypher: {cypher_stats['failed']:>3}/{cypher_stats['total']} ({100-cypher_success_rate:.1f}%)")
                
                if sql_stats['successful'] > 0 and cypher_stats['successful'] > 0:
                    print(f"   LLM Generation Time:")
                    print(f"      SQL:    {sql_stats['llm_time']:>7.3f}s (avg: {sql_stats['llm_time']/sql_stats['successful']:.3f}s)")
                    print(f"      Cypher: {cypher_stats['llm_time']:>7.3f}s (avg: {cypher_stats['llm_time']/cypher_stats['successful']:.3f}s)")
                    
                    print(f"   Database Execution Time:")
                    print(f"      SQL:    {sql_stats['db_time']:>7.3f}s (avg: {sql_stats['db_time']/sql_stats['successful']:.3f}s)")
                    print(f"      Cypher: {cypher_stats['db_time']:>7.3f}s (avg: {cypher_stats['db_time']/cypher_stats['successful']:.3f}s)")
                    
                    print(f"   Token Usage:")
                    print(f"      SQL:    {sql_stats['tokens']:>7} tokens (avg: {sql_stats['tokens']/sql_stats['successful']:.0f})")
                    print(f"      Cypher: {cypher_stats['tokens']:>7} tokens (avg: {cypher_stats['tokens']/cypher_stats['successful']:.0f})")
            
            print("\n" + "=" * 120)
            print("OVERALL TOTALS COMPARISON")
            print("=" * 120)
            
            sql_total_queries = sum(stats['total'] for stats in self.sql_stats.values())
            sql_total_successful = sum(stats['successful'] for stats in self.sql_stats.values())
            sql_total_failed = sum(stats['failed'] for stats in self.sql_stats.values())
            sql_total_llm_time = sum(stats['llm_time'] for stats in self.sql_stats.values())
            sql_total_db_time = sum(stats['db_time'] for stats in self.sql_stats.values())
            sql_total_tokens = sum(stats['tokens'] for stats in self.sql_stats.values())
            
            cypher_total_queries = sum(stats['total'] for stats in self.cypher_stats.values())
            cypher_total_successful = sum(stats['successful'] for stats in self.cypher_stats.values())
            cypher_total_failed = sum(stats['failed'] for stats in self.cypher_stats.values())
            cypher_total_llm_time = sum(stats['llm_time'] for stats in self.cypher_stats.values())
            cypher_total_db_time = sum(stats['db_time'] for stats in self.cypher_stats.values())
            cypher_total_tokens = sum(stats['tokens'] for stats in self.cypher_stats.values())
            
            print(f"SUMMARY STATISTICS:")
            print(f"   Total Queries Processed:")
            print(f"      SQL:    {sql_total_queries} queries")
            print(f"      Cypher: {cypher_total_queries} queries")
            print(f"      Combined: {sql_total_queries + cypher_total_queries} total queries processed")
            
            sql_overall_success = (sql_total_successful/sql_total_queries*100) if sql_total_queries > 0 else 0
            cypher_overall_success = (cypher_total_successful/cypher_total_queries*100) if cypher_total_queries > 0 else 0
            
            print(f"   Success Rates:")
            print(f"      SQL:    {sql_total_successful}/{sql_total_queries} ({sql_overall_success:.1f}%)")
            print(f"      Cypher: {cypher_total_successful}/{cypher_total_queries} ({cypher_overall_success:.1f}%)")
            
            print(f"   Total Processing Times:")
            print(f"      SQL Total:    LLM: {sql_total_llm_time:.3f}s + DB: {sql_total_db_time:.3f}s = {sql_total_llm_time + sql_total_db_time:.3f}s")
            print(f"      Cypher Total: LLM: {cypher_total_llm_time:.3f}s + DB: {cypher_total_db_time:.3f}s = {cypher_total_llm_time + cypher_total_db_time:.3f}s")
            
            print(f"   Total Token Usage:")
            print(f"      SQL:    {sql_total_tokens:,} tokens")
            print(f"      Cypher: {cypher_total_tokens:,} tokens")
            print(f"      Combined: {sql_total_tokens + cypher_total_tokens:,} total tokens")
            
            print("\nPERFORMANCE INSIGHTS:")
            print(f"   Parallel Execution Benefit:")
            sequential_time = (sql_total_llm_time + sql_total_db_time) + (cypher_total_llm_time + cypher_total_db_time)
            time_saved = sequential_time - total_time
            time_saved_percent = (time_saved / sequential_time * 100) if sequential_time > 0 else 0
            print(f"      Sequential would take: ~{sequential_time:.1f}s")
            print(f"      Parallel execution: {total_time:.1f}s")
            print(f"      Time saved: ~{time_saved:.1f}s ({time_saved_percent:.1f}% faster)")
            
            if sql_total_successful > 0 and cypher_total_successful > 0:
                print(f"   Database Performance Comparison:")
                avg_sql_db_time = sql_total_db_time / sql_total_successful
                avg_cypher_db_time = cypher_total_db_time / cypher_total_successful
                
                if avg_sql_db_time < avg_cypher_db_time:
                    faster_pct = ((avg_cypher_db_time - avg_sql_db_time) / avg_cypher_db_time * 100)
                    print(f"      SQL queries execute {faster_pct:.1f}% faster on average")
                else:
                    faster_pct = ((avg_sql_db_time - avg_cypher_db_time) / avg_sql_db_time * 100)
                    print(f"      Cypher queries execute {faster_pct:.1f}% faster on average")
                
                if sql_overall_success > cypher_overall_success:
                    diff = sql_overall_success - cypher_overall_success
                    print(f"      SQL has {diff:.1f}% higher success rate")
                elif cypher_overall_success > sql_overall_success:
                    diff = cypher_overall_success - sql_overall_success
                    print(f"      Cypher has {diff:.1f}% higher success rate")
                else:
                    print(f"      Both agents have equal success rates")
            
            print(f"\nOUTPUT FILES:")
            print(f"   SQL Results: /home/lam/oldKG/output/sql/bfsi_sql_imp_[easy|medium|hard].json")
            print(f"   Cypher Results: /home/lam/oldKG/output/cypher/bfsi_cypher_imp_[easy|medium|hard].json")
            print(f"   Accuracy Results: /home/lam/oldKG/output/ground_truth_accuracy_evaluation.json")
            
            print("\nCOMPLETE EVALUATION WITH ACCURACY FINISHED!")
            
        elif self.sql_success and self.cypher_success:
            print("\nAgents completed successfully, but Accuracy Evaluation failed")
            print("SQL and Cypher Results available in: /home/lam/oldKG/output/")
            
            print("\n" + "=" * 120)
            print("AGENTS COMPLETED - ACCURACY EVALUATION WAS ATTEMPTED IN PARALLEL")
            print("=" * 120)
            
            combined_results = self._create_comprehensive_results()
            
            comprehensive_output_path = '/home/lam/oldKG/output/comprehensive_evaluation_results.json'
            with open(comprehensive_output_path, 'w', encoding='utf-8') as f:
                json.dump(combined_results, f, indent=2, ensure_ascii=False)
            
            print(f"\nAGENT RESULTS:")
            print(f"   Agent Results: {comprehensive_output_path}")
            print(f"   Detailed Breakdown Available in JSON")
            
            print("\nAGENT EVALUATION FINISHED!")
            
        else:
            print("\nONE OR MORE COMPONENTS FAILED")
            if not self.sql_success:
                print("SQL Agent failed")
            if not self.cypher_success:
                print("Cypher Agent failed")
            if not self.accuracy_success and (self.sql_success or self.cypher_success):
                print("Accuracy Evaluator failed")
            print("Please check database connections and configurations.")
            
            combined_results = self._create_comprehensive_results()
            comprehensive_output_path = '/home/lam/oldKG/output/comprehensive_evaluation_results.json'
            with open(comprehensive_output_path, 'w', encoding='utf-8') as f:
                json.dump(combined_results, f, indent=2, ensure_ascii=False)
            print(f"Failure report saved: {comprehensive_output_path}")
        
        print("\n" + "=" * 120)
        print("COMBINED PROCESSING COMPLETE!")
        print("=" * 120)
    
    def _create_comprehensive_results(self, accuracy_results=None):
        """Create comprehensive results combining agent performance and accuracy evaluation"""
        sql_total_successful = sum(level['successful'] for level in self.sql_stats.values())
        sql_total_queries = sum(level['total'] for level in self.sql_stats.values())
        sql_total_llm_time = sum(level['llm_time'] for level in self.sql_stats.values())
        sql_total_db_time = sum(level['db_time'] for level in self.sql_stats.values())
        sql_total_tokens = sum(level['tokens'] for level in self.sql_stats.values())
        
        cypher_total_successful = sum(level['successful'] for level in self.cypher_stats.values())
        cypher_total_queries = sum(level['total'] for level in self.cypher_stats.values())
        cypher_total_llm_time = sum(level['llm_time'] for level in self.cypher_stats.values())
        cypher_total_db_time = sum(level['db_time'] for level in self.cypher_stats.values())
        cypher_total_tokens = sum(level['tokens'] for level in self.cypher_stats.values())
        
        sql_overall_success = (sql_total_successful / sql_total_queries * 100) if sql_total_queries > 0 else 0
        cypher_overall_success = (cypher_total_successful / cypher_total_queries * 100) if cypher_total_queries > 0 else 0
        
        total_time = time.time() - self.start_time
        
        comprehensive_results = {
            'evaluation_metadata': {
                'total_execution_time_seconds': round(total_time, 2)
            },
            'agent_performance_summary': {
                'sql_agent': {
                    'total_queries': sql_total_queries,
                    'successful_queries': sql_total_successful,
                    'success_rate_percentage': round(sql_overall_success, 2),
                    'total_llm_time_seconds': round(sql_total_llm_time, 2),
                    'total_db_time_seconds': round(sql_total_db_time, 2),
                    'avg_llm_time_per_query': round(sql_total_llm_time / sql_total_queries, 3) if sql_total_queries > 0 else 0,
                    'avg_db_time_per_query': round(sql_total_db_time / sql_total_queries, 3) if sql_total_queries > 0 else 0,
                    'total_tokens_used': sql_total_tokens,
                    'difficulty_breakdown': self.sql_stats
                },
                'cypher_agent': {
                    'total_queries': cypher_total_queries,
                    'successful_queries': cypher_total_successful,
                    'success_rate_percentage': round(cypher_overall_success, 2),
                    'total_llm_time_seconds': round(cypher_total_llm_time, 2),
                    'total_db_time_seconds': round(cypher_total_db_time, 2),
                    'avg_llm_time_per_query': round(cypher_total_llm_time / cypher_total_queries, 3) if cypher_total_queries > 0 else 0,
                    'avg_db_time_per_query': round(cypher_total_db_time / cypher_total_queries, 3) if cypher_total_queries > 0 else 0,
                    'total_tokens_used': cypher_total_tokens,
                    'difficulty_breakdown': self.cypher_stats
                },
                'comparison': {
                    'sql_vs_cypher_success_rate_diff': round(sql_overall_success - cypher_overall_success, 2),
                    'better_success_rate': 'SQL' if sql_overall_success > cypher_overall_success else 'Cypher' if cypher_overall_success > sql_overall_success else 'Equal',
                    'parallel_execution_time_seconds': round(total_time, 2)
                }
            }
        }
        
        if accuracy_results:
            comprehensive_results['ground_truth_accuracy'] = accuracy_results
        
        comprehensive_results['output_files'] = {
            'sql_results': [
                '/home/lam/oldKG/output/sql/bfsi_sql_imp_easy.json',
                '/home/lam/oldKG/output/sql/bfsi_sql_imp_medium.json',
                '/home/lam/oldKG/output/sql/bfsi_sql_imp_hard.json'
            ],
            'cypher_results': [
                '/home/lam/oldKG/output/cypher/bfsi_cypher_imp_easy.json',
                '/home/lam/oldKG/output/cypher/bfsi_cypher_imp_medium.json',
                '/home/lam/oldKG/output/cypher/bfsi_cypher_imp_hard.json'
            ],
            'comprehensive_results': '/home/lam/oldKG/output/comprehensive_evaluation_results.json'
        }
        
        return comprehensive_results


def main():
    """Main function to run all three components simultaneously."""
    print("Combined SQL, Cypher Agent & Accuracy Evaluator Runner")
    print("This will run all three components simultaneously:")
    print("1. SQLAgent - Generate SQL results")
    print("2. CypherAgent - Generate Cypher results") 
    print("3. GroundTruthAccuracyEvaluator - Evaluate accuracy")
    print()
    
    try:
        runner = CombinedAgentRunner()
        runner.run_both()
    except KeyboardInterrupt:
        print("\n\nProcess interrupted by user")
        print("Some results may be incomplete.")
    except Exception as e:
        print(f"\n\nUnexpected error: {e}")
        print("Please check your database connections and try again.")


if __name__ == "__main__":
    main()