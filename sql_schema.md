# Banking SQL Schema (Compact)

## Database Structure
**Schema:** banking_new | **Database:** test_db | **Connection:** Docker postgres_db

## Entity Relationships
```
Branches (1) ↔ (M) Customers (1) ↔ (M) Accounts (1) ↔ (M) Transactions
    ↓                    ↓
    └──────────────→ Cards (M)
                         ↓
                    Deposits (M) ↔ (1) DepositTypes
                         ↓
                    Loans (M) ↔ (1) LoanTypes
```

## Core Tables

### Branches
- **Primary Key:** branch_id (integer, auto-increment)
- **Columns:** branch_code (varchar), branch_address (text), created_at, updated_at

### Customers  
- **Primary Key:** customer_id (integer, auto-increment)
- **Foreign Keys:** branch_id → Branches(branch_id)
- **Columns:** customer_name (varchar), date_of_birth (date), address (text), phone (varchar), email (varchar), created_at, updated_at

### Accounts
- **Primary Key:** account_id (integer, auto-increment) 
- **Foreign Keys:** customer_id → Customers(customer_id)
- **Columns:** account_number (varchar), account_balance (numeric), created_at, updated_at

### Transactions
- **Primary Key:** transaction_id (integer, auto-increment)
- **Foreign Keys:** account_id → Accounts(account_id)
- **Columns:** transaction_amount (numeric), transaction_date (timestamp), created_at, updated_at

### Cards
- **Primary Key:** card_id (integer, auto-increment)
- **Foreign Keys:** customer_id → Customers(customer_id)  
- **Columns:** card_number (varchar), balance (numeric), expiration_date (date), is_blocked (boolean), created_at, updated_at

### Deposits
- **Primary Key:** deposit_id (integer, auto-increment)
- **Foreign Keys:** customer_id → Customers(customer_id), deposit_type_id → DepositTypes(deposit_type_id)
- **Columns:** deposit_identifier (varchar), balance (numeric), term (varchar), interest_rate (numeric), start_date (date), end_date (date), created_at, updated_at

### Loans  
- **Primary Key:** loan_id (integer, auto-increment)
- **Foreign Keys:** customer_id → Customers(customer_id), loan_type_id → LoanTypes(loan_type_id)
- **Columns:** loan_identifier (varchar), balance (numeric), payment_term (varchar), interest_rate (numeric), start_date (date), end_date (date), created_at, updated_at

## Lookup Tables

### DepositTypes
- **Primary Key:** deposit_type_id (integer, auto-increment)
- **Columns:** type (varchar), description (text), created_at, updated_at

### LoanTypes  
- **Primary Key:** loan_type_id (integer, auto-increment)
- **Columns:** type (varchar), description (text), created_at, updated_at

## Key Notes
- All foreign keys use CASCADE DELETE
- All tables have created_at/updated_at timestamps for auditing
- Mixed case table names require double quotes in queries
- Balance fields: positive for assets (accounts, cards, deposits), can be negative for liabilities (loans)
