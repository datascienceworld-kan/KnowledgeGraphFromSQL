# FromSQLToKnowledgeGraph

## 1. Setup data

### 1.1. Create faking data from scratch (NOT NEED TO RUN)

**Generate schema and insert data**
You should go to `database/structured_database` and run following sql file.

- `schema.sql`: Constructing SQL schema for our data
- `data.sql`: Insert data into schema tables

You should login into psql commandline interface and run following command:

```
\i database/structured_database/schema.sql
\i database/structured_database/data.sql
```

You can create database on your local by running these sql files:

- `noisy_schema.sql`: SQL command for creating public schema

**Generate synthesize data**
You can synthesize data on the local by running the following python file:

```
# Initialize sql schema first
python3 database/structured_database/initialize_sql_schema.py

# Insert data
python3 database/structured_database/fake_noisy_data.py
```

It will genrate your sql schema with tables and relationships first. Then insert data into them.

### 1.2. Setup Postgresql
Create a postgresql by migration: 
```
\i postgresql test_db.sql
```
### 1.3. Setup Neo4j

Download neo4j at: https://drive.google.com/file/d/1D47FNFfEsoXJ736fuHbe-yeq9_1HLx31/view?usp=sharing

unzip and set at root as neo4j folder.

```
docker compose up --build
```

This mount data in ./neo4j folder into container database. Access to UI dashboard:
http://localhost:7474/browser/
