# Banking_New Schema Documentation

## Overview
This document contains the complete PostgreSQL database schema for the `banking_new` schema, including all tables, columns, indexes, constraints, and relationships.

**Database Connection Details:**
- Database: test_db
- Schema: banking_new
- Connection: via Docker (postgres_db container)

## Entity Relationship Diagram (Textual)

```
Branches (1) ←→ (M) Customers (1) ←→ (M) Accounts (1) ←→ (M) Transactions
    ↓                    ↓
    └──────────────→ Cards (M)
                         ↓
                    Deposits (M) ←→ (1) DepositTypes
                         ↓
                    Loans (M) ←→ (1) LoanTypes
```

## Tables

### 1. Branches
**Purpose:** Stores bank branch information

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| branch_id | integer | NOT NULL | Auto-increment | Primary key |
| branch_code | character varying | NULL | | Unique branch identifier |
| branch_address | text | NULL | | Physical address of branch |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** branch_id
**Indexes:** Branches_pkey (UNIQUE, btree on branch_id)

### 2. Customers
**Purpose:** Stores customer information

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| customer_id | integer | NOT NULL | Auto-increment | Primary key |
| branch_id | integer | NULL | | Foreign key to Branches |
| customer_name | character varying | NULL | | Full name of customer |
| date_of_birth | date | NULL | | Customer's birth date |
| address | text | NULL | | Customer's residential address |
| phone | character varying | NULL | | Contact phone number |
| email | character varying | NULL | | Email address |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** customer_id
**Foreign Keys:**
- branch_id → banking_new.Branches(branch_id) ON DELETE CASCADE
**Indexes:** Customers_pkey (UNIQUE, btree on customer_id)

### 3. Accounts
**Purpose:** Stores bank account information

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| account_id | integer | NOT NULL | Auto-increment | Primary key |
| account_number | character varying | NULL | | Unique account identifier |
| customer_id | integer | NULL | | Foreign key to Customers |
| account_balance | numeric | NULL | | Current account balance |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** account_id
**Foreign Keys:**
- customer_id → banking_new.Customers(customer_id) ON DELETE CASCADE
**Indexes:** Accounts_pkey (UNIQUE, btree on account_id)

### 4. Transactions
**Purpose:** Stores account transaction history

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| transaction_id | integer | NOT NULL | Auto-increment | Primary key |
| account_id | integer | NULL | | Foreign key to Accounts |
| transaction_amount | numeric | NULL | | Transaction amount (positive/negative) |
| transaction_date | timestamp with time zone | NULL | | When transaction occurred |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** transaction_id
**Foreign Keys:**
- account_id → banking_new.Accounts(account_id) ON DELETE CASCADE
**Indexes:** Transactions_pkey (UNIQUE, btree on transaction_id)

### 5. Cards
**Purpose:** Stores credit/debit card information

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| card_id | integer | NOT NULL | Auto-increment | Primary key |
| card_number | character varying | NULL | | Card number |
| customer_id | integer | NULL | | Foreign key to Customers |
| balance | numeric | NULL | | Current card balance |
| expiration_date | date | NULL | | Card expiration date |
| is_blocked | boolean | NULL | | Whether card is blocked |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** card_id
**Foreign Keys:**
- customer_id → banking_new.Customers(customer_id) ON DELETE CASCADE
**Indexes:** Cards_pkey (UNIQUE, btree on card_id)

### 6. DepositTypes
**Purpose:** Lookup table for deposit product types

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| deposit_type_id | integer | NOT NULL | Auto-increment | Primary key |
| type | character varying | NULL | | Deposit type name |
| description | text | NULL | | Detailed description of deposit type |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** deposit_type_id
**Indexes:** DepositTypes_pkey (UNIQUE, btree on deposit_type_id)

### 7. Deposits
**Purpose:** Stores customer deposit accounts

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| deposit_id | integer | NOT NULL | Auto-increment | Primary key |
| customer_id | integer | NULL | | Foreign key to Customers |
| deposit_identifier | character varying | NULL | | Unique deposit identifier |
| deposit_type_id | integer | NULL | | Foreign key to DepositTypes |
| balance | numeric | NULL | | Current deposit balance |
| term | character varying | NULL | | Deposit term (e.g., "12 months") |
| interest_rate | numeric | NULL | | Interest rate percentage |
| start_date | date | NULL | | Deposit start date |
| end_date | date | NULL | | Deposit maturity date |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** deposit_id
**Foreign Keys:**
- customer_id → banking_new.Customers(customer_id) ON DELETE CASCADE
- deposit_type_id → banking_new.DepositTypes(deposit_type_id) ON DELETE CASCADE
**Indexes:** Deposits_pkey (UNIQUE, btree on deposit_id)

### 8. LoanTypes
**Purpose:** Lookup table for loan product types

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| loan_type_id | integer | NOT NULL | Auto-increment | Primary key |
| type | character varying | NULL | | Loan type name |
| description | text | NULL | | Detailed description of loan type |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** loan_type_id
**Indexes:** LoanTypes_pkey (UNIQUE, btree on loan_type_id)

### 9. Loans
**Purpose:** Stores customer loan accounts

| Column | Type | Nullable | Default | Description |
|--------|------|----------|---------|-------------|
| loan_id | integer | NOT NULL | Auto-increment | Primary key |
| customer_id | integer | NULL | | Foreign key to Customers |
| loan_identifier | character varying | NULL | | Unique loan identifier |
| loan_type_id | integer | NULL | | Foreign key to LoanTypes |
| balance | numeric | NULL | | Outstanding loan balance |
| payment_term | character varying | NULL | | Payment term (e.g., "36 months") |
| interest_rate | numeric | NULL | | Interest rate percentage |
| start_date | date | NULL | | Loan start date |
| end_date | date | NULL | | Loan maturity date |
| created_at | timestamp with time zone | NULL | | Record creation timestamp |
| updated_at | timestamp with time zone | NULL | | Record last update timestamp |

**Primary Key:** loan_id
**Foreign Keys:**
- customer_id → banking_new.Customers(customer_id) ON DELETE CASCADE
- loan_type_id → banking_new.LoanTypes(loan_type_id) ON DELETE CASCADE
**Indexes:** Loans_pkey (UNIQUE, btree on loan_id)

## Referential Integrity

### Foreign Key Relationships:
1. **Customers.branch_id** → Branches.branch_id (CASCADE DELETE)
2. **Accounts.customer_id** → Customers.customer_id (CASCADE DELETE)  
3. **Transactions.account_id** → Accounts.account_id (CASCADE DELETE)
4. **Cards.customer_id** → Customers.customer_id (CASCADE DELETE)
5. **Deposits.customer_id** → Customers.customer_id (CASCADE DELETE)
6. **Deposits.deposit_type_id** → DepositTypes.deposit_type_id (CASCADE DELETE)
7. **Loans.customer_id** → Customers.customer_id (CASCADE DELETE)
8. **Loans.loan_type_id** → LoanTypes.loan_type_id (CASCADE DELETE)

## Key Business Rules (Inferred from Schema):

1. **Hierarchical Structure:** Branches → Customers → Accounts → Transactions
2. **Customer Products:** Each customer can have multiple:
   - Bank accounts
   - Cards  
   - Deposits
   - Loans
3. **Product Types:** Standardized deposit and loan types via lookup tables
4. **Audit Trail:** All tables have created_at and updated_at timestamps
5. **Referential Integrity:** CASCADE DELETE ensures data consistency
6. **Financial Tracking:** Balance tracking across accounts, cards, deposits, and loans

## Notes:
- All primary keys use auto-incrementing sequences
- No custom triggers, views, or stored procedures found in this schema
- All tables use the default heap access method
- Schema uses mixed case table names with double quotes required for SQL queries
