# Neo4j Banking Graph Schema (Compact)

## Database Connection
**Neo4j:** bolt://localhost:7687 | **Container:** neo4j (Docker)

## Graph Structure
```
(Branches) ←-[:BELONGS_TO_BRANCH]- (Customers) -[:BELONGS_TO_CUSTOMER]-> (Accounts) -[:HAS_TRANSACTION]-> (Transactions)
                                       ↓                                     
                                   (Cards) ←-[:BELONGS_TO_CUSTOMER]-
                                       ↓                                           
                                 (Deposits) -[:HAS_DEPOSIT_TYPE]-> (DepositTypes)
                                       ↓                                           
                                  (Loans) -[:HAS_LOAN_TYPE]-> (LoanTypes)
```

## Node Labels & Key Properties

### Branches
- **Properties:** `branch_id` (int), `branch_code` (str), `branch_address` (text), `created_at`, `updated_at`

### Customers  
- **Properties:** `customer_id` (int), `customer_name` (str), `date_of_birth` (date), `address` (text), `phone` (str), `email` (str), `created_at`, `updated_at`

### Accounts
- **Properties:** `account_id` (int), `account_number` (str), `customer_id` (int), `account_balance` (float), `created_at`, `updated_at`

### Transactions
- **Properties:** `transaction_id` (int), `transaction_amount` (float), `transaction_date` (datetime), `created_at`, `updated_at`

### Cards
- **Properties:** `card_id` (int), `card_number` (str), `customer_id` (int), `balance` (float), `expiration_date` (date), `is_blocked` (bool), `created_at`, `updated_at`

### Deposits
- **Properties:** `deposit_id` (int), `customer_id` (int), `deposit_identifier` (str), `deposit_type_id` (int), `balance` (float), `term` (str), `interest_rate` (float), `start_date` (date), `end_date` (date), `created_at`, `updated_at`

### Loans  
- **Properties:** `loan_id` (int), `customer_id` (int), `loan_identifier` (str), `loan_type_id` (int), `balance` (float, usually negative), `payment_term` (str), `interest_rate` (float), `start_date` (date), `end_date` (date), `created_at`, `updated_at`

## Lookup Tables

### DepositTypes
- **Properties:** `deposit_type_id` (int), `type` (str), `description` (text), `created_at`, `updated_at`

### LoanTypes  
- **Properties:** `loan_type_id` (int), `type` (str), `description` (text), `created_at`, `updated_at`

## Relationships
1. `(Customer)-[:BELONGS_TO_BRANCH]->(Branch)` - Many-to-one
2. `(Account|Card|Deposit|Loan)-[:BELONGS_TO_CUSTOMER]->(Customer)` - Many-to-one  
3. `(Account)-[:HAS_TRANSACTION]->(Transaction)` - One-to-many
4. `(Deposit)-[:HAS_DEPOSIT_TYPE]->(DepositType)` - Many-to-one
5. `(Loan)-[:HAS_LOAN_TYPE]->(LoanType)` - Many-to-one

## Cypher Syntax Key Rules

### ❌ AVOID (SQL-style):
- `GROUP BY` → use `WITH` clause
- `HAVING` → use `WHERE` after `WITH`  
- `WHERE x > (SELECT...)` → use pattern matching
- `EXTRACT(DOW FROM date)` → use `date.dayOfWeek`

### ✅ USE (Cypher-style):
```cypher
// Aggregation with filtering
MATCH (c:Customers)-[:BELONGS_TO_CUSTOMER]->(l:Loans)
WITH c, COUNT(l) AS loanCount
WHERE loanCount > 3
RETURN c.customer_id, loanCount

// Pattern existence  
MATCH (c:Customers)
WHERE EXISTS((c)<-[:BELONGS_TO_CUSTOMER]-(:Loans))
RETURN c

// Date functions (1=Monday, 7=Sunday)
MATCH (t:Transactions)
WHERE t.transaction_date.dayOfWeek IN [6,7]
RETURN COUNT(t)
```

## Key Notes
- Loan balances: negative (debt), Asset balances: positive
- All monetary values: float, Dates: Neo4j date/datetime types
- Customer-centric design: all products link to customers via BELONGS_TO_CUSTOMER