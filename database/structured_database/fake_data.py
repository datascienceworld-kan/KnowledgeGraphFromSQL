import psycopg2
import random
from faker import Faker
from datetime import timedelta
from dateutil.relativedelta import relativedelta

fake = Faker()

# Connect to Postgres
conn = psycopg2.connect(
    dbname="banking_and_finance",
    user="phamdinhkhanh",
    password="Mypassw0rk",
    host="localhost",
    port=5432
)
cur = conn.cursor()


def random_decimal(low, high, digits=2):
    """Generate decimal using uniform distribution"""
    return round(random.uniform(low, high), digits)


def random_date(start, end):
    """Generate a random date between start and end"""
    delta = end - start
    return start + timedelta(days=random.randint(0, delta.days))


# -------- Insert Branches --------
def insert_branches(n=40):
    # Having 40 branches only
    branch_ids = []
    for _ in range(n):
        cur.execute(
            """
            INSERT INTO branches (branch_name, branch_address)
            VALUES (%s, %s) RETURNING id
            """,
            (fake.company(), fake.address())
        )
        branch_ids.append(cur.fetchone()[0])
    conn.commit()
    return branch_ids


# -------- Insert Loan Types --------
def insert_loan_types():
    # Having 10 loan types
    loan_type_names = [
        "Personal Loan",
        "Home Loan",
        "Auto Loan",
        "Education Loan",
        "Business Loan",
        "Gold Loan",
        "Mortgage Loan",
        "Overdraft Facility",
        "Credit Card Loan",
        "Agricultural Loan"
    ]

    descriptions = [
        "Unsecured loan offered to individuals for personal expenses like travel, education, or emergencies.",
        "Loan given to purchase, construct, or renovate a residential property.",
        "Loan provided to purchase new or used vehicles, usually secured by the vehicle itself.",
        "Loan designed to cover tuition fees, books, and other study-related expenses.",
        "Loan given to entrepreneurs or companies to meet business capital needs.",
        "Secured loan where gold jewelry is pledged as collateral.",
        "Long-term loan secured against real estate, often used for large financing needs.",
        "Credit facility allowing account holders to withdraw more than their balance.",
        "Short-term loan linked to a credit card, with interest charged on outstanding balance.",
        "Loan provided to farmers for agricultural activities like seeds, equipment, or irrigation."
    ]

    loan_type_ids = []

    for (i, (loan_type, desc)) in enumerate(zip(loan_type_names, descriptions)):
        cur.execute(
            """
            INSERT INTO loan_types (loan_type_name, loan_description)
            VALUES (%s, %s) RETURNING id
            """,
            (loan_type, desc)
        )
        loan_type_ids.append(cur.fetchone()[0])
    conn.commit()
    return loan_type_ids

def insert_deposit_types():
    # Having 10 deposit types
    deposit_type_names = [
        "Personal Loan",
        "Home Loan",
        "Auto Loan",
        "Education Loan",
        "Business Loan",
        "Gold Loan",
        "Mortgage Loan",
        "Overdraft Facility",
        "Credit Card Loan",
        "Agricultural Loan"
    ]

    descriptions = [
        "Unsecured loan offered to individuals for personal expenses like travel, education, or emergencies.",
        "Loan given to purchase, construct, or renovate a residential property.",
        "Loan provided to purchase new or used vehicles, usually secured by the vehicle itself.",
        "Loan designed to cover tuition fees, books, and other study-related expenses.",
        "Loan given to entrepreneurs or companies to meet business capital needs.",
        "Secured loan where gold jewelry is pledged as collateral.",
        "Long-term loan secured against real estate, often used for large financing needs.",
        "Credit facility allowing account holders to withdraw more than their balance.",
        "Short-term loan linked to a credit card, with interest charged on outstanding balance.",
        "Loan provided to farmers for agricultural activities like seeds, equipment, or irrigation."
    ]

    deposit_type_ids = []

    for (i, (deposit_type, desc)) in enumerate(zip(deposit_type_names, descriptions)):
        cur.execute(
            """
            INSERT INTO deposit_types (deposit_type_name, deposit_description)
            VALUES (%s, %s) RETURNING id
            """,
            (deposit_type, desc)
        )
        deposit_type_ids.append(cur.fetchone()[0])
    conn.commit()
    return deposit_type_ids

# -------- Insert Customers --------
def insert_customers(branch_ids, n=20):
    # having 200 customers from list of branch_ids
    customer_ids = []
    for _ in range(n):
        cur.execute(
            """
            INSERT INTO customers (branch_id, customer_name, customer_dob, customer_address, customer_phone, customer_email)
            VALUES (%s, %s, %s, %s, %s, %s) RETURNING id
            """,
            (
                random.choice(branch_ids),
                fake.name(),
                fake.date_of_birth(minimum_age=18, maximum_age=70),
                fake.address(),
                fake.phone_number(),
                fake.unique.email()
            )
        )
        customer_ids.append(cur.fetchone()[0])
    conn.commit()
    return customer_ids


# -------- Insert Accounts --------
def insert_accounts(customer_ids, n=30):
    # Fake 500 accounts from 200 customers
    account_ids = []
    for _ in range(n):
        cur.execute(
            """
            INSERT INTO accounts (account_number, account_balance, customer_id)
            VALUES (%s, %s, %s) RETURNING id
            """,
            (
                fake.bban(),
                random_decimal(-10000, 100000, 2),
                random.choice(customer_ids)
            )
        )
        account_ids.append(cur.fetchone()[0])
    conn.commit()
    return account_ids


# -------- Insert Cards --------
def insert_cards(customer_ids=[], n=15):
    # Having 15 cards from 200 customers
    card_ids = []
    for _ in range(n):
        cur.execute(
            """
            INSERT INTO cards (credit_card_number, customer_id, balance, card_expiration_date, card_is_blocked)
            VALUES (%s, %s, %s, %s, %s) RETURNING id
            """,
            (
                fake.credit_card_number(card_type=None),
                random.choice(customer_ids),
                -random_decimal(0, 100000, 2),
                fake.date_between(start_date="+1y", end_date="+5y"),
                random.choice([True, False])
            )
        )
        card_ids.append(cur.fetchone()[0])
    conn.commit()
    return card_ids


# -------- Insert Loans --------
def insert_loans(customer_ids, loan_type_ids, n=100):
    # Initialize 100 loans
    for _ in range(n):
        start_date = fake.date_between(start_date="-2y", end_date="today")
        end_date = start_date + relativedelta(years=random.choice([1,2,3,4,5,6,7,8,9,10]))
        cur.execute(
            """
            INSERT INTO loans (customer_id, loan_id, loan_type_id, balance, payment_term, interest, loan_start_date, loan_end_date)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """,
            (
                random.choice(customer_ids),
                fake.numerify("LD###############"),
                random.choice(loan_type_ids),
                -random_decimal(0, 50000, 2),
                random.choice(['1M', '3M', '6M', '9M', '12M']),
                random_decimal(0, 10, 1),
                start_date,
                end_date
            )
        )
    conn.commit()


# -------- Insert Deposits --------
def insert_deposits(customer_ids, deposit_type_ids, n=15):
    for _ in range(n):
        start_date = fake.date_between(start_date="-1y", end_date="today")
        end_date = start_date + relativedelta(years=random.choice([1,2,3,4,5,6,7,8,9,10]))
        cur.execute(
            """
            INSERT INTO deposits (customer_id, deposit_id, deposit_type_id, balance, term, interest, deposit_start_date, deposit_end_date)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """,
            (
                random.choice(customer_ids),
                fake.numerify("PD###############"),
                random.choice(deposit_type_ids),
                random_decimal(100, 50000, 2),
                random.choice(['1M', '3M', '6M', '9M', '12M']),
                random_decimal(3, 8, 1),
                start_date,
                end_date
            )
        )
    conn.commit()


# -------- Insert Transactions --------
def insert_transactions(account_ids, n=50):
    for _ in range(n):
        cur.execute(
            """
            INSERT INTO transactions (account_id, transaction_amount, transaction_date)
            VALUES (%s, %s, %s)
            """,
            (
                random.choice(account_ids),
                random.choice([-1, 1]) * random_decimal(10, 5000, 2),
                fake.date_time_between(start_date="-5y", end_date="now")
            )
        )
    conn.commit()


# ---------------- MAIN ----------------
if __name__ == "__main__":
    # --- mini_size ---
    size = {
        'n_branchs': 4,
        'n_customers': 200,
        'n_accounts': 300,
        'n_cards': 150,
        'n_loans': 200,
        'n_deposits': 200,
        'n_transactions': 1000
    }

    # --- medium_size ---
    # On database postgres
    # size = {
    #     'n_branchs': 40,
    #     'n_customers': 20000,
    #     'n_accounts': 30000,
    #     'n_cards': 15000,
    #     'n_loans': 20000,
    #     'n_deposits': 20000,
    #     'n_transactions': 100000
    # }

    # --- large_size ---
    # On database banking_and_finance
    # size = {
    #     'n_branchs': 200,
    #     'n_customers': 100000,
    #     'n_accounts': 150000,
    #     'n_cards': 75000,
    #     'n_loans': 100000,
    #     'n_deposits': 100000,
    #     'n_transactions': 1000000
    # }

    branch_ids = insert_branches(n=size['n_branchs'])
    loan_type_ids = insert_loan_types()
    deposit_type_ids = insert_deposit_types()
    customer_ids = insert_customers(branch_ids=branch_ids, n=size['n_customers'])
    account_ids = insert_accounts(customer_ids=customer_ids, n=size['n_accounts'])
    card_ids = insert_cards(customer_ids=customer_ids, n=size['n_cards'])
    insert_loans(customer_ids, loan_type_ids, n=size['n_loans'])
    insert_deposits(customer_ids, deposit_type_ids, n=size['n_deposits'])
    insert_transactions(account_ids, n=size['n_transactions'])

    cur.close()
    conn.close()
