"""
CypherAgent - A natural language to Cypher query agent using Ollama LLM.

This agent takes natural language questions and converts them to Cypher queries
using the Qwen3:8b model via Ollama, then executes them against a Neo4j database.
"""

import os
from neo4j import GraphDatabase
from typing import Dict, List, Any, Optional, Tuple
import logging
from langchain_ollama import OllamaLLM
import json
import time
import tiktoken
from datetime import datetime

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class CypherAgent:
    """
    A natural language to Cypher agent that uses Ollama LLM to convert
    natural language questions into Cypher queries and execute them.
    """
    
    def __init__(self, 
                 neo4j_uri: str = "bolt://localhost:7687",
                 neo4j_user: str = "neo4j",
                 neo4j_password: str = "MypassW0rk",
                 model_name: str = "qwen3:8b"):
        """
        Initialize the CypherAgent with Neo4j connection and LLM.
        
        Args:
            neo4j_uri: Neo4j connection URI
            neo4j_user: Neo4j username
            neo4j_password: Neo4j password
            model_name: Ollama model name
        """
        self.neo4j_uri = neo4j_uri
        self.neo4j_user = neo4j_user
        self.neo4j_password = neo4j_password
        
        # Initialize Neo4j driver
        self.driver = GraphDatabase.driver(
            neo4j_uri, 
            auth=(neo4j_user, neo4j_password)
        )
        
        # Initialize Ollama LLM
        self.llm = OllamaLLM(
            model=model_name,
            reasoning=False
        )
        
        # Load database schema from schema.md
        self.schema_context = self._load_schema_context()
        
        logger.info(f"CypherAgent initialized with model: {model_name}")
        logger.info(f"Neo4j config: {neo4j_uri}")
    
    def _load_schema_context(self) -> str:
        """Load the database schema context from cypher_schema.md file."""
        try:
            schema_path = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'cypher_schema.md')
            with open(schema_path, 'r', encoding='utf-8') as f:
                return f.read()
        except FileNotFoundError:
            logger.error("cypher_schema.md file not found. Using minimal schema context.")
            return "Database schema information not available."
        except Exception as e:
            logger.error(f"Error loading schema context: {e}")
            return "Database schema information not available."
    
    def _count_tokens(self, text: str, encoding_name: str = "cl100k_base") -> int:
        """
        Count the number of tokens in a text using tiktoken.
        
        Args:
            text: Text to count tokens for
            encoding_name: Encoding name for tiktoken (default: cl100k_base for GPT-4)
            
        Returns:
            Number of tokens
        """
        try:
            encoding = tiktoken.get_encoding(encoding_name)
            return len(encoding.encode(text))
        except Exception as e:
            logger.error(f"Error counting tokens: {e}")
            return 0
    
    def _create_cypher_prompt(self, question: str) -> str:
        """
        Create a prompt for the LLM to convert natural language to Cypher.
        
        Args:
            question: Natural language question
            
        Returns:
            Formatted prompt string
        """
        prompt = f"""You are a Cypher expert. Convert the following natural language question into a Neo4j Cypher query.

DATABASE SCHEMA CONTEXT:
{self.schema_context}

IMPORTANT RULES:
1. Use proper Neo4j Cypher syntax
2. Return ONLY the Cypher query without any explanation or markdown formatting
3. Use meaningful variable names (e.g., c for Customer, a for Account, t for Transaction)
4. For aggregations, use appropriate aggregation functions (COUNT, SUM, AVG, etc.)
5. Use case-insensitive matching with regular expressions when appropriate
6. Follow Neo4j best practices for query performance

QUESTION: {question}

CYPHER QUERY:"""
        
        return prompt
    
    def _execute_cypher_query(self, cypher_query: str) -> Tuple[List[Dict[str, Any]], Optional[str]]:
        """
        Execute Cypher query against the Neo4j database.
        
        Args:
            cypher_query: Cypher query to execute
            
        Returns:
            Tuple of (results, error_message)
        """
        session = None
        try:
            session = self.driver.session()
            result = session.run(cypher_query)
            
            # Convert result to list of dictionaries with string values
            records = []
            for record in result:
                # Convert record to dict and all values to strings
                record_dict = {key: str(value) for key, value in record.items()}
                records.append(record_dict)
            
            return records, None
            
        except Exception as e:
            logger.error(f"Cypher execution error: {e}")
            return [], str(e)
        finally:
            if session:
                session.close()
    
    def _format_results(self, results: List[Dict[str, Any]], limit: int = 20) -> str:
        """
        Format query results for display.
        
        Args:
            results: Query results
            limit: Maximum number of rows to display
            
        Returns:
            Formatted results string
        """
        if not results:
            return "No results found."
        
        # Limit results for display
        display_results = results[:limit]
        total_rows = len(results)
        
        # Create formatted output
        output = []
        output.append(f"Found {total_rows} record(s):")
        output.append("-" * 50)
        
        for i, record in enumerate(display_results, 1):
            output.append(f"Record {i}:")
            for key, value in record.items():
                output.append(f"  {key}: {value}")
            output.append("")
        
        if total_rows > limit:
            output.append(f"... and {total_rows - limit} more records (showing first {limit})")
        
        return "\n".join(output)
    
    def _simplify_answer_with_llm(self, raw_results: List[Dict[str, Any]], question: str) -> str:
        """
        Use LLM to simplify complex query results into a simple string answer.
        
        Args:
            raw_results: Raw query results from database
            question: Original question for context
            
        Returns:
            Simplified string answer
        """
        if not raw_results:
            return ""
        
        # Create a simplified prompt for answer extraction
        results_json = json.dumps(raw_results, indent=2)
        prompt = f"""Based on the query results, provide ONLY the direct answer as a simple string.

Question: {question}

Query Results: {results_json}

Extract the key answer value. Return ONLY the answer value (number, text, etc.) without any additional text or explanation.

Answer:"""

        try:
            simplified_answer = self.llm.invoke(prompt).strip()
            # Clean up common formatting issues
            simplified_answer = simplified_answer.replace('"', '').replace("'", "")
            if simplified_answer.lower() in ['null', 'none', 'n/a']:
                simplified_answer = ""
            return simplified_answer
        except Exception as e:
            logger.error(f"Error simplifying answer: {e}")
            # Fallback: try to extract first value from first result
            if raw_results and isinstance(raw_results[0], dict):
                values = list(raw_results[0].values())
                return str(values[0]) if values else ""
            return ""
    
    def query(self, question: str, return_raw: bool = False) -> Dict[str, Any]:
        """
        Process a natural language question and return Cypher results.
        
        Args:
            question: Natural language question
            return_raw: If True, return raw results instead of formatted string
            
        Returns:
            Dictionary containing query results and metadata
        """        
        try:
            # Generate Cypher query using LLM
            logger.info(f"Processing question: {question}")
            prompt = self._create_cypher_prompt(question)
            
            # Count tokens for prompt
            prompt_tokens = self._count_tokens(prompt)
            
            # Time LLM generation
            llm_start_time = time.time()
            cypher_query = self.llm.invoke(prompt).strip()
            llm_generation_time = time.time() - llm_start_time
            
            # Count tokens for response
            response_tokens = self._count_tokens(cypher_query)
            total_tokens = prompt_tokens + response_tokens
            
            # Clean up the Cypher query (remove any markdown formatting)
            cypher_query = cypher_query.replace('```cypher', '').replace('```', '').strip()
            
            logger.info(f"Generated Cypher: {cypher_query}")
            
            # Execute Cypher query with timing
            cypher_start_time = time.time()
            results, error = self._execute_cypher_query(cypher_query)
            cypher_execution_time = time.time() - cypher_start_time
            
            if error:
                return {
                    'success': False,
                    'question': question,
                    'cypher_query': cypher_query,
                    'error': error,
                    'results': None,
                    'answer': "",  # Empty answer for failed queries
                    'llm_generation_time': llm_generation_time,
                    'cypher_execution_time': cypher_execution_time,
                    'total_tokens': total_tokens
                }
            
            # Format results
            if return_raw:
                formatted_results = results
            else:
                formatted_results = self._format_results(results)
            
            # Generate simplified answer for better evaluation matching
            simplified_answer = self._simplify_answer_with_llm(results, question)
            
            return {
                'success': True,
                'question': question,
                'cypher_query': cypher_query,
                'results': formatted_results,
                'answer': simplified_answer,  # Added simplified answer
                'record_count': len(results),
                'error': None,
                'llm_generation_time': llm_generation_time,
                'cypher_execution_time': cypher_execution_time,
                'total_tokens': total_tokens
            }
            
        except Exception as e:
            logger.error(f"Error processing question: {e}")
            return {
                'success': False,
                'question': question,
                'cypher_query': None,
                'error': str(e),
                'results': None,
                'answer': "",  # Empty answer for failed queries
                'llm_generation_time': 0,
                'cypher_execution_time': 0,
                'total_tokens': 0
            }
    
    def test_connection(self) -> bool:
        """
        Test the Neo4j database connection.
        
        Returns:
            True if connection successful, False otherwise
        """
        session = None
        try:
            session = self.driver.session()
            result = session.run("RETURN 1 as test")
            test_result = result.single()
            logger.info("Neo4j connection test successful")
            return True
        except Exception as e:
            logger.error(f"Neo4j connection test failed: {e}")
            return False
        finally:
            if session:
                session.close()
    
    def get_node_labels(self) -> List[str]:
        """
        Get list of node labels in the Neo4j database.
        
        Returns:
            List of node labels
        """
        session = None
        try:
            session = self.driver.session()
            result = session.run("CALL db.labels()")
            labels = [record["label"] for record in result]
            return labels
        except Exception as e:
            logger.error(f"Error getting node labels: {e}")
            return []
        finally:
            if session:
                session.close()
    
    def close(self):
        """Close the Neo4j driver connection."""
        if self.driver:
            self.driver.close()


def main():
    """
    Read 3 JSON files, extract queries, execute them on Neo4j database, 
    and save results with tracking metrics.
    """
    # Initialize the agent
    agent = CypherAgent()
    
    # Test connection
    if not agent.test_connection():
        print("Failed to connect to Neo4j database. Please check your configuration.")
        return
    
    print("CypherAgent initialized successfully!")
    
    # Define the 3 files to process with their levels
    files_config = [
        {
            "path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_easy.json",
            "level": "easy"
        },
        {
            "path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_medium.json", 
            "level": "medium"
        },
        {
            "path": "/home/lam/oldKG/database/structured_database/bfsi_ground_truth_hard.json",
            "level": "hard"
        }
    ]
    
    # Initialize overall statistics tracking
    overall_stats = {
        'easy': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'cypher_time': 0, 'tokens': 0},
        'medium': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'cypher_time': 0, 'tokens': 0},
        'hard': {'total': 0, 'successful': 0, 'failed': 0, 'llm_time': 0, 'cypher_time': 0, 'tokens': 0}
    }
    
    for file_config in files_config:
        file_path = file_config["path"]
        level = file_config["level"]
        
        print(f"\nProcessing file: {file_path} (Level: {level})")
        
        # Prepare output data for this file
        file_results = []
        
        try:
            # Read JSON file
            with open(file_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
            
            # Process each query in the file
            for item in data:
                query = item.get('query', '')
                item_id = item.get('id', '')
                expected_answer = item.get('answer', '')
                
                if not query:
                    print(f"Skipping item {item_id}: No query found")
                    continue
                
                print(f"Processing query ID: {item_id}")
                print(f"Query: {query}")
                
                # Execute query using CypherAgent
                result = agent.query(query, return_raw=True)
                
                # Prepare output record - keep only specified keys
                output_record = {
                    'query': query,
                    'cypher_command': result.get('cypher_query', '') if result.get('success', False) else '',
                    'answer': result.get('results', []) if result.get('success', False) else [],
                    'id': item_id,
                    'llm_generation_time': result.get('llm_generation_time', 0) if result.get('success', False) else 0,
                    'cypher_execution_time': result.get('cypher_execution_time', 0) if result.get('success', False) else 0,
                    'total_token': result.get('total_tokens', 0) if result.get('success', False) else 0,
                    'success': result.get('success', False)
                }
                
                file_results.append(output_record)
                
                # Print summary
                if result.get('success', False):
                    print(f"  Cypher Generated: {result.get('cypher_query', 'N/A')}")
                    print(f"  LLM Generation Time: {result.get('llm_generation_time', 0):.3f}s")
                    print(f"  Cypher Execution Time: {result.get('cypher_execution_time', 0):.3f}s")
                    print(f"  Total Tokens: {result.get('total_tokens', 0)}")
                    print(f"  Success: {result.get('success', False)}")
                else:
                    print(f"  ERROR: {result.get('error', 'Unknown error')}")
                    print(f"  All values set to empty due to error")
                    print(f"  Success: False")
                print("-" * 60)
                
        except Exception as e:
            print(f"Error processing file {file_path}: {e}")
            continue
    
        # Save results for this file
        output_file = f"/home/lam/oldKG/output/cypher/bfsi_cypher_imp_{level}.json"
        
        # Ensure output directory exists
        os.makedirs(os.path.dirname(output_file), exist_ok=True)
        
        try:
            with open(output_file, 'w', encoding='utf-8') as f:
                json.dump(file_results, f, indent=2, ensure_ascii=False)
            
            print(f"\nResults saved to: {output_file}")
            print(f"Total queries processed for {level}: {len(file_results)}")
            
            # Print summary statistics for this file
            successful_queries = sum(1 for r in file_results if r['success'])
            failed_queries = len(file_results) - successful_queries
            total_llm_time = sum(r['llm_generation_time'] for r in file_results if r['success'])
            total_cypher_time = sum(r['cypher_execution_time'] for r in file_results if r['success'])
            total_tokens = sum(r['total_token'] for r in file_results if r['success'])
            
            # Update overall statistics
            overall_stats[level]['total'] = len(file_results)
            overall_stats[level]['successful'] = successful_queries
            overall_stats[level]['failed'] = failed_queries
            overall_stats[level]['llm_time'] = total_llm_time
            overall_stats[level]['cypher_time'] = total_cypher_time
            overall_stats[level]['tokens'] = total_tokens
            
            print(f"Successful queries: {successful_queries}/{len(file_results)}")
            print(f"Failed queries (empty values): {failed_queries}/{len(file_results)}")
            
            if successful_queries > 0:
                print(f"Total LLM generation time: {total_llm_time:.3f}s")
                print(f"Total Cypher execution time: {total_cypher_time:.3f}s")
                print(f"Total combined time: {total_llm_time + total_cypher_time:.3f}s")
                print(f"Total tokens used: {total_tokens}")
                print(f"Average LLM time per successful query: {total_llm_time/successful_queries:.3f}s")
                print(f"Average Cypher time per successful query: {total_cypher_time/successful_queries:.3f}s")
                print(f"Average tokens per successful query: {total_tokens/successful_queries:.0f}")
            else:
                print("No successful queries to calculate averages.")
            
        except Exception as e:
            print(f"Error saving results for {level}: {e}")
            print(f"Results for {level} not saved!")
        
        print("=" * 80)
    
    # Print comprehensive final summary
    print("\n" + "=" * 100)
    print("COMPREHENSIVE CYPHER SUMMARY REPORT")
    print("=" * 100)
    
    # Summary by level
    for level in ['easy', 'medium', 'hard']:
        stats = overall_stats[level]
        print(f"\n📊 {level.upper()} LEVEL:")
        print(f"   Total Queries: {stats['total']}")
        print(f"   Successful: {stats['successful']} ({stats['successful']/stats['total']*100:.1f}%)" if stats['total'] > 0 else "   Successful: 0 (0.0%)")
        print(f"   Failed: {stats['failed']} ({stats['failed']/stats['total']*100:.1f}%)" if stats['total'] > 0 else "   Failed: 0 (0.0%)")
        
        if stats['successful'] > 0:
            print(f"   LLM Generation Time: {stats['llm_time']:.3f}s")
            print(f"   Cypher Execution Time: {stats['cypher_time']:.3f}s")
            print(f"   Total Time: {stats['llm_time'] + stats['cypher_time']:.3f}s")
            print(f"   Total Tokens: {stats['tokens']}")
            print(f"   Avg LLM Time/Query: {stats['llm_time']/stats['successful']:.3f}s")
            print(f"   Avg Cypher Time/Query: {stats['cypher_time']/stats['successful']:.3f}s")
            print(f"   Avg Tokens/Query: {stats['tokens']/stats['successful']:.0f}")
        else:
            print(f"   No successful queries to calculate timing/token averages")
    
    # Overall totals
    total_queries = sum(stats['total'] for stats in overall_stats.values())
    total_successful = sum(stats['successful'] for stats in overall_stats.values())
    total_failed = sum(stats['failed'] for stats in overall_stats.values())
    total_llm_time = sum(stats['llm_time'] for stats in overall_stats.values())
    total_cypher_time = sum(stats['cypher_time'] for stats in overall_stats.values())
    total_tokens = sum(stats['tokens'] for stats in overall_stats.values())
    
    print(f"\n🎯 OVERALL TOTALS:")
    print(f"   Total Queries Processed: {total_queries}")
    print(f"   Total Successful: {total_successful} ({total_successful/total_queries*100:.1f}%)" if total_queries > 0 else "   Total Successful: 0 (0.0%)")
    print(f"   Total Failed: {total_failed} ({total_failed/total_queries*100:.1f}%)" if total_queries > 0 else "   Total Failed: 0 (0.0%)")
    
    if total_successful > 0:
        print(f"   Total LLM Generation Time: {total_llm_time:.3f}s")
        print(f"   Total Cypher Execution Time: {total_cypher_time:.3f}s")
        print(f"   Total Combined Time: {total_llm_time + total_cypher_time:.3f}s")
        print(f"   Total Tokens Used: {total_tokens}")
        print(f"   Average LLM Time per Successful Query: {total_llm_time/total_successful:.3f}s")
        print(f"   Average Cypher Time per Successful Query: {total_cypher_time/total_successful:.3f}s")
        print(f"   Average Tokens per Successful Query: {total_tokens/total_successful:.0f}")
        
        # Performance insights
        print(f"\n💡 PERFORMANCE INSIGHTS:")
        print(f"   LLM vs Cypher Time Ratio: {total_llm_time/total_cypher_time:.2f}:1" if total_cypher_time > 0 else "   LLM vs Cypher Time Ratio: N/A")
        print(f"   Average Total Time per Query: {(total_llm_time + total_cypher_time)/total_successful:.3f}s")
        
        # Success rate by difficulty
        print(f"\n📈 SUCCESS RATES BY DIFFICULTY:")
        for level in ['easy', 'medium', 'hard']:
            stats = overall_stats[level]
            if stats['total'] > 0:
                success_rate = stats['successful']/stats['total']*100
                print(f"   {level.capitalize()}: {success_rate:.1f}% ({stats['successful']}/{stats['total']})")
    
    print("\n" + "=" * 100)
    print("CYPHER PROCESSING COMPLETE!")
    print("=" * 100)
    
    # Close the Neo4j connection
    agent.close()


if __name__ == "__main__":
    main()