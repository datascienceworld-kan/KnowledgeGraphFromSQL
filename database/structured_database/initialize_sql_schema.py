import psycopg2
from psycopg2 import Error
import os

def execute_sql_file(file_path, db_config):
    """
    Execute an entire .sql file against PostgreSQL
    
    Args:
        file_path (str): Path to the .sql file
        db_config (dict): Database connection configuration
    
    Returns:
        bool: True if successful, False otherwise
    """
    if not os.path.exists(file_path):
        print(f"❌ SQL file not found: {file_path}")
        return False
    
    try:
        # Establish connection
        connection = psycopg2.connect(**db_config)
        connection.autocommit = True  # Important for DDL statements
        cursor = connection.cursor()
        
        # Read and execute SQL file
        with open(file_path, 'r', encoding='utf-8') as file:
            sql_content = file.read()
        
        print(f"📝 Executing SQL file: {file_path}")
        print(f"📏 File size: {len(sql_content)} characters")
        
        # Execute the entire file content
        cursor.execute(sql_content)
        
        print("✅ SQL file executed successfully!")
        
        # Close cursor and connection
        cursor.close()
        connection.close()
        
        return True
        
    except (Exception, Error) as error:
        print(f"❌ Error executing SQL file: {error}")
        if 'connection' in locals():
            connection.rollback()
            connection.close()
        return False

# Usage
if __name__ == "__main__":
    # There are two database
    # - posgres: for medium database
    # - banking_and_finance: for large database
    DB_CONFIG = {
        'host': 'localhost',
        'database': 'test_db',
        'user': 'phamdinhkhanh',
        'password': 'Mypassw0rk',
        'port': 5432
    }
    
    # Create test noisy data:
    # sql_file = "noisy_schema.sql"
    execute_sql_file(sql_file, DB_CONFIG)
