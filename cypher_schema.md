# Neo4j Banking Graph Schema Documentation

## Overview
This document contains the complete Neo4j graph database schema for the banking system, including all node labels, relationships, properties, and graph structure.

**Database Connection Details:**
- Database: Neo4j
- Connection: bolt://localhost:7687
- Container: neo4j (Docker)

## Graph Structure Overview

```
(Branch) ←-[:BELONGS_TO_BRANCH]- (Customer) -[:BELONGS_TO_CUSTOMER]-> (Account) -[:HAS_TRANSACTION]-> (Transaction)
    ↓                                 ↓                                     ↓
    └── (Card) ←-[:BELONGS_TO_CUSTOMER]- Customer                          └── (Deposit) -[:HAS_DEPOSIT_TYPE]-> (DepositType)
                                      ↓                                           ↓
                                 (Loan) -[:HAS_LOAN_TYPE]-> (LoanType)    (Loan) ←-[:BELONGS_TO_CUSTOMER]-
```

## Node Labels and Properties

### 1. Branches
**Purpose:** Bank branch locations and information

**Properties:**
- `branch_id` (integer) - Unique branch identifier
- `branch_code` (string) - Branch code identifier  
- `branch_address` (text) - Physical address of the branch
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:Branches {
  branch_id: 1,
  branch_code: "BR001", 
  branch_address: "123 Main Street, Downtown",
  created_at: datetime("2025-09-23T17:09:03.814Z"),
  updated_at: datetime("2025-09-23T17:09:03.814Z")
})
```

### 2. Customers  
**Purpose:** Bank customers and their personal information

**Properties:**
- `customer_id` (integer) - Unique customer identifier
- `customer_name` (string) - Full name of the customer
- `date_of_birth` (date) - Customer's birth date
- `address` (text) - Customer's residential address
- `phone` (string) - Contact phone number
- `phone_number` (string) - Alternative phone field
- `email` (string) - Email address
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:Customers {
  customer_id: 52,
  customer_name: "John Doe",
  date_of_birth: date("1985-05-15"),
  address: "456 Oak Avenue",
  phone: "+1-555-0123",
  email: "john.doe@email.com",
  created_at: datetime("2025-09-23T17:09:03.912Z"),
  updated_at: datetime("2025-09-23T17:09:03.912Z")
})
```

### 3. Accounts
**Purpose:** Bank accounts linked to customers

**Properties:**
- `account_id` (integer) - Unique account identifier
- `account_number` (string) - Account number (e.g., "RSAL51473255709444")
- `customer_id` (integer) - Reference to owning customer
- `account_balance` (float) - Current account balance
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:Accounts {
  account_id: 1,
  account_number: "RSAL51473255709444",
  customer_id: 52,
  account_balance: 99074.26,
  created_at: datetime("2025-09-23T17:09:03.912Z"),
  updated_at: datetime("2025-09-23T17:09:03.912Z")
})
```

### 4. Transactions
**Purpose:** Financial transactions on accounts

**Properties:**
- `transaction_id` (integer) - Unique transaction identifier
- `transaction_amount` (float) - Transaction amount (positive/negative)
- `transaction_date` (datetime) - When transaction occurred
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:Transactions {
  transaction_id: 1001,
  transaction_amount: -250.00,
  transaction_date: datetime("2025-09-28T10:30:00Z"),
  created_at: datetime("2025-09-23T17:09:03.912Z"),
  updated_at: datetime("2025-09-23T17:09:03.912Z")
})
```

### 5. Cards
**Purpose:** Credit/debit cards issued to customers

**Properties:**
- `card_id` (integer) - Unique card identifier
- `card_number` (string) - Card number
- `customer_id` (integer) - Reference to card owner
- `balance` (float) - Current card balance (credit cards)
- `card_balance` (float) - Alternative balance field
- `expiration_date` (date) - Card expiration date
- `is_blocked` (boolean) - Whether card is blocked/disabled
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:Cards {
  card_id: 1,
  card_number: "4532-****-****-1234",
  customer_id: 52,
  balance: 5000.00,
  expiration_date: date("2027-12-31"),
  is_blocked: false,
  created_at: datetime("2025-09-23T17:09:03.912Z"),
  updated_at: datetime("2025-09-23T17:09:03.912Z")
})
```

### 6. DepositTypes
**Purpose:** Lookup table for types of deposit products

**Properties:**
- `deposit_type_id` (integer) - Unique deposit type identifier
- `type` (string) - Name of the deposit type
- `type_name` (string) - Alternative type name field
- `description` (text) - Detailed description of deposit type
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:DepositTypes {
  deposit_type_id: 1,
  type: "Fixed Deposit",
  description: "Fixed-term deposit with guaranteed interest rate",
  created_at: datetime("2025-09-23T17:09:03.814Z"),
  updated_at: datetime("2025-09-23T17:09:03.814Z")
})
```

### 7. Deposits
**Purpose:** Customer deposit accounts and investments

**Properties:**
- `deposit_id` (integer) - Unique deposit identifier
- `customer_id` (integer) - Reference to deposit owner
- `deposit_identifier` (string) - Deposit account identifier
- `deposit_type_id` (integer) - Reference to deposit type
- `balance` (float) - Current deposit balance
- `term` (string) - Deposit term (e.g., "12M", "24M")
- `interest_rate` (float) - Interest rate percentage
- `start_date` (date) - Deposit start date
- `end_date` (date) - Deposit maturity date
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:Deposits {
  deposit_id: 1,
  customer_id: 25,
  deposit_identifier: "FD001234567",
  deposit_type_id: 1,
  balance: 50000.00,
  term: "12M",
  interest_rate: 7.5,
  start_date: date("2025-01-15"),
  end_date: date("2026-01-15"),
  created_at: datetime("2025-09-23T17:09:03.963Z"),
  updated_at: datetime("2025-09-23T17:09:03.963Z")
})
```

### 8. LoanTypes
**Purpose:** Lookup table for types of loan products

**Properties:**
- `loan_type_id` (integer) - Unique loan type identifier
- `type` (string) - Name of the loan type
- `description` (text) - Detailed description of loan type
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:LoanTypes {
  loan_type_id: 1,
  type: "Personal Loan",
  description: "Unsecured loan offered to individuals for personal expenses like travel, education, or emergencies.",
  created_at: datetime("2025-09-23T17:09:03.814Z"),
  updated_at: datetime("2025-09-23T17:09:03.814Z")
})
```

### 9. Loans
**Purpose:** Customer loan accounts

**Properties:**
- `loan_id` (integer) - Unique loan identifier
- `customer_id` (integer) - Reference to loan borrower
- `loan_identifier` (string) - Loan account identifier (e.g., "LD145314212923852")
- `loan_type_id` (integer) - Reference to loan type
- `balance` (float) - Outstanding loan balance (typically negative)
- `payment_term` (string) - Payment term (e.g., "12M", "36M")
- `interest_rate` (float) - Interest rate percentage
- `start_date` (date) - Loan start date
- `end_date` (date) - Loan maturity date
- `created_at` (datetime) - Record creation timestamp
- `updated_at` (datetime) - Record last update timestamp

**Sample Node:**
```cypher
(:Loans {
  loan_id: 1,
  customer_id: 18,
  loan_identifier: "LD145314212923852",
  loan_type_id: 10,
  balance: -23319.11,
  payment_term: "12M",
  interest_rate: 9.6,
  start_date: date("2023-11-06"),
  end_date: date("2030-11-06"),
  created_at: datetime("2025-09-23T17:09:03.963Z"),
  updated_at: datetime("2025-09-23T17:09:03.963Z")
})
```

## Relationships

### 1. BELONGS_TO_BRANCH
**Purpose:** Links customers to their assigned branch
- **Direction:** (Customer)-[:BELONGS_TO_BRANCH]->(Branch)
- **Properties:** None
- **Cardinality:** Many customers to one branch

### 2. BELONGS_TO_CUSTOMER  
**Purpose:** Links accounts, cards, deposits, and loans to their owner
- **Direction:** (Account|Card|Deposit|Loan)-[:BELONGS_TO_CUSTOMER]->(Customer)
- **Properties:** None
- **Cardinality:** Many products to one customer

### 3. HAS_TRANSACTION
**Purpose:** Links accounts to their transactions
- **Direction:** (Account)-[:HAS_TRANSACTION]->(Transaction)
- **Properties:** None
- **Cardinality:** One account to many transactions

### 4. HAS_DEPOSIT_TYPE
**Purpose:** Links deposits to their product type
- **Direction:** (Deposit)-[:HAS_DEPOSIT_TYPE]->(DepositType)
- **Properties:** None
- **Cardinality:** Many deposits to one type

### 5. HAS_LOAN_TYPE
**Purpose:** Links loans to their product type
- **Direction:** (Loan)-[:HAS_LOAN_TYPE]->(LoanType)
- **Properties:** None
- **Cardinality:** Many loans to one type

## Common Query Patterns

### Find Customer and Their Products
```cypher
MATCH (c:Customers {customer_id: 52})
OPTIONAL MATCH (c)<-[:BELONGS_TO_CUSTOMER]-(a:Accounts)
OPTIONAL MATCH (c)<-[:BELONGS_TO_CUSTOMER]-(card:Cards)
OPTIONAL MATCH (c)<-[:BELONGS_TO_CUSTOMER]-(d:Deposits)
OPTIONAL MATCH (c)<-[:BELONGS_TO_CUSTOMER]-(l:Loans)
RETURN c, a, card, d, l
```

### Find Account Transactions
```cypher
MATCH (a:Accounts {account_id: 1})-[:HAS_TRANSACTION]->(t:Transactions)
RETURN a, t
ORDER BY t.transaction_date DESC
```

### Find Customers by Branch
```cypher
MATCH (b:Branches {branch_id: 1})<-[:BELONGS_TO_BRANCH]-(c:Customers)
RETURN b, c
```

### Find Loan Details with Type
```cypher
MATCH (l:Loans)-[:HAS_LOAN_TYPE]->(lt:LoanTypes)
MATCH (l)-[:BELONGS_TO_CUSTOMER]->(c:Customers)
RETURN l, lt, c
```

## Key Features

1. **Graph Relationships:** Natural representation of banking relationships
2. **Product Hierarchy:** Clear separation of product types via lookup nodes  

## Important Cypher Syntax Guidelines

### ❌ AVOID SQL-Style Patterns:
- Don't use `GROUP BY` - use `WITH` clause for grouping
- Don't use `HAVING` - use `WHERE` after `WITH` 
- Don't use subqueries in `WHERE` clause like `WHERE x > (SELECT...)`
- Don't use `EXTRACT(DOW FROM date)` - use `date.dayOfWeek`

### ✅ CORRECT Cypher Patterns:

**Aggregation with Filtering:**
```cypher
MATCH (c:Customers)-[:BELONGS_TO_CUSTOMER]->(l:Loans)
WITH c, COUNT(l) AS loanCount
WHERE loanCount > 3
RETURN c.customer_id, loanCount
```

**Counting with Conditions:**
```cypher
MATCH (c:Customers)
WHERE EXISTS((c)<-[:BELONGS_TO_CUSTOMER]-(:Cards)) 
  AND EXISTS((c)<-[:BELONGS_TO_CUSTOMER]-(:Deposits))
RETURN COUNT(DISTINCT c)
```

**Date Functions:**
```cypher
// Get day of week: date.dayOfWeek (1=Monday, 7=Sunday)
MATCH (t:Transactions)
WHERE t.transaction_date.dayOfWeek IN [6,7] // Saturday/Sunday
RETURN COUNT(t)
```

**Average Comparisons:**
```cypher
MATCH (c:Cards)
WITH AVG(c.balance) AS avgBalance
MATCH (c2:Cards)
WHERE c2.balance > avgBalance
RETURN COUNT(c2)
```

**Pattern Existence:**
```cypher
// Check if relationship exists
MATCH (c:Customers)
WHERE EXISTS((c)<-[:BELONGS_TO_CUSTOMER]-(:Loans))
RETURN c
```
3. **Customer-Centric:** All products linked to customers via BELONGS_TO_CUSTOMER
4. **Temporal Data:** Created/updated timestamps on all nodes
5. **Financial Tracking:** Balance tracking across all financial products
6. **Flexible Queries:** Easy traversal of related entities through graph relationships

## Notes
- All monetary values stored as floats
- Dates stored as Neo4j date types  
- Timestamps stored as Neo4j datetime types
- Loan balances typically negative (representing debt)
- Card and deposit balances typically positive (representing available funds)
- Graph structure allows for complex relationship queries and pattern matching