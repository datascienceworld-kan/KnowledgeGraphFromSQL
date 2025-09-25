--
-- PostgreSQL database dump
--

\restrict JlRRZmlLXc0TWMO67DWyh0zEt7c2THzMpjBzzTqmfYcgQmqdqL0OFHUeYGhIULw

-- Dumped from database version 15.14 (Homebrew)
-- Dumped by pg_dump version 15.14 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: banking_new; Type: SCHEMA; Schema: -; Owner: phamdinhkhanh
--

CREATE SCHEMA banking_new;


ALTER SCHEMA banking_new OWNER TO phamdinhkhanh;

--
-- Name: g_current; Type: SCHEMA; Schema: -; Owner: phamdinhkhanh
--

CREATE SCHEMA g_current;


ALTER SCHEMA g_current OWNER TO phamdinhkhanh;

--
-- Name: g_prev; Type: SCHEMA; Schema: -; Owner: phamdinhkhanh
--

CREATE SCHEMA g_prev;


ALTER SCHEMA g_prev OWNER TO phamdinhkhanh;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Accounts; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."Accounts" (
    account_id integer NOT NULL,
    account_number character varying,
    customer_id integer,
    account_balance numeric,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."Accounts" OWNER TO phamdinhkhanh;

--
-- Name: Accounts_account_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."Accounts_account_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."Accounts_account_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: Accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."Accounts_account_id_seq" OWNED BY g_current."Accounts".account_id;


--
-- Name: Accounts; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."Accounts" (
    account_id integer DEFAULT nextval('g_current."Accounts_account_id_seq"'::regclass) NOT NULL,
    account_number character varying,
    customer_id integer,
    account_balance numeric,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."Accounts" OWNER TO phamdinhkhanh;

--
-- Name: Branches; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."Branches" (
    branch_id integer NOT NULL,
    branch_code character varying,
    branch_address text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."Branches" OWNER TO phamdinhkhanh;

--
-- Name: Branches_branch_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."Branches_branch_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."Branches_branch_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: Branches_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."Branches_branch_id_seq" OWNED BY g_current."Branches".branch_id;


--
-- Name: Branches; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."Branches" (
    branch_id integer DEFAULT nextval('g_current."Branches_branch_id_seq"'::regclass) NOT NULL,
    branch_code character varying,
    branch_address text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."Branches" OWNER TO phamdinhkhanh;

--
-- Name: Cards; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."Cards" (
    card_id integer NOT NULL,
    card_number character varying,
    customer_id integer,
    balance numeric,
    expiration_date date,
    is_blocked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."Cards" OWNER TO phamdinhkhanh;

--
-- Name: Cards_card_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."Cards_card_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."Cards_card_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: Cards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."Cards_card_id_seq" OWNED BY g_current."Cards".card_id;


--
-- Name: Cards; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."Cards" (
    card_id integer DEFAULT nextval('g_current."Cards_card_id_seq"'::regclass) NOT NULL,
    card_number character varying,
    customer_id integer,
    balance numeric,
    expiration_date date,
    is_blocked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."Cards" OWNER TO phamdinhkhanh;

--
-- Name: Customers; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."Customers" (
    customer_id integer NOT NULL,
    branch_id integer,
    customer_name character varying,
    date_of_birth date,
    address text,
    phone character varying,
    email character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."Customers" OWNER TO phamdinhkhanh;

--
-- Name: Customers_customer_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."Customers_customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."Customers_customer_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: Customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."Customers_customer_id_seq" OWNED BY g_current."Customers".customer_id;


--
-- Name: Customers; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."Customers" (
    customer_id integer DEFAULT nextval('g_current."Customers_customer_id_seq"'::regclass) NOT NULL,
    branch_id integer,
    customer_name character varying,
    date_of_birth date,
    address text,
    phone character varying,
    email character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."Customers" OWNER TO phamdinhkhanh;

--
-- Name: DepositTypes; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."DepositTypes" (
    deposit_type_id integer NOT NULL,
    type character varying,
    description text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."DepositTypes" OWNER TO phamdinhkhanh;

--
-- Name: DepositTypes_deposit_type_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."DepositTypes_deposit_type_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."DepositTypes_deposit_type_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: DepositTypes_deposit_type_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."DepositTypes_deposit_type_id_seq" OWNED BY g_current."DepositTypes".deposit_type_id;


--
-- Name: DepositTypes; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."DepositTypes" (
    deposit_type_id integer DEFAULT nextval('g_current."DepositTypes_deposit_type_id_seq"'::regclass) NOT NULL,
    type character varying,
    description text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."DepositTypes" OWNER TO phamdinhkhanh;

--
-- Name: Deposits; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."Deposits" (
    deposit_id integer NOT NULL,
    customer_id integer,
    deposit_identifier character varying,
    deposit_type_id integer,
    balance numeric,
    term character varying,
    interest_rate numeric,
    start_date date,
    end_date date,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."Deposits" OWNER TO phamdinhkhanh;

--
-- Name: Deposits_deposit_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."Deposits_deposit_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."Deposits_deposit_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: Deposits_deposit_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."Deposits_deposit_id_seq" OWNED BY g_current."Deposits".deposit_id;


--
-- Name: Deposits; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."Deposits" (
    deposit_id integer DEFAULT nextval('g_current."Deposits_deposit_id_seq"'::regclass) NOT NULL,
    customer_id integer,
    deposit_identifier character varying,
    deposit_type_id integer,
    balance numeric,
    term character varying,
    interest_rate numeric,
    start_date date,
    end_date date,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."Deposits" OWNER TO phamdinhkhanh;

--
-- Name: LoanTypes; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."LoanTypes" (
    loan_type_id integer NOT NULL,
    type character varying,
    description text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."LoanTypes" OWNER TO phamdinhkhanh;

--
-- Name: LoanTypes_loan_type_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."LoanTypes_loan_type_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."LoanTypes_loan_type_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: LoanTypes_loan_type_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."LoanTypes_loan_type_id_seq" OWNED BY g_current."LoanTypes".loan_type_id;


--
-- Name: LoanTypes; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."LoanTypes" (
    loan_type_id integer DEFAULT nextval('g_current."LoanTypes_loan_type_id_seq"'::regclass) NOT NULL,
    type character varying,
    description text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."LoanTypes" OWNER TO phamdinhkhanh;

--
-- Name: Loans; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."Loans" (
    loan_id integer NOT NULL,
    customer_id integer,
    loan_identifier character varying,
    loan_type_id integer,
    balance numeric,
    payment_term character varying,
    interest_rate numeric,
    start_date date,
    end_date date,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."Loans" OWNER TO phamdinhkhanh;

--
-- Name: Loans_loan_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."Loans_loan_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."Loans_loan_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: Loans_loan_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."Loans_loan_id_seq" OWNED BY g_current."Loans".loan_id;


--
-- Name: Loans; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."Loans" (
    loan_id integer DEFAULT nextval('g_current."Loans_loan_id_seq"'::regclass) NOT NULL,
    customer_id integer,
    loan_identifier character varying,
    loan_type_id integer,
    balance numeric,
    payment_term character varying,
    interest_rate numeric,
    start_date date,
    end_date date,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."Loans" OWNER TO phamdinhkhanh;

--
-- Name: Transactions; Type: TABLE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE TABLE g_current."Transactions" (
    transaction_id integer NOT NULL,
    account_id integer,
    transaction_amount numeric,
    transaction_date timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE g_current."Transactions" OWNER TO phamdinhkhanh;

--
-- Name: Transactions_transaction_id_seq; Type: SEQUENCE; Schema: g_current; Owner: phamdinhkhanh
--

CREATE SEQUENCE g_current."Transactions_transaction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE g_current."Transactions_transaction_id_seq" OWNER TO phamdinhkhanh;

--
-- Name: Transactions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: g_current; Owner: phamdinhkhanh
--

ALTER SEQUENCE g_current."Transactions_transaction_id_seq" OWNED BY g_current."Transactions".transaction_id;


--
-- Name: Transactions; Type: TABLE; Schema: banking_new; Owner: phamdinhkhanh
--

CREATE TABLE banking_new."Transactions" (
    transaction_id integer DEFAULT nextval('g_current."Transactions_transaction_id_seq"'::regclass) NOT NULL,
    account_id integer,
    transaction_amount numeric,
    transaction_date timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE banking_new."Transactions" OWNER TO phamdinhkhanh;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    acc_num character varying(50),
    cus_id integer NOT NULL,
    acc_bal numeric(15,2) DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.accounts OWNER TO phamdinhkhanh;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO phamdinhkhanh;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: accounts; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.accounts (
    id integer DEFAULT nextval('public.accounts_id_seq'::regclass) NOT NULL,
    acc_num character varying(50),
    cus_id integer NOT NULL,
    acc_bal numeric(15,2) DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE g_prev.accounts OWNER TO phamdinhkhanh;

--
-- Name: branches; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.branches (
    id integer NOT NULL,
    brc character varying(255) NOT NULL,
    brc_address text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.branches OWNER TO phamdinhkhanh;

--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.branches_id_seq OWNER TO phamdinhkhanh;

--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: branches; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.branches (
    id integer DEFAULT nextval('public.branches_id_seq'::regclass) NOT NULL,
    brc character varying(255) NOT NULL,
    brc_address text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE g_prev.branches OWNER TO phamdinhkhanh;

--
-- Name: cards; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    cc_num character varying(50),
    cus_id integer NOT NULL,
    bal numeric(15,2) DEFAULT 0 NOT NULL,
    card_exp_date date NOT NULL,
    is_blocked boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT cards_bal_check CHECK ((bal <= (0)::numeric))
);


ALTER TABLE public.cards OWNER TO phamdinhkhanh;

--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_id_seq OWNER TO phamdinhkhanh;

--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- Name: cards; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.cards (
    id integer DEFAULT nextval('public.cards_id_seq'::regclass) NOT NULL,
    cc_num character varying(50),
    cus_id integer NOT NULL,
    bal numeric(15,2) DEFAULT 0 NOT NULL,
    card_exp_date date NOT NULL,
    is_blocked boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT cards_bal_check CHECK ((bal <= (0)::numeric))
);


ALTER TABLE g_prev.cards OWNER TO phamdinhkhanh;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    brc integer NOT NULL,
    cus_name character varying(255) NOT NULL,
    cus_dob date NOT NULL,
    cus_addr text NOT NULL,
    cus_phone character varying(30),
    cus_email character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers OWNER TO phamdinhkhanh;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO phamdinhkhanh;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: customers; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.customers (
    id integer DEFAULT nextval('public.customers_id_seq'::regclass) NOT NULL,
    brc integer NOT NULL,
    cus_name character varying(255) NOT NULL,
    cus_dob date NOT NULL,
    cus_addr text NOT NULL,
    cus_phone character varying(30),
    cus_email character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE g_prev.customers OWNER TO phamdinhkhanh;

--
-- Name: deposit_types; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.deposit_types (
    id integer NOT NULL,
    de_type character varying(100) NOT NULL,
    de_des text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.deposit_types OWNER TO phamdinhkhanh;

--
-- Name: deposit_types_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.deposit_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposit_types_id_seq OWNER TO phamdinhkhanh;

--
-- Name: deposit_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.deposit_types_id_seq OWNED BY public.deposit_types.id;


--
-- Name: deposit_types; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.deposit_types (
    id integer DEFAULT nextval('public.deposit_types_id_seq'::regclass) NOT NULL,
    de_type character varying(100) NOT NULL,
    de_des text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE g_prev.deposit_types OWNER TO phamdinhkhanh;

--
-- Name: deposits; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.deposits (
    id integer NOT NULL,
    cus_id integer NOT NULL,
    de_id character varying(50),
    de_type_id integer NOT NULL,
    bal numeric(15,2) DEFAULT 0 NOT NULL,
    tem character varying(30),
    interest numeric(6,4) DEFAULT 0 NOT NULL,
    de_st_dt date NOT NULL,
    de_en_dt date,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT deposits_bal_check CHECK ((bal >= (0)::numeric)),
    CONSTRAINT deposits_check CHECK (((de_en_dt IS NULL) OR (de_en_dt > de_st_dt))),
    CONSTRAINT deposits_interest_check CHECK ((interest >= (0)::numeric))
);


ALTER TABLE public.deposits OWNER TO phamdinhkhanh;

--
-- Name: deposits_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.deposits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deposits_id_seq OWNER TO phamdinhkhanh;

--
-- Name: deposits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.deposits_id_seq OWNED BY public.deposits.id;


--
-- Name: deposits; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.deposits (
    id integer DEFAULT nextval('public.deposits_id_seq'::regclass) NOT NULL,
    cus_id integer NOT NULL,
    de_id character varying(50),
    de_type_id integer NOT NULL,
    bal numeric(15,2) DEFAULT 0 NOT NULL,
    tem character varying(30),
    interest numeric(6,4) DEFAULT 0 NOT NULL,
    de_st_dt date NOT NULL,
    de_en_dt date,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT deposits_bal_check CHECK ((bal >= (0)::numeric)),
    CONSTRAINT deposits_check CHECK (((de_en_dt IS NULL) OR (de_en_dt > de_st_dt))),
    CONSTRAINT deposits_interest_check CHECK ((interest >= (0)::numeric))
);


ALTER TABLE g_prev.deposits OWNER TO phamdinhkhanh;

--
-- Name: loan_types; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.loan_types (
    id integer NOT NULL,
    ln_type character varying(100) NOT NULL,
    ln_des text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.loan_types OWNER TO phamdinhkhanh;

--
-- Name: loan_types_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.loan_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loan_types_id_seq OWNER TO phamdinhkhanh;

--
-- Name: loan_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.loan_types_id_seq OWNED BY public.loan_types.id;


--
-- Name: loan_types; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.loan_types (
    id integer DEFAULT nextval('public.loan_types_id_seq'::regclass) NOT NULL,
    ln_type character varying(100) NOT NULL,
    ln_des text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE g_prev.loan_types OWNER TO phamdinhkhanh;

--
-- Name: loans; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.loans (
    id integer NOT NULL,
    cus_id integer NOT NULL,
    ln_id character varying(50),
    ln_type_id integer NOT NULL,
    bal numeric(15,2) DEFAULT 0 NOT NULL,
    pmt_term character varying(30),
    interest numeric(6,4) DEFAULT 0 NOT NULL,
    ln_st_dt date NOT NULL,
    ln_en_dt date,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT loans_bal_check CHECK ((bal <= (0)::numeric)),
    CONSTRAINT loans_check CHECK (((ln_en_dt IS NULL) OR (ln_en_dt > ln_st_dt))),
    CONSTRAINT loans_interest_check CHECK ((interest >= (0)::numeric))
);


ALTER TABLE public.loans OWNER TO phamdinhkhanh;

--
-- Name: loans_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.loans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loans_id_seq OWNER TO phamdinhkhanh;

--
-- Name: loans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.loans_id_seq OWNED BY public.loans.id;


--
-- Name: loans; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.loans (
    id integer DEFAULT nextval('public.loans_id_seq'::regclass) NOT NULL,
    cus_id integer NOT NULL,
    ln_id character varying(50),
    ln_type_id integer NOT NULL,
    bal numeric(15,2) DEFAULT 0 NOT NULL,
    pmt_term character varying(30),
    interest numeric(6,4) DEFAULT 0 NOT NULL,
    ln_st_dt date NOT NULL,
    ln_en_dt date,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT loans_bal_check CHECK ((bal <= (0)::numeric)),
    CONSTRAINT loans_check CHECK (((ln_en_dt IS NULL) OR (ln_en_dt > ln_st_dt))),
    CONSTRAINT loans_interest_check CHECK ((interest >= (0)::numeric))
);


ALTER TABLE g_prev.loans OWNER TO phamdinhkhanh;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: phamdinhkhanh
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    acc_id integer NOT NULL,
    tran_amt numeric(15,2) NOT NULL,
    tran_dt timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT transactions_tran_amt_check CHECK ((tran_amt <> (0)::numeric))
);


ALTER TABLE public.transactions OWNER TO phamdinhkhanh;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: phamdinhkhanh
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO phamdinhkhanh;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: phamdinhkhanh
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: transactions; Type: TABLE; Schema: g_prev; Owner: phamdinhkhanh
--

CREATE TABLE g_prev.transactions (
    id integer DEFAULT nextval('public.transactions_id_seq'::regclass) NOT NULL,
    acc_id integer NOT NULL,
    tran_amt numeric(15,2) NOT NULL,
    tran_dt timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT transactions_tran_amt_check CHECK ((tran_amt <> (0)::numeric))
);


ALTER TABLE g_prev.transactions OWNER TO phamdinhkhanh;

--
-- Name: Accounts account_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Accounts" ALTER COLUMN account_id SET DEFAULT nextval('g_current."Accounts_account_id_seq"'::regclass);


--
-- Name: Branches branch_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Branches" ALTER COLUMN branch_id SET DEFAULT nextval('g_current."Branches_branch_id_seq"'::regclass);


--
-- Name: Cards card_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Cards" ALTER COLUMN card_id SET DEFAULT nextval('g_current."Cards_card_id_seq"'::regclass);


--
-- Name: Customers customer_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Customers" ALTER COLUMN customer_id SET DEFAULT nextval('g_current."Customers_customer_id_seq"'::regclass);


--
-- Name: DepositTypes deposit_type_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."DepositTypes" ALTER COLUMN deposit_type_id SET DEFAULT nextval('g_current."DepositTypes_deposit_type_id_seq"'::regclass);


--
-- Name: Deposits deposit_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Deposits" ALTER COLUMN deposit_id SET DEFAULT nextval('g_current."Deposits_deposit_id_seq"'::regclass);


--
-- Name: LoanTypes loan_type_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."LoanTypes" ALTER COLUMN loan_type_id SET DEFAULT nextval('g_current."LoanTypes_loan_type_id_seq"'::regclass);


--
-- Name: Loans loan_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Loans" ALTER COLUMN loan_id SET DEFAULT nextval('g_current."Loans_loan_id_seq"'::regclass);


--
-- Name: Transactions transaction_id; Type: DEFAULT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Transactions" ALTER COLUMN transaction_id SET DEFAULT nextval('g_current."Transactions_transaction_id_seq"'::regclass);


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: deposit_types id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.deposit_types ALTER COLUMN id SET DEFAULT nextval('public.deposit_types_id_seq'::regclass);


--
-- Name: deposits id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.deposits ALTER COLUMN id SET DEFAULT nextval('public.deposits_id_seq'::regclass);


--
-- Name: loan_types id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.loan_types ALTER COLUMN id SET DEFAULT nextval('public.loan_types_id_seq'::regclass);


--
-- Name: loans id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.loans ALTER COLUMN id SET DEFAULT nextval('public.loans_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Data for Name: Accounts; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."Accounts" (account_id, account_number, customer_id, account_balance, created_at, updated_at) FROM stdin;
1	RSAL51473255709444	52	99074.26	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
2	OEVO41031388209891	82	9477.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
3	EBZV87223503490879	176	24628.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
4	GBKO12986782461241	159	20781.02	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
5	HUGF10426621621216	6	12728.64	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
6	LUBH94592419035093	116	73443.51	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
7	ZYXA81838775427140	171	92463.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
8	VDUE67763587879707	9	65937.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
9	KDVE65029543834475	4	50532.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
10	HNVG39349416879641	119	87791.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
11	OTRV35680483860342	107	495.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
12	DQIA66428878931936	73	35691.72	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
13	RXLS44345514710060	169	45473.23	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
14	NZVQ19679915765291	122	42528.43	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
15	TAMZ72217715200407	59	3873.98	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
16	CJFE31371441177705	88	-764.56	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
17	MYMX86944807574116	14	1714.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
18	ASQA16071627801713	188	27184.11	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
19	OEPX12340298670699	141	43385.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
20	IGZI59057410985728	61	98407.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
21	ZOTM68802465021534	191	40542.38	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
22	KUJM32477932865163	135	97906.38	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
23	RIWH26889080931163	101	2809.55	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
24	YNTV09875829198698	47	34538.40	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
25	SXPW68078697566581	196	99447.17	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
26	WAZJ65162994405238	34	15780.62	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
27	ZCLE45595007604206	172	41989.13	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
28	GFBI90128435818670	94	30563.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
29	UIAF87728550939154	87	74803.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
30	ROVB09704606474998	152	23140.12	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
31	UYZY72902413628652	23	95019.95	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
32	OIZP53528192169028	27	83946.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
33	UQAF62154719437099	129	41037.05	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
34	WABX58464278969133	50	39014.20	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
35	DIBJ40104306159452	192	94341.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
36	SSQG12301976872672	33	5543.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
37	MPHC92757581691021	62	41384.32	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
38	NPKY20128815160028	170	91597.26	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
39	PXID17992147779458	77	-3996.63	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
40	HIHI27081012910231	39	14259.65	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
41	ECOF48673088191960	187	69339.00	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
42	KHPO10443180763760	73	43330.15	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
43	WOJR20807791690237	118	57814.92	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
44	ACPX62238525650442	138	99743.81	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
45	DDRW36283752835613	117	49824.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
46	JQRQ69813524031526	174	2450.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
47	HLGZ81181388281825	25	54739.88	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
48	KLAJ32492095982801	66	57792.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
49	FEYL31362972764589	156	54061.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
50	UUCF53434269597282	148	79184.84	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
51	FFVQ98435174940595	51	12586.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
52	HVDX21007418114373	5	-1063.66	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
53	ZBSV06962089004178	2	25121.88	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
54	RUQP36934907908565	34	21750.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
55	XEVX04051338278087	179	-749.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
56	TOWK36249482520035	171	59205.14	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
57	BSGW90918344093325	13	95268.80	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
58	ZFSN49812952172711	183	6032.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
59	JQIE56227253862191	117	67130.21	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
60	RRUB58788768196656	71	44425.27	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
61	OPWX61318773121136	183	13536.72	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
62	ENYE11460353162737	119	16206.86	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
63	IQNZ09312882342897	35	57927.15	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
64	QMYS54532472086112	122	35743.12	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
65	SXEQ65111275988832	36	53607.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
66	OEJF01777767146176	192	82312.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
67	DYTC31508559324107	56	11973.95	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
68	XMVO15224781551990	21	72385.52	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
69	BSWZ33040418698529	82	24068.97	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
70	MPKX41683608524479	32	64876.95	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
71	WFJQ23798136643194	174	66739.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
72	VZZO75161321941089	179	82650.66	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
73	ERMD03148329663023	135	96100.94	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
74	LEHP96495347556794	59	85888.51	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
75	ODKA78838574450354	58	22762.33	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
76	FAPW84353414762558	9	90633.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
77	HELA77467347517564	131	42038.19	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
78	GKSB24118417102313	160	20447.93	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
79	KUQM33077182501789	144	95866.51	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
80	COZP37664460425373	31	59840.43	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
81	YUIB84086032347477	50	9625.11	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
82	FVJP35924204712209	93	23148.29	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
83	YETO25730014694795	155	14049.24	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
84	FFAL82212832309697	155	13876.27	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
85	DISA90315859562228	150	34408.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
86	NZWZ46654903472400	133	32184.24	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
87	NDXB41424186491745	174	45295.54	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
88	YZZO53991948689201	47	41800.94	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
89	PZET11068811176045	26	-4618.68	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
90	HLRC82080263792909	19	89186.27	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
91	MCRU40146535193789	186	52355.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
92	QENM79993548850444	88	43957.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
93	ZLSW18592011971079	103	89967.58	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
94	NTTS77022339820839	88	-5512.42	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
95	RJZO49720897476595	67	32846.30	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
96	ZGAN92180065572620	153	33735.30	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
97	SAVP80457496977674	123	77755.20	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
98	ZNDV83677487970512	7	84989.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
99	QGMY26214098592318	29	-5022.56	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
100	KCSJ23583228515307	56	79715.60	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
101	RCQW51073042394562	21	4458.21	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
102	BQPR70080981645015	57	21600.44	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
103	STJO99220223758298	104	29884.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
104	OJCK09973784434121	185	66474.11	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
105	ADVN82837723777658	59	58081.57	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
106	RIOI63621872952515	98	32991.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
107	JETC98001456297611	80	52764.94	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
108	YWQP27372095769794	151	12501.55	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
109	LSZM93580615368079	17	8186.90	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
110	BEUM86353352631634	67	35045.08	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
111	CMBO25739032875136	34	37306.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
112	FYKL42922998172999	136	53985.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
113	CKBI23786631157096	60	22531.56	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
114	NMUH16013619712310	17	88051.03	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
115	SEWT31241961851147	41	33547.26	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
116	DUFA09211464226685	147	11494.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
117	HDTY98285956507438	67	18576.86	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
118	NGNJ42161051978059	29	49761.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
119	GFWB52636420103656	58	94148.38	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
120	CPXH32867534276175	148	97006.10	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
121	BJNK69033845802595	10	46577.72	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
122	MVWH04897129316091	108	95585.19	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
123	OYHF18516036864976	108	15569.72	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
124	VVWM66925761154852	41	89827.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
125	PCZX25617562415632	109	75634.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
126	YLGY91053117721911	73	9882.35	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
127	JGIJ44094830299792	72	5857.81	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
128	IRXE76702017613487	43	77353.98	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
129	EKQE05323171074875	198	48840.18	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
130	KGLD13039307139175	110	66619.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
131	QOQF28342002891727	154	93352.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
132	GDOG52324112960500	147	38471.71	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
133	TGTH59315066397081	107	23700.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
134	JIRS71203527298460	28	43747.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
135	FSHT39049428928845	133	85952.44	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
136	ZPNJ29683196703576	198	26220.48	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
137	KASQ51012530384094	96	58755.88	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
138	ZASI30376944183840	76	35565.67	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
139	NSHA07952535541782	148	86197.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
140	LGYB06436358644629	112	-4412.77	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
141	WZHL14352584787851	11	78435.98	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
142	TETH00806242555917	138	92514.71	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
143	ZRUL74167341741202	167	-6842.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
144	PJHA60427454049636	192	14235.13	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
145	MSVV09965199471196	170	75554.04	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
146	OKZV51248958765115	66	97379.29	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
147	XPFI36218587160138	149	76644.19	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
148	ZGZE91084337641839	30	-3449.42	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
149	EGIU97128554419418	124	89935.48	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
150	ALNE03614065101543	93	90143.07	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
151	AKBO64648319805481	22	16032.93	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
152	OYRE68351090129417	200	66749.76	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
153	EGVO34341578156993	109	11490.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
154	PIPV62671583316647	76	22406.25	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
155	FXET06105515849481	67	27100.68	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
156	IFEK91901806960398	26	96301.48	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
157	JTTF34442823014555	132	45655.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
158	TKYY78539376639124	98	-1922.74	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
159	JLDP31058873872125	22	50456.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
160	VUCT39261917084462	68	6602.58	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
161	ALNX06317765495914	200	41774.57	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
162	FENC73827125296132	69	1342.66	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
163	XDXD39431592387548	163	59495.16	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
164	GYAD70349665747967	164	41927.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
165	MSEP18572304732152	189	38707.66	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
166	GCKZ19087782390399	29	33688.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
167	XVAP37280838579320	116	59315.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
168	VAHA31239196610559	24	-432.91	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
169	MRJG37335449742012	82	53804.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
170	TTNJ83061100740859	63	8273.06	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
171	CVHX44116968467082	118	2800.52	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
172	TVYF26033617561488	155	-8235.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
173	TZDY55273928165417	118	29914.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
174	WHOR37149240874325	166	21900.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
175	BRUR90285952594162	151	57324.79	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
176	SLQL35258718724043	30	-3921.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
177	HEWB49745056045230	170	15613.32	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
178	EOEU97995411527386	107	53861.43	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
179	EDTV64060138045293	137	-1205.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
180	IHLV25071319160107	105	26424.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
181	XDNM85846791428492	111	83975.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
182	XPLV57673056674250	104	37774.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
183	RPLG15924193982769	91	62785.63	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
184	XJUK73846826922116	55	57938.87	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
185	FXSI63662750805903	109	5599.23	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
186	NDHU49868674239239	120	31575.53	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
187	QFRG21134557955881	76	33492.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
188	BDIJ04627138912856	20	53446.41	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
189	LPUS47531220904179	16	61463.59	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
190	VPZX09998466467174	50	82868.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
191	REKQ89923932711222	182	-2096.82	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
192	JAFY35074447565540	90	24322.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
193	HCFL87943495166749	118	64684.44	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
194	ICQJ83818006861453	42	41858.93	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
195	WWVL65471888064148	129	88136.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
196	BNMZ14126040526920	8	63032.92	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
197	PIQN95166433454713	83	99955.29	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
198	SFES28956176325609	5	12673.48	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
199	TQIV68974681332446	66	53436.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
200	IPKN06543980855453	9	99231.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
201	IAND71360925698356	82	17817.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
202	YBYA25857378959125	28	94773.98	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
203	YMJQ77453006453918	82	24011.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
204	PFCM44169927711483	94	31862.65	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
205	XCNS11298684066352	67	12821.71	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
206	WJQW29331587247499	106	34814.94	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
207	VIME86549242242940	67	53014.02	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
208	EYMS45393682872562	16	-3168.84	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
209	LXGM53984929130371	42	46397.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
210	SFEB01139991376143	158	-3494.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
211	DGGV43883776145123	119	38248.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
212	LLIY66974438850583	89	42854.24	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
213	PKFR99276457306896	25	47507.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
214	BCFH35216891400429	153	72924.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
215	KQUS69956238013856	139	61790.31	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
216	KEWN73199311103517	156	20524.55	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
217	LPXV86356116605117	19	54302.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
218	XXSP47987129186889	170	62297.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
219	LLPA73194817740813	31	77465.74	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
220	WRDA43515595226570	6	14818.79	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
221	VDYA17864885176862	88	47412.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
222	SGPB08326360129675	10	55093.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
223	FCGT04015802808705	187	77402.85	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
224	RMMH11747331860122	31	30018.45	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
225	FKEM44130910911648	65	-443.45	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
226	FTHS50415923510263	71	-6204.32	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
227	RIKU85684458791937	60	-5709.87	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
228	VIYP28794549866839	137	83738.16	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
229	NKHP60284749286319	58	59641.91	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
230	SJCI33978595634473	173	15696.67	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
231	WZTV34566002525779	90	68286.91	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
232	BSGU58691063431856	57	68629.40	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
233	KAUL58860249678383	58	9517.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
234	VCJU33377243598873	97	84755.79	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
235	AKTQ04245057889115	93	64890.97	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
236	UEED38600240743684	133	87189.84	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
237	MMTF66066089930241	37	83993.41	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
238	YBIB54607011402432	106	18779.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
239	JIEM60781906703846	30	47548.95	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
240	DGRM62906835580587	33	27929.87	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
241	DRWU48306399029315	133	-8838.82	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
242	ZHJY43658182060444	37	54982.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
243	PIRU17862017422777	46	30833.04	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
244	KCDG61516706703650	114	66319.26	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
245	JVOJ02081006548047	133	61519.85	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
246	TFUH66729024442595	64	10527.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
247	KTOY93680154426995	44	75219.19	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
248	WFBC02828433494125	170	60647.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
249	NOFE88717704520516	64	91446.64	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
250	XHCI87954079428528	13	98365.74	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
251	DZQA50675936784198	79	84831.52	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
252	PVDI21541537108613	7	42938.53	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
253	AZDB51588290542954	172	16268.71	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
254	KVZH52785652567938	130	36885.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
255	CFUK89733906287700	161	85998.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
256	JLFT63355885143214	127	33436.55	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
257	JAWV38890448081489	89	72042.51	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
258	MNWY20190702204122	139	17370.54	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
259	VWEN15563584626974	142	39857.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
260	XDKY80652224747597	183	11327.16	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
261	JGSR98233315890124	126	78793.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
262	NCBU94998030308140	110	39510.76	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
263	IJNB94801093717507	72	88810.07	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
264	VEFM08010199192890	72	66024.02	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
265	SZNP89216260921114	102	-5358.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
266	SRSY29930279264512	27	84321.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
267	LDPZ62190015579685	16	98856.25	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
268	ZHWF31986649380311	30	27309.57	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
269	ULLZ26939705415482	56	77596.45	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
270	IJMQ54223801090344	61	93533.02	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
271	SYQS71503102191947	28	83607.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
272	FADW26638292548498	200	38663.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
273	XNZV60645635859407	47	64753.85	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
274	AMMH09858891662717	186	81327.30	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
275	OUBJ15094108869881	168	56252.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
276	EDQO63711511091661	108	27837.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
277	USAA50924367650771	27	-9224.86	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
278	HTBY71292616370068	163	19090.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
279	YAKO65020115432460	153	54670.81	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
280	QMZH81279788732973	6	89233.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
281	IKMC95564359135529	16	53666.10	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
282	ZBNW69002036912346	164	-294.52	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
283	KAOC33461283437906	24	38133.82	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
284	GZGV89654419773898	58	29968.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
285	MUQG15961085923817	46	93442.33	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
286	IYHB26221692807639	163	93076.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
287	LAGX15312555477821	148	90138.86	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
288	LZDV21319580962291	26	74117.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
289	BMVT14030871602701	147	28953.11	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
290	CLXM44655725590729	109	32236.45	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
291	DEBF59391598887185	83	82404.78	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
292	TKNT59585037187743	153	19625.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
293	MGWD73900304885475	81	33115.44	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
294	RQXF96665814970443	17	-3549.16	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
295	ASMO21057327591392	185	83848.33	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
296	AAQC92388795706162	67	39238.68	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
297	MDLJ59676970544657	74	10255.97	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
298	OUZF12488811039108	16	25508.17	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
299	UAGM17884021145653	165	76773.89	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
300	NLPH98157095125058	44	80531.78	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
\.


--
-- Data for Name: Branches; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."Branches" (branch_id, branch_code, branch_address, created_at, updated_at) FROM stdin;
1	Anthony, Rogers and Fields	718 Knight Shore Apt. 164\nLake Jennifershire, GA 68216	2025-09-23 17:09:03.810141+07	2025-09-23 17:09:03.810141+07
2	Gallagher-Mullen	846 Gomez Roads\nNew Colleen, MI 66121	2025-09-23 17:09:03.810141+07	2025-09-23 17:09:03.810141+07
3	Allison Group	52223 John Mountains Apt. 169\nDonnafurt, ME 99158	2025-09-23 17:09:03.810141+07	2025-09-23 17:09:03.810141+07
4	Harris Ltd	4376 Brandi Loaf Apt. 848\nNew Earlhaven, WA 71139	2025-09-23 17:09:03.810141+07	2025-09-23 17:09:03.810141+07
\.


--
-- Data for Name: Cards; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."Cards" (card_id, card_number, customer_id, balance, expiration_date, is_blocked, created_at, updated_at) FROM stdin;
1	3550741184678404	17	-41880.86	2029-05-13	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
2	4806927940861307877	156	-45023.52	2028-01-01	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
3	501843484376	97	-10455.60	2028-01-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
4	30108238922269	181	-47242.35	2027-06-05	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
5	4333992318143686316	170	-14555.79	2028-03-19	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
6	4721053539851	87	-72521.02	2030-01-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
7	676185421374	14	-12.42	2029-02-18	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
8	3558371116536660	145	-9033.95	2029-12-31	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
9	2260648608121130	91	-17453.20	2028-02-18	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
10	180003395211952	87	-33074.41	2030-06-02	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
11	180013204086800	141	-18286.45	2028-03-04	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
12	6011606620498236	51	-3955.25	2027-08-22	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
13	2298193473344216	167	-65515.27	2028-12-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
14	4068114094801	132	-48079.06	2029-12-19	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
15	676114879742	24	-64323.63	2028-12-11	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
16	213195497139916	74	-85700.15	2027-03-18	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
17	6011393351827004	153	-65517.75	2029-02-23	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
18	30026837989648	16	-55966.00	2030-03-08	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
19	3542598283866749	42	-15507.13	2027-10-26	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
20	213179746485098	40	-28547.06	2030-03-13	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
21	3551172540083890	39	-85689.41	2029-07-01	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
22	675902604650	194	-82956.07	2028-04-17	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
23	501824629650	121	-25878.79	2027-06-28	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
24	213175398005226	149	-9051.61	2026-12-09	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
25	3506179698891400	43	-46625.68	2030-06-04	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
26	4689356464767575560	25	-29097.41	2030-02-12	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
27	501826605773	104	-85746.84	2027-02-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
28	180077148179815	179	-8259.37	2029-07-23	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
29	3525324666290022	7	-99646.98	2026-12-22	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
30	4557446555737	145	-25100.00	2029-10-24	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
31	30365865289046	58	-13418.71	2029-07-23	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
32	6560122551651517	59	-25148.78	2026-11-14	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
33	4871089103436	154	-78478.33	2026-12-04	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
34	372131229379873	34	-33621.46	2028-06-22	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
35	575796590579	33	-87377.22	2027-04-17	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
36	4952731079404	131	-62709.98	2030-08-12	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
37	30233304685044	34	-41239.75	2027-07-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
38	6011730301028334	45	-68407.66	2028-10-06	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
39	3564498047379936	185	-93778.98	2027-08-31	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
40	4961743077274352359	73	-98732.68	2029-06-03	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
41	4622202226500419688	110	-98947.61	2027-09-13	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
42	676349213741	83	-44375.38	2026-10-10	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
43	6011780879176122	124	-66850.51	2030-01-15	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
44	4330902810284372	80	-23928.96	2029-03-17	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
45	180064999628348	166	-47370.84	2026-10-22	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
46	503865802386	179	-42227.48	2027-08-21	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
47	3586044073476859	68	-85741.79	2029-01-07	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
48	213178897437858	82	-45468.88	2030-06-15	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
49	4337821360123248103	96	-68116.82	2027-11-24	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
50	4854446368405	159	-96703.55	2029-09-05	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
51	342868595179158	127	-40423.16	2029-11-22	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
52	566285238648	9	-82080.72	2028-11-15	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
53	30350173705388	63	-8783.67	2027-06-28	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
54	6522638116509376	25	-9723.31	2027-12-19	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
55	30555237468472	55	-72422.56	2028-11-26	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
56	341781932595336	24	-79525.61	2027-07-27	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
57	343778281551678	26	-7269.23	2027-03-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
58	4701925610415384	119	-353.68	2029-03-29	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
59	4265349381187120182	149	-31390.19	2028-12-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
60	4264674455169115	24	-95555.90	2029-10-19	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
61	376955692068795	176	-88917.12	2029-02-02	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
62	4822557555166219140	186	-23673.76	2028-02-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
63	3583644661208029	40	-20813.59	2027-08-17	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
64	4951940809381534	58	-3129.38	2027-03-01	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
65	30220869521730	172	-7455.48	2030-07-08	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
66	4163373594966244074	179	-75784.89	2029-01-28	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
67	4780021304316362635	50	-79640.95	2029-07-27	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
68	36208198658376	138	-81874.41	2027-07-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
69	213113174807127	140	-12923.42	2027-02-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
70	3510179218552098	129	-67816.85	2027-10-27	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
71	3529436244652915	61	-90923.73	2027-07-09	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
72	373893201825517	87	-25928.52	2028-03-09	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
73	3528645894524908	1	-30902.66	2028-10-05	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
74	38796301527668	72	-76676.49	2030-08-03	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
75	30382573038961	159	-71374.78	2029-04-12	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
76	30036207321728	159	-7442.46	2027-05-30	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
77	4240388751782500	146	-87274.18	2026-12-18	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
78	2221338664885558	134	-27795.93	2030-09-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
79	5234066030240640	124	-791.83	2029-08-01	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
80	676186197445	2	-27394.86	2030-03-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
81	38422889149060	38	-98055.80	2028-12-11	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
82	6570361256822647	15	-46913.29	2028-09-17	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
83	4397088372772	112	-79921.89	2029-11-19	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
84	2715415380759151	53	-95724.02	2027-10-21	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
85	4060760839262605596	141	-42983.96	2027-05-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
86	4961510919399680	57	-36778.30	2029-08-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
87	36204719270429	175	-95511.72	2029-11-26	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
88	4909816034651383	154	-26064.24	2027-01-14	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
89	4898334524120767123	38	-12052.87	2028-01-23	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
90	30109548332603	147	-63368.88	2028-05-23	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
91	30465850054163	181	-68852.13	2030-06-04	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
92	570130086764	163	-47824.07	2027-08-08	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
93	4647355605492445	109	-7118.77	2029-09-21	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
94	4434661545015882	200	-17695.90	2027-06-26	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
95	6596295708005700	150	-74792.11	2030-03-28	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
96	3514737301435335	95	-87084.19	2029-10-05	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
97	4830120690458432076	73	-13146.05	2029-02-12	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
98	180078127182259	173	-96177.09	2026-10-24	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
99	6011241323263404	165	-25424.77	2029-05-13	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
100	30055569054339	128	-15367.40	2029-08-27	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
101	213185269688232	139	-19857.20	2027-01-20	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
102	4568698178443125896	184	-22748.88	2027-01-23	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
103	213172498129824	198	-36894.89	2028-03-12	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
104	2720632595733994	146	-41859.41	2028-05-29	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
105	3505019974940235	163	-19014.37	2027-02-03	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
106	4894155807094	155	-36149.46	2028-07-31	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
107	4716221036670981	181	-18708.99	2029-05-09	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
108	4302886273087653455	141	-19957.89	2026-12-16	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
109	348666233713097	69	-31728.79	2027-01-03	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
110	3548770292842821	96	-68407.51	2027-11-10	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
111	3551197418041902	163	-83712.23	2026-11-26	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
112	5355612448768236	42	-60383.98	2029-04-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
113	4646237233344291404	199	-10235.66	2030-04-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
114	4035232290818612540	107	-82429.93	2029-08-03	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
115	3573991248551617	44	-11151.94	2026-12-18	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
116	180083217948072	109	-37316.29	2028-04-12	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
117	3508229213872522	77	-29907.13	2030-01-17	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
118	375460747185299	184	-16658.73	2027-08-13	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
119	4239100852978128885	118	-31354.53	2027-08-04	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
120	4749746139944082	192	-77896.39	2028-01-15	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
121	6011120003835188	153	-89109.86	2027-06-22	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
122	3563552492395234	169	-15846.38	2029-10-29	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
123	2720005949419281	175	-18632.19	2029-10-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
124	6011481552309201	70	-79211.92	2029-11-21	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
125	4345343111742136	78	-37764.99	2029-07-09	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
126	4178722369946162	145	-67503.34	2029-09-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
127	4540130847313	74	-63182.19	2027-09-14	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
128	4175012195595729	196	-88830.89	2028-02-20	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
129	180000647547373	196	-32355.37	2030-01-07	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
130	4944284557478464374	159	-39483.15	2030-05-04	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
131	6011738176915733	181	-43922.47	2029-08-19	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
132	2720633614577610	14	-49530.03	2030-04-24	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
133	4083309643349878	141	-47158.05	2029-09-22	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
134	30085583447631	150	-5274.99	2028-11-30	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
135	6545671674046336	120	-742.59	2028-02-18	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
136	6011361999629967	79	-52268.36	2027-06-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
137	341181937055552	119	-86788.33	2028-01-13	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
138	4097116085883806873	62	-41695.01	2030-08-07	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
139	36427683392958	99	-93491.88	2028-12-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
140	373247177080468	67	-8289.41	2030-04-17	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
141	347557781924890	99	-26100.48	2029-03-04	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
142	676242313374	150	-43570.36	2027-05-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
143	213129501368708	31	-55816.20	2027-08-05	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
144	4347933495797876	4	-59784.40	2028-05-07	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
145	6544573953075914	9	-49083.19	2029-03-07	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
146	4552828588094084	130	-16290.33	2030-04-01	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
147	3593973388089331	5	-11667.70	2028-12-21	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
148	4939708708757824	173	-82361.91	2029-12-06	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
149	639088926931	11	-57307.86	2028-12-18	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
150	4317402459902993	52	-5084.19	2028-07-22	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
\.


--
-- Data for Name: Customers; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."Customers" (customer_id, branch_id, customer_name, date_of_birth, address, phone, email, created_at, updated_at) FROM stdin;
1	1	Francis Hester	1971-04-17	0597 Cobb Port\nByrdview, DC 80139	(980)534-8932x056	thomasmichael@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
2	1	Andrew Johnson	1995-04-26	360 Lopez Corner Apt. 630\nDiaztown, SC 45544	001-826-773-9379	umacias@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
3	2	Anthony Cox	2007-01-23	8850 Smith Mountain\nJeffreyside, CO 21586	(592)548-8150x69160	ophillips@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
4	4	Elizabeth Fisher	1955-09-13	54442 Michaela Path Suite 343\nVelasquezport, FL 56921	(811)660-7530	isaac56@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
5	4	Norma Velazquez	1967-01-15	8077 Wells Causeway\nJanettown, TX 81923	4105836586	kharris@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
6	4	Andrew Clay	1968-02-09	612 Erin Estate Apt. 770\nOconnellmouth, VA 03527	345.255.3853x6764	johnwoods@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
7	1	Traci Jones	1981-03-18	80818 Daniel Fork\nNew Joshuaburgh, LA 78468	001-613-560-9688x53422	robert33@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
8	4	Hayley Vasquez	1999-11-01	3570 Sandra Heights\nEast Paulaberg, FL 64142	(766)926-7258x6489	markprice@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
9	4	Tiffany Newton	2005-04-01	Unit 6549 Box 4301\nDPO AE 07959	+1-685-409-8018x996	virginiacooper@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
10	4	Sara Jackson	1998-11-11	19883 Blake Field\nSouth Kevinberg, FL 87633	(847)496-3340	raymonddominguez@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
11	1	Robert Miles	1988-04-29	43052 Charles Trace\nSouth Troyfurt, ME 56723	(995)721-8215	elizabeth38@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
12	4	Amber Garza	1961-06-08	66482 Rivera Prairie Suite 565\nWest Chadton, VA 59818	632.967.2049	alexfloyd@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
13	4	Michael Oconnor	1971-11-18	754 Paul Mountains\nWest Malikburgh, MT 70210	901-287-9647	lauriejackson@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
14	3	James Williams	1977-12-17	8146 Johnson Roads Suite 564\nPort Manuel, NE 38723	001-238-868-5625	brianmyers@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
15	1	Cynthia Gardner	1974-04-25	214 Payne Common Suite 818\nNorth Michael, SC 25659	370-548-5366	bryannoah@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
16	2	Jennifer Bryan	1969-06-30	7843 Anita Burg\nCollinshaven, MP 41920	001-781-369-6332x1560	baldwincrystal@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
17	1	Scott Allen	1994-06-11	8141 Linda Flats Suite 385\nEast Savannah, SD 08405	858.550.2302	danielssarah@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
18	3	Valerie Salas	1979-12-03	6879 Peterson Prairie Suite 165\nKimberlyville, MD 76971	001-746-442-8531x9744	timothy87@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
19	3	Sara Sexton	1974-06-28	0989 Willis Stream Suite 058\nNorth Sheilachester, VT 94440	(623)344-4145	oconnorelizabeth@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
20	4	David Ellison	2006-08-18	2210 Cynthia Landing\nOlsenfurt, NJ 90137	+1-286-368-9208x62126	durhamcathy@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
21	3	Kelly Knight	1965-06-04	2263 Benson Crest\nLawrencemouth, KY 48156	387-732-8439	jennifer88@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
22	3	Kathryn Jones	1990-05-29	5886 Smith Throughway\nPort Luke, OK 87609	001-497-601-5034	johnyates@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
23	1	Glenn Kim	1980-01-30	6144 Brown Estates Suite 798\nPatriciaview, IA 56892	747-818-4265	stonetommy@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
24	1	Richard Vang	1974-06-10	6911 William Island Suite 459\nStanleychester, ID 12627	(514)567-4516x52097	sarahhensley@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
25	3	Jennifer Gray	1985-10-16	48365 Mccall Plaza\nMelissafort, MT 25903	(485)360-1482x179	jennifer00@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
26	4	Ryan Thomas	1954-10-08	6993 Jones Mountain Apt. 899\nWest Rhonda, AZ 64633	+1-441-305-2663x931	karenthompson@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
27	1	Nicole Le	1988-04-14	496 Harvey Fall\nNew Daniel, MT 81453	671-371-0678	abigailcox@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
28	2	Trevor Hernandez	1965-10-26	3948 Robert Skyway\nJoshuatown, OH 84700	001-534-554-9944x13986	carlosstanley@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
29	3	Daniel Thomas	1963-10-14	9209 Robinson Isle Suite 434\nSouth Ericville, GA 33024	(464)332-0335	hgoodwin@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
30	1	Amy Calderon	1997-08-25	755 Sheila Ridges Suite 438\nWest Amandashire, ND 47654	2004961939	janetholland@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
31	2	Kerry Wyatt	1994-10-09	68106 Sharon Dam Suite 814\nLake Vanessa, WA 14153	(752)272-0178	cynthia05@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
32	1	Vanessa Barnes	1977-05-14	Unit 9696 Box 7892\nDPO AA 65475	922-238-7579x3789	megan13@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
33	3	Jennifer Cunningham	1997-05-05	672 Larson Squares\nLake Billyfurt, NJ 13373	391.427.3601	wmack@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
34	4	Thomas Johnson	1991-04-26	196 Williams Prairie Apt. 423\nWest Brandy, ND 75149	(629)778-9315x421	lisaharris@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
35	1	Leslie Vang	1975-12-27	28266 Kristin Camp\nWest Katrinaland, AS 34646	889.448.7173	fisherheather@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
36	2	Mark Shelton	1954-09-24	7285 Brittany Street Suite 973\nAustinfort, MP 85397	001-921-884-0449x50668	christophercamacho@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
37	1	John Watson	1976-01-08	201 Rivera Route\nSouth Ellenchester, WI 46942	598.529.0394x0575	johnandrade@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
38	3	Larry Lawson	1955-11-19	578 Beth Gardens\nNew Heidi, WV 86492	001-460-501-9845x98730	hrich@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
39	4	Jacqueline Campbell	1998-02-03	66214 Nicole Views Suite 795\nRaytown, PA 74201	(740)748-4733	nmartinez@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
40	1	Denise Pruitt	2004-09-26	007 King Groves Suite 655\nWeberstad, WA 79300	+1-454-315-7970	thompsonkent@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
41	4	Robert Cole	1998-06-09	8568 Nicole Crest Suite 511\nWest Christopher, NY 44354	001-319-975-5784x137	michaelcannon@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
42	1	Lisa Hurley	1989-10-22	8838 Michael Islands\nWest Bryan, NY 59920	001-508-387-8957x38712	michaelhardy@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
43	3	James Campbell	1959-01-01	129 Lawrence Turnpike Suite 587\nGutierrezmouth, NE 75741	001-404-295-0199x40554	phillipcamacho@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
44	1	Dawn Richard	1978-05-29	7644 Thomas Track\nGomezville, IN 96384	236.572.9572	brownrebecca@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
45	2	Kelly Fowler	1969-06-29	23324 Welch Centers Apt. 592\nWest Jacob, TN 15981	(635)754-7099	jorge66@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
46	1	Douglas Douglas	1983-10-08	1731 Kyle Locks\nDavenportbury, IA 63511	347-970-3730x19095	gary10@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
47	2	Michael Patel	1974-04-11	939 Wolfe Ridges\nNorth Nancy, GA 75763	956.507.9167	calderonheather@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
48	4	Nicole Green	1997-01-24	1229 Blair Fields\nTrevinoton, MP 69258	588.572.0891	nnunez@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
49	4	Michelle Smith	1994-01-11	6141 Meza Roads\nNorth Mary, AR 80510	946.330.7950	irivera@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
50	2	Jerry Bradford	1986-10-23	19282 Linda Highway Apt. 527\nSouth Amandafort, NM 34254	001-714-655-3510x2315	angelabaldwin@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
51	1	Donald Stewart	1985-10-24	60028 Walker Burg Suite 159\nWest Lesliestad, MD 80763	(248)508-9773x090	jennifercolon@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
52	2	Emily Greene	1964-07-31	7716 Nelson Shores Apt. 328\nEast Matthewtown, PR 27319	+1-689-649-8379x2067	lfields@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
53	4	Andrea Booker	1995-11-13	3905 Hoffman Divide\nLake William, UT 83692	+1-833-534-0359x02977	jennifer54@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
54	1	Caroline Bird	1970-08-08	221 Lyons Ports\nLake Theresa, MT 94590	919.831.9895	mercadodeborah@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
55	2	Jeremy Juarez	1981-02-12	PSC 9712, Box 6781\nAPO AA 47613	(941)446-8400	gilberttara@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
56	4	Mitchell Reyes	1987-04-24	187 Mccarty Wall\nLake Danielleport, NJ 37428	(387)857-6143x630	normanjoshua@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
57	4	Andrew Bradley	1994-05-25	6458 Perry Corner Suite 866\nNew Charlesstad, TN 09006	(734)566-0619x606	denise06@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
58	2	Daniel Johnson	1992-11-16	281 Cole Street Suite 723\nNorth Steven, NM 41137	644.913.4013x5926	kbenson@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
59	1	Dr. Jennifer Allen	1994-08-16	79254 Rice Trail Suite 531\nMyersport, AS 55090	(599)299-0998x031	seanjones@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
60	1	Sarah Roberts	1999-08-05	258 Davis Creek Apt. 332\nSouth Beth, NH 33052	826.442.5049x70393	hannah98@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
61	1	Mary Burke	2003-05-09	23533 Smith Islands Suite 429\nSmithchester, CT 07386	410-607-0118x320	montgomeryjames@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
62	1	Joann Perez MD	1977-01-28	0332 Carter Junction Suite 609\nLake Ryan, WY 68616	568.289.3322	elizabethsparks@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
63	4	Xavier Garcia	1972-02-07	78833 Ashley Loop\nWest Amytown, AZ 88598	001-951-790-3115x4618	samanthadouglas@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
64	4	Mark Hawkins	1969-01-28	1757 Casey Bridge Apt. 495\nRichardborough, AZ 53390	001-954-683-4889x89309	testes@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
65	4	Joe Wilson	1967-06-26	991 Crosby Manor Apt. 799\nLake Saraside, TN 61718	+1-593-736-3066x334	cwhitehead@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
66	2	Katherine Morris	1996-04-27	USCGC Smith\nFPO AE 47229	(389)441-2278	atkinsonjonathan@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
67	4	Deborah Hamilton	1961-08-04	509 Kathleen Groves\nCopelandstad, NC 64431	869.859.7978	meredithashley@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
68	1	Michael Moore	1965-02-07	764 Jimenez Expressway Apt. 157\nRobertborough, GA 06782	(737)687-8336	walshjared@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
69	3	Dustin Jackson	1986-09-02	3903 Morgan Park\nStevenfort, AK 77785	001-321-736-3061x1013	thomaskara@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
70	3	Angela Carpenter	1997-01-24	3520 Edwin Squares\nEast Paulmouth, OK 47961	882.847.9841	rodriguezperry@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
71	1	Tina Carpenter	1977-08-02	198 Jamie Ville\nClintonmouth, PA 94755	743.362.1996	charles68@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
72	4	John Park	1989-07-14	16166 Heather Shore\nSouth Jason, MI 33050	001-852-848-4481	david70@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
73	3	Sarah Turner	1959-04-01	984 Beard Walk\nPort Julie, DE 06985	7533908538	kayla73@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
74	4	Courtney Chen	2001-09-17	8072 Ball Street\nAnthonyfort, MI 95892	713-388-7019x1169	sschmidt@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
75	1	Andrew Cooper	1972-04-13	459 Kristy Road\nWhitefurt, MN 20238	+1-712-860-2576x75884	tranjennifer@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
76	1	Brenda Lee	1974-09-18	89997 Carol Fall\nNataliemouth, WV 18382	944.947.1946x139	halljustin@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
77	4	Gabriela Jones	2004-05-06	20762 Vazquez Prairie Suite 122\nLake Olivia, FM 36595	001-644-430-5154	ruizstephen@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
78	2	Anthony Mendez	1957-08-12	144 Schmidt Green Apt. 880\nMorganfort, RI 62227	3539324184	keith07@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
79	4	Crystal Lewis	1975-07-29	78089 Franco Harbor Suite 653\nSmithfort, WI 71044	+1-540-270-2899	emilyhogan@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
80	2	Sarah Collins	1996-09-14	8398 Barr Ramp\nNorth Alison, CA 90601	001-359-707-6722x172	michelle53@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
81	1	Robert Ibarra	1966-09-06	2657 Theresa Hollow Apt. 464\nLisafort, MT 73132	(868)541-6830x913	erikasanford@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
82	4	Bradley Butler	2002-10-21	3727 Bryant Stravenue Suite 908\nFrenchport, GA 13681	(848)353-4173x65557	leonardrichard@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
83	2	Carl Adams	1960-09-26	4991 Vega Walks\nSaraborough, HI 02453	+1-284-345-0502x82256	zcain@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
84	1	Misty Ritter	2002-02-20	7482 Morris Greens Suite 047\nAnnstad, CT 66280	342-269-4018	leslie59@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
85	2	Raymond Fuller MD	1969-04-17	9610 Hannah Hills Apt. 093\nDonovanmouth, PR 22006	(943)262-4240	gibsonbeverly@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
86	2	Nancy Hale	1961-06-23	7406 Gregory Mission Suite 488\nDaisyville, IN 20383	630.561.4009x867	mcooper@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
87	4	Patricia Henry	1996-04-23	1034 Conrad Common Suite 777\nSouth Brendafort, ME 78188	(580)245-7411x090	johnward@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
88	2	Kirk Martinez	2004-08-12	229 Sandoval Run Apt. 475\nPatriciafort, HI 28977	458-575-4316x81092	mduran@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
89	1	Aaron Shepherd	1963-07-01	43560 Erin Terrace Apt. 191\nSouth Laurashire, NY 96385	971.385.2559x8652	williamsonkevin@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
90	2	Blake Aguilar	1990-08-05	95807 Mercado Summit Apt. 142\nLake Phyllis, AK 39261	971-642-2325x5652	rwillis@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
91	2	Barbara Adams	1982-06-23	2729 Debbie Landing Apt. 452\nSmithfurt, VI 02766	936-985-1313x267	aford@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
92	2	Corey Taylor	1966-10-05	5123 Stevenson Orchard Suite 066\nPort Corey, TN 40672	821.663.3061x40764	ksimmons@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
93	3	Miranda Brown	1964-09-19	370 Lane Fields Suite 430\nPort Danielside, GU 30779	001-730-783-3881x931	coreymolina@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
94	1	Jason Williams	1972-05-13	57187 Brown Causeway\nNorth Matthew, KS 97353	309.567.4404x6352	wandawilliams@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
95	3	John Woods	1990-06-16	041 Hernandez Lakes Apt. 744\nHartmanborough, WY 38555	3773821747	humphreyralph@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
96	2	Angela Miller	1962-12-27	060 Patricia Cape Apt. 408\nSethport, SD 45020	(621)731-7805x1706	karen14@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
97	3	Melissa Sims	1961-07-12	35980 Gonzalez Loop Suite 754\nTaylormouth, ND 34563	001-291-313-6794	ryan13@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
98	3	Michelle Yang	1958-07-16	5186 Mendez Walks Apt. 003\nEast Heatherview, MS 97890	208.830.9237	brendatodd@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
99	4	Christopher Brown	1973-09-24	0908 Kevin Rue\nSouth Stephaniestad, IN 92537	001-641-398-0090x066	stephaniehernandez@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
100	2	Sarah Garcia	2001-03-09	229 Mann Junctions Suite 351\nEast Stephen, AZ 09985	(747)337-3196	dwayne63@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
101	4	Kyle Butler	1996-12-23	4760 Wayne Knolls\nNew Ryan, CA 50826	995-802-8538x16384	priceisaiah@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
102	1	Taylor Fisher	2002-11-05	940 Hill Rapids Apt. 822\nLake Christianport, KY 68413	524-709-1776x483	uromero@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
103	3	Michael Fields	1993-08-18	421 Paul Cove Suite 844\nNew Cherylborough, WI 49011	869-567-1853x50924	rodriguezmary@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
104	1	Crystal Howell	1967-04-07	09184 Cunningham Hill\nWest Justinview, VI 13000	001-946-493-6832x9221	howardmichael@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
105	4	Luis Sanders	1955-09-26	188 Little Overpass Apt. 504\nTaylorshire, AS 34666	(580)537-7915x38489	woodselaine@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
106	3	Laura Lee	1988-04-18	24153 Fox Junctions\nStephenville, WA 11250	964-289-2199	erinroberts@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
107	1	Pamela Jackson	1973-07-14	Unit 4955 Box 1681\nDPO AE 41793	001-696-650-5792x642	mary75@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
108	2	Robert Kelly	1975-10-19	13458 Taylor Valley\nLake Michaelhaven, ND 63948	001-280-963-0265x992	tevans@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
109	1	Karen Gonzalez	1991-01-22	8796 Sandra Port\nCameronberg, ND 97931	529.843.9579x81121	hubernicholas@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
110	1	Linda Nelson	1974-08-01	98247 Johnson Stravenue Apt. 467\nJacobbury, ND 12340	(422)690-8255	susanrodriguez@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
111	3	Tonya Richards	1961-12-20	9311 Brian Lodge\nSouth Bryanborough, SC 33666	972-681-1432x5675	howardjones@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
112	1	Margaret Pacheco	2004-12-17	3380 Williams Rapids\nWilliamsfort, PA 65951	(301)203-3741	lindascott@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
113	1	Laurie Hall	1986-08-06	5614 Henderson Plaza Apt. 731\nHowardtown, NY 78415	252.318.7704	andrewchan@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
114	4	Luis Cruz	1988-08-26	5026 Dougherty Fall Apt. 436\nDavidberg, MH 48468	001-867-341-0796x2695	cbriggs@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
115	3	Brandy Jones	2005-03-16	1638 Bowman Landing Apt. 941\nPort Rodneyport, TX 07685	(654)877-2821x1024	lambrian@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
116	2	Joseph Nelson	1992-09-30	72594 Scott Trail\nPort Douglasborough, MI 06585	899-348-8337x767	clarkamber@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
117	4	Shannon Moore	2004-01-25	410 Brittany Meadow Apt. 803\nPort Tracey, NE 84001	(829)313-1571x0310	pwashington@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
118	4	Natalie Gordon	1956-07-24	154 Harrison Island\nSouth Catherine, PW 52395	231-397-2718x48604	mackenzie99@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
119	1	Nicholas Moore	1962-09-04	452 Turner Mountains Apt. 317\nRiddleton, MN 24925	001-888-518-3999	franklinkevin@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
120	1	Karen Long	1990-06-12	981 Yang Ridge\nNathanielhaven, OR 43610	(860)547-2850x2469	toddjason@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
121	1	Nicholas Long	2002-06-25	91932 Moore Groves Suite 523\nSouth Gina, PW 80889	961-782-0608	campbellholly@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
122	1	Toni Leon	1958-05-31	52365 Jessica Run\nJohnshire, DC 46308	+1-797-943-7033x11370	danielkathryn@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
123	4	James Green	2001-05-13	98245 Dawn Loaf Suite 115\nStanleystad, NV 85433	953.407.7776x47069	trivers@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
124	3	William Lopez	1964-05-16	9911 Carlson Tunnel\nWest Rachelberg, OH 50814	(688)822-0780	jonesdaniel@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
125	4	Jason Nichols	1967-06-13	07575 Amanda Lakes Apt. 008\nJoyceport, HI 07154	001-739-278-4440	pamelajenkins@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
126	1	Brenda Weaver	1984-06-25	2536 Denise Roads\nVargasmouth, IN 31779	+1-392-614-9745x334	sharonwiley@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
127	2	Joseph Anderson	1994-07-04	018 Chen Vista Apt. 077\nLake Sierra, VI 19115	+1-262-605-5044x06882	fpowell@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
128	4	Rhonda Mcdonald	2002-03-24	692 Brandi Loop Apt. 658\nPort Crystalview, WA 13365	+1-982-737-8977x679	cohensusan@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
129	2	Alexandria Carter	2002-03-22	65307 James Center\nDarlenemouth, OH 27139	666.550.2963	jonathan60@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
130	4	Kevin Odonnell	1993-02-14	4207 Gary Stream Suite 691\nHollowayberg, NC 56735	001-245-928-8967	edwardstheresa@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
131	4	Joseph King	2005-06-04	340 Le Light\nEast Amber, IA 78049	(814)563-4806	walkercheryl@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
132	1	Jeremy Gonzales	1991-04-20	30367 Figueroa Squares\nThomasborough, LA 28938	001-325-451-0810x958	stoutmiranda@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
133	2	Robert Munoz	1996-01-20	6925 Katherine Common Apt. 076\nPort Luis, LA 92082	2063357039	garyday@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
134	2	Mrs. Carly Edwards	1998-12-08	92718 Deanna Crossroad\nBrittanyfort, CA 50671	327-960-4826x3289	nicolas69@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
135	1	Nancy Scott	1973-07-12	901 Christina Brooks\nJonathanchester, AK 53875	+1-756-205-8289x023	gordonadam@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
136	2	Alexander Golden	1992-03-26	9676 Amanda Springs\nDennisport, HI 06151	730-310-5958	stephenbush@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
137	4	Hannah Scott	1969-03-19	20824 Pena Street\nPort Calvin, CO 60263	844-754-0297x63535	michael02@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
138	3	Robert Campbell	1983-02-28	36229 Ruben Ferry Apt. 705\nPort Kristinhaven, CO 75450	894-234-2376x846	ariasgloria@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
139	4	Rebecca Lam	1999-12-10	65884 Kristen Ford\nNorth Barbaraside, AL 57362	916-834-6423x60690	brooksnicholas@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
140	4	Michael Spencer	1988-09-14	36221 Wendy Groves\nRodriguezburgh, ID 66337	210-640-6246	aliciareid@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
141	2	Mr. Joshua Mcmahon	1987-01-07	29294 Rodriguez Dam\nAndrewtown, MO 40992	5042090904	reedthomas@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
142	4	Jennifer Perry	1965-08-28	9060 Morgan Summit Apt. 067\nPort Davidville, IA 34926	227-297-6359	xwalters@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
143	3	Desiree Hernandez	1958-10-17	8636 Kelley Circle Apt. 752\nWallsside, NV 14073	+1-306-275-1775x39052	tanderson@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
144	4	Alexander Hernandez	1955-02-03	4892 Daniel Highway\nPort Debra, UT 95329	512-976-6914	rebeccasimpson@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
145	4	John Maxwell	1962-04-16	070 Stanley Bridge Suite 691\nLake Adriennemouth, MD 97331	+1-804-809-7251x157	mblack@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
146	3	Annette Thomas	1959-02-02	1594 Wolf Fields\nCollinsstad, VA 33186	001-958-705-6105x795	francisamy@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
147	4	John Browning	1956-05-07	PSC 2425, Box 0159\nAPO AA 44812	705-991-2346	patrick39@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
148	2	Alice Peterson	1992-12-02	99294 Hernandez Plaza\nBrownville, CT 50412	589-858-8864x2363	adamsjeffrey@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
149	3	Fernando Hammond	1982-02-26	Unit 3014 Box 0267\nDPO AA 39684	+1-486-417-2324x129	qshannon@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
150	3	Regina Patel	1995-08-13	962 Shannon Radial Suite 943\nLake Brian, MI 63233	8156356052	kimberly83@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
151	4	Lindsey Allen	1977-07-26	002 Logan Falls\nOliverstad, MD 04971	(500)939-2661	amy17@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
152	1	Justin Robinson	1960-12-26	USNV Lee\nFPO AP 30968	563.510.2047x110	petersonalexandra@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
153	4	John Wright	1995-11-26	PSC 0468, Box 2001\nAPO AE 08491	485-487-3494	glee@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
154	3	Sarah Page	1970-03-16	5658 Alexis Via Apt. 885\nNorth Lisa, VI 89282	001-998-305-0627x283	stewartjackson@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
155	2	William Sandoval	1985-02-25	4576 Ward Radial\nRogerchester, NC 82052	+1-743-559-6798x842	carterlisa@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
156	2	Paul Cook	2001-11-14	Unit 7756 Box 3467\nDPO AA 73732	2484280847	megan44@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
157	3	Nicholas Hayes	2004-07-03	577 Lewis Radial Suite 122\nWest Stephenmouth, NM 56415	+1-741-652-2016x621	edwardchen@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
158	3	Mathew Sutton	1983-08-31	0307 Aaron Island\nNorth Amandaport, AR 30657	958.985.7150	rodriguezcrystal@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
159	3	Jennifer Rush	1966-06-03	28040 Rodriguez Rue\nAdamsmouth, KY 12671	(619)747-1013	nicholsanita@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
160	2	Nicholas King	1965-08-23	20198 Brittany View\nAnashire, GU 82170	(447)634-5930	martinsean@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
161	1	Laura Briggs	1970-04-30	USNS White\nFPO AP 16834	861.705.9626x251	carrdarrell@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
162	1	Ronald Santiago	2002-03-15	12202 Sheri Key Suite 439\nLyonsmouth, DC 24690	001-915-549-4792x978	bjohnson@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
163	3	Alex Jimenez	1982-04-07	Unit 0051 Box 7420\nDPO AP 87788	946.724.9471x2148	galvanjanet@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
164	2	Jon Wilson	1974-03-14	294 Tammy Bridge Apt. 736\nNew Amy, OH 71171	(289)569-7097	torrescarlos@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
165	4	Scott Schmidt	1978-04-03	0220 Harrison Port Apt. 414\nLisaborough, WY 02405	838.899.7441x364	cassandra33@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
166	2	Angel Johnson	1980-01-15	599 Perkins Passage Apt. 183\nWest Earlmouth, TX 56958	202-420-0894	shaneowens@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
167	1	Brady Smith	1990-01-27	9424 David Islands\nBenjaminland, WA 80949	9745715609	bwilliams@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
168	4	Maria Horton	1958-11-10	39845 Saunders Ridge\nSouth Davidshire, ID 52716	7186826541	sandybeltran@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
169	4	Marissa Lamb	1994-01-24	3405 Carroll Haven\nJohnshire, NV 23264	+1-828-796-9619x05414	jschaefer@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
170	1	Mckenzie Price	2003-07-24	PSC 8093, Box 0599\nAPO AE 90958	001-209-502-8538	aaronmoss@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
171	2	Christine Roberts	1998-05-11	44363 Michael Ridge\nCannonburgh, FL 23422	+1-513-558-4627	gbest@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
172	3	Luke Hansen	1989-12-13	505 Elijah Underpass Suite 117\nJamesfurt, MN 06777	302.961.4264x2295	chadmitchell@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
173	4	Carol Gonzalez	1998-11-28	6991 Jessica Station Suite 328\nPort Jasmine, CA 29426	917.674.0179x69699	jreynolds@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
174	3	Christopher Brown	1961-10-21	1694 Ashley Pike Suite 747\nPort Jacqueline, OH 38447	520.409.9694	felicia26@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
175	1	Kristen Torres	1989-07-03	31256 Jackson Port Suite 671\nCaseyhaven, AR 16546	965.716.4872x92546	wilkinsonkeith@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
176	3	Margaret Whitney	1987-12-07	104 Smith Stravenue\nTurnertown, NC 70483	(627)363-0700	morganwilliams@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
177	2	Julie Holden	1962-07-22	PSC 0485, Box 2085\nAPO AE 58827	887.249.9918	christyvargas@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
178	2	Matthew Johnson	1990-08-10	7295 Holly Crossing\nWest Cody, FL 08169	243.464.3621x0253	kaitlinmills@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
179	2	Alan Thompson	2001-07-08	9868 George Square Apt. 680\nLake Brendachester, KY 51732	465-310-2349x709	marystrickland@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
180	3	Lori Cooper DVM	1978-09-03	944 Lisa Circles\nNashmouth, UT 72725	(795)685-6802x42791	michael32@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
181	1	Cheryl Snow	1973-03-12	2449 Scott Prairie Apt. 184\nChambersview, OR 96280	001-642-999-5517x41085	contrerascorey@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
182	2	Teresa Anderson	1987-09-12	680 Diaz Walks Suite 824\nRachelview, PA 69687	573-820-4764x21496	williamsjustin@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
183	2	Sheri Roberts	1961-05-18	85208 Cole Parkways Apt. 201\nTimothyport, MA 62543	274-517-6128x922	coxmelissa@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
184	1	Carmen Lara	1997-04-05	046 Cummings Plain\nMichaelfurt, NH 18000	+1-430-882-0198x461	stevengillespie@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
185	4	Michael Watson	1996-12-14	5296 Henry Cove\nAndersonhaven, KS 50058	(633)496-9034	brianthompson@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
186	3	Jonathan Ramos	1960-08-28	USCGC Long\nFPO AP 47998	490-312-4403	garzadavid@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
187	4	Jesse Taylor	2000-10-05	67083 John Lights Apt. 577\nWest Dianeton, AR 99667	395.338.6884x59359	melissa46@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
188	1	Michaela Ellis	1964-06-20	190 Strickland Camp Apt. 092\nLucasborough, FM 36946	001-274-979-2500x550	ronald51@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
189	1	Ryan Larson	1977-05-30	96912 Sheri Street\nNathanchester, MA 52343	5632847931	lmorris@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
190	4	Debra Gonzales	1987-05-20	8551 Yu Oval Apt. 932\nWest Joshuaport, ME 73803	+1-201-673-8997	erica52@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
191	2	Daniel Brown	1989-05-18	6091 Miller Ford Suite 637\nWest Julie, DE 72875	001-219-751-4814x9616	wwood@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
192	2	Shelley Powell	1992-05-15	921 Powers Turnpike\nNorth Steven, NY 04978	+1-389-444-6717x828	susan35@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
193	3	Joseph Kelly	2006-02-28	44147 Jeremy Summit Suite 988\nNorth Margaretport, AS 57247	344.312.2773	mcdonaldkelly@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
194	1	Cynthia Jones	1957-03-27	29527 Marsh Plain\nPort Jacob, MO 01289	626.742.7674	gregorypollard@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
195	2	Anthony Melton	2006-01-24	136 Fischer Islands\nMaxwellborough, FM 31314	(503)355-8116x83923	edwardhubbard@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
196	1	Alexander Peterson	1978-09-18	0134 Smith Port Suite 176\nHernandezchester, HI 95065	511-338-8832	dmorgan@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
197	4	Carl Lewis	1970-04-19	0398 Hunter Forks Suite 674\nEast Michealbury, AK 13990	001-517-757-7503x811	willisjonathon@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
198	2	John Salas	1979-10-23	195 Glass Point\nNorth Tammyburgh, AR 56101	920-718-8924	joneshaley@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
199	4	Melissa Rivera	1960-08-29	7556 Emily Crossing\nSouth Carl, KS 71642	592-425-2036	paulashort@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
200	1	Kirsten Garrett	1980-12-14	995 Charles Trace Suite 284\nNorth Krystal, DC 32653	4855659311	yesenia85@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
\.


--
-- Data for Name: DepositTypes; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."DepositTypes" (deposit_type_id, type, description, created_at, updated_at) FROM stdin;
1	Personal Loan	Unsecured loan offered to individuals for personal expenses like travel, education, or emergencies.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
2	Home Loan	Loan given to purchase, construct, or renovate a residential property.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
3	Auto Loan	Loan provided to purchase new or used vehicles, usually secured by the vehicle itself.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
4	Education Loan	Loan designed to cover tuition fees, books, and other study-related expenses.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
5	Business Loan	Loan given to entrepreneurs or companies to meet business capital needs.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
6	Gold Loan	Secured loan where gold jewelry is pledged as collateral.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
7	Mortgage Loan	Long-term loan secured against real estate, often used for large financing needs.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
8	Overdraft Facility	Credit facility allowing account holders to withdraw more than their balance.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
9	Credit Card Loan	Short-term loan linked to a credit card, with interest charged on outstanding balance.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
10	Agricultural Loan	Loan provided to farmers for agricultural activities like seeds, equipment, or irrigation.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
\.


--
-- Data for Name: Deposits; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."Deposits" (deposit_id, customer_id, deposit_identifier, deposit_type_id, balance, term, interest_rate, start_date, end_date, created_at, updated_at) FROM stdin;
1	165	PD609256121905408	3	18757.44	1M	3.9000	2025-08-03	2028-08-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
2	33	PD649551413034775	7	11013.12	3M	4.2000	2025-03-16	2031-03-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
3	153	PD534686814533551	5	28681.73	9M	5.0000	2025-08-01	2029-08-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
4	179	PD914601912720279	4	8267.70	6M	3.6000	2025-05-31	2032-05-31	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
5	36	PD229561792422906	6	27146.91	1M	7.6000	2024-10-27	2030-10-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
6	172	PD341311760401700	9	47185.04	3M	5.9000	2025-01-18	2031-01-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
7	14	PD272863118440266	3	12898.26	3M	7.8000	2024-10-21	2028-10-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
8	99	PD609089360637224	8	16949.79	12M	4.6000	2025-05-03	2028-05-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
9	195	PD261039791984589	4	19638.45	1M	6.8000	2025-01-06	2026-01-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
10	131	PD765526375460900	5	49919.41	6M	7.7000	2025-08-30	2031-08-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
11	100	PD379741013462756	6	43353.83	1M	4.0000	2025-06-24	2030-06-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
12	3	PD467505095218808	1	46920.06	12M	6.3000	2024-12-19	2031-12-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
13	28	PD591075025419689	9	11419.07	6M	3.6000	2025-05-14	2034-05-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
14	115	PD687986839581770	6	36667.53	1M	4.7000	2024-12-01	2032-12-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
15	80	PD537909106114150	8	32574.65	9M	6.3000	2024-12-14	2027-12-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
16	188	PD510323063018148	7	23714.11	9M	3.4000	2025-05-13	2033-05-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
17	128	PD728467351872090	8	40090.68	1M	3.9000	2025-06-03	2028-06-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
18	164	PD094785146051746	4	32155.35	6M	7.4000	2025-03-23	2030-03-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
19	148	PD487937117704360	9	21756.51	12M	7.6000	2025-07-27	2026-07-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
20	80	PD622334030118415	8	33121.12	12M	6.1000	2024-12-07	2032-12-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
21	197	PD358557249233836	5	5814.84	12M	6.5000	2025-06-14	2027-06-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
22	184	PD696244531694484	8	28382.62	12M	7.1000	2024-10-31	2025-10-31	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
23	64	PD630565849732320	6	141.21	3M	5.7000	2025-02-06	2035-02-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
24	82	PD196994046463656	6	30332.80	6M	3.4000	2025-05-27	2027-05-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
25	194	PD477710315216472	5	29860.48	1M	5.6000	2025-05-24	2030-05-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
26	26	PD590354295525502	4	9967.34	12M	6.2000	2025-04-17	2026-04-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
27	99	PD578419921609035	2	9066.66	3M	6.3000	2025-05-18	2035-05-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
28	46	PD725244186102951	9	16330.22	9M	3.8000	2025-06-21	2027-06-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
29	23	PD650296484595564	3	41651.56	3M	3.9000	2025-01-23	2032-01-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
30	55	PD965485685752504	1	31928.83	12M	7.5000	2025-09-07	2034-09-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
31	62	PD979467460031941	8	45978.96	1M	4.9000	2025-01-21	2027-01-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
32	129	PD693612257218875	4	37691.71	3M	5.9000	2025-02-17	2029-02-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
33	95	PD582327752829632	2	24439.70	12M	7.8000	2025-06-06	2028-06-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
34	132	PD715744345336127	2	32189.61	3M	6.2000	2025-09-21	2034-09-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
35	50	PD480147486005163	2	28813.36	1M	8.0000	2024-11-21	2031-11-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
36	7	PD225215150205790	4	29280.26	12M	3.4000	2024-10-01	2032-10-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
37	70	PD577297035421245	2	15624.24	12M	5.6000	2025-09-16	2028-09-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
38	124	PD432168913595099	10	29101.06	1M	7.1000	2025-09-20	2034-09-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
39	116	PD036266910294293	7	3546.64	3M	4.4000	2025-03-05	2029-03-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
40	142	PD908854734778946	1	40509.85	1M	5.7000	2025-06-03	2032-06-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
41	8	PD165370129364802	3	34214.95	9M	7.9000	2024-12-07	2031-12-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
42	73	PD450014922253149	2	27167.63	9M	6.2000	2025-07-22	2032-07-22	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
43	69	PD713278380595424	9	28479.26	12M	5.6000	2025-03-04	2026-03-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
44	127	PD579600021714611	5	22037.63	1M	4.1000	2024-12-20	2033-12-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
45	183	PD518858097075460	4	2165.13	3M	7.5000	2025-07-08	2030-07-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
46	182	PD311612834234478	4	44530.29	3M	6.8000	2025-01-20	2030-01-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
47	117	PD040683462108396	4	47224.43	6M	4.4000	2025-03-12	2034-03-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
48	168	PD255374106032107	2	10331.67	6M	5.3000	2025-02-12	2030-02-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
49	127	PD321085561358334	1	42158.50	6M	4.3000	2025-04-04	2032-04-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
50	98	PD615693795527934	5	17773.83	3M	7.3000	2024-12-29	2033-12-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
51	125	PD591163793223447	7	20120.28	1M	3.7000	2025-04-12	2035-04-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
52	69	PD873658937525671	3	3566.71	9M	5.2000	2025-06-28	2035-06-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
53	184	PD358263381870365	1	15002.12	6M	3.7000	2024-11-17	2030-11-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
54	111	PD296630078793499	3	30988.72	12M	7.7000	2025-03-03	2027-03-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
55	91	PD310567086508806	6	41480.48	9M	6.4000	2024-10-10	2027-10-10	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
56	44	PD102707250782606	2	48957.61	1M	7.6000	2025-08-26	2029-08-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
57	197	PD601913218129686	2	25832.64	3M	7.1000	2025-08-18	2029-08-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
58	65	PD542931389283777	1	31611.14	12M	4.5000	2025-01-12	2032-01-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
59	181	PD536972565325546	10	17266.38	9M	8.0000	2025-05-04	2034-05-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
60	90	PD655559515924803	4	35000.75	1M	7.1000	2025-01-27	2028-01-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
61	68	PD197792624246778	8	40056.27	9M	5.7000	2025-05-30	2033-05-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
62	31	PD179975548975238	2	31040.00	6M	4.7000	2025-08-07	2034-08-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
63	157	PD501354031284363	2	587.13	9M	3.0000	2025-02-27	2035-02-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
64	127	PD789259548666606	10	7786.14	1M	4.0000	2025-04-30	2026-04-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
65	37	PD480553828729578	10	39028.42	9M	4.4000	2024-10-14	2026-10-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
66	121	PD300129597653458	4	40627.46	3M	4.6000	2024-12-14	2032-12-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
67	117	PD038858299983618	6	21101.00	1M	3.1000	2024-11-05	2029-11-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
68	61	PD065988803442732	2	14774.46	3M	7.5000	2025-05-29	2028-05-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
69	181	PD028374985022309	6	23639.22	12M	3.8000	2024-12-08	2026-12-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
70	114	PD269676954701745	5	22300.91	9M	5.2000	2025-02-14	2026-02-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
71	153	PD240950275579542	6	48114.09	1M	4.0000	2024-09-25	2027-09-25	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
72	181	PD281416310685564	3	10875.74	12M	3.3000	2025-05-02	2026-05-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
73	76	PD139280295532498	5	45368.33	3M	7.2000	2025-09-18	2026-09-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
74	7	PD850785010013054	10	15540.27	1M	6.1000	2025-03-12	2026-03-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
75	71	PD631775196857428	9	28275.72	1M	6.0000	2025-08-28	2031-08-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
76	170	PD177315375342617	4	41197.74	12M	3.8000	2025-02-15	2029-02-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
77	115	PD291344864905726	3	35299.61	1M	6.4000	2024-10-13	2031-10-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
78	69	PD664671369591279	9	49478.57	1M	5.6000	2024-12-07	2027-12-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
79	195	PD609504383875637	5	14478.39	3M	7.6000	2025-08-22	2027-08-22	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
80	94	PD927633173158195	7	41842.75	3M	6.5000	2025-01-27	2034-01-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
81	66	PD058778052986492	8	9638.67	6M	3.6000	2025-08-04	2027-08-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
82	131	PD854451822698857	6	18151.82	6M	4.4000	2025-03-25	2035-03-25	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
83	107	PD277408035038662	3	3873.59	12M	4.6000	2024-10-26	2030-10-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
84	38	PD225201817511814	2	38105.96	9M	3.0000	2025-06-05	2028-06-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
85	89	PD681076441449938	9	25676.81	12M	3.8000	2025-04-22	2033-04-22	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
86	96	PD779551401204199	9	34963.15	6M	4.0000	2025-02-19	2031-02-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
87	12	PD677944993216071	8	15382.47	9M	6.3000	2025-09-04	2026-09-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
88	18	PD751665074693011	1	42044.42	12M	3.7000	2025-06-15	2029-06-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
89	71	PD387255188580657	8	31392.92	12M	4.9000	2025-01-31	2035-01-31	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
90	37	PD409674849117326	5	27052.28	12M	4.5000	2024-10-02	2025-10-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
91	123	PD865696086662619	1	49085.66	3M	3.2000	2025-06-09	2031-06-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
92	60	PD156598388665653	9	28564.80	3M	6.6000	2025-07-19	2028-07-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
93	83	PD177048797387316	10	41498.03	9M	6.8000	2025-06-21	2026-06-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
94	143	PD433886715747518	10	26669.56	9M	6.9000	2024-11-07	2030-11-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
95	56	PD084674393897937	1	28355.47	9M	6.0000	2025-07-12	2035-07-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
96	20	PD087918117537205	4	41701.44	9M	5.6000	2025-08-07	2033-08-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
97	193	PD825297303182970	7	38527.35	3M	6.9000	2025-05-11	2030-05-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
98	4	PD162158588906177	7	20252.36	9M	6.7000	2025-07-02	2030-07-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
99	178	PD686315731693068	8	22746.16	6M	7.7000	2025-08-15	2027-08-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
100	9	PD526060778352759	6	32777.67	9M	7.4000	2025-05-16	2033-05-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
101	78	PD990266067812544	2	34697.99	12M	6.4000	2024-11-26	2027-11-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
102	137	PD349136787676305	7	44984.09	12M	6.2000	2024-10-08	2032-10-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
103	67	PD314932442162498	7	8435.05	3M	6.5000	2025-05-26	2027-05-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
104	51	PD998380366673146	5	18889.31	9M	6.8000	2025-04-04	2032-04-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
105	36	PD225596049412554	8	45574.37	6M	4.8000	2025-05-24	2028-05-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
106	180	PD700513058811503	3	40602.07	1M	7.2000	2025-01-06	2028-01-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
107	182	PD130567211686531	5	47547.36	6M	6.3000	2025-04-29	2030-04-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
108	78	PD021354655029415	2	29069.51	3M	7.0000	2025-07-02	2030-07-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
109	120	PD972067220987510	3	12407.16	3M	7.9000	2025-05-16	2030-05-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
110	66	PD532657874027739	7	49633.26	3M	6.6000	2024-10-01	2032-10-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
111	156	PD551994331235058	7	41974.08	9M	6.7000	2024-10-05	2026-10-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
112	145	PD450057169666731	2	29095.10	3M	7.6000	2025-08-28	2034-08-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
113	188	PD448754371008904	9	22524.46	3M	6.3000	2024-11-19	2034-11-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
114	4	PD885985214059914	4	22779.57	12M	6.1000	2024-11-25	2028-11-25	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
115	157	PD629011388972451	5	5947.35	3M	7.5000	2025-02-12	2035-02-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
116	103	PD298533276908542	5	11950.57	12M	4.3000	2025-04-11	2031-04-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
117	28	PD628200873835796	1	33195.32	3M	5.1000	2024-10-26	2032-10-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
118	198	PD530550675020174	7	42175.30	12M	7.5000	2025-08-14	2029-08-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
119	52	PD130494801452161	10	6846.80	1M	3.1000	2024-10-27	2028-10-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
120	66	PD469118632517582	1	11604.80	9M	3.2000	2025-01-12	2027-01-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
121	131	PD048009866403657	8	13811.06	3M	4.3000	2025-01-01	2034-01-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
122	20	PD372019451185684	6	33380.60	6M	7.1000	2025-02-20	2034-02-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
123	149	PD153008794305087	4	43088.78	6M	5.2000	2025-05-14	2028-05-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
124	23	PD757570281832866	4	20475.74	1M	7.5000	2024-12-29	2033-12-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
125	69	PD962471986343030	5	14046.77	1M	7.5000	2025-06-10	2029-06-10	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
126	4	PD176275250062931	8	43325.62	9M	3.3000	2025-02-23	2033-02-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
127	187	PD888928619059589	6	47482.49	9M	6.5000	2025-08-05	2035-08-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
128	142	PD185360762097443	10	7988.20	9M	4.2000	2024-12-08	2025-12-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
129	103	PD388316257228574	3	32861.90	9M	3.2000	2025-01-23	2031-01-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
130	59	PD409653229739056	5	9224.04	9M	4.6000	2025-09-06	2027-09-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
131	72	PD695722511555682	7	17142.65	9M	5.1000	2025-02-26	2031-02-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
132	69	PD870877567816699	4	40078.01	12M	3.1000	2024-10-04	2032-10-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
133	70	PD554544532007449	4	27753.00	9M	6.5000	2025-03-28	2033-03-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
134	48	PD691302991377980	1	11401.04	9M	4.0000	2025-03-13	2034-03-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
135	57	PD976618348486421	9	12500.97	3M	5.2000	2024-09-23	2033-09-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
136	90	PD627051862589238	4	11933.83	12M	3.8000	2025-09-02	2026-09-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
137	29	PD963715147467156	7	19336.52	1M	6.8000	2025-08-30	2030-08-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
138	64	PD808034012476467	6	5761.29	12M	5.7000	2025-03-09	2029-03-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
139	148	PD829154151227782	7	43854.10	1M	4.9000	2025-01-17	2032-01-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
140	131	PD898673068553739	3	21134.56	1M	7.6000	2025-09-08	2031-09-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
141	150	PD128834953351658	4	27596.67	9M	3.1000	2025-02-20	2035-02-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
142	104	PD486850512991396	1	17956.99	1M	7.4000	2024-10-11	2031-10-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
143	150	PD002656321445811	3	25925.97	6M	5.6000	2025-06-18	2033-06-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
144	179	PD892800898670277	4	24726.02	6M	3.1000	2025-08-17	2032-08-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
145	3	PD240613247483576	5	28088.36	3M	4.4000	2025-09-16	2028-09-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
146	190	PD698832512899905	10	36275.83	1M	6.2000	2025-09-08	2032-09-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
147	162	PD861657690239738	7	22381.80	6M	5.4000	2024-11-11	2029-11-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
148	180	PD907659107101734	5	43757.52	9M	5.2000	2024-11-19	2034-11-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
149	61	PD921493633996779	1	30962.75	12M	7.5000	2025-06-30	2029-06-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
150	45	PD329398151921836	10	10283.51	3M	6.1000	2024-11-03	2033-11-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
151	84	PD154283928167380	8	42162.83	6M	3.2000	2025-02-28	2026-02-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
152	63	PD510683096656686	7	28080.56	6M	3.6000	2025-04-07	2033-04-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
153	124	PD159589741417484	1	10810.01	12M	5.7000	2025-01-22	2026-01-22	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
154	58	PD593413921109972	2	32075.02	12M	3.3000	2024-11-16	2025-11-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
155	50	PD457325052767607	6	3213.37	12M	7.1000	2024-09-30	2029-09-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
156	101	PD381665508560816	10	18794.60	3M	3.7000	2025-07-09	2033-07-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
157	2	PD748674329148947	2	39867.14	9M	7.7000	2025-01-06	2030-01-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
158	41	PD754602855145101	10	44979.67	9M	5.0000	2025-04-13	2035-04-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
159	11	PD419210333563263	10	32989.69	1M	7.2000	2025-09-05	2031-09-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
160	19	PD712041265337091	1	7705.24	1M	6.7000	2025-04-02	2035-04-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
161	193	PD643207473269606	8	32743.64	12M	6.7000	2025-04-12	2026-04-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
162	51	PD301364078920926	7	5906.62	12M	3.1000	2025-08-24	2029-08-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
163	118	PD407814694760362	4	15794.32	9M	6.4000	2025-01-09	2030-01-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
164	20	PD790064761866223	2	12314.35	1M	3.5000	2025-04-29	2033-04-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
165	73	PD134336387203818	10	2168.01	1M	4.6000	2024-12-30	2026-12-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
166	113	PD652840497504172	7	42695.86	1M	4.4000	2025-09-08	2030-09-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
167	3	PD442025428535325	1	9381.79	9M	7.3000	2025-02-02	2028-02-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
168	146	PD926189560387733	4	46321.36	3M	4.3000	2024-10-11	2029-10-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
169	109	PD257159486502021	7	11888.28	6M	3.8000	2025-08-08	2027-08-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
170	155	PD727590827881302	7	17074.04	12M	3.7000	2024-11-15	2032-11-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
171	172	PD368818346024714	2	37230.24	6M	3.3000	2025-04-04	2030-04-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
172	32	PD490682698606135	1	5900.64	6M	3.9000	2025-06-07	2027-06-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
173	52	PD575823276522277	4	1588.56	6M	5.1000	2025-04-30	2032-04-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
174	68	PD734286211942842	8	19170.14	3M	6.4000	2025-08-10	2032-08-10	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
175	176	PD885617681455660	3	34566.28	12M	5.4000	2025-04-02	2027-04-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
176	154	PD199272539033358	2	21431.52	3M	4.6000	2025-04-13	2027-04-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
177	38	PD843228252471235	7	12857.16	9M	7.0000	2024-12-15	2034-12-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
178	47	PD838257811449609	9	32950.58	1M	4.3000	2025-04-17	2030-04-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
179	7	PD070055500042483	5	21885.99	3M	5.5000	2025-07-05	2034-07-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
180	114	PD396078123145633	9	31537.48	3M	3.7000	2024-10-07	2026-10-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
181	191	PD975578037480778	7	40933.83	6M	7.5000	2024-10-06	2030-10-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
182	35	PD795529384927609	5	42392.46	1M	6.0000	2025-04-07	2032-04-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
183	125	PD302927748666395	9	39590.50	6M	4.7000	2025-05-14	2034-05-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
184	194	PD120663204723044	7	33732.74	12M	7.7000	2025-05-11	2033-05-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
185	122	PD048576420837416	2	20394.03	6M	4.5000	2024-11-24	2033-11-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
186	143	PD807553534467441	8	6314.10	9M	6.6000	2025-06-24	2026-06-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
187	49	PD274719785915636	6	41969.67	1M	6.4000	2025-02-01	2028-02-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
188	42	PD488152645451828	6	268.82	9M	5.6000	2024-12-01	2033-12-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
189	28	PD093281037785497	4	4379.57	1M	7.8000	2025-01-29	2031-01-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
190	179	PD965612489630614	6	49971.67	1M	5.3000	2025-03-03	2028-03-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
191	132	PD979296296648031	10	31200.90	9M	7.6000	2025-05-31	2031-05-31	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
192	20	PD573050104985354	10	49969.14	9M	5.7000	2025-07-23	2028-07-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
193	22	PD694730814558910	4	36332.33	1M	5.6000	2025-02-08	2030-02-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
194	174	PD156552333431269	6	37943.54	9M	5.9000	2025-03-09	2034-03-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
195	26	PD794254880954647	1	5366.92	6M	3.7000	2024-09-29	2033-09-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
196	42	PD503966205423811	6	3765.81	1M	3.1000	2025-03-17	2034-03-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
197	28	PD209911221474873	4	47645.75	3M	3.2000	2025-06-29	2035-06-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
198	158	PD561162656649234	6	3213.89	3M	6.5000	2025-08-30	2026-08-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
199	6	PD318740083749901	5	43258.42	6M	4.5000	2025-07-25	2029-07-25	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
200	3	PD113608492641356	4	35690.86	1M	5.7000	2025-05-23	2035-05-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
\.


--
-- Data for Name: LoanTypes; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."LoanTypes" (loan_type_id, type, description, created_at, updated_at) FROM stdin;
1	Personal Loan	Unsecured loan offered to individuals for personal expenses like travel, education, or emergencies.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
2	Home Loan	Loan given to purchase, construct, or renovate a residential property.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
3	Auto Loan	Loan provided to purchase new or used vehicles, usually secured by the vehicle itself.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
4	Education Loan	Loan designed to cover tuition fees, books, and other study-related expenses.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
5	Business Loan	Loan given to entrepreneurs or companies to meet business capital needs.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
6	Gold Loan	Secured loan where gold jewelry is pledged as collateral.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
7	Mortgage Loan	Long-term loan secured against real estate, often used for large financing needs.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
8	Overdraft Facility	Credit facility allowing account holders to withdraw more than their balance.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
9	Credit Card Loan	Short-term loan linked to a credit card, with interest charged on outstanding balance.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
10	Agricultural Loan	Loan provided to farmers for agricultural activities like seeds, equipment, or irrigation.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
\.


--
-- Data for Name: Loans; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."Loans" (loan_id, customer_id, loan_identifier, loan_type_id, balance, payment_term, interest_rate, start_date, end_date, created_at, updated_at) FROM stdin;
1	18	LD145314212923852	10	-23319.11	12M	9.6000	2023-11-06	2030-11-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
2	81	LD487663520818681	1	-29281.38	6M	6.6000	2024-10-03	2026-10-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
3	183	LD368252720639848	9	-43526.60	12M	9.6000	2025-09-11	2032-09-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
4	174	LD324940452297919	7	-18678.64	12M	10.0000	2025-07-31	2026-07-31	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
5	76	LD083116506831124	8	-19739.70	6M	2.3000	2025-02-04	2029-02-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
6	94	LD453050917803866	3	-3149.91	9M	6.1000	2024-01-25	2029-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
7	21	LD289560082909339	7	-8130.16	3M	9.6000	2025-08-21	2029-08-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
8	189	LD465488368786854	8	-28550.52	6M	2.5000	2024-11-24	2025-11-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
9	106	LD815494736469094	10	-20305.73	6M	3.5000	2024-11-02	2025-11-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
10	198	LD032390546235431	10	-26274.01	12M	7.6000	2024-03-03	2034-03-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
11	63	LD067180591274944	8	-43147.36	1M	4.0000	2023-11-05	2026-11-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
12	28	LD278920882940922	3	-40452.98	6M	9.0000	2024-06-07	2034-06-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
13	70	LD122204487049002	6	-35710.94	1M	3.9000	2023-12-27	2027-12-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
14	150	LD006616586984943	3	-45399.49	1M	7.1000	2023-12-23	2029-12-23	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
15	198	LD537477441630776	7	-17035.74	1M	6.3000	2024-08-18	2026-08-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
16	111	LD247967780511262	6	-33319.69	12M	1.5000	2024-09-07	2034-09-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
17	42	LD097735726830138	7	-49007.19	9M	3.0000	2024-05-18	2034-05-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
18	15	LD436001572175010	8	-12947.97	9M	7.8000	2025-07-04	2035-07-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
19	59	LD205422140929247	9	-33083.23	12M	6.6000	2024-01-17	2027-01-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
20	52	LD096633559370361	9	-34066.69	3M	2.5000	2024-01-08	2029-01-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
21	112	LD089780182344269	5	-12368.71	6M	1.2000	2023-11-29	2029-11-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
22	24	LD889680014180640	8	-7399.61	12M	2.6000	2024-09-05	2027-09-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
23	52	LD000535523819063	6	-35008.38	9M	6.4000	2023-11-06	2029-11-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
24	80	LD392956305707775	7	-35185.78	6M	3.8000	2024-05-06	2031-05-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
25	10	LD604379073309184	4	-14929.19	3M	0.4000	2023-11-03	2024-11-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
26	43	LD162272608305598	5	-43487.09	3M	7.9000	2024-01-24	2030-01-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
27	200	LD171615552223473	5	-10291.56	3M	5.6000	2025-07-20	2035-07-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
28	138	LD336430118162965	7	-22819.89	6M	0.1000	2024-03-27	2028-03-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
29	71	LD365472961969826	7	-23209.70	12M	5.6000	2024-05-02	2028-05-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
30	200	LD618444840391467	1	-24215.09	1M	2.4000	2024-08-01	2026-08-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
31	42	LD501413748373104	5	-20146.51	1M	9.1000	2024-02-02	2025-02-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
32	188	LD336750982026845	8	-37020.51	9M	9.2000	2023-10-09	2024-10-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
33	128	LD146570059992174	7	-8913.03	1M	9.0000	2025-07-02	2030-07-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
34	116	LD347528021501652	6	-25379.90	3M	5.9000	2025-08-01	2028-08-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
35	120	LD945416042108600	8	-35317.87	1M	4.4000	2024-04-08	2034-04-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
36	103	LD990683519374763	3	-17268.67	1M	7.6000	2023-11-27	2027-11-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
37	165	LD194839074929365	1	-33418.34	3M	4.2000	2024-01-09	2025-01-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
38	52	LD539362075729936	8	-49590.03	3M	9.2000	2025-03-21	2028-03-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
39	18	LD146588337967330	10	-14273.53	12M	0.2000	2024-11-21	2026-11-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
40	14	LD600461278338733	2	-42527.48	9M	4.3000	2024-11-21	2031-11-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
41	45	LD919847438409112	4	-18700.90	3M	2.9000	2024-10-29	2030-10-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
42	140	LD504465226839931	10	-48549.13	1M	7.6000	2025-02-05	2032-02-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
43	173	LD881116440598051	5	-9974.95	1M	9.8000	2024-07-11	2033-07-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
44	108	LD408545145460569	1	-1076.17	3M	7.4000	2024-07-11	2030-07-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
45	96	LD118250234688815	9	-23257.14	12M	4.3000	2024-12-11	2029-12-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
46	68	LD274115641348521	6	-35635.14	1M	1.0000	2025-08-28	2035-08-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
47	177	LD055091536748671	6	-40713.06	12M	9.8000	2024-06-27	2033-06-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
48	61	LD565961141443421	10	-24448.00	6M	8.4000	2023-09-24	2031-09-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
49	4	LD670494986797057	2	-30127.18	9M	4.0000	2024-11-20	2027-11-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
50	11	LD515317026193732	6	-39921.71	3M	8.3000	2025-06-04	2026-06-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
51	168	LD168476026737069	2	-28585.17	12M	6.9000	2025-04-16	2026-04-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
52	101	LD185429262230884	6	-18267.80	1M	8.3000	2024-05-11	2027-05-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
53	62	LD879976807751312	4	-36949.88	12M	2.2000	2025-03-21	2027-03-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
54	69	LD718484109664589	2	-23120.86	1M	1.5000	2024-11-07	2026-11-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
55	132	LD280510403739641	6	-45787.05	1M	0.8000	2024-12-02	2029-12-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
56	88	LD388289554230603	10	-39108.82	12M	9.6000	2024-09-12	2030-09-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
57	185	LD661230181317288	7	-33399.43	12M	1.8000	2024-01-25	2028-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
58	69	LD457368617256008	8	-33507.90	12M	4.8000	2023-11-14	2025-11-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
59	133	LD056925817774084	4	-23936.91	3M	2.9000	2025-07-03	2035-07-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
60	147	LD243507031153001	2	-32827.31	9M	1.8000	2025-03-02	2031-03-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
61	16	LD951586766579204	3	-42806.97	6M	3.6000	2024-05-12	2030-05-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
62	100	LD900816536434962	1	-5209.79	6M	7.5000	2024-12-28	2026-12-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
63	184	LD555916979879274	2	-25995.43	9M	8.5000	2025-04-21	2026-04-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
64	156	LD095040624984272	6	-25982.95	6M	9.6000	2024-03-10	2026-03-10	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
65	19	LD440356953198913	4	-40641.73	6M	4.8000	2025-08-17	2032-08-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
66	72	LD531345848544451	2	-8910.68	1M	5.7000	2024-09-30	2029-09-30	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
67	121	LD726361912386720	8	-47057.95	9M	4.8000	2024-02-13	2034-02-13	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
68	50	LD623389662372793	1	-30672.09	1M	0.7000	2025-08-12	2026-08-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
69	168	LD666608550795516	6	-41037.13	12M	4.6000	2024-01-10	2028-01-10	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
70	180	LD343125591202372	1	-16949.80	12M	7.9000	2025-05-29	2030-05-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
71	158	LD170591520795090	4	-8497.87	1M	6.6000	2023-12-15	2024-12-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
72	23	LD742820756035380	1	-37983.37	1M	6.8000	2024-03-07	2027-03-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
73	71	LD948589397381734	7	-32164.84	6M	5.6000	2024-11-11	2030-11-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
74	127	LD321946251583229	10	-9582.32	3M	9.3000	2024-02-25	2026-02-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
75	170	LD148421702333832	8	-8163.50	12M	2.9000	2023-11-26	2028-11-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
76	83	LD113241503837578	5	-47947.93	3M	3.9000	2024-05-08	2028-05-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
77	143	LD931340474419961	5	-6013.65	9M	5.3000	2025-06-01	2032-06-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
78	51	LD281503537541968	9	-37301.83	3M	8.1000	2025-03-09	2030-03-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
79	44	LD912173255661225	4	-21256.26	6M	7.9000	2025-05-26	2032-05-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
80	120	LD867529609337970	9	-42572.40	6M	0.5000	2025-09-02	2032-09-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
81	59	LD001943639471876	1	-47393.77	12M	8.1000	2023-10-06	2031-10-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
82	96	LD893421384873793	3	-14372.21	9M	8.1000	2025-07-16	2030-07-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
83	81	LD911189075048366	4	-6105.89	3M	8.1000	2024-02-10	2031-02-10	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
84	107	LD229245967355360	1	-23063.73	6M	7.5000	2024-07-05	2033-07-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
85	155	LD811273817859047	2	-2343.96	6M	2.0000	2023-10-03	2024-10-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
86	180	LD038039679172594	9	-43293.56	3M	2.4000	2024-10-05	2030-10-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
87	146	LD828721255301067	3	-37044.95	1M	3.9000	2025-06-04	2034-06-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
88	98	LD450713542692954	5	-27487.59	9M	0.8000	2025-02-18	2032-02-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
89	52	LD285193329837987	5	-2727.11	3M	6.3000	2023-12-11	2032-12-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
90	86	LD343171887405451	2	-28066.45	3M	7.2000	2023-11-10	2030-11-10	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
91	173	LD477884445283682	2	-30541.37	3M	8.1000	2025-06-24	2028-06-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
92	196	LD194776517130206	8	-27759.17	1M	5.1000	2025-05-06	2035-05-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
93	109	LD582404425835594	10	-15331.15	6M	3.3000	2024-09-17	2030-09-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
94	28	LD546267789399746	7	-3968.17	9M	0.1000	2025-05-14	2032-05-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
95	173	LD512422497946451	10	-28189.14	9M	4.9000	2024-11-26	2031-11-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
96	133	LD753623353983559	8	-31589.50	3M	6.4000	2025-06-22	2032-06-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
97	112	LD071015946764832	7	-14421.88	6M	8.1000	2025-02-07	2027-02-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
98	107	LD068212588899991	3	-40249.63	9M	3.9000	2024-11-20	2026-11-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
99	137	LD108216021569570	3	-926.83	1M	7.7000	2025-04-09	2027-04-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
100	170	LD565750752578882	2	-21476.98	9M	6.4000	2024-09-20	2033-09-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
101	155	LD401826134645408	5	-18481.17	3M	9.0000	2023-12-04	2032-12-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
102	138	LD077344483307793	1	-19815.65	1M	5.5000	2024-11-28	2030-11-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
103	167	LD656052775768326	9	-44243.03	1M	4.5000	2025-08-30	2034-08-30	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
104	108	LD644613254918569	3	-39745.24	9M	3.1000	2024-05-09	2032-05-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
105	162	LD481646433932959	2	-47510.80	3M	2.2000	2023-11-05	2030-11-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
106	164	LD001295972271265	9	-18370.82	6M	5.1000	2023-12-08	2032-12-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
107	117	LD950995193757578	1	-3505.82	12M	8.4000	2025-05-02	2027-05-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
108	15	LD200893430254124	7	-34420.81	1M	0.7000	2024-01-25	2031-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
109	158	LD595137928392440	8	-8228.93	3M	5.6000	2025-09-14	2027-09-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
110	140	LD727555501271084	6	-1267.92	6M	7.2000	2024-01-09	2025-01-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
111	180	LD499672989624851	6	-37695.59	6M	5.6000	2025-01-02	2032-01-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
112	8	LD967556291126868	9	-25789.99	9M	8.0000	2024-04-12	2028-04-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
113	78	LD988656828298970	6	-1418.31	9M	7.2000	2025-01-13	2028-01-13	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
114	162	LD422991259979304	4	-47884.96	9M	5.7000	2025-05-18	2034-05-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
115	75	LD315583401978250	7	-45365.19	3M	0.1000	2025-08-04	2031-08-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
116	188	LD852055266819800	7	-23748.25	9M	8.7000	2025-04-20	2027-04-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
117	77	LD532975454421780	1	-10285.35	6M	6.8000	2024-06-08	2031-06-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
118	86	LD178373196770892	5	-20931.35	12M	4.2000	2024-05-12	2033-05-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
119	140	LD812440053398711	9	-4132.62	3M	9.2000	2024-12-12	2030-12-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
120	159	LD417530115349847	2	-23524.16	3M	2.5000	2025-05-04	2033-05-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
121	110	LD400023209019694	5	-32958.48	9M	0.2000	2024-10-26	2032-10-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
122	30	LD179108331341910	9	-32363.09	9M	1.5000	2024-11-24	2030-11-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
123	13	LD095272407654916	10	-35023.54	9M	0.6000	2023-11-30	2024-11-30	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
124	80	LD299014978952129	2	-34484.14	12M	8.0000	2024-06-06	2031-06-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
125	106	LD585702850280766	9	-11065.46	1M	3.0000	2024-02-27	2034-02-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
126	43	LD879149879207673	1	-1675.17	12M	2.9000	2024-07-22	2034-07-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
127	47	LD304485856225781	10	-27540.92	9M	0.5000	2024-08-12	2033-08-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
128	193	LD924760672653081	10	-42787.45	6M	2.2000	2024-07-09	2034-07-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
129	81	LD104504134085245	8	-10667.91	12M	8.4000	2025-03-04	2027-03-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
130	48	LD730302957613736	3	-48869.26	6M	7.1000	2025-04-04	2032-04-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
131	76	LD940594606398821	6	-15698.41	9M	6.7000	2024-12-28	2032-12-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
132	143	LD188024946785313	10	-23213.31	1M	3.3000	2024-02-04	2027-02-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
133	80	LD679547947692844	8	-37107.74	9M	7.9000	2024-08-18	2028-08-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
134	43	LD181742641323248	4	-26419.71	6M	4.0000	2024-11-26	2026-11-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
135	51	LD406510962476626	4	-2236.38	6M	3.2000	2025-02-15	2032-02-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
136	19	LD197438001917643	7	-34712.33	12M	3.7000	2023-10-09	2033-10-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
137	168	LD556007055341801	1	-46840.04	12M	3.3000	2025-05-22	2033-05-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
138	155	LD381133964969678	5	-5678.64	3M	6.9000	2025-07-04	2030-07-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
139	82	LD514105103283279	4	-10220.10	12M	2.1000	2025-01-05	2034-01-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
140	3	LD692410264106285	9	-49363.71	9M	1.1000	2025-07-23	2031-07-23	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
141	135	LD034548362402151	3	-9710.27	9M	9.1000	2023-11-04	2031-11-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
142	188	LD690149211376398	2	-30819.77	6M	0.6000	2024-06-17	2034-06-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
143	142	LD650014162169618	9	-20989.13	12M	2.6000	2025-07-14	2033-07-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
144	117	LD406863054499711	3	-32953.57	3M	6.9000	2025-03-25	2032-03-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
145	200	LD794564558587649	10	-48674.90	6M	8.3000	2024-03-29	2033-03-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
146	6	LD833027506351301	4	-20676.50	12M	6.2000	2025-05-19	2031-05-19	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
147	130	LD137165398916033	8	-16226.05	6M	7.8000	2024-07-16	2025-07-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
148	176	LD316278521638355	4	-25108.04	1M	0.3000	2025-07-16	2033-07-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
149	168	LD016590594921530	1	-30578.18	6M	8.1000	2024-10-06	2029-10-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
150	164	LD731483760836811	4	-22064.95	6M	3.7000	2023-11-02	2029-11-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
151	4	LD816248128004231	3	-17765.62	6M	6.7000	2024-07-02	2026-07-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
152	148	LD190017322067125	3	-12625.26	12M	0.9000	2025-07-20	2033-07-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
153	179	LD223571608041536	7	-16090.33	6M	1.0000	2025-06-19	2026-06-19	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
154	181	LD418226368622913	9	-37547.30	3M	1.4000	2023-12-04	2029-12-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
155	9	LD266894442603180	5	-4262.00	12M	8.0000	2024-03-29	2033-03-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
156	189	LD214951145590531	9	-9058.82	9M	0.7000	2024-04-27	2026-04-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
157	44	LD357213743310735	5	-3763.15	6M	0.7000	2024-03-25	2025-03-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
158	17	LD237534158011242	8	-31848.68	6M	7.8000	2023-10-20	2027-10-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
159	49	LD302660904301566	10	-9866.09	3M	4.1000	2025-07-08	2027-07-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
160	77	LD194541084292956	7	-37645.57	12M	7.1000	2024-10-16	2033-10-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
161	121	LD577999148849296	10	-885.12	9M	1.9000	2025-09-01	2032-09-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
162	143	LD476079079743373	5	-25192.02	1M	8.3000	2024-12-11	2033-12-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
163	38	LD328173694376275	1	-31352.94	1M	4.7000	2024-02-07	2031-02-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
164	153	LD405483121718349	9	-41656.31	6M	3.8000	2024-02-14	2028-02-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
165	28	LD437542689773259	3	-23012.71	3M	2.3000	2025-07-21	2032-07-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
166	66	LD036220583477750	1	-32815.63	9M	9.9000	2024-07-04	2027-07-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
167	169	LD819628150055865	7	-44772.07	1M	5.3000	2024-08-16	2025-08-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
168	34	LD360093831015338	7	-25302.18	12M	3.4000	2025-02-17	2034-02-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
169	33	LD330236785986404	4	-8921.58	6M	4.5000	2024-09-25	2032-09-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
170	73	LD824657142438233	10	-47247.90	12M	3.8000	2025-06-12	2034-06-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
171	120	LD034905299442037	8	-44562.48	12M	8.7000	2024-01-15	2030-01-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
172	121	LD339233064432356	5	-27490.56	9M	7.3000	2025-04-26	2030-04-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
173	90	LD873739328875371	6	-3892.22	12M	6.2000	2025-02-05	2032-02-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
174	185	LD745009199973667	3	-26716.13	9M	1.0000	2023-12-16	2025-12-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
175	60	LD693754509377947	4	-33853.88	3M	9.3000	2024-01-24	2027-01-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
176	11	LD500230023634021	9	-20493.94	3M	7.4000	2023-09-26	2029-09-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
177	123	LD735270337161357	10	-13683.70	12M	6.3000	2025-01-25	2032-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
178	162	LD672231164480007	8	-23753.15	12M	8.4000	2023-12-09	2026-12-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
179	95	LD604746559853886	10	-47490.73	6M	7.1000	2025-06-28	2028-06-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
180	100	LD887697953463320	8	-5169.66	3M	3.8000	2024-01-25	2029-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
181	161	LD496879622304177	4	-28305.37	1M	0.7000	2024-04-22	2028-04-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
182	22	LD266044282781493	4	-6173.81	9M	0.7000	2025-09-15	2033-09-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
183	49	LD483595627348758	1	-37783.89	1M	3.0000	2024-08-22	2031-08-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
184	15	LD873392430852598	3	-32666.33	12M	8.7000	2024-05-15	2028-05-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
185	96	LD429494452557044	3	-32838.18	1M	8.6000	2024-01-24	2025-01-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
186	198	LD730896633019010	3	-27726.12	1M	0.5000	2024-02-09	2028-02-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
187	155	LD771480512623935	6	-38651.51	12M	1.1000	2025-09-03	2034-09-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
188	35	LD858056064336402	10	-40678.94	3M	2.1000	2025-02-07	2032-02-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
189	36	LD720951467823164	6	-48838.27	3M	4.0000	2024-04-26	2028-04-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
190	55	LD958612274590026	2	-23282.42	9M	1.1000	2025-06-15	2033-06-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
191	28	LD997146585707356	1	-41358.37	12M	1.7000	2024-11-24	2033-11-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
192	185	LD078803015035909	8	-2311.02	3M	9.3000	2023-11-12	2028-11-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
193	82	LD928681354466939	10	-7861.38	1M	9.0000	2024-05-21	2028-05-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
194	66	LD639039239556429	2	-9695.88	6M	10.0000	2024-08-08	2033-08-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
195	154	LD901709492762226	5	-28576.14	9M	3.1000	2023-09-25	2032-09-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
196	167	LD863528941140326	10	-40887.60	3M	4.5000	2025-01-02	2031-01-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
197	197	LD330717875280878	9	-16464.75	3M	1.0000	2024-04-01	2031-04-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
198	6	LD500850551657413	1	-13727.46	12M	5.2000	2025-09-16	2032-09-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
199	149	LD676759005435634	2	-9078.69	12M	9.3000	2023-10-17	2027-10-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
200	186	LD118784027894443	4	-15439.53	3M	6.8000	2024-07-16	2027-07-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
\.


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: banking_new; Owner: phamdinhkhanh
--

COPY banking_new."Transactions" (transaction_id, account_id, transaction_amount, transaction_date, created_at, updated_at) FROM stdin;
1	20	-3805.06	2021-02-03 12:07:34.950597+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
2	159	455.68	2024-06-04 12:44:13.979481+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
3	117	3395.75	2022-09-25 00:44:40.548274+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
4	3	-885.30	2024-05-01 06:11:52.281085+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
5	143	-3127.68	2025-05-17 07:34:15.325124+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
6	118	4659.77	2023-10-16 09:43:34.151561+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
7	273	2506.07	2025-02-15 19:27:56.705882+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
8	129	953.59	2024-01-11 04:24:45.267099+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
9	243	3635.04	2025-06-08 11:37:43.331973+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
10	200	-4008.23	2022-06-09 17:56:09.710562+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
11	49	1349.10	2021-08-19 16:58:57.393095+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
12	139	-1284.31	2021-06-20 15:29:17.726547+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
13	41	-1437.93	2025-01-19 16:39:13.51212+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
14	75	3472.55	2022-03-01 10:11:37.939738+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
15	278	3886.23	2021-12-14 10:16:20.293205+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
16	238	1369.60	2024-10-10 03:30:34.849037+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
17	98	4138.30	2025-02-20 06:35:42.739955+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
18	47	430.90	2020-12-01 14:33:34.155666+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
19	140	-4914.31	2023-12-05 05:03:15.920181+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
20	291	898.55	2023-05-14 10:39:23.853644+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
21	113	-1565.28	2024-03-30 14:44:09.052642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
22	53	3993.53	2021-11-22 05:15:32.399273+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
23	90	1887.58	2024-11-21 03:45:13.106555+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
24	65	-2275.27	2024-02-01 08:06:26.60366+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
25	283	-1345.79	2024-05-16 20:48:14.263161+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
26	227	-1974.52	2022-02-23 09:16:55.377046+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
27	273	4323.77	2023-12-28 11:43:12.134144+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
28	239	-4548.91	2022-06-18 08:16:03.883188+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
29	263	701.47	2020-12-17 05:39:50.425062+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
30	244	-2942.26	2023-10-07 07:45:13.701654+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
31	198	-1732.49	2024-09-03 08:29:24.389319+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
32	239	-4326.21	2023-02-24 05:02:28.314753+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
33	220	1677.06	2025-06-22 09:07:39.116956+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
34	141	4591.79	2025-05-07 00:44:24.362599+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
35	150	4296.88	2022-07-28 18:39:43.962377+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
36	181	3666.74	2024-02-24 06:23:48.602065+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
37	54	-349.47	2024-05-14 16:30:27.684973+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
38	15	3890.37	2021-03-29 17:16:51.439386+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
39	202	-2884.64	2021-05-23 10:54:28.461868+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
40	179	-4929.09	2022-07-03 19:04:06.377104+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
41	185	2668.74	2023-04-05 01:50:27.400774+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
42	152	4899.07	2022-05-14 13:53:58.634969+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
43	149	849.46	2020-10-21 15:30:33.166858+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
44	174	-1934.00	2022-01-18 05:04:54.770175+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
45	183	-31.86	2022-11-04 12:56:32.788622+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
46	260	2941.18	2021-11-18 04:04:04.542636+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
47	83	-3206.32	2022-12-12 00:53:31.415087+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
48	282	1256.77	2021-07-12 23:04:59.468973+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
49	54	3783.15	2024-05-04 03:18:43.175911+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
50	271	-3849.86	2024-08-22 22:22:04.226282+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
51	149	-345.17	2024-05-10 04:57:50.096441+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
52	252	4715.69	2024-12-28 09:24:38.173114+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
53	278	4317.57	2020-12-04 00:02:42.410312+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
54	288	3909.10	2023-01-26 21:29:15.433919+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
55	123	-1684.83	2023-01-16 14:59:55.181783+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
56	234	-153.24	2025-07-07 05:28:54.081595+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
57	81	3347.84	2023-01-15 22:05:10.874448+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
58	40	-2562.05	2023-08-25 23:56:40.62412+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
59	179	-1350.85	2021-08-02 20:17:56.476492+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
60	274	-3059.32	2023-05-10 14:38:03.81472+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
61	116	2372.86	2022-11-17 18:59:43.685429+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
62	99	3388.04	2024-04-21 17:50:56.337449+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
63	264	-3365.91	2023-05-15 20:04:24.489467+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
64	50	1998.77	2021-04-02 11:40:19.541076+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
65	43	2165.41	2022-01-29 02:57:31.47885+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
66	98	-3312.26	2024-04-13 20:06:58.219866+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
67	200	-875.24	2024-05-13 07:46:14.660119+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
68	260	-1892.54	2021-06-16 23:49:45.871708+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
69	4	-1776.73	2022-07-26 15:05:54.948073+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
70	145	-2516.45	2024-10-15 14:51:16.415512+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
71	80	1930.48	2022-02-20 10:56:55.648427+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
72	109	-2086.22	2025-05-19 18:48:25.432982+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
73	37	-681.13	2022-01-23 18:08:45.931504+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
74	65	1000.07	2022-02-13 11:08:57.936541+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
75	240	921.44	2023-07-23 19:06:18.446361+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
76	12	1190.05	2023-09-20 20:55:41.596704+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
77	286	1989.45	2023-06-21 19:33:01.37589+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
78	214	3695.35	2024-10-02 16:58:22.627987+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
79	238	-4946.30	2021-08-31 00:38:43.723908+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
80	101	924.69	2021-04-09 14:01:55.936851+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
81	130	-1079.17	2023-07-25 08:24:33.770455+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
82	91	-3024.83	2023-06-30 22:33:20.985595+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
83	67	2198.50	2021-04-04 12:16:53.009414+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
84	27	1597.25	2022-03-22 18:31:27.007079+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
85	120	3552.15	2021-07-19 16:28:34.068642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
86	221	2255.91	2023-07-06 00:56:36.079911+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
87	87	-3686.22	2022-02-10 02:00:45.330132+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
88	220	2974.28	2021-05-28 02:55:55.332144+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
89	45	-4616.37	2023-11-18 04:01:57.651551+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
90	52	-2961.69	2021-11-19 06:26:09.367474+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
91	232	375.53	2024-03-15 04:01:52.334958+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
92	183	-4545.73	2023-06-04 16:34:04.207073+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
93	138	-3101.46	2024-09-17 10:51:52.591647+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
94	11	-4847.89	2023-05-21 22:10:33.630339+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
95	169	-2201.61	2024-10-26 12:01:43.379472+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
96	275	3067.07	2022-02-19 18:39:09.137963+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
97	206	4795.12	2021-02-06 13:54:50.996912+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
98	289	-3525.08	2023-04-25 03:29:50.222692+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
99	257	-2453.99	2022-10-25 17:50:09.881338+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
100	177	-3303.51	2024-06-13 07:55:12.612023+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
101	163	1974.02	2021-09-14 09:16:07.820518+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
102	142	-1938.85	2021-06-04 06:18:25.057101+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
103	90	938.17	2022-08-05 13:16:14.056232+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
104	116	-592.00	2022-02-13 20:15:31.767428+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
105	144	2371.72	2022-03-10 03:15:14.335705+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
106	23	778.28	2022-01-03 21:50:58.211095+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
107	1	1895.45	2025-06-12 22:21:27.713684+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
108	46	3815.71	2025-08-15 19:49:27.357173+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
109	34	578.08	2022-08-04 18:18:41.172436+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
110	133	-2826.08	2025-08-10 09:57:05.547606+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
111	151	-1729.65	2022-05-24 22:53:02.821716+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
112	99	3538.18	2021-05-07 13:36:50.409314+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
113	83	-533.17	2024-08-22 06:20:29.981295+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
114	174	267.14	2024-06-02 20:18:43.905938+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
115	2	856.87	2024-02-16 08:09:51.264102+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
116	273	-1728.70	2021-08-07 13:47:28.544594+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
117	140	-2520.69	2023-01-06 09:49:19.337624+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
118	169	-2046.44	2020-10-09 02:27:54.185302+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
119	106	-4083.81	2022-05-04 01:02:08.64058+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
120	225	-881.77	2022-04-08 01:08:26.021975+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
121	144	-4913.71	2021-12-21 07:57:28.931855+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
122	134	2449.18	2024-02-09 13:44:03.871518+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
123	138	3317.10	2021-04-04 13:09:30.363812+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
124	135	4071.18	2022-10-12 05:10:51.957694+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
125	288	2074.81	2021-09-28 03:47:41.158188+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
126	35	-3696.63	2025-03-29 23:03:42.137618+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
127	222	2963.74	2020-10-21 02:32:54.190803+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
128	94	-1743.23	2022-07-16 10:32:28.656096+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
129	95	4379.57	2023-03-19 05:53:13.794528+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
130	44	4989.20	2023-08-03 08:18:04.620108+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
131	223	282.34	2024-11-30 23:33:41.58776+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
132	222	2731.23	2024-02-22 00:54:19.411131+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
133	75	4085.70	2023-12-20 17:41:43.361533+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
134	252	4706.90	2021-07-21 05:40:48.884979+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
135	176	1759.40	2024-01-05 14:28:30.506881+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
136	38	377.90	2020-11-02 01:22:38.433364+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
137	294	-1770.87	2021-12-22 09:54:49.414966+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
138	96	3258.41	2023-11-15 21:14:41.948881+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
139	83	-298.57	2022-04-25 17:48:29.201849+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
140	281	-3324.40	2025-08-03 23:29:05.809144+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
141	279	1651.55	2023-11-20 16:20:42.175908+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
142	38	4058.64	2023-06-11 16:31:43.642171+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
143	211	-3034.54	2023-02-01 22:28:42.442979+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
144	295	2733.46	2024-10-30 22:41:06.731556+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
145	188	-4738.45	2022-04-04 07:01:52.191072+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
146	160	-761.12	2024-06-19 13:15:38.799899+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
147	170	-1646.16	2021-10-20 10:07:45.654628+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
148	224	-958.16	2023-07-02 05:37:02.553017+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
149	70	-2705.20	2022-10-23 04:53:29.763843+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
150	170	3427.38	2021-05-14 13:46:03.230784+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
151	138	2541.43	2022-12-29 03:28:05.198543+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
152	237	3730.06	2024-05-20 02:14:08.937269+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
153	73	-3040.61	2022-10-28 11:51:06.056075+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
154	286	4294.47	2023-11-24 08:29:02.67344+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
155	13	-4096.87	2021-11-28 08:44:43.954029+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
156	12	-1922.30	2022-07-29 02:01:05.622511+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
157	158	-2137.94	2024-10-29 01:44:11.053886+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
158	127	-1290.03	2021-05-16 22:47:21.610205+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
159	266	2568.49	2025-05-13 00:06:38.584893+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
160	278	1033.83	2024-09-27 23:21:13.780192+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
161	130	-2303.60	2025-09-06 16:02:39.512078+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
162	292	77.22	2024-06-14 08:24:44.817647+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
163	92	-3773.57	2021-01-12 04:50:35.648523+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
164	129	1651.41	2021-12-26 00:58:13.034105+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
165	209	-2630.29	2023-11-05 11:51:01.582587+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
166	293	-744.62	2022-12-31 11:51:32.335447+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
167	10	-3414.03	2024-11-18 07:36:26.992192+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
168	176	-3834.03	2024-07-08 11:02:45.792511+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
169	170	-3404.99	2023-01-10 12:06:00.91428+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
170	171	134.84	2025-05-22 16:16:03.51568+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
171	237	-3734.61	2022-07-03 07:41:04.654465+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
172	40	-889.43	2024-02-23 06:12:26.420525+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
173	185	-488.26	2021-03-31 00:00:43.487081+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
174	55	-1956.52	2021-04-19 15:39:33.002208+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
175	212	-2668.30	2022-12-05 21:08:55.530966+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
176	5	-2512.27	2022-02-06 02:08:32.895486+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
177	227	1251.25	2024-09-29 05:55:32.302339+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
178	111	3897.42	2023-02-09 22:43:18.646724+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
179	77	1762.16	2023-11-22 21:46:07.937075+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
180	149	2980.81	2024-04-23 18:57:55.949761+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
181	191	-4736.84	2022-07-25 05:18:58.853378+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
182	55	-1272.89	2022-08-22 01:06:45.363683+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
183	244	3077.96	2023-09-07 06:46:03.637159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
184	192	-2498.97	2021-10-24 01:42:27.025494+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
185	245	3426.99	2024-11-21 14:05:56.220778+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
186	292	363.80	2025-06-11 09:39:47.409109+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
187	86	-760.70	2025-06-15 22:46:28.396872+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
188	1	3789.86	2021-03-01 05:44:23.663717+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
189	164	-3181.33	2024-08-01 08:54:04.794749+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
190	245	-733.84	2025-01-17 09:11:11.950266+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
191	119	2825.14	2025-08-12 20:47:34.299698+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
192	4	4815.94	2024-06-17 04:46:59.531167+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
193	168	-473.81	2024-01-30 01:02:51.380927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
194	237	-622.32	2022-09-13 18:41:56.201047+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
195	284	4711.63	2022-02-19 11:03:22.800526+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
196	83	-1447.89	2021-02-15 16:51:15.436635+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
197	41	4216.98	2024-08-08 16:53:46.572547+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
198	123	-1161.35	2024-12-18 12:30:51.329405+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
199	78	-4056.95	2024-04-01 20:16:27.448027+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
200	44	-796.75	2021-02-05 16:05:15.613307+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
201	3	-3789.13	2024-01-16 17:11:58.307935+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
202	243	529.71	2020-09-28 04:06:52.943496+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
203	28	-4476.58	2022-02-05 04:04:06.372688+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
204	268	1310.53	2024-01-28 09:52:42.081038+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
205	239	4327.05	2024-08-23 05:10:59.260384+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
206	85	-3340.05	2024-08-19 06:48:01.577587+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
207	114	2461.22	2021-09-03 17:30:45.534961+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
208	33	-143.07	2025-07-01 14:30:50.833108+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
209	54	3809.71	2024-12-21 11:08:49.033624+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
210	188	-1767.78	2024-09-05 20:20:51.762879+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
211	120	-4603.13	2024-11-12 10:39:03.888095+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
212	20	-1577.78	2021-10-05 16:50:25.261683+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
213	146	883.29	2024-07-01 16:44:40.215949+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
214	97	320.88	2021-04-02 16:45:33.381116+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
215	215	2618.39	2021-03-29 05:43:10.982156+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
216	217	1578.73	2021-07-28 07:47:07.22011+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
217	40	-3021.19	2020-10-14 04:56:57.678269+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
218	7	-1444.15	2025-04-29 03:39:00.62296+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
219	212	1077.16	2020-10-21 19:26:36.361872+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
220	292	-379.07	2022-01-17 00:16:45.371841+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
221	43	2197.52	2022-09-24 04:49:00.168059+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
222	2	-3543.37	2022-02-16 21:49:33.451168+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
223	9	4475.85	2021-08-11 05:35:28.709673+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
224	283	2365.61	2024-03-27 01:54:06.525486+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
225	283	-119.85	2023-10-10 02:45:37.760529+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
226	22	-4286.89	2024-07-05 03:26:06.399991+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
227	19	4868.67	2024-06-12 12:16:54.635267+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
228	275	3204.25	2022-08-06 07:41:51.134251+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
229	196	2324.02	2025-02-07 12:32:59.501513+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
230	104	-3823.53	2024-10-16 06:06:42.99163+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
231	294	3128.83	2022-06-09 00:46:03.730614+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
232	196	2448.90	2023-03-26 12:01:35.51139+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
233	144	-4488.70	2022-08-23 20:37:14.365839+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
234	149	-4504.86	2023-03-22 12:30:52.008611+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
235	235	3492.54	2024-06-06 01:43:20.226569+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
236	176	-1376.28	2023-08-21 22:24:28.353867+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
237	36	4705.14	2023-05-14 17:08:02.059954+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
238	18	-2233.18	2021-01-13 07:49:21.001832+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
239	199	1974.07	2022-03-04 13:02:55.751231+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
240	121	1202.51	2021-06-17 10:08:22.125794+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
241	210	-487.14	2021-07-25 20:07:15.679656+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
242	69	4053.89	2022-02-23 06:08:41.903853+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
243	27	-1253.16	2023-08-25 00:15:14.910046+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
244	234	1816.38	2021-11-03 23:19:15.069825+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
245	236	-1958.83	2022-05-30 23:09:35.725625+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
246	271	2270.06	2022-08-31 01:11:04.139034+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
247	18	-3149.56	2023-11-21 18:32:14.490845+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
248	116	1147.02	2023-02-12 10:44:59.026652+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
249	143	-168.68	2024-11-19 22:20:59.93245+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
250	190	-4133.00	2024-03-02 06:09:07.55689+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
251	83	-3592.41	2021-11-26 08:29:39.491554+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
252	137	3917.22	2023-07-22 23:04:55.199157+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
253	79	4279.69	2024-08-20 16:59:12.909109+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
254	15	2101.08	2024-12-14 20:01:20.812658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
255	217	-2326.32	2023-03-22 14:43:18.055969+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
256	150	2507.60	2024-06-17 19:22:33.684068+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
257	245	-3034.30	2024-07-17 18:10:50.335478+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
258	62	-2586.82	2024-05-28 16:29:05.590056+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
259	171	-1762.66	2021-05-19 14:08:15.148346+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
260	171	-3474.64	2022-10-23 07:39:25.086451+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
261	133	3634.49	2022-11-15 02:24:11.34714+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
262	29	4325.17	2023-05-13 06:36:14.813877+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
263	237	-4703.26	2022-02-26 18:33:59.131995+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
264	64	-3287.58	2021-08-04 04:59:29.852804+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
265	281	-2694.68	2021-07-10 03:16:50.559646+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
266	262	-4224.28	2022-05-29 11:19:59.209066+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
267	232	2235.56	2021-11-06 13:58:31.01354+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
268	126	806.04	2023-08-14 12:57:38.007949+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
269	30	1418.56	2021-10-13 03:20:46.658761+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
270	293	3995.58	2025-05-16 09:54:00.674734+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
271	299	-3768.68	2021-12-27 08:50:34.601761+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
272	255	-2386.23	2024-04-20 19:26:13.751507+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
273	240	395.68	2024-09-27 23:18:28.35788+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
274	165	4128.44	2023-11-26 11:35:03.076822+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
275	131	62.49	2022-04-26 09:35:05.16313+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
276	224	678.54	2023-09-16 10:06:35.742974+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
277	294	1897.56	2023-03-09 16:30:04.27066+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
278	22	-252.71	2025-08-02 09:55:00.561254+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
279	75	1737.36	2023-11-23 01:42:59.712238+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
280	74	4107.46	2021-10-08 07:38:49.491908+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
281	80	-3170.09	2024-09-14 02:05:28.608642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
282	270	-334.71	2023-11-18 19:31:46.150152+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
283	35	4175.16	2025-09-16 06:06:27.507286+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
284	212	4258.32	2023-09-19 09:50:06.859891+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
285	145	-56.45	2025-01-31 03:55:24.60372+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
286	23	-2893.28	2022-02-28 07:24:38.818136+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
287	139	3851.35	2021-07-06 17:34:46.073204+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
288	34	1437.08	2022-10-26 18:28:46.89607+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
289	275	3594.07	2022-05-22 01:24:27.569875+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
290	277	1756.31	2022-08-28 01:38:52.276362+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
291	284	-2558.52	2022-09-22 05:13:20.559212+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
292	264	-707.22	2022-10-13 03:03:27.771498+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
293	3	2135.16	2022-03-13 16:23:03.869472+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
294	283	456.05	2022-08-13 02:40:26.927191+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
295	154	1539.50	2021-03-28 19:46:30.819799+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
296	235	1359.90	2023-09-22 08:21:17.719674+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
297	267	-3587.34	2021-04-22 14:26:04.132922+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
298	168	967.97	2025-04-23 13:31:23.291984+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
299	274	2133.26	2022-02-15 17:29:03.217552+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
300	182	-4622.61	2021-02-07 21:34:55.789552+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
301	49	4121.10	2022-07-28 07:35:34.859813+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
302	105	3961.21	2025-08-15 01:49:50.486314+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
303	73	-4229.44	2022-04-29 14:43:39.32633+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
304	110	-1565.19	2023-09-03 01:03:27.444839+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
305	105	-4447.52	2021-12-30 21:59:19.58643+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
306	67	-4838.76	2021-05-27 22:38:37.921121+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
307	128	4459.74	2022-10-02 06:12:42.890509+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
308	210	-1222.36	2022-11-11 09:27:49.218793+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
309	281	2609.55	2023-06-10 18:15:28.884159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
310	275	2650.21	2022-06-21 05:17:29.92159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
311	241	-1686.01	2025-07-01 13:24:42.783342+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
312	186	1108.35	2020-12-21 08:51:38.469846+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
313	62	3876.09	2022-09-20 01:31:29.866927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
314	90	1576.91	2025-01-24 21:07:49.883501+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
315	102	1029.21	2021-07-03 11:33:05.078473+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
316	6	3896.83	2021-02-13 04:13:33.656343+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
317	147	3585.43	2023-01-05 12:37:34.097603+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
318	237	1099.59	2021-12-18 05:34:50.609074+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
319	266	-260.78	2025-02-27 17:36:06.536249+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
320	18	4236.02	2024-10-19 15:30:50.042897+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
321	141	3599.77	2024-04-23 05:16:57.909102+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
322	161	-1261.86	2022-08-11 23:49:47.450893+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
323	148	-4432.42	2024-09-02 15:01:59.099425+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
324	121	2661.27	2021-11-24 09:53:46.455619+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
325	27	1252.50	2023-10-17 00:24:38.049237+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
326	67	4429.00	2023-05-23 15:12:30.739831+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
327	75	-3383.76	2025-05-09 15:30:57.261099+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
328	185	2638.70	2022-10-23 20:12:33.078306+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
329	282	-1080.52	2021-09-26 14:14:30.669112+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
330	295	874.57	2021-02-25 13:06:31.144037+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
331	265	-1444.76	2022-04-26 03:24:35.053371+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
332	182	366.34	2021-06-24 14:22:30.173279+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
333	250	1627.94	2025-04-11 14:14:46.200942+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
334	192	-711.40	2024-08-20 10:34:45.914926+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
335	180	893.75	2024-12-04 03:03:09.635742+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
336	211	-3189.40	2021-06-21 05:22:19.734798+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
337	203	1960.63	2023-05-08 18:54:40.016229+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
338	39	-2992.37	2021-12-03 20:44:30.163275+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
339	99	3509.34	2025-01-08 08:29:55.287783+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
340	57	1340.82	2020-10-30 00:14:12.411174+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
341	217	-2420.11	2023-06-10 12:13:55.636307+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
342	292	-2924.06	2025-02-07 14:45:39.862925+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
343	196	2303.13	2023-10-29 00:16:58.63546+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
344	224	4021.83	2023-06-09 17:46:31.830049+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
345	262	-3080.80	2022-02-04 05:36:53.220807+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
346	95	-541.37	2021-12-07 10:18:13.619198+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
347	261	4972.49	2024-10-16 05:27:25.560011+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
348	221	-2638.63	2025-09-22 22:51:24.643236+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
349	140	2430.99	2025-01-05 12:30:51.291056+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
350	157	-3783.04	2021-04-24 07:05:35.498205+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
351	35	2248.73	2025-02-20 21:08:14.141675+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
352	161	-4786.44	2025-05-09 21:38:00.632277+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
353	196	-2531.41	2022-08-01 08:03:00.302399+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
354	6	261.32	2020-12-27 11:27:52.036887+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
355	74	-3814.88	2020-12-09 23:01:02.093848+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
356	101	-3456.52	2024-05-18 18:57:46.910858+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
357	270	515.44	2022-07-26 06:05:01.944104+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
358	270	-3990.48	2024-07-20 10:01:21.238149+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
359	109	4947.96	2021-03-26 11:31:39.909885+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
360	236	-1945.45	2025-03-30 23:53:47.877561+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
361	273	-3496.22	2024-05-09 12:06:04.573436+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
362	156	-843.16	2024-12-31 14:24:15.525892+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
363	46	-2117.24	2024-09-07 17:27:04.921138+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
364	299	2102.91	2020-11-13 03:12:51.373003+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
365	95	-4669.48	2023-10-14 18:03:15.6119+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
366	161	1129.09	2024-12-07 19:36:21.110075+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
367	115	80.18	2023-02-22 18:49:47.103407+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
368	177	-1367.34	2023-06-29 23:25:54.779296+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
369	44	4259.05	2023-08-23 00:47:02.394005+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
370	9	3803.79	2023-08-30 10:56:49.432806+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
371	109	2261.49	2022-10-28 18:42:24.547643+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
372	167	-1596.67	2025-08-19 15:10:14.797848+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
373	70	-3484.60	2025-05-31 19:24:39.46351+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
374	58	2979.58	2023-01-04 19:54:33.682471+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
375	111	3193.45	2024-04-10 16:27:46.383817+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
376	114	260.83	2021-07-19 15:51:16.325496+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
377	215	3792.26	2021-01-29 14:08:21.47267+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
378	205	-1041.47	2021-10-30 13:55:58.136411+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
379	184	-1455.96	2023-08-28 23:28:39.127582+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
380	21	-1502.09	2021-10-30 11:54:42.707665+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
381	25	-2896.61	2025-06-02 03:01:26.922366+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
382	93	4169.28	2025-05-04 12:08:09.154554+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
383	132	-4122.01	2024-03-16 05:48:30.564248+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
384	105	-2922.81	2020-10-06 19:18:03.081822+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
385	19	1082.39	2020-10-02 19:18:45.886395+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
386	236	-627.84	2024-06-15 21:53:27.839312+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
387	70	1058.91	2021-11-29 17:43:11.674134+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
388	2	676.24	2025-07-31 07:48:02.771768+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
389	109	4755.41	2023-10-04 22:48:33.44076+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
390	175	865.78	2023-12-17 16:54:30.212832+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
391	253	1539.02	2021-10-29 16:26:36.335265+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
392	141	868.02	2025-06-10 10:14:14.466388+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
393	174	4843.75	2021-10-13 20:59:34.894714+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
394	171	3312.18	2023-10-06 12:43:08.27002+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
395	239	801.95	2022-11-26 05:10:18.31922+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
396	117	3966.25	2022-11-20 04:53:20.036432+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
397	7	495.53	2024-01-10 09:00:06.086888+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
398	157	892.20	2021-06-16 08:41:45.013521+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
399	94	4713.04	2023-03-05 22:47:25.136992+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
400	162	-2334.73	2023-10-12 00:53:25.889349+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
401	293	-2333.49	2022-10-17 14:36:10.529718+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
402	280	2147.50	2023-09-06 11:12:47.71879+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
403	60	4611.79	2022-11-27 02:16:52.76273+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
404	134	1014.07	2022-09-15 00:12:36.553745+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
405	38	-3895.47	2025-09-03 04:40:36.812162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
406	170	-2232.96	2022-10-29 13:48:04.578684+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
407	158	-838.69	2022-07-27 06:17:41.215924+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
408	43	-2304.12	2023-11-01 16:50:18.105773+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
409	130	-259.35	2023-01-04 03:12:00.097752+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
410	119	-3823.45	2023-08-11 22:47:22.101249+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
411	178	-425.46	2022-07-23 02:16:13.973162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
412	264	2140.68	2023-09-02 20:02:08.072449+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
413	101	4752.57	2023-02-16 14:40:13.53984+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
414	16	-4830.51	2025-09-21 02:28:28.281656+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
415	72	699.07	2021-04-21 11:34:22.884301+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
416	1	4198.08	2025-09-20 19:55:49.305603+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
417	106	-2246.05	2023-01-03 10:42:20.218596+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
418	79	2253.48	2025-08-20 23:20:43.625766+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
419	42	4079.87	2025-06-24 01:23:38.03026+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
420	92	3909.43	2022-11-04 09:39:39.075943+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
421	144	1222.60	2024-05-13 00:55:44.226581+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
422	16	4610.56	2024-01-19 17:55:11.707578+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
423	189	-4513.85	2023-04-20 20:24:38.826724+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
424	136	1148.78	2020-11-28 02:41:21.353273+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
425	248	545.59	2025-01-01 01:26:46.849323+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
426	123	-301.12	2021-05-26 22:09:58.623962+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
427	182	3655.49	2025-04-14 14:23:50.063329+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
428	14	4991.79	2024-05-12 06:30:22.150744+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
429	233	-4185.32	2022-01-15 05:20:56.318946+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
430	271	-1536.01	2022-06-20 15:37:22.401086+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
431	206	-2722.17	2024-05-21 13:49:20.912041+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
432	160	-2450.86	2025-08-11 04:02:25.468358+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
433	234	2497.55	2023-11-02 04:37:33.946789+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
434	256	4840.59	2022-05-08 10:31:30.98909+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
435	27	4244.83	2024-10-16 06:53:04.911602+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
436	13	4269.83	2021-10-11 19:06:09.827796+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
437	71	-4121.71	2024-06-29 05:14:56.836467+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
438	162	2915.41	2024-05-21 18:29:10.437703+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
439	213	-4355.39	2023-11-09 20:41:19.567248+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
440	249	-4047.97	2022-09-06 08:11:53.770386+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
441	6	-3397.20	2024-10-17 06:37:54.426673+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
442	235	-2617.30	2020-11-15 20:42:58.194841+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
443	218	2000.76	2021-02-28 22:28:30.707412+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
444	24	1512.84	2023-09-07 01:38:38.994119+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
445	189	903.19	2021-02-07 04:45:34.767808+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
446	33	-2224.87	2024-05-07 10:19:17.264964+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
447	16	3969.45	2022-07-12 06:42:56.248582+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
448	251	2560.10	2023-12-28 22:37:16.490157+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
449	111	3156.61	2024-02-22 22:52:53.72173+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
450	53	2722.46	2025-01-12 00:13:08.438816+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
451	282	-3788.39	2024-11-18 09:53:54.555293+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
452	275	-3418.79	2021-11-09 10:56:53.609886+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
453	253	4208.76	2023-02-06 20:19:39.751993+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
454	154	-1421.74	2022-12-26 23:45:14.676301+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
455	183	-2001.44	2020-11-20 07:12:52.490482+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
456	154	-54.12	2020-10-06 12:14:57.483399+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
457	126	4356.26	2020-10-19 11:48:48.064402+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
458	38	2455.65	2023-12-18 18:16:11.041081+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
459	181	-3818.71	2021-11-24 00:17:15.976739+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
460	134	-3892.13	2023-12-14 21:09:55.255898+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
461	124	-4936.77	2022-07-31 00:18:24.113123+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
462	76	-3152.60	2022-05-31 05:46:22.075409+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
463	141	1080.63	2021-08-15 23:19:15.315726+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
464	16	-3893.32	2023-03-27 02:58:19.08927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
465	159	-1626.03	2024-11-27 06:00:42.458658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
466	270	3907.93	2022-10-31 07:13:28.231596+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
467	218	-3297.76	2024-09-19 17:57:13.777135+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
468	12	4117.28	2023-11-08 05:35:28.988893+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
469	192	917.36	2022-04-05 04:57:45.85696+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
470	67	4264.19	2024-07-21 04:54:57.802851+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
471	285	-2185.33	2023-11-30 22:33:37.0931+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
472	278	658.27	2022-06-25 04:31:33.278784+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
473	258	550.30	2024-08-24 22:11:14.115712+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
474	55	-4030.58	2021-09-19 23:19:43.977012+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
475	167	-2594.78	2022-05-22 10:52:50.556553+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
476	259	1821.90	2021-05-20 20:59:13.241157+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
477	262	-170.21	2021-12-24 06:07:10.028025+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
478	18	1371.32	2024-04-23 20:09:24.688249+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
479	287	-242.90	2025-06-09 00:05:19.928133+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
480	248	-4127.49	2022-09-17 02:39:13.841605+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
481	25	-2305.71	2021-09-21 21:28:02.373365+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
482	21	-234.82	2021-10-28 20:05:50.391149+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
483	62	1049.53	2021-12-10 23:12:58.036242+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
484	153	65.09	2025-08-04 07:25:36.709483+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
485	294	-2984.52	2025-01-23 07:09:08.685661+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
486	220	-2946.13	2022-03-29 19:31:42.949108+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
487	205	-1387.74	2022-04-27 02:20:51.375035+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
488	228	-3653.90	2023-02-16 09:34:28.839159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
489	79	-4618.49	2024-12-20 06:47:20.195631+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
490	34	877.21	2025-07-16 16:23:46.105215+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
491	48	3153.93	2022-10-27 19:43:22.696814+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
492	242	4857.41	2024-08-16 05:15:19.055486+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
493	62	-4567.05	2022-02-14 16:21:56.721434+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
494	200	-3441.89	2021-05-08 15:48:49.245064+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
495	276	-380.10	2025-03-26 11:58:15.751671+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
496	277	-1614.13	2024-07-04 23:45:50.471381+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
497	23	-2427.70	2021-05-27 22:53:19.381001+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
498	110	2528.34	2025-04-22 05:58:44.663663+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
499	244	3396.98	2022-12-03 16:14:49.949782+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
500	159	-139.35	2025-02-17 18:24:56.624357+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
501	294	-3967.87	2023-08-24 20:26:24.319416+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
502	55	-1588.27	2025-04-29 04:38:33.49919+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
503	211	-1370.07	2021-11-22 09:17:24.967755+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
504	155	2272.49	2021-03-24 20:35:48.074982+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
505	282	3750.36	2022-05-29 16:46:28.684206+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
506	276	3193.45	2024-02-29 18:06:10.509736+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
507	241	-4488.07	2022-05-23 20:55:13.538665+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
508	282	-451.04	2024-03-13 10:24:02.390035+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
509	60	-880.28	2023-05-08 19:21:52.627019+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
510	16	4428.27	2021-07-18 19:03:08.893088+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
511	119	4142.05	2020-11-28 03:21:17.029774+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
512	195	1219.37	2022-11-27 03:35:34.455642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
513	27	3532.68	2021-09-01 06:50:45.145665+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
514	12	-4419.71	2021-09-14 06:20:39.507069+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
515	122	2746.16	2024-08-16 15:48:36.483123+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
516	296	1404.71	2024-01-01 07:34:42.476368+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
517	225	-2835.29	2021-06-29 04:08:03.969529+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
518	12	4108.55	2022-04-02 23:33:33.691952+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
519	36	-3250.31	2025-04-20 12:08:10.556658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
520	238	-1457.26	2024-12-24 06:04:56.554694+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
521	172	3164.36	2021-02-10 10:49:55.094221+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
522	83	-4709.59	2025-03-17 15:23:37.38679+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
523	249	770.75	2024-10-19 02:52:51.795283+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
524	156	-4771.50	2021-09-02 02:31:14.637267+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
525	145	2077.83	2024-12-18 10:30:32.12757+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
526	191	3400.98	2022-02-06 22:24:27.255235+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
527	98	-3146.85	2024-09-16 06:58:01.907551+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
528	239	-223.20	2025-04-15 02:08:16.990847+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
529	128	2569.04	2023-02-16 20:40:03.568256+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
530	197	2881.51	2024-10-21 15:36:43.826887+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
531	296	1158.12	2024-08-02 05:19:41.755797+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
532	278	1372.99	2025-04-09 04:01:29.196181+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
533	89	-1297.49	2022-08-06 23:22:41.571242+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
534	242	-2354.15	2022-12-10 04:43:55.137729+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
535	35	-1659.61	2022-02-16 03:57:41.185553+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
536	54	-210.19	2021-06-03 11:31:01.395972+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
537	143	4272.79	2024-01-08 13:49:21.265561+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
538	229	1550.02	2021-02-14 22:04:28.995726+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
539	206	3498.10	2025-08-23 20:12:58.128259+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
540	231	3156.35	2023-12-17 18:27:25.314597+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
541	176	602.19	2021-04-10 03:37:20.013138+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
542	137	1977.10	2024-12-25 22:10:52.850356+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
543	247	-3180.04	2025-08-29 14:04:02.227309+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
544	29	4694.37	2024-05-13 22:11:02.63601+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
545	21	-418.51	2022-08-14 22:40:57.38326+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
546	244	66.66	2022-09-13 07:43:54.645965+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
547	71	3102.76	2022-07-02 11:37:50.255447+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
548	10	456.22	2021-08-21 14:25:41.174636+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
549	93	-961.09	2022-04-30 01:06:10.80971+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
550	124	3921.39	2021-12-24 20:18:58.80948+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
551	237	2142.12	2021-08-01 00:53:27.556689+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
552	230	-84.25	2022-05-11 13:24:13.516996+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
553	64	2404.80	2022-12-30 05:29:51.477307+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
554	294	41.99	2024-01-06 20:15:53.640798+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
555	29	-4220.70	2023-01-07 02:45:08.401163+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
556	220	-1338.69	2023-05-12 09:42:25.427095+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
557	180	-404.79	2023-04-03 05:03:50.441718+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
558	38	-1479.78	2023-12-07 23:20:06.736856+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
559	253	-4481.30	2025-03-25 07:32:14.029866+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
560	172	-4413.03	2022-04-19 17:49:22.98048+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
561	46	-928.08	2022-05-17 23:29:45.710531+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
562	6	1028.40	2021-05-31 06:50:18.007506+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
563	230	2897.13	2022-09-30 15:00:35.499524+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
564	292	-3676.56	2024-01-29 04:47:31.805657+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
565	224	1068.69	2022-02-24 12:21:40.047162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
566	115	-2109.38	2023-12-23 06:12:35.436616+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
567	143	-562.35	2021-05-08 23:51:09.656452+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
568	12	-4019.44	2022-08-16 12:16:51.01322+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
569	93	4897.85	2022-03-13 20:18:22.433849+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
570	258	-1149.47	2021-05-26 21:12:44.375603+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
571	179	151.34	2021-07-24 03:22:31.053512+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
572	115	-3599.21	2023-11-20 22:17:03.53748+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
573	297	4566.43	2021-02-19 11:24:35.184607+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
574	10	2240.31	2025-06-25 15:26:24.052663+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
575	197	4942.65	2022-03-03 02:22:55.691384+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
576	270	-438.22	2023-05-08 00:08:37.560963+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
577	252	-2254.50	2023-11-02 16:21:02.561321+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
578	67	-4225.87	2021-01-04 23:52:42.91642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
579	70	1687.05	2020-10-22 09:34:51.188464+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
580	64	4921.24	2021-03-25 16:58:58.198443+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
581	119	2912.67	2022-06-23 20:42:05.017197+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
582	218	1962.87	2024-10-09 02:13:16.751728+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
583	159	985.75	2023-09-30 19:03:14.435927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
584	189	-3485.47	2025-04-06 05:18:40.0199+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
585	4	230.41	2023-11-29 04:33:14.280926+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
586	182	-4251.35	2023-07-01 10:50:31.564395+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
587	251	1094.28	2025-01-27 21:41:34.726662+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
588	155	103.38	2025-04-27 09:29:50.117565+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
589	199	4356.23	2022-11-19 05:04:26.011305+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
590	236	-3840.20	2024-04-05 06:13:56.43291+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
591	75	3069.28	2023-11-22 08:59:09.403252+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
592	82	2586.19	2021-03-19 11:32:39.914938+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
593	295	-110.16	2022-05-18 12:32:07.050014+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
594	188	-4370.00	2021-06-18 12:30:11.660367+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
595	158	3825.66	2025-05-04 21:34:57.006659+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
596	89	3860.53	2023-07-28 23:04:21.904029+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
597	150	-2907.12	2024-02-03 12:26:29.120238+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
598	176	-765.53	2021-12-07 22:12:17.822215+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
599	252	3336.71	2023-06-27 23:35:16.802968+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
600	56	-2347.64	2025-05-11 15:30:07.830762+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
601	120	-2766.17	2022-07-30 01:41:45.80365+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
602	35	2876.85	2021-07-11 06:52:05.738002+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
603	145	-1408.43	2021-03-02 16:04:05.285222+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
604	200	771.21	2023-07-08 05:34:18.234986+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
605	210	-1962.69	2022-05-27 22:49:21.932579+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
606	279	-2311.65	2024-08-15 23:53:22.952988+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
607	103	-2651.70	2024-07-29 02:13:35.991957+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
608	128	-3550.61	2024-03-24 23:44:55.965728+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
609	228	-1693.22	2021-07-21 22:51:12.475016+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
610	71	3600.07	2022-09-01 05:16:41.850078+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
611	152	3328.65	2022-02-21 17:56:32.662258+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
612	107	-3372.68	2024-10-24 19:42:24.820962+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
613	203	2830.46	2022-05-14 08:38:31.326107+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
614	217	2148.05	2024-02-12 16:44:15.001667+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
615	192	3202.65	2024-03-17 02:07:06.50654+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
616	122	1838.95	2020-12-29 16:14:10.643389+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
617	117	2336.91	2022-07-26 08:29:41.355105+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
618	243	-2440.44	2022-07-28 17:55:42.053296+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
619	88	-4083.70	2024-03-06 10:02:31.140758+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
620	55	2116.60	2024-07-12 20:02:18.873056+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
621	19	-2562.21	2024-07-27 04:33:27.79919+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
622	192	-52.91	2025-06-02 22:25:08.718691+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
623	138	1388.31	2024-12-25 20:05:20.773555+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
624	115	2513.36	2020-12-31 21:19:07.823716+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
625	224	3936.96	2021-11-28 05:59:10.544383+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
626	231	-1616.92	2025-03-15 20:11:35.635802+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
627	171	-702.58	2023-10-20 16:32:31.529774+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
628	226	3510.11	2025-02-08 06:04:13.423076+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
629	93	-441.36	2024-09-02 20:27:02.422385+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
630	13	319.40	2022-06-03 19:33:09.732748+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
631	156	-4845.03	2022-07-06 12:41:39.373077+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
632	17	-3683.40	2021-09-21 22:44:34.319472+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
633	266	-3510.76	2021-10-16 23:01:51.624868+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
634	246	-55.38	2023-09-18 22:54:22.177409+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
635	188	2465.01	2020-12-06 22:07:34.054488+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
636	273	-475.21	2022-06-27 14:07:21.042214+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
637	30	545.28	2021-01-17 16:58:41.646962+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
638	216	3953.55	2022-03-30 11:29:35.525531+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
639	247	435.67	2023-10-22 06:57:35.110798+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
640	300	2772.48	2021-08-23 05:24:02.196524+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
641	67	1614.52	2022-10-02 15:01:10.179907+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
642	238	1279.05	2023-12-31 22:32:21.480089+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
643	36	-1665.60	2024-08-06 09:38:20.214233+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
644	78	4783.61	2023-05-08 13:50:30.218254+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
645	289	3278.43	2023-11-22 07:25:55.706937+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
646	128	1058.42	2025-01-30 03:03:50.573367+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
647	218	4874.50	2024-01-01 03:09:58.351485+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
648	200	3858.28	2021-12-30 01:18:24.597847+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
649	129	4203.76	2023-03-06 19:09:08.440058+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
650	191	-2139.58	2022-05-14 19:27:45.638032+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
651	178	4717.22	2021-03-17 01:16:51.985063+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
652	22	721.16	2025-09-04 05:52:05.172548+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
653	251	4179.59	2022-11-15 04:10:56.368515+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
654	282	-1665.82	2023-03-20 16:25:17.843655+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
655	150	-1572.62	2022-05-10 09:16:12.298343+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
656	196	4056.28	2021-04-23 10:56:46.324938+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
657	300	2960.43	2025-06-09 19:54:08.621487+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
658	49	4390.06	2023-02-02 04:38:55.378525+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
659	243	2542.14	2021-06-05 14:47:38.329591+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
660	99	-2880.51	2024-05-06 15:15:52.684966+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
661	13	-4535.49	2022-09-29 22:34:01.687137+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
662	81	1565.03	2022-02-19 13:38:58.39971+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
663	12	2246.43	2022-08-22 14:13:59.938198+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
664	253	2391.78	2023-04-20 09:16:03.917382+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
665	204	3585.47	2021-02-03 17:12:13.684205+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
666	290	-1673.97	2025-08-12 16:40:54.049214+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
667	79	-450.11	2023-10-04 19:56:14.080265+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
668	279	1213.08	2023-09-10 23:03:05.601372+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
669	65	1413.07	2023-04-26 22:01:20.451293+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
670	138	539.77	2023-05-17 10:04:31.280687+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
671	72	991.47	2025-09-20 18:13:29.534808+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
672	195	-4857.68	2023-03-19 09:02:46.508277+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
673	295	-390.05	2024-08-30 01:43:47.90659+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
674	67	995.43	2022-10-05 00:54:15.570311+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
675	249	3636.13	2024-10-07 01:54:39.67007+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
676	285	1576.72	2023-04-01 06:38:13.782522+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
677	214	2980.81	2024-05-23 13:52:53.753626+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
678	237	3523.49	2024-12-13 08:53:50.733435+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
679	167	538.86	2020-10-14 21:54:43.619058+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
680	12	548.37	2024-07-16 10:25:58.870981+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
681	39	-1510.64	2024-05-10 16:10:44.684428+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
682	235	3931.63	2023-02-08 13:19:54.287983+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
683	228	2719.27	2025-07-22 05:23:09.154027+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
684	286	-1115.57	2025-09-14 06:02:24.479927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
685	137	4962.17	2024-12-29 07:24:15.673558+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
686	28	3827.23	2024-05-05 15:49:49.963661+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
687	262	839.55	2022-10-19 08:42:40.162529+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
688	283	-1146.35	2024-09-07 20:48:21.163997+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
689	33	-654.14	2024-11-02 19:49:20.827724+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
690	279	3314.44	2025-06-09 16:38:46.748113+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
691	102	-1339.26	2024-06-13 04:31:17.70685+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
692	208	-3396.51	2024-01-11 00:12:06.329886+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
693	231	1079.47	2023-05-02 15:47:52.583502+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
694	261	-3736.43	2024-09-28 17:56:13.122602+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
695	250	-594.25	2025-07-30 22:43:42.959388+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
696	167	4669.45	2021-07-06 13:41:41.451244+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
697	22	1470.92	2025-06-02 16:08:09.546517+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
698	297	3231.89	2023-04-21 21:04:14.315246+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
699	210	253.78	2023-11-02 17:51:25.61105+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
700	162	906.95	2021-12-17 08:10:48.125737+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
701	157	-3736.17	2023-11-09 21:09:50.270596+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
702	246	884.17	2021-10-04 03:45:42.475283+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
703	32	2713.74	2022-10-12 07:51:23.610946+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
704	51	-2714.65	2023-02-15 01:19:00.089679+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
705	40	-2169.09	2021-11-17 09:28:09.118014+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
706	179	-3211.09	2022-01-29 01:27:19.205596+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
707	222	-348.20	2025-02-21 06:02:09.273789+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
708	165	1397.08	2023-10-19 02:07:13.278257+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
709	171	-3030.03	2023-07-25 05:26:21.522345+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
710	101	243.86	2021-05-01 20:19:41.886713+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
711	35	-3951.77	2022-08-13 06:34:28.56535+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
712	193	-1661.27	2023-06-02 06:32:39.089331+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
713	8	-2361.91	2021-09-17 21:46:04.185502+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
714	46	-2797.21	2022-04-01 03:57:26.370573+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
715	54	-1426.08	2023-11-29 20:55:04.668407+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
716	219	-1109.08	2024-10-21 17:22:05.84729+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
717	65	917.46	2024-01-11 14:04:34.156357+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
718	18	-2094.25	2024-08-30 03:27:13.430406+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
719	268	1193.55	2023-09-29 10:16:17.738022+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
720	70	-4239.32	2021-11-09 09:36:00.119827+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
721	141	-953.37	2022-03-15 01:51:05.847196+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
722	174	986.27	2020-12-22 10:41:10.730201+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
723	152	3355.53	2022-05-20 01:34:12.506437+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
724	197	-1034.43	2022-08-17 06:40:36.109103+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
725	100	-2250.94	2024-10-02 00:52:00.324144+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
726	293	-3021.89	2022-11-08 01:28:00.805454+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
727	298	-1091.06	2021-05-25 13:40:15.164049+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
728	115	3928.43	2022-04-09 08:17:56.865862+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
729	298	-4009.00	2024-01-13 13:07:14.960576+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
730	25	3148.68	2023-04-12 17:31:29.400335+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
731	51	3668.71	2024-07-05 06:57:34.385594+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
732	158	1817.89	2023-10-02 18:46:47.046161+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
733	261	-2017.33	2024-12-10 06:38:28.900094+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
734	299	-1149.40	2023-08-04 23:51:03.857851+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
735	66	506.03	2021-03-07 03:37:43.010103+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
736	242	1772.43	2024-05-10 22:11:16.594899+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
737	3	-4444.20	2024-07-25 03:44:45.979432+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
738	12	3818.95	2025-02-02 12:45:26.341329+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
739	42	-2799.46	2020-12-07 07:57:20.318483+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
740	190	-4326.22	2024-04-11 19:23:08.290166+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
741	267	-4029.45	2021-01-07 03:19:17.001586+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
742	45	-1023.44	2021-09-19 07:18:42.121534+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
743	271	689.70	2024-01-21 04:24:44.496533+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
744	65	-3814.90	2024-04-13 09:05:46.450169+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
745	78	-259.38	2021-05-22 10:22:28.150736+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
746	291	-2473.32	2023-06-08 08:12:34.832573+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
747	215	-1621.85	2025-08-02 15:29:22.52405+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
748	241	-4219.72	2024-03-15 15:30:24.102838+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
749	98	-377.35	2020-12-14 07:52:30.644105+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
750	269	-291.71	2025-03-03 00:56:00.535628+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
751	85	-3037.69	2025-01-17 00:35:50.893383+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
752	33	220.69	2021-08-06 23:22:12.382342+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
753	155	-1848.00	2023-03-19 03:41:59.437552+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
754	46	-1483.35	2022-05-01 08:07:23.641512+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
755	12	4850.27	2023-04-26 06:52:40.118725+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
756	30	-1530.88	2022-01-23 06:49:40.778056+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
757	107	2923.99	2022-08-05 16:01:46.069709+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
758	96	1358.23	2023-12-06 19:44:51.394044+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
759	7	1874.43	2022-10-25 10:25:11.241645+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
760	132	2807.01	2022-12-05 05:03:23.672644+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
761	274	2463.67	2022-06-22 16:57:55.595384+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
762	272	-2959.70	2024-06-29 02:39:42.222584+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
763	31	-4429.68	2025-03-05 09:58:20.51779+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
764	189	903.42	2023-11-19 02:30:03.607061+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
765	290	-2794.26	2021-10-31 18:15:16.936298+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
766	224	1371.79	2025-04-01 09:16:03.778014+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
767	15	-2450.01	2024-09-30 12:10:42.667861+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
768	156	2921.81	2022-07-16 02:35:22.500339+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
769	258	-2438.81	2022-10-07 22:23:29.453201+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
770	108	-3168.15	2024-01-25 18:43:21.631075+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
771	53	-1176.33	2021-02-03 09:42:59.385162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
772	144	-1089.01	2025-06-14 13:08:23.899995+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
773	163	-1908.83	2020-10-28 22:25:29.06066+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
774	35	144.93	2024-03-02 14:34:38.573797+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
775	152	2185.21	2022-03-09 19:16:45.150547+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
776	280	-3590.73	2024-01-05 06:03:20.844072+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
777	249	1395.03	2022-10-13 02:29:32.031692+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
778	4	-47.76	2024-05-05 16:32:30.126819+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
779	158	-2304.56	2023-06-27 19:48:28.707857+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
780	66	4548.66	2020-12-26 15:01:54.680368+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
781	178	4993.73	2023-01-26 04:56:28.408671+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
782	247	3235.86	2024-05-02 21:10:27.871276+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
783	71	3417.40	2021-01-07 18:51:36.220746+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
784	164	-1641.72	2023-12-25 09:37:59.819594+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
785	57	-1082.86	2022-05-22 03:46:28.422523+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
786	219	615.77	2021-08-19 10:26:02.262653+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
787	6	-1135.52	2023-11-06 05:56:54.656281+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
788	139	-555.68	2024-12-27 16:53:55.487871+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
789	269	-1551.28	2022-01-03 16:48:26.197393+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
790	27	4967.74	2020-10-22 12:40:27.394289+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
791	156	-1768.85	2024-06-08 10:12:19.93128+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
792	147	4645.01	2024-06-25 10:35:33.667479+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
793	171	4340.65	2022-11-15 21:47:26.644882+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
794	234	-3261.27	2023-09-10 16:17:55.611642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
795	236	-4422.88	2025-09-14 22:19:26.801405+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
796	229	2860.67	2022-06-22 14:25:54.736436+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
797	84	-3077.14	2022-07-22 10:37:12.085537+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
798	177	-1555.56	2021-04-12 06:23:14.83346+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
799	92	-1329.11	2020-10-10 09:50:20.198932+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
800	278	-1377.08	2024-09-11 02:14:50.255844+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
801	194	3172.30	2025-06-12 09:54:30.431652+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
802	73	2677.04	2021-01-28 06:21:54.381124+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
803	26	3799.00	2022-01-30 20:08:48.395184+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
804	286	3776.73	2021-09-20 07:44:55.437781+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
805	248	4887.77	2024-04-01 15:44:27.106987+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
806	162	524.40	2022-08-08 10:25:00.421054+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
807	280	3908.29	2024-08-05 02:21:31.71291+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
808	23	-1486.79	2025-01-14 21:22:44.328367+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
809	253	4421.58	2024-01-27 11:30:45.179115+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
810	146	4016.59	2021-02-26 16:37:15.560308+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
811	141	435.63	2022-12-17 19:56:35.733369+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
812	237	3215.84	2021-11-10 09:02:09.820352+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
813	242	4372.76	2024-02-15 17:13:08.003516+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
814	258	-2709.87	2021-07-23 09:06:12.412833+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
815	258	-838.60	2025-02-03 23:53:32.921174+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
816	298	-2453.58	2024-02-12 01:28:40.708947+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
817	95	1714.86	2023-02-05 12:54:22.328219+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
818	143	4853.63	2023-07-10 04:32:21.772275+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
819	231	2744.42	2022-06-23 07:20:41.158953+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
820	215	-4019.01	2024-03-05 23:11:40.843786+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
821	279	3001.13	2024-11-25 06:10:05.532178+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
822	88	1832.51	2024-11-20 01:05:41.781951+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
823	257	-1245.71	2021-02-04 18:28:01.457942+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
824	136	-4317.74	2025-05-27 03:03:08.143467+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
825	281	-719.14	2024-11-15 18:21:06.077269+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
826	268	4718.98	2021-04-13 15:11:47.47965+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
827	256	4200.12	2023-07-23 14:07:36.269865+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
828	53	4170.01	2021-08-15 07:46:33.756658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
829	199	1112.17	2022-11-25 15:27:59.37716+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
830	125	2962.02	2023-08-06 14:18:11.789571+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
831	184	534.47	2022-05-22 01:09:31.535289+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
832	36	4351.79	2024-09-07 10:46:29.852527+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
833	35	3946.52	2025-05-13 15:12:02.623185+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
834	135	4954.85	2022-05-16 17:49:21.329016+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
835	218	3658.02	2025-02-01 00:02:41.354847+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
836	92	75.32	2021-06-23 00:11:22.222666+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
837	158	1492.59	2023-04-19 11:20:06.56336+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
838	23	4840.70	2021-08-05 00:40:58.273669+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
839	97	-1694.04	2023-06-26 21:33:25.781121+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
840	280	-1026.79	2023-04-25 21:11:04.730454+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
841	223	2278.75	2024-04-22 01:47:59.963079+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
842	245	-1551.49	2024-12-25 04:37:57.37159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
843	225	-775.40	2022-09-09 19:56:38.489315+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
844	148	4411.78	2023-10-05 20:11:21.596508+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
845	238	-2474.69	2021-07-19 17:17:36.865244+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
846	98	18.52	2021-09-10 03:25:58.652057+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
847	288	-1753.86	2023-03-19 02:51:42.712701+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
848	256	2786.40	2021-02-18 21:47:33.840405+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
849	102	1531.76	2023-01-14 15:56:00.312137+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
850	74	-4171.32	2023-11-20 16:13:40.618392+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
851	264	2644.18	2023-01-31 06:44:06.734445+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
852	8	2286.47	2021-04-28 04:13:20.250344+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
853	150	1910.32	2024-12-09 07:31:30.080975+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
854	182	-3916.40	2025-09-07 16:47:55.657398+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
855	225	928.30	2022-11-10 05:00:23.840394+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
856	47	1320.64	2020-12-15 23:50:24.91827+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
857	178	-1847.51	2025-09-12 12:46:46.415419+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
858	206	409.00	2024-07-21 01:34:56.863658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
859	99	1277.77	2022-08-09 22:29:37.77953+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
860	253	-4750.76	2022-06-17 00:09:22.570431+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
861	7	-4984.06	2022-11-10 16:24:53.145291+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
862	173	897.18	2021-05-04 14:49:32.213447+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
863	116	-4956.16	2022-05-21 02:58:48.007522+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
864	53	1251.08	2023-11-14 18:33:04.835495+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
865	151	-1426.26	2024-11-17 07:19:59.28723+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
866	175	-4190.16	2025-08-19 09:33:41.750234+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
867	270	-4001.78	2023-08-14 19:22:29.239792+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
868	84	-2904.04	2025-01-27 21:47:58.677433+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
869	280	2979.17	2025-06-27 01:30:08.952891+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
870	237	-3156.44	2023-05-10 14:02:25.325116+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
871	64	-1143.91	2024-04-14 11:07:05.129679+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
872	134	1352.08	2022-11-17 20:37:56.942884+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
873	17	1102.09	2024-11-21 14:39:44.639038+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
874	110	-2142.63	2022-07-29 13:46:37.505712+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
875	168	711.83	2024-10-14 22:27:38.437925+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
876	175	-4928.81	2023-09-07 19:30:21.505866+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
877	196	-3701.67	2025-03-17 09:04:53.437468+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
878	289	-1413.53	2023-07-11 18:22:44.56086+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
879	229	4451.61	2020-10-27 13:28:27.71237+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
880	156	-3754.95	2024-05-15 13:05:54.97079+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
881	5	2679.17	2022-07-15 04:23:55.916086+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
882	23	4080.10	2023-08-03 02:15:01.287104+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
883	266	2552.10	2024-09-10 22:28:51.904471+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
884	196	1023.02	2024-07-18 23:07:40.385024+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
885	230	3763.09	2022-01-05 11:47:36.047098+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
886	247	3805.00	2022-10-13 01:10:21.034865+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
887	296	2852.43	2024-10-26 16:38:52.619118+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
888	183	2918.22	2022-09-05 05:10:40.175895+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
889	113	-1997.74	2023-07-26 06:15:24.162805+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
890	21	-3937.16	2025-02-20 19:39:36.940652+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
891	214	-3367.11	2024-03-28 16:11:30.450265+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
892	25	4026.95	2023-12-05 10:39:41.147196+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
893	181	185.31	2025-05-04 02:29:11.003372+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
894	7	-2089.61	2022-03-07 18:11:28.127314+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
895	205	-2123.21	2024-10-15 05:13:47.649623+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
896	57	1959.91	2024-01-26 19:55:40.53219+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
897	166	-2248.35	2022-03-03 00:47:23.492585+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
898	235	742.50	2021-10-09 11:21:38.802521+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
899	192	4354.13	2023-05-24 09:10:58.019706+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
900	60	-918.66	2024-09-23 14:22:22.000417+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
901	282	-3764.19	2023-09-26 16:29:48.783094+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
902	109	-2333.03	2022-06-04 21:44:09.027874+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
903	248	4881.53	2021-07-12 05:05:14.702522+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
904	114	-4202.77	2023-02-22 06:18:25.329902+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
905	240	2573.74	2025-01-17 16:37:40.373424+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
906	175	-638.59	2021-06-06 13:29:15.80191+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
907	235	165.70	2023-04-20 23:10:16.184147+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
908	206	1950.85	2021-03-18 07:24:50.913323+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
909	30	-2274.19	2020-10-20 05:08:46.737289+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
910	154	-4389.93	2023-04-29 13:06:14.952499+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
911	91	-4746.45	2021-07-01 12:12:08.001799+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
912	287	1330.72	2022-06-15 19:22:44.188334+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
913	184	-178.86	2022-04-14 07:02:34.936865+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
914	38	-1939.08	2024-01-25 18:38:37.508291+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
915	66	-848.54	2022-03-20 22:37:56.052768+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
916	97	-2948.62	2021-03-21 20:21:01.936611+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
917	119	-2692.94	2020-12-02 05:34:06.011378+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
918	287	836.33	2021-01-30 07:18:45.964195+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
919	165	-3892.14	2024-10-23 12:34:22.821492+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
920	237	3006.25	2024-11-10 18:53:24.445013+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
921	82	-1915.34	2024-03-03 07:23:48.950973+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
922	175	2310.51	2022-02-26 22:09:40.126668+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
923	166	4404.87	2021-03-12 23:19:26.537808+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
924	90	2703.07	2024-09-25 09:56:27.694246+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
925	271	-81.15	2025-07-12 21:33:11.024508+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
926	146	-3512.10	2024-08-06 10:51:21.549558+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
927	208	-1815.46	2025-02-01 12:38:39.446228+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
928	163	2838.57	2021-08-18 12:24:56.426778+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
929	229	3043.56	2024-12-02 13:13:00.43738+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
930	150	2298.81	2023-02-09 05:21:15.732117+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
931	130	49.77	2024-10-22 03:12:13.031149+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
932	239	3207.92	2022-09-29 11:18:17.700271+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
933	25	4333.57	2025-01-14 23:35:16.532456+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
934	253	2549.35	2020-10-30 18:58:39.614763+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
935	238	4803.53	2022-06-26 14:11:00.423801+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
936	79	1387.71	2023-02-22 15:25:55.146255+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
937	103	3636.49	2024-09-19 15:28:20.563063+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
938	199	-4397.27	2024-11-07 07:44:51.894922+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
939	59	1290.78	2021-07-29 16:20:24.555042+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
940	241	-804.92	2021-07-04 18:08:50.235492+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
941	50	1802.30	2022-07-13 07:47:08.168602+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
942	2	2099.13	2024-09-21 23:04:09.331604+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
943	281	165.01	2023-06-02 21:49:56.315723+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
944	284	-4578.06	2021-11-19 04:41:38.637535+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
945	159	-4389.79	2022-02-17 11:28:10.251045+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
946	203	-4588.88	2021-01-01 01:32:04.632272+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
947	260	-3740.97	2022-10-13 18:18:49.682622+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
948	271	-3550.29	2022-12-01 14:29:55.612411+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
949	223	1826.44	2023-11-28 17:13:40.725481+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
950	296	298.96	2022-02-20 15:52:50.224317+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
951	73	2952.39	2021-12-18 16:29:36.922747+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
952	284	3998.79	2022-05-23 04:10:40.544523+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
953	146	3681.22	2023-10-14 20:13:28.632583+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
954	202	2900.31	2022-02-05 11:59:28.631483+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
955	54	-674.49	2023-10-24 13:55:02.931169+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
956	78	1128.82	2025-02-21 10:43:02.161478+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
957	132	4597.36	2021-07-14 14:44:53.122027+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
958	90	1790.67	2023-07-29 18:38:18.729905+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
959	227	3182.69	2021-11-04 18:03:41.480317+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
960	82	-3199.16	2020-11-27 17:13:36.172371+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
961	152	281.14	2024-03-01 13:36:34.132639+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
962	22	-363.09	2025-06-28 21:36:28.71579+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
963	149	-3743.27	2021-12-17 05:04:38.012853+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
964	83	4556.65	2022-07-14 12:43:20.59661+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
965	72	3050.24	2025-02-16 12:44:51.76162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
966	237	2816.14	2024-02-13 00:14:47.764179+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
967	228	4938.73	2021-06-07 22:24:52.163632+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
968	64	-1308.05	2021-08-21 07:42:44.80652+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
969	240	-4207.23	2025-01-11 16:00:48.17682+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
970	21	2287.29	2022-03-13 14:23:47.751834+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
971	260	2032.78	2024-01-23 19:41:30.03124+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
972	293	-877.39	2023-12-19 05:19:24.034823+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
973	231	-3635.45	2024-08-02 19:39:03.278178+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
974	19	1806.46	2024-03-07 22:00:56.814662+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
975	147	3081.59	2025-05-23 21:21:23.010751+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
976	175	364.21	2023-07-26 01:12:08.157398+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
977	261	-3838.93	2023-02-25 19:14:17.671886+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
978	258	-2012.86	2022-03-27 11:09:02.144455+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
979	152	1488.46	2023-01-13 11:10:37.176552+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
980	158	46.51	2021-11-15 13:47:16.847624+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
981	280	1419.42	2021-10-03 17:27:00.337653+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
982	246	2532.32	2022-03-12 18:41:33.855873+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
983	83	1078.99	2025-07-17 04:51:49.046268+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
984	294	-4040.64	2025-02-02 04:30:43.097051+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
985	163	-445.93	2023-02-07 22:38:45.565797+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
986	21	-274.88	2021-12-08 10:36:26.396474+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
987	113	-449.28	2024-10-18 10:09:54.477915+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
988	127	-2195.33	2024-10-12 11:46:49.023849+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
989	256	1651.34	2022-09-19 00:15:40.962521+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
990	278	3416.23	2024-10-31 10:27:07.61771+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
991	285	1045.44	2021-10-06 15:55:51.637373+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
992	241	-3470.74	2024-06-04 21:29:38.657038+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
993	178	1476.63	2021-08-12 23:14:50.920274+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
994	200	-4534.56	2023-07-26 16:44:36.870834+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
995	32	-1210.58	2025-09-22 23:39:36.056609+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
996	227	-1580.48	2023-03-09 17:13:34.118989+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
997	271	-1513.62	2022-12-25 23:05:27.331798+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
998	149	1101.29	2022-02-06 05:49:57.420811+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
999	254	3383.99	2025-01-13 08:55:07.363239+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
1000	119	-134.69	2022-02-26 14:10:16.578995+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
\.


--
-- Data for Name: Accounts; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."Accounts" (account_id, account_number, customer_id, account_balance, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Branches; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."Branches" (branch_id, branch_code, branch_address, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Cards; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."Cards" (card_id, card_number, customer_id, balance, expiration_date, is_blocked, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Customers; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."Customers" (customer_id, branch_id, customer_name, date_of_birth, address, phone, email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: DepositTypes; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."DepositTypes" (deposit_type_id, type, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Deposits; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."Deposits" (deposit_id, customer_id, deposit_identifier, deposit_type_id, balance, term, interest_rate, start_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: LoanTypes; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."LoanTypes" (loan_type_id, type, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Loans; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."Loans" (loan_id, customer_id, loan_identifier, loan_type_id, balance, payment_term, interest_rate, start_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: g_current; Owner: phamdinhkhanh
--

COPY g_current."Transactions" (transaction_id, account_id, transaction_amount, transaction_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.accounts (id, acc_num, cus_id, acc_bal, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.branches (id, brc, brc_address, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.cards (id, cc_num, cus_id, bal, card_exp_date, is_blocked, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.customers (id, brc, cus_name, cus_dob, cus_addr, cus_phone, cus_email, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: deposit_types; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.deposit_types (id, de_type, de_des, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: deposits; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.deposits (id, cus_id, de_id, de_type_id, bal, tem, interest, de_st_dt, de_en_dt, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: loan_types; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.loan_types (id, ln_type, ln_des, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.loans (id, cus_id, ln_id, ln_type_id, bal, pmt_term, interest, ln_st_dt, ln_en_dt, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: g_prev; Owner: phamdinhkhanh
--

COPY g_prev.transactions (id, acc_id, tran_amt, tran_dt, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.accounts (id, acc_num, cus_id, acc_bal, created_at, updated_at) FROM stdin;
1	RSAL51473255709444	52	99074.26	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
2	OEVO41031388209891	82	9477.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
3	EBZV87223503490879	176	24628.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
4	GBKO12986782461241	159	20781.02	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
5	HUGF10426621621216	6	12728.64	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
6	LUBH94592419035093	116	73443.51	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
7	ZYXA81838775427140	171	92463.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
8	VDUE67763587879707	9	65937.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
9	KDVE65029543834475	4	50532.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
10	HNVG39349416879641	119	87791.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
11	OTRV35680483860342	107	495.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
12	DQIA66428878931936	73	35691.72	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
13	RXLS44345514710060	169	45473.23	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
14	NZVQ19679915765291	122	42528.43	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
15	TAMZ72217715200407	59	3873.98	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
16	CJFE31371441177705	88	-764.56	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
17	MYMX86944807574116	14	1714.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
18	ASQA16071627801713	188	27184.11	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
19	OEPX12340298670699	141	43385.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
20	IGZI59057410985728	61	98407.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
21	ZOTM68802465021534	191	40542.38	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
22	KUJM32477932865163	135	97906.38	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
23	RIWH26889080931163	101	2809.55	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
24	YNTV09875829198698	47	34538.40	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
25	SXPW68078697566581	196	99447.17	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
26	WAZJ65162994405238	34	15780.62	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
27	ZCLE45595007604206	172	41989.13	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
28	GFBI90128435818670	94	30563.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
29	UIAF87728550939154	87	74803.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
30	ROVB09704606474998	152	23140.12	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
31	UYZY72902413628652	23	95019.95	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
32	OIZP53528192169028	27	83946.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
33	UQAF62154719437099	129	41037.05	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
34	WABX58464278969133	50	39014.20	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
35	DIBJ40104306159452	192	94341.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
36	SSQG12301976872672	33	5543.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
37	MPHC92757581691021	62	41384.32	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
38	NPKY20128815160028	170	91597.26	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
39	PXID17992147779458	77	-3996.63	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
40	HIHI27081012910231	39	14259.65	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
41	ECOF48673088191960	187	69339.00	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
42	KHPO10443180763760	73	43330.15	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
43	WOJR20807791690237	118	57814.92	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
44	ACPX62238525650442	138	99743.81	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
45	DDRW36283752835613	117	49824.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
46	JQRQ69813524031526	174	2450.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
47	HLGZ81181388281825	25	54739.88	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
48	KLAJ32492095982801	66	57792.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
49	FEYL31362972764589	156	54061.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
50	UUCF53434269597282	148	79184.84	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
51	FFVQ98435174940595	51	12586.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
52	HVDX21007418114373	5	-1063.66	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
53	ZBSV06962089004178	2	25121.88	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
54	RUQP36934907908565	34	21750.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
55	XEVX04051338278087	179	-749.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
56	TOWK36249482520035	171	59205.14	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
57	BSGW90918344093325	13	95268.80	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
58	ZFSN49812952172711	183	6032.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
59	JQIE56227253862191	117	67130.21	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
60	RRUB58788768196656	71	44425.27	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
61	OPWX61318773121136	183	13536.72	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
62	ENYE11460353162737	119	16206.86	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
63	IQNZ09312882342897	35	57927.15	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
64	QMYS54532472086112	122	35743.12	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
65	SXEQ65111275988832	36	53607.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
66	OEJF01777767146176	192	82312.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
67	DYTC31508559324107	56	11973.95	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
68	XMVO15224781551990	21	72385.52	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
69	BSWZ33040418698529	82	24068.97	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
70	MPKX41683608524479	32	64876.95	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
71	WFJQ23798136643194	174	66739.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
72	VZZO75161321941089	179	82650.66	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
73	ERMD03148329663023	135	96100.94	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
74	LEHP96495347556794	59	85888.51	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
75	ODKA78838574450354	58	22762.33	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
76	FAPW84353414762558	9	90633.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
77	HELA77467347517564	131	42038.19	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
78	GKSB24118417102313	160	20447.93	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
79	KUQM33077182501789	144	95866.51	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
80	COZP37664460425373	31	59840.43	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
81	YUIB84086032347477	50	9625.11	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
82	FVJP35924204712209	93	23148.29	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
83	YETO25730014694795	155	14049.24	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
84	FFAL82212832309697	155	13876.27	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
85	DISA90315859562228	150	34408.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
86	NZWZ46654903472400	133	32184.24	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
87	NDXB41424186491745	174	45295.54	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
88	YZZO53991948689201	47	41800.94	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
89	PZET11068811176045	26	-4618.68	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
90	HLRC82080263792909	19	89186.27	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
91	MCRU40146535193789	186	52355.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
92	QENM79993548850444	88	43957.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
93	ZLSW18592011971079	103	89967.58	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
94	NTTS77022339820839	88	-5512.42	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
95	RJZO49720897476595	67	32846.30	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
96	ZGAN92180065572620	153	33735.30	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
97	SAVP80457496977674	123	77755.20	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
98	ZNDV83677487970512	7	84989.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
99	QGMY26214098592318	29	-5022.56	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
100	KCSJ23583228515307	56	79715.60	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
101	RCQW51073042394562	21	4458.21	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
102	BQPR70080981645015	57	21600.44	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
103	STJO99220223758298	104	29884.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
104	OJCK09973784434121	185	66474.11	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
105	ADVN82837723777658	59	58081.57	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
106	RIOI63621872952515	98	32991.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
107	JETC98001456297611	80	52764.94	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
108	YWQP27372095769794	151	12501.55	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
109	LSZM93580615368079	17	8186.90	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
110	BEUM86353352631634	67	35045.08	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
111	CMBO25739032875136	34	37306.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
112	FYKL42922998172999	136	53985.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
113	CKBI23786631157096	60	22531.56	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
114	NMUH16013619712310	17	88051.03	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
115	SEWT31241961851147	41	33547.26	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
116	DUFA09211464226685	147	11494.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
117	HDTY98285956507438	67	18576.86	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
118	NGNJ42161051978059	29	49761.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
119	GFWB52636420103656	58	94148.38	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
120	CPXH32867534276175	148	97006.10	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
121	BJNK69033845802595	10	46577.72	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
122	MVWH04897129316091	108	95585.19	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
123	OYHF18516036864976	108	15569.72	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
124	VVWM66925761154852	41	89827.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
125	PCZX25617562415632	109	75634.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
126	YLGY91053117721911	73	9882.35	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
127	JGIJ44094830299792	72	5857.81	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
128	IRXE76702017613487	43	77353.98	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
129	EKQE05323171074875	198	48840.18	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
130	KGLD13039307139175	110	66619.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
131	QOQF28342002891727	154	93352.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
132	GDOG52324112960500	147	38471.71	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
133	TGTH59315066397081	107	23700.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
134	JIRS71203527298460	28	43747.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
135	FSHT39049428928845	133	85952.44	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
136	ZPNJ29683196703576	198	26220.48	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
137	KASQ51012530384094	96	58755.88	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
138	ZASI30376944183840	76	35565.67	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
139	NSHA07952535541782	148	86197.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
140	LGYB06436358644629	112	-4412.77	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
141	WZHL14352584787851	11	78435.98	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
142	TETH00806242555917	138	92514.71	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
143	ZRUL74167341741202	167	-6842.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
144	PJHA60427454049636	192	14235.13	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
145	MSVV09965199471196	170	75554.04	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
146	OKZV51248958765115	66	97379.29	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
147	XPFI36218587160138	149	76644.19	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
148	ZGZE91084337641839	30	-3449.42	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
149	EGIU97128554419418	124	89935.48	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
150	ALNE03614065101543	93	90143.07	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
151	AKBO64648319805481	22	16032.93	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
152	OYRE68351090129417	200	66749.76	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
153	EGVO34341578156993	109	11490.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
154	PIPV62671583316647	76	22406.25	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
155	FXET06105515849481	67	27100.68	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
156	IFEK91901806960398	26	96301.48	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
157	JTTF34442823014555	132	45655.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
158	TKYY78539376639124	98	-1922.74	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
159	JLDP31058873872125	22	50456.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
160	VUCT39261917084462	68	6602.58	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
161	ALNX06317765495914	200	41774.57	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
162	FENC73827125296132	69	1342.66	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
163	XDXD39431592387548	163	59495.16	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
164	GYAD70349665747967	164	41927.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
165	MSEP18572304732152	189	38707.66	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
166	GCKZ19087782390399	29	33688.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
167	XVAP37280838579320	116	59315.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
168	VAHA31239196610559	24	-432.91	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
169	MRJG37335449742012	82	53804.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
170	TTNJ83061100740859	63	8273.06	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
171	CVHX44116968467082	118	2800.52	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
172	TVYF26033617561488	155	-8235.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
173	TZDY55273928165417	118	29914.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
174	WHOR37149240874325	166	21900.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
175	BRUR90285952594162	151	57324.79	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
176	SLQL35258718724043	30	-3921.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
177	HEWB49745056045230	170	15613.32	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
178	EOEU97995411527386	107	53861.43	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
179	EDTV64060138045293	137	-1205.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
180	IHLV25071319160107	105	26424.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
181	XDNM85846791428492	111	83975.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
182	XPLV57673056674250	104	37774.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
183	RPLG15924193982769	91	62785.63	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
184	XJUK73846826922116	55	57938.87	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
185	FXSI63662750805903	109	5599.23	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
186	NDHU49868674239239	120	31575.53	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
187	QFRG21134557955881	76	33492.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
188	BDIJ04627138912856	20	53446.41	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
189	LPUS47531220904179	16	61463.59	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
190	VPZX09998466467174	50	82868.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
191	REKQ89923932711222	182	-2096.82	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
192	JAFY35074447565540	90	24322.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
193	HCFL87943495166749	118	64684.44	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
194	ICQJ83818006861453	42	41858.93	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
195	WWVL65471888064148	129	88136.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
196	BNMZ14126040526920	8	63032.92	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
197	PIQN95166433454713	83	99955.29	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
198	SFES28956176325609	5	12673.48	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
199	TQIV68974681332446	66	53436.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
200	IPKN06543980855453	9	99231.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
201	IAND71360925698356	82	17817.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
202	YBYA25857378959125	28	94773.98	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
203	YMJQ77453006453918	82	24011.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
204	PFCM44169927711483	94	31862.65	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
205	XCNS11298684066352	67	12821.71	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
206	WJQW29331587247499	106	34814.94	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
207	VIME86549242242940	67	53014.02	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
208	EYMS45393682872562	16	-3168.84	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
209	LXGM53984929130371	42	46397.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
210	SFEB01139991376143	158	-3494.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
211	DGGV43883776145123	119	38248.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
212	LLIY66974438850583	89	42854.24	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
213	PKFR99276457306896	25	47507.61	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
214	BCFH35216891400429	153	72924.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
215	KQUS69956238013856	139	61790.31	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
216	KEWN73199311103517	156	20524.55	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
217	LPXV86356116605117	19	54302.49	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
218	XXSP47987129186889	170	62297.09	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
219	LLPA73194817740813	31	77465.74	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
220	WRDA43515595226570	6	14818.79	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
221	VDYA17864885176862	88	47412.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
222	SGPB08326360129675	10	55093.22	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
223	FCGT04015802808705	187	77402.85	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
224	RMMH11747331860122	31	30018.45	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
225	FKEM44130910911648	65	-443.45	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
226	FTHS50415923510263	71	-6204.32	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
227	RIKU85684458791937	60	-5709.87	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
228	VIYP28794549866839	137	83738.16	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
229	NKHP60284749286319	58	59641.91	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
230	SJCI33978595634473	173	15696.67	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
231	WZTV34566002525779	90	68286.91	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
232	BSGU58691063431856	57	68629.40	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
233	KAUL58860249678383	58	9517.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
234	VCJU33377243598873	97	84755.79	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
235	AKTQ04245057889115	93	64890.97	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
236	UEED38600240743684	133	87189.84	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
237	MMTF66066089930241	37	83993.41	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
238	YBIB54607011402432	106	18779.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
239	JIEM60781906703846	30	47548.95	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
240	DGRM62906835580587	33	27929.87	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
241	DRWU48306399029315	133	-8838.82	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
242	ZHJY43658182060444	37	54982.01	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
243	PIRU17862017422777	46	30833.04	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
244	KCDG61516706703650	114	66319.26	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
245	JVOJ02081006548047	133	61519.85	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
246	TFUH66729024442595	64	10527.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
247	KTOY93680154426995	44	75219.19	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
248	WFBC02828433494125	170	60647.36	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
249	NOFE88717704520516	64	91446.64	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
250	XHCI87954079428528	13	98365.74	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
251	DZQA50675936784198	79	84831.52	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
252	PVDI21541537108613	7	42938.53	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
253	AZDB51588290542954	172	16268.71	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
254	KVZH52785652567938	130	36885.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
255	CFUK89733906287700	161	85998.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
256	JLFT63355885143214	127	33436.55	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
257	JAWV38890448081489	89	72042.51	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
258	MNWY20190702204122	139	17370.54	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
259	VWEN15563584626974	142	39857.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
260	XDKY80652224747597	183	11327.16	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
261	JGSR98233315890124	126	78793.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
262	NCBU94998030308140	110	39510.76	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
263	IJNB94801093717507	72	88810.07	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
264	VEFM08010199192890	72	66024.02	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
265	SZNP89216260921114	102	-5358.34	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
266	SRSY29930279264512	27	84321.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
267	LDPZ62190015579685	16	98856.25	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
268	ZHWF31986649380311	30	27309.57	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
269	ULLZ26939705415482	56	77596.45	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
270	IJMQ54223801090344	61	93533.02	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
271	SYQS71503102191947	28	83607.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
272	FADW26638292548498	200	38663.83	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
273	XNZV60645635859407	47	64753.85	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
274	AMMH09858891662717	186	81327.30	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
275	OUBJ15094108869881	168	56252.28	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
276	EDQO63711511091661	108	27837.96	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
277	USAA50924367650771	27	-9224.86	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
278	HTBY71292616370068	163	19090.50	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
279	YAKO65020115432460	153	54670.81	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
280	QMZH81279788732973	6	89233.47	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
281	IKMC95564359135529	16	53666.10	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
282	ZBNW69002036912346	164	-294.52	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
283	KAOC33461283437906	24	38133.82	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
284	GZGV89654419773898	58	29968.75	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
285	MUQG15961085923817	46	93442.33	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
286	IYHB26221692807639	163	93076.39	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
287	LAGX15312555477821	148	90138.86	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
288	LZDV21319580962291	26	74117.37	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
289	BMVT14030871602701	147	28953.11	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
290	CLXM44655725590729	109	32236.45	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
291	DEBF59391598887185	83	82404.78	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
292	TKNT59585037187743	153	19625.99	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
293	MGWD73900304885475	81	33115.44	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
294	RQXF96665814970443	17	-3549.16	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
295	ASMO21057327591392	185	83848.33	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
296	AAQC92388795706162	67	39238.68	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
297	MDLJ59676970544657	74	10255.97	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
298	OUZF12488811039108	16	25508.17	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
299	UAGM17884021145653	165	76773.89	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
300	NLPH98157095125058	44	80531.78	2025-09-23 17:09:03.912337+07	2025-09-23 17:09:03.912337+07
\.


--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.branches (id, brc, brc_address, created_at, updated_at) FROM stdin;
1	Anthony, Rogers and Fields	718 Knight Shore Apt. 164\nLake Jennifershire, GA 68216	2025-09-23 17:09:03.810141+07	2025-09-23 17:09:03.810141+07
2	Gallagher-Mullen	846 Gomez Roads\nNew Colleen, MI 66121	2025-09-23 17:09:03.810141+07	2025-09-23 17:09:03.810141+07
3	Allison Group	52223 John Mountains Apt. 169\nDonnafurt, ME 99158	2025-09-23 17:09:03.810141+07	2025-09-23 17:09:03.810141+07
4	Harris Ltd	4376 Brandi Loaf Apt. 848\nNew Earlhaven, WA 71139	2025-09-23 17:09:03.810141+07	2025-09-23 17:09:03.810141+07
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.cards (id, cc_num, cus_id, bal, card_exp_date, is_blocked, created_at, updated_at) FROM stdin;
1	3550741184678404	17	-41880.86	2029-05-13	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
2	4806927940861307877	156	-45023.52	2028-01-01	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
3	501843484376	97	-10455.60	2028-01-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
4	30108238922269	181	-47242.35	2027-06-05	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
5	4333992318143686316	170	-14555.79	2028-03-19	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
6	4721053539851	87	-72521.02	2030-01-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
7	676185421374	14	-12.42	2029-02-18	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
8	3558371116536660	145	-9033.95	2029-12-31	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
9	2260648608121130	91	-17453.20	2028-02-18	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
10	180003395211952	87	-33074.41	2030-06-02	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
11	180013204086800	141	-18286.45	2028-03-04	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
12	6011606620498236	51	-3955.25	2027-08-22	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
13	2298193473344216	167	-65515.27	2028-12-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
14	4068114094801	132	-48079.06	2029-12-19	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
15	676114879742	24	-64323.63	2028-12-11	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
16	213195497139916	74	-85700.15	2027-03-18	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
17	6011393351827004	153	-65517.75	2029-02-23	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
18	30026837989648	16	-55966.00	2030-03-08	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
19	3542598283866749	42	-15507.13	2027-10-26	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
20	213179746485098	40	-28547.06	2030-03-13	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
21	3551172540083890	39	-85689.41	2029-07-01	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
22	675902604650	194	-82956.07	2028-04-17	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
23	501824629650	121	-25878.79	2027-06-28	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
24	213175398005226	149	-9051.61	2026-12-09	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
25	3506179698891400	43	-46625.68	2030-06-04	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
26	4689356464767575560	25	-29097.41	2030-02-12	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
27	501826605773	104	-85746.84	2027-02-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
28	180077148179815	179	-8259.37	2029-07-23	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
29	3525324666290022	7	-99646.98	2026-12-22	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
30	4557446555737	145	-25100.00	2029-10-24	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
31	30365865289046	58	-13418.71	2029-07-23	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
32	6560122551651517	59	-25148.78	2026-11-14	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
33	4871089103436	154	-78478.33	2026-12-04	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
34	372131229379873	34	-33621.46	2028-06-22	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
35	575796590579	33	-87377.22	2027-04-17	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
36	4952731079404	131	-62709.98	2030-08-12	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
37	30233304685044	34	-41239.75	2027-07-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
38	6011730301028334	45	-68407.66	2028-10-06	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
39	3564498047379936	185	-93778.98	2027-08-31	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
40	4961743077274352359	73	-98732.68	2029-06-03	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
41	4622202226500419688	110	-98947.61	2027-09-13	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
42	676349213741	83	-44375.38	2026-10-10	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
43	6011780879176122	124	-66850.51	2030-01-15	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
44	4330902810284372	80	-23928.96	2029-03-17	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
45	180064999628348	166	-47370.84	2026-10-22	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
46	503865802386	179	-42227.48	2027-08-21	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
47	3586044073476859	68	-85741.79	2029-01-07	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
48	213178897437858	82	-45468.88	2030-06-15	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
49	4337821360123248103	96	-68116.82	2027-11-24	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
50	4854446368405	159	-96703.55	2029-09-05	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
51	342868595179158	127	-40423.16	2029-11-22	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
52	566285238648	9	-82080.72	2028-11-15	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
53	30350173705388	63	-8783.67	2027-06-28	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
54	6522638116509376	25	-9723.31	2027-12-19	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
55	30555237468472	55	-72422.56	2028-11-26	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
56	341781932595336	24	-79525.61	2027-07-27	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
57	343778281551678	26	-7269.23	2027-03-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
58	4701925610415384	119	-353.68	2029-03-29	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
59	4265349381187120182	149	-31390.19	2028-12-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
60	4264674455169115	24	-95555.90	2029-10-19	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
61	376955692068795	176	-88917.12	2029-02-02	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
62	4822557555166219140	186	-23673.76	2028-02-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
63	3583644661208029	40	-20813.59	2027-08-17	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
64	4951940809381534	58	-3129.38	2027-03-01	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
65	30220869521730	172	-7455.48	2030-07-08	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
66	4163373594966244074	179	-75784.89	2029-01-28	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
67	4780021304316362635	50	-79640.95	2029-07-27	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
68	36208198658376	138	-81874.41	2027-07-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
69	213113174807127	140	-12923.42	2027-02-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
70	3510179218552098	129	-67816.85	2027-10-27	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
71	3529436244652915	61	-90923.73	2027-07-09	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
72	373893201825517	87	-25928.52	2028-03-09	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
73	3528645894524908	1	-30902.66	2028-10-05	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
74	38796301527668	72	-76676.49	2030-08-03	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
75	30382573038961	159	-71374.78	2029-04-12	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
76	30036207321728	159	-7442.46	2027-05-30	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
77	4240388751782500	146	-87274.18	2026-12-18	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
78	2221338664885558	134	-27795.93	2030-09-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
79	5234066030240640	124	-791.83	2029-08-01	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
80	676186197445	2	-27394.86	2030-03-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
81	38422889149060	38	-98055.80	2028-12-11	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
82	6570361256822647	15	-46913.29	2028-09-17	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
83	4397088372772	112	-79921.89	2029-11-19	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
84	2715415380759151	53	-95724.02	2027-10-21	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
85	4060760839262605596	141	-42983.96	2027-05-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
86	4961510919399680	57	-36778.30	2029-08-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
87	36204719270429	175	-95511.72	2029-11-26	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
88	4909816034651383	154	-26064.24	2027-01-14	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
89	4898334524120767123	38	-12052.87	2028-01-23	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
90	30109548332603	147	-63368.88	2028-05-23	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
91	30465850054163	181	-68852.13	2030-06-04	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
92	570130086764	163	-47824.07	2027-08-08	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
93	4647355605492445	109	-7118.77	2029-09-21	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
94	4434661545015882	200	-17695.90	2027-06-26	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
95	6596295708005700	150	-74792.11	2030-03-28	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
96	3514737301435335	95	-87084.19	2029-10-05	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
97	4830120690458432076	73	-13146.05	2029-02-12	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
98	180078127182259	173	-96177.09	2026-10-24	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
99	6011241323263404	165	-25424.77	2029-05-13	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
100	30055569054339	128	-15367.40	2029-08-27	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
101	213185269688232	139	-19857.20	2027-01-20	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
102	4568698178443125896	184	-22748.88	2027-01-23	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
103	213172498129824	198	-36894.89	2028-03-12	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
104	2720632595733994	146	-41859.41	2028-05-29	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
105	3505019974940235	163	-19014.37	2027-02-03	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
106	4894155807094	155	-36149.46	2028-07-31	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
107	4716221036670981	181	-18708.99	2029-05-09	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
108	4302886273087653455	141	-19957.89	2026-12-16	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
109	348666233713097	69	-31728.79	2027-01-03	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
110	3548770292842821	96	-68407.51	2027-11-10	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
111	3551197418041902	163	-83712.23	2026-11-26	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
112	5355612448768236	42	-60383.98	2029-04-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
113	4646237233344291404	199	-10235.66	2030-04-14	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
114	4035232290818612540	107	-82429.93	2029-08-03	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
115	3573991248551617	44	-11151.94	2026-12-18	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
116	180083217948072	109	-37316.29	2028-04-12	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
117	3508229213872522	77	-29907.13	2030-01-17	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
118	375460747185299	184	-16658.73	2027-08-13	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
119	4239100852978128885	118	-31354.53	2027-08-04	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
120	4749746139944082	192	-77896.39	2028-01-15	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
121	6011120003835188	153	-89109.86	2027-06-22	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
122	3563552492395234	169	-15846.38	2029-10-29	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
123	2720005949419281	175	-18632.19	2029-10-25	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
124	6011481552309201	70	-79211.92	2029-11-21	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
125	4345343111742136	78	-37764.99	2029-07-09	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
126	4178722369946162	145	-67503.34	2029-09-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
127	4540130847313	74	-63182.19	2027-09-14	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
128	4175012195595729	196	-88830.89	2028-02-20	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
129	180000647547373	196	-32355.37	2030-01-07	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
130	4944284557478464374	159	-39483.15	2030-05-04	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
131	6011738176915733	181	-43922.47	2029-08-19	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
132	2720633614577610	14	-49530.03	2030-04-24	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
133	4083309643349878	141	-47158.05	2029-09-22	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
134	30085583447631	150	-5274.99	2028-11-30	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
135	6545671674046336	120	-742.59	2028-02-18	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
136	6011361999629967	79	-52268.36	2027-06-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
137	341181937055552	119	-86788.33	2028-01-13	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
138	4097116085883806873	62	-41695.01	2030-08-07	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
139	36427683392958	99	-93491.88	2028-12-02	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
140	373247177080468	67	-8289.41	2030-04-17	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
141	347557781924890	99	-26100.48	2029-03-04	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
142	676242313374	150	-43570.36	2027-05-10	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
143	213129501368708	31	-55816.20	2027-08-05	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
144	4347933495797876	4	-59784.40	2028-05-07	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
145	6544573953075914	9	-49083.19	2029-03-07	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
146	4552828588094084	130	-16290.33	2030-04-01	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
147	3593973388089331	5	-11667.70	2028-12-21	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
148	4939708708757824	173	-82361.91	2029-12-06	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
149	639088926931	11	-57307.86	2028-12-18	t	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
150	4317402459902993	52	-5084.19	2028-07-22	f	2025-09-23 17:09:03.950029+07	2025-09-23 17:09:03.950029+07
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.customers (id, brc, cus_name, cus_dob, cus_addr, cus_phone, cus_email, created_at, updated_at) FROM stdin;
1	1	Francis Hester	1971-04-17	0597 Cobb Port\nByrdview, DC 80139	(980)534-8932x056	thomasmichael@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
2	1	Andrew Johnson	1995-04-26	360 Lopez Corner Apt. 630\nDiaztown, SC 45544	001-826-773-9379	umacias@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
3	2	Anthony Cox	2007-01-23	8850 Smith Mountain\nJeffreyside, CO 21586	(592)548-8150x69160	ophillips@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
4	4	Elizabeth Fisher	1955-09-13	54442 Michaela Path Suite 343\nVelasquezport, FL 56921	(811)660-7530	isaac56@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
5	4	Norma Velazquez	1967-01-15	8077 Wells Causeway\nJanettown, TX 81923	4105836586	kharris@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
6	4	Andrew Clay	1968-02-09	612 Erin Estate Apt. 770\nOconnellmouth, VA 03527	345.255.3853x6764	johnwoods@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
7	1	Traci Jones	1981-03-18	80818 Daniel Fork\nNew Joshuaburgh, LA 78468	001-613-560-9688x53422	robert33@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
8	4	Hayley Vasquez	1999-11-01	3570 Sandra Heights\nEast Paulaberg, FL 64142	(766)926-7258x6489	markprice@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
9	4	Tiffany Newton	2005-04-01	Unit 6549 Box 4301\nDPO AE 07959	+1-685-409-8018x996	virginiacooper@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
10	4	Sara Jackson	1998-11-11	19883 Blake Field\nSouth Kevinberg, FL 87633	(847)496-3340	raymonddominguez@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
11	1	Robert Miles	1988-04-29	43052 Charles Trace\nSouth Troyfurt, ME 56723	(995)721-8215	elizabeth38@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
12	4	Amber Garza	1961-06-08	66482 Rivera Prairie Suite 565\nWest Chadton, VA 59818	632.967.2049	alexfloyd@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
13	4	Michael Oconnor	1971-11-18	754 Paul Mountains\nWest Malikburgh, MT 70210	901-287-9647	lauriejackson@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
14	3	James Williams	1977-12-17	8146 Johnson Roads Suite 564\nPort Manuel, NE 38723	001-238-868-5625	brianmyers@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
15	1	Cynthia Gardner	1974-04-25	214 Payne Common Suite 818\nNorth Michael, SC 25659	370-548-5366	bryannoah@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
16	2	Jennifer Bryan	1969-06-30	7843 Anita Burg\nCollinshaven, MP 41920	001-781-369-6332x1560	baldwincrystal@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
17	1	Scott Allen	1994-06-11	8141 Linda Flats Suite 385\nEast Savannah, SD 08405	858.550.2302	danielssarah@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
18	3	Valerie Salas	1979-12-03	6879 Peterson Prairie Suite 165\nKimberlyville, MD 76971	001-746-442-8531x9744	timothy87@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
19	3	Sara Sexton	1974-06-28	0989 Willis Stream Suite 058\nNorth Sheilachester, VT 94440	(623)344-4145	oconnorelizabeth@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
20	4	David Ellison	2006-08-18	2210 Cynthia Landing\nOlsenfurt, NJ 90137	+1-286-368-9208x62126	durhamcathy@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
21	3	Kelly Knight	1965-06-04	2263 Benson Crest\nLawrencemouth, KY 48156	387-732-8439	jennifer88@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
22	3	Kathryn Jones	1990-05-29	5886 Smith Throughway\nPort Luke, OK 87609	001-497-601-5034	johnyates@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
23	1	Glenn Kim	1980-01-30	6144 Brown Estates Suite 798\nPatriciaview, IA 56892	747-818-4265	stonetommy@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
24	1	Richard Vang	1974-06-10	6911 William Island Suite 459\nStanleychester, ID 12627	(514)567-4516x52097	sarahhensley@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
25	3	Jennifer Gray	1985-10-16	48365 Mccall Plaza\nMelissafort, MT 25903	(485)360-1482x179	jennifer00@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
26	4	Ryan Thomas	1954-10-08	6993 Jones Mountain Apt. 899\nWest Rhonda, AZ 64633	+1-441-305-2663x931	karenthompson@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
27	1	Nicole Le	1988-04-14	496 Harvey Fall\nNew Daniel, MT 81453	671-371-0678	abigailcox@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
28	2	Trevor Hernandez	1965-10-26	3948 Robert Skyway\nJoshuatown, OH 84700	001-534-554-9944x13986	carlosstanley@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
29	3	Daniel Thomas	1963-10-14	9209 Robinson Isle Suite 434\nSouth Ericville, GA 33024	(464)332-0335	hgoodwin@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
30	1	Amy Calderon	1997-08-25	755 Sheila Ridges Suite 438\nWest Amandashire, ND 47654	2004961939	janetholland@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
31	2	Kerry Wyatt	1994-10-09	68106 Sharon Dam Suite 814\nLake Vanessa, WA 14153	(752)272-0178	cynthia05@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
32	1	Vanessa Barnes	1977-05-14	Unit 9696 Box 7892\nDPO AA 65475	922-238-7579x3789	megan13@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
33	3	Jennifer Cunningham	1997-05-05	672 Larson Squares\nLake Billyfurt, NJ 13373	391.427.3601	wmack@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
34	4	Thomas Johnson	1991-04-26	196 Williams Prairie Apt. 423\nWest Brandy, ND 75149	(629)778-9315x421	lisaharris@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
35	1	Leslie Vang	1975-12-27	28266 Kristin Camp\nWest Katrinaland, AS 34646	889.448.7173	fisherheather@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
36	2	Mark Shelton	1954-09-24	7285 Brittany Street Suite 973\nAustinfort, MP 85397	001-921-884-0449x50668	christophercamacho@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
37	1	John Watson	1976-01-08	201 Rivera Route\nSouth Ellenchester, WI 46942	598.529.0394x0575	johnandrade@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
38	3	Larry Lawson	1955-11-19	578 Beth Gardens\nNew Heidi, WV 86492	001-460-501-9845x98730	hrich@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
39	4	Jacqueline Campbell	1998-02-03	66214 Nicole Views Suite 795\nRaytown, PA 74201	(740)748-4733	nmartinez@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
40	1	Denise Pruitt	2004-09-26	007 King Groves Suite 655\nWeberstad, WA 79300	+1-454-315-7970	thompsonkent@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
41	4	Robert Cole	1998-06-09	8568 Nicole Crest Suite 511\nWest Christopher, NY 44354	001-319-975-5784x137	michaelcannon@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
42	1	Lisa Hurley	1989-10-22	8838 Michael Islands\nWest Bryan, NY 59920	001-508-387-8957x38712	michaelhardy@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
43	3	James Campbell	1959-01-01	129 Lawrence Turnpike Suite 587\nGutierrezmouth, NE 75741	001-404-295-0199x40554	phillipcamacho@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
44	1	Dawn Richard	1978-05-29	7644 Thomas Track\nGomezville, IN 96384	236.572.9572	brownrebecca@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
45	2	Kelly Fowler	1969-06-29	23324 Welch Centers Apt. 592\nWest Jacob, TN 15981	(635)754-7099	jorge66@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
46	1	Douglas Douglas	1983-10-08	1731 Kyle Locks\nDavenportbury, IA 63511	347-970-3730x19095	gary10@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
47	2	Michael Patel	1974-04-11	939 Wolfe Ridges\nNorth Nancy, GA 75763	956.507.9167	calderonheather@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
48	4	Nicole Green	1997-01-24	1229 Blair Fields\nTrevinoton, MP 69258	588.572.0891	nnunez@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
49	4	Michelle Smith	1994-01-11	6141 Meza Roads\nNorth Mary, AR 80510	946.330.7950	irivera@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
50	2	Jerry Bradford	1986-10-23	19282 Linda Highway Apt. 527\nSouth Amandafort, NM 34254	001-714-655-3510x2315	angelabaldwin@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
51	1	Donald Stewart	1985-10-24	60028 Walker Burg Suite 159\nWest Lesliestad, MD 80763	(248)508-9773x090	jennifercolon@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
52	2	Emily Greene	1964-07-31	7716 Nelson Shores Apt. 328\nEast Matthewtown, PR 27319	+1-689-649-8379x2067	lfields@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
53	4	Andrea Booker	1995-11-13	3905 Hoffman Divide\nLake William, UT 83692	+1-833-534-0359x02977	jennifer54@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
54	1	Caroline Bird	1970-08-08	221 Lyons Ports\nLake Theresa, MT 94590	919.831.9895	mercadodeborah@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
55	2	Jeremy Juarez	1981-02-12	PSC 9712, Box 6781\nAPO AA 47613	(941)446-8400	gilberttara@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
56	4	Mitchell Reyes	1987-04-24	187 Mccarty Wall\nLake Danielleport, NJ 37428	(387)857-6143x630	normanjoshua@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
57	4	Andrew Bradley	1994-05-25	6458 Perry Corner Suite 866\nNew Charlesstad, TN 09006	(734)566-0619x606	denise06@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
58	2	Daniel Johnson	1992-11-16	281 Cole Street Suite 723\nNorth Steven, NM 41137	644.913.4013x5926	kbenson@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
59	1	Dr. Jennifer Allen	1994-08-16	79254 Rice Trail Suite 531\nMyersport, AS 55090	(599)299-0998x031	seanjones@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
60	1	Sarah Roberts	1999-08-05	258 Davis Creek Apt. 332\nSouth Beth, NH 33052	826.442.5049x70393	hannah98@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
61	1	Mary Burke	2003-05-09	23533 Smith Islands Suite 429\nSmithchester, CT 07386	410-607-0118x320	montgomeryjames@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
62	1	Joann Perez MD	1977-01-28	0332 Carter Junction Suite 609\nLake Ryan, WY 68616	568.289.3322	elizabethsparks@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
63	4	Xavier Garcia	1972-02-07	78833 Ashley Loop\nWest Amytown, AZ 88598	001-951-790-3115x4618	samanthadouglas@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
64	4	Mark Hawkins	1969-01-28	1757 Casey Bridge Apt. 495\nRichardborough, AZ 53390	001-954-683-4889x89309	testes@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
65	4	Joe Wilson	1967-06-26	991 Crosby Manor Apt. 799\nLake Saraside, TN 61718	+1-593-736-3066x334	cwhitehead@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
66	2	Katherine Morris	1996-04-27	USCGC Smith\nFPO AE 47229	(389)441-2278	atkinsonjonathan@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
67	4	Deborah Hamilton	1961-08-04	509 Kathleen Groves\nCopelandstad, NC 64431	869.859.7978	meredithashley@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
68	1	Michael Moore	1965-02-07	764 Jimenez Expressway Apt. 157\nRobertborough, GA 06782	(737)687-8336	walshjared@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
69	3	Dustin Jackson	1986-09-02	3903 Morgan Park\nStevenfort, AK 77785	001-321-736-3061x1013	thomaskara@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
70	3	Angela Carpenter	1997-01-24	3520 Edwin Squares\nEast Paulmouth, OK 47961	882.847.9841	rodriguezperry@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
71	1	Tina Carpenter	1977-08-02	198 Jamie Ville\nClintonmouth, PA 94755	743.362.1996	charles68@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
72	4	John Park	1989-07-14	16166 Heather Shore\nSouth Jason, MI 33050	001-852-848-4481	david70@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
73	3	Sarah Turner	1959-04-01	984 Beard Walk\nPort Julie, DE 06985	7533908538	kayla73@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
74	4	Courtney Chen	2001-09-17	8072 Ball Street\nAnthonyfort, MI 95892	713-388-7019x1169	sschmidt@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
75	1	Andrew Cooper	1972-04-13	459 Kristy Road\nWhitefurt, MN 20238	+1-712-860-2576x75884	tranjennifer@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
76	1	Brenda Lee	1974-09-18	89997 Carol Fall\nNataliemouth, WV 18382	944.947.1946x139	halljustin@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
77	4	Gabriela Jones	2004-05-06	20762 Vazquez Prairie Suite 122\nLake Olivia, FM 36595	001-644-430-5154	ruizstephen@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
78	2	Anthony Mendez	1957-08-12	144 Schmidt Green Apt. 880\nMorganfort, RI 62227	3539324184	keith07@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
79	4	Crystal Lewis	1975-07-29	78089 Franco Harbor Suite 653\nSmithfort, WI 71044	+1-540-270-2899	emilyhogan@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
80	2	Sarah Collins	1996-09-14	8398 Barr Ramp\nNorth Alison, CA 90601	001-359-707-6722x172	michelle53@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
81	1	Robert Ibarra	1966-09-06	2657 Theresa Hollow Apt. 464\nLisafort, MT 73132	(868)541-6830x913	erikasanford@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
82	4	Bradley Butler	2002-10-21	3727 Bryant Stravenue Suite 908\nFrenchport, GA 13681	(848)353-4173x65557	leonardrichard@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
83	2	Carl Adams	1960-09-26	4991 Vega Walks\nSaraborough, HI 02453	+1-284-345-0502x82256	zcain@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
84	1	Misty Ritter	2002-02-20	7482 Morris Greens Suite 047\nAnnstad, CT 66280	342-269-4018	leslie59@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
85	2	Raymond Fuller MD	1969-04-17	9610 Hannah Hills Apt. 093\nDonovanmouth, PR 22006	(943)262-4240	gibsonbeverly@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
86	2	Nancy Hale	1961-06-23	7406 Gregory Mission Suite 488\nDaisyville, IN 20383	630.561.4009x867	mcooper@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
87	4	Patricia Henry	1996-04-23	1034 Conrad Common Suite 777\nSouth Brendafort, ME 78188	(580)245-7411x090	johnward@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
88	2	Kirk Martinez	2004-08-12	229 Sandoval Run Apt. 475\nPatriciafort, HI 28977	458-575-4316x81092	mduran@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
89	1	Aaron Shepherd	1963-07-01	43560 Erin Terrace Apt. 191\nSouth Laurashire, NY 96385	971.385.2559x8652	williamsonkevin@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
90	2	Blake Aguilar	1990-08-05	95807 Mercado Summit Apt. 142\nLake Phyllis, AK 39261	971-642-2325x5652	rwillis@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
91	2	Barbara Adams	1982-06-23	2729 Debbie Landing Apt. 452\nSmithfurt, VI 02766	936-985-1313x267	aford@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
92	2	Corey Taylor	1966-10-05	5123 Stevenson Orchard Suite 066\nPort Corey, TN 40672	821.663.3061x40764	ksimmons@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
93	3	Miranda Brown	1964-09-19	370 Lane Fields Suite 430\nPort Danielside, GU 30779	001-730-783-3881x931	coreymolina@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
94	1	Jason Williams	1972-05-13	57187 Brown Causeway\nNorth Matthew, KS 97353	309.567.4404x6352	wandawilliams@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
95	3	John Woods	1990-06-16	041 Hernandez Lakes Apt. 744\nHartmanborough, WY 38555	3773821747	humphreyralph@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
96	2	Angela Miller	1962-12-27	060 Patricia Cape Apt. 408\nSethport, SD 45020	(621)731-7805x1706	karen14@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
97	3	Melissa Sims	1961-07-12	35980 Gonzalez Loop Suite 754\nTaylormouth, ND 34563	001-291-313-6794	ryan13@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
98	3	Michelle Yang	1958-07-16	5186 Mendez Walks Apt. 003\nEast Heatherview, MS 97890	208.830.9237	brendatodd@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
99	4	Christopher Brown	1973-09-24	0908 Kevin Rue\nSouth Stephaniestad, IN 92537	001-641-398-0090x066	stephaniehernandez@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
100	2	Sarah Garcia	2001-03-09	229 Mann Junctions Suite 351\nEast Stephen, AZ 09985	(747)337-3196	dwayne63@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
101	4	Kyle Butler	1996-12-23	4760 Wayne Knolls\nNew Ryan, CA 50826	995-802-8538x16384	priceisaiah@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
102	1	Taylor Fisher	2002-11-05	940 Hill Rapids Apt. 822\nLake Christianport, KY 68413	524-709-1776x483	uromero@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
103	3	Michael Fields	1993-08-18	421 Paul Cove Suite 844\nNew Cherylborough, WI 49011	869-567-1853x50924	rodriguezmary@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
104	1	Crystal Howell	1967-04-07	09184 Cunningham Hill\nWest Justinview, VI 13000	001-946-493-6832x9221	howardmichael@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
105	4	Luis Sanders	1955-09-26	188 Little Overpass Apt. 504\nTaylorshire, AS 34666	(580)537-7915x38489	woodselaine@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
106	3	Laura Lee	1988-04-18	24153 Fox Junctions\nStephenville, WA 11250	964-289-2199	erinroberts@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
107	1	Pamela Jackson	1973-07-14	Unit 4955 Box 1681\nDPO AE 41793	001-696-650-5792x642	mary75@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
108	2	Robert Kelly	1975-10-19	13458 Taylor Valley\nLake Michaelhaven, ND 63948	001-280-963-0265x992	tevans@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
109	1	Karen Gonzalez	1991-01-22	8796 Sandra Port\nCameronberg, ND 97931	529.843.9579x81121	hubernicholas@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
110	1	Linda Nelson	1974-08-01	98247 Johnson Stravenue Apt. 467\nJacobbury, ND 12340	(422)690-8255	susanrodriguez@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
111	3	Tonya Richards	1961-12-20	9311 Brian Lodge\nSouth Bryanborough, SC 33666	972-681-1432x5675	howardjones@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
112	1	Margaret Pacheco	2004-12-17	3380 Williams Rapids\nWilliamsfort, PA 65951	(301)203-3741	lindascott@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
113	1	Laurie Hall	1986-08-06	5614 Henderson Plaza Apt. 731\nHowardtown, NY 78415	252.318.7704	andrewchan@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
114	4	Luis Cruz	1988-08-26	5026 Dougherty Fall Apt. 436\nDavidberg, MH 48468	001-867-341-0796x2695	cbriggs@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
115	3	Brandy Jones	2005-03-16	1638 Bowman Landing Apt. 941\nPort Rodneyport, TX 07685	(654)877-2821x1024	lambrian@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
116	2	Joseph Nelson	1992-09-30	72594 Scott Trail\nPort Douglasborough, MI 06585	899-348-8337x767	clarkamber@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
117	4	Shannon Moore	2004-01-25	410 Brittany Meadow Apt. 803\nPort Tracey, NE 84001	(829)313-1571x0310	pwashington@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
118	4	Natalie Gordon	1956-07-24	154 Harrison Island\nSouth Catherine, PW 52395	231-397-2718x48604	mackenzie99@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
119	1	Nicholas Moore	1962-09-04	452 Turner Mountains Apt. 317\nRiddleton, MN 24925	001-888-518-3999	franklinkevin@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
120	1	Karen Long	1990-06-12	981 Yang Ridge\nNathanielhaven, OR 43610	(860)547-2850x2469	toddjason@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
121	1	Nicholas Long	2002-06-25	91932 Moore Groves Suite 523\nSouth Gina, PW 80889	961-782-0608	campbellholly@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
122	1	Toni Leon	1958-05-31	52365 Jessica Run\nJohnshire, DC 46308	+1-797-943-7033x11370	danielkathryn@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
123	4	James Green	2001-05-13	98245 Dawn Loaf Suite 115\nStanleystad, NV 85433	953.407.7776x47069	trivers@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
124	3	William Lopez	1964-05-16	9911 Carlson Tunnel\nWest Rachelberg, OH 50814	(688)822-0780	jonesdaniel@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
125	4	Jason Nichols	1967-06-13	07575 Amanda Lakes Apt. 008\nJoyceport, HI 07154	001-739-278-4440	pamelajenkins@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
126	1	Brenda Weaver	1984-06-25	2536 Denise Roads\nVargasmouth, IN 31779	+1-392-614-9745x334	sharonwiley@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
127	2	Joseph Anderson	1994-07-04	018 Chen Vista Apt. 077\nLake Sierra, VI 19115	+1-262-605-5044x06882	fpowell@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
128	4	Rhonda Mcdonald	2002-03-24	692 Brandi Loop Apt. 658\nPort Crystalview, WA 13365	+1-982-737-8977x679	cohensusan@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
129	2	Alexandria Carter	2002-03-22	65307 James Center\nDarlenemouth, OH 27139	666.550.2963	jonathan60@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
130	4	Kevin Odonnell	1993-02-14	4207 Gary Stream Suite 691\nHollowayberg, NC 56735	001-245-928-8967	edwardstheresa@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
131	4	Joseph King	2005-06-04	340 Le Light\nEast Amber, IA 78049	(814)563-4806	walkercheryl@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
132	1	Jeremy Gonzales	1991-04-20	30367 Figueroa Squares\nThomasborough, LA 28938	001-325-451-0810x958	stoutmiranda@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
133	2	Robert Munoz	1996-01-20	6925 Katherine Common Apt. 076\nPort Luis, LA 92082	2063357039	garyday@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
134	2	Mrs. Carly Edwards	1998-12-08	92718 Deanna Crossroad\nBrittanyfort, CA 50671	327-960-4826x3289	nicolas69@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
135	1	Nancy Scott	1973-07-12	901 Christina Brooks\nJonathanchester, AK 53875	+1-756-205-8289x023	gordonadam@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
136	2	Alexander Golden	1992-03-26	9676 Amanda Springs\nDennisport, HI 06151	730-310-5958	stephenbush@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
137	4	Hannah Scott	1969-03-19	20824 Pena Street\nPort Calvin, CO 60263	844-754-0297x63535	michael02@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
138	3	Robert Campbell	1983-02-28	36229 Ruben Ferry Apt. 705\nPort Kristinhaven, CO 75450	894-234-2376x846	ariasgloria@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
139	4	Rebecca Lam	1999-12-10	65884 Kristen Ford\nNorth Barbaraside, AL 57362	916-834-6423x60690	brooksnicholas@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
140	4	Michael Spencer	1988-09-14	36221 Wendy Groves\nRodriguezburgh, ID 66337	210-640-6246	aliciareid@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
141	2	Mr. Joshua Mcmahon	1987-01-07	29294 Rodriguez Dam\nAndrewtown, MO 40992	5042090904	reedthomas@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
142	4	Jennifer Perry	1965-08-28	9060 Morgan Summit Apt. 067\nPort Davidville, IA 34926	227-297-6359	xwalters@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
143	3	Desiree Hernandez	1958-10-17	8636 Kelley Circle Apt. 752\nWallsside, NV 14073	+1-306-275-1775x39052	tanderson@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
144	4	Alexander Hernandez	1955-02-03	4892 Daniel Highway\nPort Debra, UT 95329	512-976-6914	rebeccasimpson@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
145	4	John Maxwell	1962-04-16	070 Stanley Bridge Suite 691\nLake Adriennemouth, MD 97331	+1-804-809-7251x157	mblack@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
146	3	Annette Thomas	1959-02-02	1594 Wolf Fields\nCollinsstad, VA 33186	001-958-705-6105x795	francisamy@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
147	4	John Browning	1956-05-07	PSC 2425, Box 0159\nAPO AA 44812	705-991-2346	patrick39@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
148	2	Alice Peterson	1992-12-02	99294 Hernandez Plaza\nBrownville, CT 50412	589-858-8864x2363	adamsjeffrey@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
149	3	Fernando Hammond	1982-02-26	Unit 3014 Box 0267\nDPO AA 39684	+1-486-417-2324x129	qshannon@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
150	3	Regina Patel	1995-08-13	962 Shannon Radial Suite 943\nLake Brian, MI 63233	8156356052	kimberly83@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
151	4	Lindsey Allen	1977-07-26	002 Logan Falls\nOliverstad, MD 04971	(500)939-2661	amy17@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
152	1	Justin Robinson	1960-12-26	USNV Lee\nFPO AP 30968	563.510.2047x110	petersonalexandra@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
153	4	John Wright	1995-11-26	PSC 0468, Box 2001\nAPO AE 08491	485-487-3494	glee@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
154	3	Sarah Page	1970-03-16	5658 Alexis Via Apt. 885\nNorth Lisa, VI 89282	001-998-305-0627x283	stewartjackson@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
155	2	William Sandoval	1985-02-25	4576 Ward Radial\nRogerchester, NC 82052	+1-743-559-6798x842	carterlisa@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
156	2	Paul Cook	2001-11-14	Unit 7756 Box 3467\nDPO AA 73732	2484280847	megan44@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
157	3	Nicholas Hayes	2004-07-03	577 Lewis Radial Suite 122\nWest Stephenmouth, NM 56415	+1-741-652-2016x621	edwardchen@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
158	3	Mathew Sutton	1983-08-31	0307 Aaron Island\nNorth Amandaport, AR 30657	958.985.7150	rodriguezcrystal@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
159	3	Jennifer Rush	1966-06-03	28040 Rodriguez Rue\nAdamsmouth, KY 12671	(619)747-1013	nicholsanita@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
160	2	Nicholas King	1965-08-23	20198 Brittany View\nAnashire, GU 82170	(447)634-5930	martinsean@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
161	1	Laura Briggs	1970-04-30	USNS White\nFPO AP 16834	861.705.9626x251	carrdarrell@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
162	1	Ronald Santiago	2002-03-15	12202 Sheri Key Suite 439\nLyonsmouth, DC 24690	001-915-549-4792x978	bjohnson@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
163	3	Alex Jimenez	1982-04-07	Unit 0051 Box 7420\nDPO AP 87788	946.724.9471x2148	galvanjanet@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
164	2	Jon Wilson	1974-03-14	294 Tammy Bridge Apt. 736\nNew Amy, OH 71171	(289)569-7097	torrescarlos@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
165	4	Scott Schmidt	1978-04-03	0220 Harrison Port Apt. 414\nLisaborough, WY 02405	838.899.7441x364	cassandra33@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
166	2	Angel Johnson	1980-01-15	599 Perkins Passage Apt. 183\nWest Earlmouth, TX 56958	202-420-0894	shaneowens@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
167	1	Brady Smith	1990-01-27	9424 David Islands\nBenjaminland, WA 80949	9745715609	bwilliams@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
168	4	Maria Horton	1958-11-10	39845 Saunders Ridge\nSouth Davidshire, ID 52716	7186826541	sandybeltran@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
169	4	Marissa Lamb	1994-01-24	3405 Carroll Haven\nJohnshire, NV 23264	+1-828-796-9619x05414	jschaefer@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
170	1	Mckenzie Price	2003-07-24	PSC 8093, Box 0599\nAPO AE 90958	001-209-502-8538	aaronmoss@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
171	2	Christine Roberts	1998-05-11	44363 Michael Ridge\nCannonburgh, FL 23422	+1-513-558-4627	gbest@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
172	3	Luke Hansen	1989-12-13	505 Elijah Underpass Suite 117\nJamesfurt, MN 06777	302.961.4264x2295	chadmitchell@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
173	4	Carol Gonzalez	1998-11-28	6991 Jessica Station Suite 328\nPort Jasmine, CA 29426	917.674.0179x69699	jreynolds@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
174	3	Christopher Brown	1961-10-21	1694 Ashley Pike Suite 747\nPort Jacqueline, OH 38447	520.409.9694	felicia26@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
175	1	Kristen Torres	1989-07-03	31256 Jackson Port Suite 671\nCaseyhaven, AR 16546	965.716.4872x92546	wilkinsonkeith@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
176	3	Margaret Whitney	1987-12-07	104 Smith Stravenue\nTurnertown, NC 70483	(627)363-0700	morganwilliams@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
177	2	Julie Holden	1962-07-22	PSC 0485, Box 2085\nAPO AE 58827	887.249.9918	christyvargas@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
178	2	Matthew Johnson	1990-08-10	7295 Holly Crossing\nWest Cody, FL 08169	243.464.3621x0253	kaitlinmills@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
179	2	Alan Thompson	2001-07-08	9868 George Square Apt. 680\nLake Brendachester, KY 51732	465-310-2349x709	marystrickland@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
180	3	Lori Cooper DVM	1978-09-03	944 Lisa Circles\nNashmouth, UT 72725	(795)685-6802x42791	michael32@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
181	1	Cheryl Snow	1973-03-12	2449 Scott Prairie Apt. 184\nChambersview, OR 96280	001-642-999-5517x41085	contrerascorey@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
182	2	Teresa Anderson	1987-09-12	680 Diaz Walks Suite 824\nRachelview, PA 69687	573-820-4764x21496	williamsjustin@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
183	2	Sheri Roberts	1961-05-18	85208 Cole Parkways Apt. 201\nTimothyport, MA 62543	274-517-6128x922	coxmelissa@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
184	1	Carmen Lara	1997-04-05	046 Cummings Plain\nMichaelfurt, NH 18000	+1-430-882-0198x461	stevengillespie@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
185	4	Michael Watson	1996-12-14	5296 Henry Cove\nAndersonhaven, KS 50058	(633)496-9034	brianthompson@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
186	3	Jonathan Ramos	1960-08-28	USCGC Long\nFPO AP 47998	490-312-4403	garzadavid@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
187	4	Jesse Taylor	2000-10-05	67083 John Lights Apt. 577\nWest Dianeton, AR 99667	395.338.6884x59359	melissa46@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
188	1	Michaela Ellis	1964-06-20	190 Strickland Camp Apt. 092\nLucasborough, FM 36946	001-274-979-2500x550	ronald51@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
189	1	Ryan Larson	1977-05-30	96912 Sheri Street\nNathanchester, MA 52343	5632847931	lmorris@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
190	4	Debra Gonzales	1987-05-20	8551 Yu Oval Apt. 932\nWest Joshuaport, ME 73803	+1-201-673-8997	erica52@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
191	2	Daniel Brown	1989-05-18	6091 Miller Ford Suite 637\nWest Julie, DE 72875	001-219-751-4814x9616	wwood@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
192	2	Shelley Powell	1992-05-15	921 Powers Turnpike\nNorth Steven, NY 04978	+1-389-444-6717x828	susan35@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
193	3	Joseph Kelly	2006-02-28	44147 Jeremy Summit Suite 988\nNorth Margaretport, AS 57247	344.312.2773	mcdonaldkelly@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
194	1	Cynthia Jones	1957-03-27	29527 Marsh Plain\nPort Jacob, MO 01289	626.742.7674	gregorypollard@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
195	2	Anthony Melton	2006-01-24	136 Fischer Islands\nMaxwellborough, FM 31314	(503)355-8116x83923	edwardhubbard@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
196	1	Alexander Peterson	1978-09-18	0134 Smith Port Suite 176\nHernandezchester, HI 95065	511-338-8832	dmorgan@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
197	4	Carl Lewis	1970-04-19	0398 Hunter Forks Suite 674\nEast Michealbury, AK 13990	001-517-757-7503x811	willisjonathon@example.com	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
198	2	John Salas	1979-10-23	195 Glass Point\nNorth Tammyburgh, AR 56101	920-718-8924	joneshaley@example.net	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
199	4	Melissa Rivera	1960-08-29	7556 Emily Crossing\nSouth Carl, KS 71642	592-425-2036	paulashort@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
200	1	Kirsten Garrett	1980-12-14	995 Charles Trace Suite 284\nNorth Krystal, DC 32653	4855659311	yesenia85@example.org	2025-09-23 17:09:03.819167+07	2025-09-23 17:09:03.819167+07
\.


--
-- Data for Name: deposit_types; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.deposit_types (id, de_type, de_des, created_at, updated_at) FROM stdin;
1	Personal Loan	Unsecured loan offered to individuals for personal expenses like travel, education, or emergencies.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
2	Home Loan	Loan given to purchase, construct, or renovate a residential property.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
3	Auto Loan	Loan provided to purchase new or used vehicles, usually secured by the vehicle itself.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
4	Education Loan	Loan designed to cover tuition fees, books, and other study-related expenses.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
5	Business Loan	Loan given to entrepreneurs or companies to meet business capital needs.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
6	Gold Loan	Secured loan where gold jewelry is pledged as collateral.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
7	Mortgage Loan	Long-term loan secured against real estate, often used for large financing needs.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
8	Overdraft Facility	Credit facility allowing account holders to withdraw more than their balance.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
9	Credit Card Loan	Short-term loan linked to a credit card, with interest charged on outstanding balance.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
10	Agricultural Loan	Loan provided to farmers for agricultural activities like seeds, equipment, or irrigation.	2025-09-23 17:09:03.817024+07	2025-09-23 17:09:03.817024+07
\.


--
-- Data for Name: deposits; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.deposits (id, cus_id, de_id, de_type_id, bal, tem, interest, de_st_dt, de_en_dt, created_at, updated_at) FROM stdin;
1	165	PD609256121905408	3	18757.44	1M	3.9000	2025-08-03	2028-08-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
2	33	PD649551413034775	7	11013.12	3M	4.2000	2025-03-16	2031-03-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
3	153	PD534686814533551	5	28681.73	9M	5.0000	2025-08-01	2029-08-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
4	179	PD914601912720279	4	8267.70	6M	3.6000	2025-05-31	2032-05-31	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
5	36	PD229561792422906	6	27146.91	1M	7.6000	2024-10-27	2030-10-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
6	172	PD341311760401700	9	47185.04	3M	5.9000	2025-01-18	2031-01-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
7	14	PD272863118440266	3	12898.26	3M	7.8000	2024-10-21	2028-10-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
8	99	PD609089360637224	8	16949.79	12M	4.6000	2025-05-03	2028-05-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
9	195	PD261039791984589	4	19638.45	1M	6.8000	2025-01-06	2026-01-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
10	131	PD765526375460900	5	49919.41	6M	7.7000	2025-08-30	2031-08-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
11	100	PD379741013462756	6	43353.83	1M	4.0000	2025-06-24	2030-06-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
12	3	PD467505095218808	1	46920.06	12M	6.3000	2024-12-19	2031-12-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
13	28	PD591075025419689	9	11419.07	6M	3.6000	2025-05-14	2034-05-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
14	115	PD687986839581770	6	36667.53	1M	4.7000	2024-12-01	2032-12-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
15	80	PD537909106114150	8	32574.65	9M	6.3000	2024-12-14	2027-12-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
16	188	PD510323063018148	7	23714.11	9M	3.4000	2025-05-13	2033-05-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
17	128	PD728467351872090	8	40090.68	1M	3.9000	2025-06-03	2028-06-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
18	164	PD094785146051746	4	32155.35	6M	7.4000	2025-03-23	2030-03-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
19	148	PD487937117704360	9	21756.51	12M	7.6000	2025-07-27	2026-07-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
20	80	PD622334030118415	8	33121.12	12M	6.1000	2024-12-07	2032-12-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
21	197	PD358557249233836	5	5814.84	12M	6.5000	2025-06-14	2027-06-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
22	184	PD696244531694484	8	28382.62	12M	7.1000	2024-10-31	2025-10-31	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
23	64	PD630565849732320	6	141.21	3M	5.7000	2025-02-06	2035-02-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
24	82	PD196994046463656	6	30332.80	6M	3.4000	2025-05-27	2027-05-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
25	194	PD477710315216472	5	29860.48	1M	5.6000	2025-05-24	2030-05-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
26	26	PD590354295525502	4	9967.34	12M	6.2000	2025-04-17	2026-04-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
27	99	PD578419921609035	2	9066.66	3M	6.3000	2025-05-18	2035-05-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
28	46	PD725244186102951	9	16330.22	9M	3.8000	2025-06-21	2027-06-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
29	23	PD650296484595564	3	41651.56	3M	3.9000	2025-01-23	2032-01-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
30	55	PD965485685752504	1	31928.83	12M	7.5000	2025-09-07	2034-09-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
31	62	PD979467460031941	8	45978.96	1M	4.9000	2025-01-21	2027-01-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
32	129	PD693612257218875	4	37691.71	3M	5.9000	2025-02-17	2029-02-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
33	95	PD582327752829632	2	24439.70	12M	7.8000	2025-06-06	2028-06-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
34	132	PD715744345336127	2	32189.61	3M	6.2000	2025-09-21	2034-09-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
35	50	PD480147486005163	2	28813.36	1M	8.0000	2024-11-21	2031-11-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
36	7	PD225215150205790	4	29280.26	12M	3.4000	2024-10-01	2032-10-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
37	70	PD577297035421245	2	15624.24	12M	5.6000	2025-09-16	2028-09-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
38	124	PD432168913595099	10	29101.06	1M	7.1000	2025-09-20	2034-09-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
39	116	PD036266910294293	7	3546.64	3M	4.4000	2025-03-05	2029-03-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
40	142	PD908854734778946	1	40509.85	1M	5.7000	2025-06-03	2032-06-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
41	8	PD165370129364802	3	34214.95	9M	7.9000	2024-12-07	2031-12-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
42	73	PD450014922253149	2	27167.63	9M	6.2000	2025-07-22	2032-07-22	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
43	69	PD713278380595424	9	28479.26	12M	5.6000	2025-03-04	2026-03-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
44	127	PD579600021714611	5	22037.63	1M	4.1000	2024-12-20	2033-12-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
45	183	PD518858097075460	4	2165.13	3M	7.5000	2025-07-08	2030-07-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
46	182	PD311612834234478	4	44530.29	3M	6.8000	2025-01-20	2030-01-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
47	117	PD040683462108396	4	47224.43	6M	4.4000	2025-03-12	2034-03-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
48	168	PD255374106032107	2	10331.67	6M	5.3000	2025-02-12	2030-02-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
49	127	PD321085561358334	1	42158.50	6M	4.3000	2025-04-04	2032-04-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
50	98	PD615693795527934	5	17773.83	3M	7.3000	2024-12-29	2033-12-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
51	125	PD591163793223447	7	20120.28	1M	3.7000	2025-04-12	2035-04-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
52	69	PD873658937525671	3	3566.71	9M	5.2000	2025-06-28	2035-06-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
53	184	PD358263381870365	1	15002.12	6M	3.7000	2024-11-17	2030-11-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
54	111	PD296630078793499	3	30988.72	12M	7.7000	2025-03-03	2027-03-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
55	91	PD310567086508806	6	41480.48	9M	6.4000	2024-10-10	2027-10-10	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
56	44	PD102707250782606	2	48957.61	1M	7.6000	2025-08-26	2029-08-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
57	197	PD601913218129686	2	25832.64	3M	7.1000	2025-08-18	2029-08-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
58	65	PD542931389283777	1	31611.14	12M	4.5000	2025-01-12	2032-01-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
59	181	PD536972565325546	10	17266.38	9M	8.0000	2025-05-04	2034-05-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
60	90	PD655559515924803	4	35000.75	1M	7.1000	2025-01-27	2028-01-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
61	68	PD197792624246778	8	40056.27	9M	5.7000	2025-05-30	2033-05-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
62	31	PD179975548975238	2	31040.00	6M	4.7000	2025-08-07	2034-08-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
63	157	PD501354031284363	2	587.13	9M	3.0000	2025-02-27	2035-02-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
64	127	PD789259548666606	10	7786.14	1M	4.0000	2025-04-30	2026-04-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
65	37	PD480553828729578	10	39028.42	9M	4.4000	2024-10-14	2026-10-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
66	121	PD300129597653458	4	40627.46	3M	4.6000	2024-12-14	2032-12-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
67	117	PD038858299983618	6	21101.00	1M	3.1000	2024-11-05	2029-11-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
68	61	PD065988803442732	2	14774.46	3M	7.5000	2025-05-29	2028-05-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
69	181	PD028374985022309	6	23639.22	12M	3.8000	2024-12-08	2026-12-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
70	114	PD269676954701745	5	22300.91	9M	5.2000	2025-02-14	2026-02-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
71	153	PD240950275579542	6	48114.09	1M	4.0000	2024-09-25	2027-09-25	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
72	181	PD281416310685564	3	10875.74	12M	3.3000	2025-05-02	2026-05-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
73	76	PD139280295532498	5	45368.33	3M	7.2000	2025-09-18	2026-09-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
74	7	PD850785010013054	10	15540.27	1M	6.1000	2025-03-12	2026-03-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
75	71	PD631775196857428	9	28275.72	1M	6.0000	2025-08-28	2031-08-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
76	170	PD177315375342617	4	41197.74	12M	3.8000	2025-02-15	2029-02-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
77	115	PD291344864905726	3	35299.61	1M	6.4000	2024-10-13	2031-10-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
78	69	PD664671369591279	9	49478.57	1M	5.6000	2024-12-07	2027-12-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
79	195	PD609504383875637	5	14478.39	3M	7.6000	2025-08-22	2027-08-22	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
80	94	PD927633173158195	7	41842.75	3M	6.5000	2025-01-27	2034-01-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
81	66	PD058778052986492	8	9638.67	6M	3.6000	2025-08-04	2027-08-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
82	131	PD854451822698857	6	18151.82	6M	4.4000	2025-03-25	2035-03-25	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
83	107	PD277408035038662	3	3873.59	12M	4.6000	2024-10-26	2030-10-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
84	38	PD225201817511814	2	38105.96	9M	3.0000	2025-06-05	2028-06-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
85	89	PD681076441449938	9	25676.81	12M	3.8000	2025-04-22	2033-04-22	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
86	96	PD779551401204199	9	34963.15	6M	4.0000	2025-02-19	2031-02-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
87	12	PD677944993216071	8	15382.47	9M	6.3000	2025-09-04	2026-09-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
88	18	PD751665074693011	1	42044.42	12M	3.7000	2025-06-15	2029-06-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
89	71	PD387255188580657	8	31392.92	12M	4.9000	2025-01-31	2035-01-31	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
90	37	PD409674849117326	5	27052.28	12M	4.5000	2024-10-02	2025-10-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
91	123	PD865696086662619	1	49085.66	3M	3.2000	2025-06-09	2031-06-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
92	60	PD156598388665653	9	28564.80	3M	6.6000	2025-07-19	2028-07-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
93	83	PD177048797387316	10	41498.03	9M	6.8000	2025-06-21	2026-06-21	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
94	143	PD433886715747518	10	26669.56	9M	6.9000	2024-11-07	2030-11-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
95	56	PD084674393897937	1	28355.47	9M	6.0000	2025-07-12	2035-07-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
96	20	PD087918117537205	4	41701.44	9M	5.6000	2025-08-07	2033-08-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
97	193	PD825297303182970	7	38527.35	3M	6.9000	2025-05-11	2030-05-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
98	4	PD162158588906177	7	20252.36	9M	6.7000	2025-07-02	2030-07-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
99	178	PD686315731693068	8	22746.16	6M	7.7000	2025-08-15	2027-08-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
100	9	PD526060778352759	6	32777.67	9M	7.4000	2025-05-16	2033-05-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
101	78	PD990266067812544	2	34697.99	12M	6.4000	2024-11-26	2027-11-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
102	137	PD349136787676305	7	44984.09	12M	6.2000	2024-10-08	2032-10-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
103	67	PD314932442162498	7	8435.05	3M	6.5000	2025-05-26	2027-05-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
104	51	PD998380366673146	5	18889.31	9M	6.8000	2025-04-04	2032-04-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
105	36	PD225596049412554	8	45574.37	6M	4.8000	2025-05-24	2028-05-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
106	180	PD700513058811503	3	40602.07	1M	7.2000	2025-01-06	2028-01-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
107	182	PD130567211686531	5	47547.36	6M	6.3000	2025-04-29	2030-04-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
108	78	PD021354655029415	2	29069.51	3M	7.0000	2025-07-02	2030-07-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
109	120	PD972067220987510	3	12407.16	3M	7.9000	2025-05-16	2030-05-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
110	66	PD532657874027739	7	49633.26	3M	6.6000	2024-10-01	2032-10-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
111	156	PD551994331235058	7	41974.08	9M	6.7000	2024-10-05	2026-10-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
112	145	PD450057169666731	2	29095.10	3M	7.6000	2025-08-28	2034-08-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
113	188	PD448754371008904	9	22524.46	3M	6.3000	2024-11-19	2034-11-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
114	4	PD885985214059914	4	22779.57	12M	6.1000	2024-11-25	2028-11-25	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
115	157	PD629011388972451	5	5947.35	3M	7.5000	2025-02-12	2035-02-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
116	103	PD298533276908542	5	11950.57	12M	4.3000	2025-04-11	2031-04-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
117	28	PD628200873835796	1	33195.32	3M	5.1000	2024-10-26	2032-10-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
118	198	PD530550675020174	7	42175.30	12M	7.5000	2025-08-14	2029-08-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
119	52	PD130494801452161	10	6846.80	1M	3.1000	2024-10-27	2028-10-27	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
120	66	PD469118632517582	1	11604.80	9M	3.2000	2025-01-12	2027-01-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
121	131	PD048009866403657	8	13811.06	3M	4.3000	2025-01-01	2034-01-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
122	20	PD372019451185684	6	33380.60	6M	7.1000	2025-02-20	2034-02-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
123	149	PD153008794305087	4	43088.78	6M	5.2000	2025-05-14	2028-05-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
124	23	PD757570281832866	4	20475.74	1M	7.5000	2024-12-29	2033-12-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
125	69	PD962471986343030	5	14046.77	1M	7.5000	2025-06-10	2029-06-10	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
126	4	PD176275250062931	8	43325.62	9M	3.3000	2025-02-23	2033-02-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
127	187	PD888928619059589	6	47482.49	9M	6.5000	2025-08-05	2035-08-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
128	142	PD185360762097443	10	7988.20	9M	4.2000	2024-12-08	2025-12-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
129	103	PD388316257228574	3	32861.90	9M	3.2000	2025-01-23	2031-01-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
130	59	PD409653229739056	5	9224.04	9M	4.6000	2025-09-06	2027-09-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
131	72	PD695722511555682	7	17142.65	9M	5.1000	2025-02-26	2031-02-26	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
132	69	PD870877567816699	4	40078.01	12M	3.1000	2024-10-04	2032-10-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
133	70	PD554544532007449	4	27753.00	9M	6.5000	2025-03-28	2033-03-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
134	48	PD691302991377980	1	11401.04	9M	4.0000	2025-03-13	2034-03-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
135	57	PD976618348486421	9	12500.97	3M	5.2000	2024-09-23	2033-09-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
136	90	PD627051862589238	4	11933.83	12M	3.8000	2025-09-02	2026-09-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
137	29	PD963715147467156	7	19336.52	1M	6.8000	2025-08-30	2030-08-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
138	64	PD808034012476467	6	5761.29	12M	5.7000	2025-03-09	2029-03-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
139	148	PD829154151227782	7	43854.10	1M	4.9000	2025-01-17	2032-01-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
140	131	PD898673068553739	3	21134.56	1M	7.6000	2025-09-08	2031-09-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
141	150	PD128834953351658	4	27596.67	9M	3.1000	2025-02-20	2035-02-20	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
142	104	PD486850512991396	1	17956.99	1M	7.4000	2024-10-11	2031-10-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
143	150	PD002656321445811	3	25925.97	6M	5.6000	2025-06-18	2033-06-18	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
144	179	PD892800898670277	4	24726.02	6M	3.1000	2025-08-17	2032-08-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
145	3	PD240613247483576	5	28088.36	3M	4.4000	2025-09-16	2028-09-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
146	190	PD698832512899905	10	36275.83	1M	6.2000	2025-09-08	2032-09-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
147	162	PD861657690239738	7	22381.80	6M	5.4000	2024-11-11	2029-11-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
148	180	PD907659107101734	5	43757.52	9M	5.2000	2024-11-19	2034-11-19	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
149	61	PD921493633996779	1	30962.75	12M	7.5000	2025-06-30	2029-06-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
150	45	PD329398151921836	10	10283.51	3M	6.1000	2024-11-03	2033-11-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
151	84	PD154283928167380	8	42162.83	6M	3.2000	2025-02-28	2026-02-28	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
152	63	PD510683096656686	7	28080.56	6M	3.6000	2025-04-07	2033-04-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
153	124	PD159589741417484	1	10810.01	12M	5.7000	2025-01-22	2026-01-22	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
154	58	PD593413921109972	2	32075.02	12M	3.3000	2024-11-16	2025-11-16	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
155	50	PD457325052767607	6	3213.37	12M	7.1000	2024-09-30	2029-09-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
156	101	PD381665508560816	10	18794.60	3M	3.7000	2025-07-09	2033-07-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
157	2	PD748674329148947	2	39867.14	9M	7.7000	2025-01-06	2030-01-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
158	41	PD754602855145101	10	44979.67	9M	5.0000	2025-04-13	2035-04-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
159	11	PD419210333563263	10	32989.69	1M	7.2000	2025-09-05	2031-09-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
160	19	PD712041265337091	1	7705.24	1M	6.7000	2025-04-02	2035-04-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
161	193	PD643207473269606	8	32743.64	12M	6.7000	2025-04-12	2026-04-12	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
162	51	PD301364078920926	7	5906.62	12M	3.1000	2025-08-24	2029-08-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
163	118	PD407814694760362	4	15794.32	9M	6.4000	2025-01-09	2030-01-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
164	20	PD790064761866223	2	12314.35	1M	3.5000	2025-04-29	2033-04-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
165	73	PD134336387203818	10	2168.01	1M	4.6000	2024-12-30	2026-12-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
166	113	PD652840497504172	7	42695.86	1M	4.4000	2025-09-08	2030-09-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
167	3	PD442025428535325	1	9381.79	9M	7.3000	2025-02-02	2028-02-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
168	146	PD926189560387733	4	46321.36	3M	4.3000	2024-10-11	2029-10-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
169	109	PD257159486502021	7	11888.28	6M	3.8000	2025-08-08	2027-08-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
170	155	PD727590827881302	7	17074.04	12M	3.7000	2024-11-15	2032-11-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
171	172	PD368818346024714	2	37230.24	6M	3.3000	2025-04-04	2030-04-04	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
172	32	PD490682698606135	1	5900.64	6M	3.9000	2025-06-07	2027-06-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
173	52	PD575823276522277	4	1588.56	6M	5.1000	2025-04-30	2032-04-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
174	68	PD734286211942842	8	19170.14	3M	6.4000	2025-08-10	2032-08-10	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
175	176	PD885617681455660	3	34566.28	12M	5.4000	2025-04-02	2027-04-02	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
176	154	PD199272539033358	2	21431.52	3M	4.6000	2025-04-13	2027-04-13	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
177	38	PD843228252471235	7	12857.16	9M	7.0000	2024-12-15	2034-12-15	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
178	47	PD838257811449609	9	32950.58	1M	4.3000	2025-04-17	2030-04-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
179	7	PD070055500042483	5	21885.99	3M	5.5000	2025-07-05	2034-07-05	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
180	114	PD396078123145633	9	31537.48	3M	3.7000	2024-10-07	2026-10-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
181	191	PD975578037480778	7	40933.83	6M	7.5000	2024-10-06	2030-10-06	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
182	35	PD795529384927609	5	42392.46	1M	6.0000	2025-04-07	2032-04-07	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
183	125	PD302927748666395	9	39590.50	6M	4.7000	2025-05-14	2034-05-14	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
184	194	PD120663204723044	7	33732.74	12M	7.7000	2025-05-11	2033-05-11	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
185	122	PD048576420837416	2	20394.03	6M	4.5000	2024-11-24	2033-11-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
186	143	PD807553534467441	8	6314.10	9M	6.6000	2025-06-24	2026-06-24	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
187	49	PD274719785915636	6	41969.67	1M	6.4000	2025-02-01	2028-02-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
188	42	PD488152645451828	6	268.82	9M	5.6000	2024-12-01	2033-12-01	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
189	28	PD093281037785497	4	4379.57	1M	7.8000	2025-01-29	2031-01-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
190	179	PD965612489630614	6	49971.67	1M	5.3000	2025-03-03	2028-03-03	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
191	132	PD979296296648031	10	31200.90	9M	7.6000	2025-05-31	2031-05-31	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
192	20	PD573050104985354	10	49969.14	9M	5.7000	2025-07-23	2028-07-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
193	22	PD694730814558910	4	36332.33	1M	5.6000	2025-02-08	2030-02-08	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
194	174	PD156552333431269	6	37943.54	9M	5.9000	2025-03-09	2034-03-09	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
195	26	PD794254880954647	1	5366.92	6M	3.7000	2024-09-29	2033-09-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
196	42	PD503966205423811	6	3765.81	1M	3.1000	2025-03-17	2034-03-17	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
197	28	PD209911221474873	4	47645.75	3M	3.2000	2025-06-29	2035-06-29	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
198	158	PD561162656649234	6	3213.89	3M	6.5000	2025-08-30	2026-08-30	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
199	6	PD318740083749901	5	43258.42	6M	4.5000	2025-07-25	2029-07-25	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
200	3	PD113608492641356	4	35690.86	1M	5.7000	2025-05-23	2035-05-23	2025-09-23 17:09:03.983854+07	2025-09-23 17:09:03.983854+07
\.


--
-- Data for Name: loan_types; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.loan_types (id, ln_type, ln_des, created_at, updated_at) FROM stdin;
1	Personal Loan	Unsecured loan offered to individuals for personal expenses like travel, education, or emergencies.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
2	Home Loan	Loan given to purchase, construct, or renovate a residential property.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
3	Auto Loan	Loan provided to purchase new or used vehicles, usually secured by the vehicle itself.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
4	Education Loan	Loan designed to cover tuition fees, books, and other study-related expenses.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
5	Business Loan	Loan given to entrepreneurs or companies to meet business capital needs.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
6	Gold Loan	Secured loan where gold jewelry is pledged as collateral.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
7	Mortgage Loan	Long-term loan secured against real estate, often used for large financing needs.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
8	Overdraft Facility	Credit facility allowing account holders to withdraw more than their balance.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
9	Credit Card Loan	Short-term loan linked to a credit card, with interest charged on outstanding balance.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
10	Agricultural Loan	Loan provided to farmers for agricultural activities like seeds, equipment, or irrigation.	2025-09-23 17:09:03.814051+07	2025-09-23 17:09:03.814051+07
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.loans (id, cus_id, ln_id, ln_type_id, bal, pmt_term, interest, ln_st_dt, ln_en_dt, created_at, updated_at) FROM stdin;
1	18	LD145314212923852	10	-23319.11	12M	9.6000	2023-11-06	2030-11-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
2	81	LD487663520818681	1	-29281.38	6M	6.6000	2024-10-03	2026-10-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
3	183	LD368252720639848	9	-43526.60	12M	9.6000	2025-09-11	2032-09-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
4	174	LD324940452297919	7	-18678.64	12M	10.0000	2025-07-31	2026-07-31	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
5	76	LD083116506831124	8	-19739.70	6M	2.3000	2025-02-04	2029-02-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
6	94	LD453050917803866	3	-3149.91	9M	6.1000	2024-01-25	2029-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
7	21	LD289560082909339	7	-8130.16	3M	9.6000	2025-08-21	2029-08-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
8	189	LD465488368786854	8	-28550.52	6M	2.5000	2024-11-24	2025-11-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
9	106	LD815494736469094	10	-20305.73	6M	3.5000	2024-11-02	2025-11-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
10	198	LD032390546235431	10	-26274.01	12M	7.6000	2024-03-03	2034-03-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
11	63	LD067180591274944	8	-43147.36	1M	4.0000	2023-11-05	2026-11-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
12	28	LD278920882940922	3	-40452.98	6M	9.0000	2024-06-07	2034-06-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
13	70	LD122204487049002	6	-35710.94	1M	3.9000	2023-12-27	2027-12-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
14	150	LD006616586984943	3	-45399.49	1M	7.1000	2023-12-23	2029-12-23	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
15	198	LD537477441630776	7	-17035.74	1M	6.3000	2024-08-18	2026-08-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
16	111	LD247967780511262	6	-33319.69	12M	1.5000	2024-09-07	2034-09-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
17	42	LD097735726830138	7	-49007.19	9M	3.0000	2024-05-18	2034-05-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
18	15	LD436001572175010	8	-12947.97	9M	7.8000	2025-07-04	2035-07-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
19	59	LD205422140929247	9	-33083.23	12M	6.6000	2024-01-17	2027-01-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
20	52	LD096633559370361	9	-34066.69	3M	2.5000	2024-01-08	2029-01-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
21	112	LD089780182344269	5	-12368.71	6M	1.2000	2023-11-29	2029-11-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
22	24	LD889680014180640	8	-7399.61	12M	2.6000	2024-09-05	2027-09-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
23	52	LD000535523819063	6	-35008.38	9M	6.4000	2023-11-06	2029-11-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
24	80	LD392956305707775	7	-35185.78	6M	3.8000	2024-05-06	2031-05-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
25	10	LD604379073309184	4	-14929.19	3M	0.4000	2023-11-03	2024-11-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
26	43	LD162272608305598	5	-43487.09	3M	7.9000	2024-01-24	2030-01-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
27	200	LD171615552223473	5	-10291.56	3M	5.6000	2025-07-20	2035-07-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
28	138	LD336430118162965	7	-22819.89	6M	0.1000	2024-03-27	2028-03-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
29	71	LD365472961969826	7	-23209.70	12M	5.6000	2024-05-02	2028-05-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
30	200	LD618444840391467	1	-24215.09	1M	2.4000	2024-08-01	2026-08-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
31	42	LD501413748373104	5	-20146.51	1M	9.1000	2024-02-02	2025-02-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
32	188	LD336750982026845	8	-37020.51	9M	9.2000	2023-10-09	2024-10-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
33	128	LD146570059992174	7	-8913.03	1M	9.0000	2025-07-02	2030-07-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
34	116	LD347528021501652	6	-25379.90	3M	5.9000	2025-08-01	2028-08-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
35	120	LD945416042108600	8	-35317.87	1M	4.4000	2024-04-08	2034-04-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
36	103	LD990683519374763	3	-17268.67	1M	7.6000	2023-11-27	2027-11-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
37	165	LD194839074929365	1	-33418.34	3M	4.2000	2024-01-09	2025-01-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
38	52	LD539362075729936	8	-49590.03	3M	9.2000	2025-03-21	2028-03-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
39	18	LD146588337967330	10	-14273.53	12M	0.2000	2024-11-21	2026-11-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
40	14	LD600461278338733	2	-42527.48	9M	4.3000	2024-11-21	2031-11-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
41	45	LD919847438409112	4	-18700.90	3M	2.9000	2024-10-29	2030-10-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
42	140	LD504465226839931	10	-48549.13	1M	7.6000	2025-02-05	2032-02-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
43	173	LD881116440598051	5	-9974.95	1M	9.8000	2024-07-11	2033-07-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
44	108	LD408545145460569	1	-1076.17	3M	7.4000	2024-07-11	2030-07-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
45	96	LD118250234688815	9	-23257.14	12M	4.3000	2024-12-11	2029-12-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
46	68	LD274115641348521	6	-35635.14	1M	1.0000	2025-08-28	2035-08-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
47	177	LD055091536748671	6	-40713.06	12M	9.8000	2024-06-27	2033-06-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
48	61	LD565961141443421	10	-24448.00	6M	8.4000	2023-09-24	2031-09-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
49	4	LD670494986797057	2	-30127.18	9M	4.0000	2024-11-20	2027-11-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
50	11	LD515317026193732	6	-39921.71	3M	8.3000	2025-06-04	2026-06-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
51	168	LD168476026737069	2	-28585.17	12M	6.9000	2025-04-16	2026-04-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
52	101	LD185429262230884	6	-18267.80	1M	8.3000	2024-05-11	2027-05-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
53	62	LD879976807751312	4	-36949.88	12M	2.2000	2025-03-21	2027-03-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
54	69	LD718484109664589	2	-23120.86	1M	1.5000	2024-11-07	2026-11-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
55	132	LD280510403739641	6	-45787.05	1M	0.8000	2024-12-02	2029-12-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
56	88	LD388289554230603	10	-39108.82	12M	9.6000	2024-09-12	2030-09-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
57	185	LD661230181317288	7	-33399.43	12M	1.8000	2024-01-25	2028-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
58	69	LD457368617256008	8	-33507.90	12M	4.8000	2023-11-14	2025-11-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
59	133	LD056925817774084	4	-23936.91	3M	2.9000	2025-07-03	2035-07-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
60	147	LD243507031153001	2	-32827.31	9M	1.8000	2025-03-02	2031-03-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
61	16	LD951586766579204	3	-42806.97	6M	3.6000	2024-05-12	2030-05-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
62	100	LD900816536434962	1	-5209.79	6M	7.5000	2024-12-28	2026-12-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
63	184	LD555916979879274	2	-25995.43	9M	8.5000	2025-04-21	2026-04-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
64	156	LD095040624984272	6	-25982.95	6M	9.6000	2024-03-10	2026-03-10	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
65	19	LD440356953198913	4	-40641.73	6M	4.8000	2025-08-17	2032-08-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
66	72	LD531345848544451	2	-8910.68	1M	5.7000	2024-09-30	2029-09-30	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
67	121	LD726361912386720	8	-47057.95	9M	4.8000	2024-02-13	2034-02-13	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
68	50	LD623389662372793	1	-30672.09	1M	0.7000	2025-08-12	2026-08-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
69	168	LD666608550795516	6	-41037.13	12M	4.6000	2024-01-10	2028-01-10	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
70	180	LD343125591202372	1	-16949.80	12M	7.9000	2025-05-29	2030-05-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
71	158	LD170591520795090	4	-8497.87	1M	6.6000	2023-12-15	2024-12-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
72	23	LD742820756035380	1	-37983.37	1M	6.8000	2024-03-07	2027-03-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
73	71	LD948589397381734	7	-32164.84	6M	5.6000	2024-11-11	2030-11-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
74	127	LD321946251583229	10	-9582.32	3M	9.3000	2024-02-25	2026-02-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
75	170	LD148421702333832	8	-8163.50	12M	2.9000	2023-11-26	2028-11-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
76	83	LD113241503837578	5	-47947.93	3M	3.9000	2024-05-08	2028-05-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
77	143	LD931340474419961	5	-6013.65	9M	5.3000	2025-06-01	2032-06-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
78	51	LD281503537541968	9	-37301.83	3M	8.1000	2025-03-09	2030-03-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
79	44	LD912173255661225	4	-21256.26	6M	7.9000	2025-05-26	2032-05-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
80	120	LD867529609337970	9	-42572.40	6M	0.5000	2025-09-02	2032-09-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
81	59	LD001943639471876	1	-47393.77	12M	8.1000	2023-10-06	2031-10-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
82	96	LD893421384873793	3	-14372.21	9M	8.1000	2025-07-16	2030-07-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
83	81	LD911189075048366	4	-6105.89	3M	8.1000	2024-02-10	2031-02-10	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
84	107	LD229245967355360	1	-23063.73	6M	7.5000	2024-07-05	2033-07-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
85	155	LD811273817859047	2	-2343.96	6M	2.0000	2023-10-03	2024-10-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
86	180	LD038039679172594	9	-43293.56	3M	2.4000	2024-10-05	2030-10-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
87	146	LD828721255301067	3	-37044.95	1M	3.9000	2025-06-04	2034-06-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
88	98	LD450713542692954	5	-27487.59	9M	0.8000	2025-02-18	2032-02-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
89	52	LD285193329837987	5	-2727.11	3M	6.3000	2023-12-11	2032-12-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
90	86	LD343171887405451	2	-28066.45	3M	7.2000	2023-11-10	2030-11-10	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
91	173	LD477884445283682	2	-30541.37	3M	8.1000	2025-06-24	2028-06-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
92	196	LD194776517130206	8	-27759.17	1M	5.1000	2025-05-06	2035-05-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
93	109	LD582404425835594	10	-15331.15	6M	3.3000	2024-09-17	2030-09-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
94	28	LD546267789399746	7	-3968.17	9M	0.1000	2025-05-14	2032-05-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
95	173	LD512422497946451	10	-28189.14	9M	4.9000	2024-11-26	2031-11-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
96	133	LD753623353983559	8	-31589.50	3M	6.4000	2025-06-22	2032-06-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
97	112	LD071015946764832	7	-14421.88	6M	8.1000	2025-02-07	2027-02-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
98	107	LD068212588899991	3	-40249.63	9M	3.9000	2024-11-20	2026-11-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
99	137	LD108216021569570	3	-926.83	1M	7.7000	2025-04-09	2027-04-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
100	170	LD565750752578882	2	-21476.98	9M	6.4000	2024-09-20	2033-09-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
101	155	LD401826134645408	5	-18481.17	3M	9.0000	2023-12-04	2032-12-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
102	138	LD077344483307793	1	-19815.65	1M	5.5000	2024-11-28	2030-11-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
103	167	LD656052775768326	9	-44243.03	1M	4.5000	2025-08-30	2034-08-30	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
104	108	LD644613254918569	3	-39745.24	9M	3.1000	2024-05-09	2032-05-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
105	162	LD481646433932959	2	-47510.80	3M	2.2000	2023-11-05	2030-11-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
106	164	LD001295972271265	9	-18370.82	6M	5.1000	2023-12-08	2032-12-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
107	117	LD950995193757578	1	-3505.82	12M	8.4000	2025-05-02	2027-05-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
108	15	LD200893430254124	7	-34420.81	1M	0.7000	2024-01-25	2031-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
109	158	LD595137928392440	8	-8228.93	3M	5.6000	2025-09-14	2027-09-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
110	140	LD727555501271084	6	-1267.92	6M	7.2000	2024-01-09	2025-01-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
111	180	LD499672989624851	6	-37695.59	6M	5.6000	2025-01-02	2032-01-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
112	8	LD967556291126868	9	-25789.99	9M	8.0000	2024-04-12	2028-04-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
113	78	LD988656828298970	6	-1418.31	9M	7.2000	2025-01-13	2028-01-13	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
114	162	LD422991259979304	4	-47884.96	9M	5.7000	2025-05-18	2034-05-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
115	75	LD315583401978250	7	-45365.19	3M	0.1000	2025-08-04	2031-08-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
116	188	LD852055266819800	7	-23748.25	9M	8.7000	2025-04-20	2027-04-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
117	77	LD532975454421780	1	-10285.35	6M	6.8000	2024-06-08	2031-06-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
118	86	LD178373196770892	5	-20931.35	12M	4.2000	2024-05-12	2033-05-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
119	140	LD812440053398711	9	-4132.62	3M	9.2000	2024-12-12	2030-12-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
120	159	LD417530115349847	2	-23524.16	3M	2.5000	2025-05-04	2033-05-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
121	110	LD400023209019694	5	-32958.48	9M	0.2000	2024-10-26	2032-10-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
122	30	LD179108331341910	9	-32363.09	9M	1.5000	2024-11-24	2030-11-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
123	13	LD095272407654916	10	-35023.54	9M	0.6000	2023-11-30	2024-11-30	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
124	80	LD299014978952129	2	-34484.14	12M	8.0000	2024-06-06	2031-06-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
125	106	LD585702850280766	9	-11065.46	1M	3.0000	2024-02-27	2034-02-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
126	43	LD879149879207673	1	-1675.17	12M	2.9000	2024-07-22	2034-07-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
127	47	LD304485856225781	10	-27540.92	9M	0.5000	2024-08-12	2033-08-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
128	193	LD924760672653081	10	-42787.45	6M	2.2000	2024-07-09	2034-07-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
129	81	LD104504134085245	8	-10667.91	12M	8.4000	2025-03-04	2027-03-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
130	48	LD730302957613736	3	-48869.26	6M	7.1000	2025-04-04	2032-04-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
131	76	LD940594606398821	6	-15698.41	9M	6.7000	2024-12-28	2032-12-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
132	143	LD188024946785313	10	-23213.31	1M	3.3000	2024-02-04	2027-02-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
133	80	LD679547947692844	8	-37107.74	9M	7.9000	2024-08-18	2028-08-18	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
134	43	LD181742641323248	4	-26419.71	6M	4.0000	2024-11-26	2026-11-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
135	51	LD406510962476626	4	-2236.38	6M	3.2000	2025-02-15	2032-02-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
136	19	LD197438001917643	7	-34712.33	12M	3.7000	2023-10-09	2033-10-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
137	168	LD556007055341801	1	-46840.04	12M	3.3000	2025-05-22	2033-05-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
138	155	LD381133964969678	5	-5678.64	3M	6.9000	2025-07-04	2030-07-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
139	82	LD514105103283279	4	-10220.10	12M	2.1000	2025-01-05	2034-01-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
140	3	LD692410264106285	9	-49363.71	9M	1.1000	2025-07-23	2031-07-23	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
141	135	LD034548362402151	3	-9710.27	9M	9.1000	2023-11-04	2031-11-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
142	188	LD690149211376398	2	-30819.77	6M	0.6000	2024-06-17	2034-06-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
143	142	LD650014162169618	9	-20989.13	12M	2.6000	2025-07-14	2033-07-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
144	117	LD406863054499711	3	-32953.57	3M	6.9000	2025-03-25	2032-03-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
145	200	LD794564558587649	10	-48674.90	6M	8.3000	2024-03-29	2033-03-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
146	6	LD833027506351301	4	-20676.50	12M	6.2000	2025-05-19	2031-05-19	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
147	130	LD137165398916033	8	-16226.05	6M	7.8000	2024-07-16	2025-07-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
148	176	LD316278521638355	4	-25108.04	1M	0.3000	2025-07-16	2033-07-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
149	168	LD016590594921530	1	-30578.18	6M	8.1000	2024-10-06	2029-10-06	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
150	164	LD731483760836811	4	-22064.95	6M	3.7000	2023-11-02	2029-11-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
151	4	LD816248128004231	3	-17765.62	6M	6.7000	2024-07-02	2026-07-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
152	148	LD190017322067125	3	-12625.26	12M	0.9000	2025-07-20	2033-07-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
153	179	LD223571608041536	7	-16090.33	6M	1.0000	2025-06-19	2026-06-19	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
154	181	LD418226368622913	9	-37547.30	3M	1.4000	2023-12-04	2029-12-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
155	9	LD266894442603180	5	-4262.00	12M	8.0000	2024-03-29	2033-03-29	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
156	189	LD214951145590531	9	-9058.82	9M	0.7000	2024-04-27	2026-04-27	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
157	44	LD357213743310735	5	-3763.15	6M	0.7000	2024-03-25	2025-03-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
158	17	LD237534158011242	8	-31848.68	6M	7.8000	2023-10-20	2027-10-20	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
159	49	LD302660904301566	10	-9866.09	3M	4.1000	2025-07-08	2027-07-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
160	77	LD194541084292956	7	-37645.57	12M	7.1000	2024-10-16	2033-10-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
161	121	LD577999148849296	10	-885.12	9M	1.9000	2025-09-01	2032-09-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
162	143	LD476079079743373	5	-25192.02	1M	8.3000	2024-12-11	2033-12-11	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
163	38	LD328173694376275	1	-31352.94	1M	4.7000	2024-02-07	2031-02-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
164	153	LD405483121718349	9	-41656.31	6M	3.8000	2024-02-14	2028-02-14	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
165	28	LD437542689773259	3	-23012.71	3M	2.3000	2025-07-21	2032-07-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
166	66	LD036220583477750	1	-32815.63	9M	9.9000	2024-07-04	2027-07-04	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
167	169	LD819628150055865	7	-44772.07	1M	5.3000	2024-08-16	2025-08-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
168	34	LD360093831015338	7	-25302.18	12M	3.4000	2025-02-17	2034-02-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
169	33	LD330236785986404	4	-8921.58	6M	4.5000	2024-09-25	2032-09-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
170	73	LD824657142438233	10	-47247.90	12M	3.8000	2025-06-12	2034-06-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
171	120	LD034905299442037	8	-44562.48	12M	8.7000	2024-01-15	2030-01-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
172	121	LD339233064432356	5	-27490.56	9M	7.3000	2025-04-26	2030-04-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
173	90	LD873739328875371	6	-3892.22	12M	6.2000	2025-02-05	2032-02-05	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
174	185	LD745009199973667	3	-26716.13	9M	1.0000	2023-12-16	2025-12-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
175	60	LD693754509377947	4	-33853.88	3M	9.3000	2024-01-24	2027-01-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
176	11	LD500230023634021	9	-20493.94	3M	7.4000	2023-09-26	2029-09-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
177	123	LD735270337161357	10	-13683.70	12M	6.3000	2025-01-25	2032-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
178	162	LD672231164480007	8	-23753.15	12M	8.4000	2023-12-09	2026-12-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
179	95	LD604746559853886	10	-47490.73	6M	7.1000	2025-06-28	2028-06-28	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
180	100	LD887697953463320	8	-5169.66	3M	3.8000	2024-01-25	2029-01-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
181	161	LD496879622304177	4	-28305.37	1M	0.7000	2024-04-22	2028-04-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
182	22	LD266044282781493	4	-6173.81	9M	0.7000	2025-09-15	2033-09-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
183	49	LD483595627348758	1	-37783.89	1M	3.0000	2024-08-22	2031-08-22	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
184	15	LD873392430852598	3	-32666.33	12M	8.7000	2024-05-15	2028-05-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
185	96	LD429494452557044	3	-32838.18	1M	8.6000	2024-01-24	2025-01-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
186	198	LD730896633019010	3	-27726.12	1M	0.5000	2024-02-09	2028-02-09	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
187	155	LD771480512623935	6	-38651.51	12M	1.1000	2025-09-03	2034-09-03	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
188	35	LD858056064336402	10	-40678.94	3M	2.1000	2025-02-07	2032-02-07	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
189	36	LD720951467823164	6	-48838.27	3M	4.0000	2024-04-26	2028-04-26	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
190	55	LD958612274590026	2	-23282.42	9M	1.1000	2025-06-15	2033-06-15	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
191	28	LD997146585707356	1	-41358.37	12M	1.7000	2024-11-24	2033-11-24	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
192	185	LD078803015035909	8	-2311.02	3M	9.3000	2023-11-12	2028-11-12	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
193	82	LD928681354466939	10	-7861.38	1M	9.0000	2024-05-21	2028-05-21	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
194	66	LD639039239556429	2	-9695.88	6M	10.0000	2024-08-08	2033-08-08	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
195	154	LD901709492762226	5	-28576.14	9M	3.1000	2023-09-25	2032-09-25	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
196	167	LD863528941140326	10	-40887.60	3M	4.5000	2025-01-02	2031-01-02	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
197	197	LD330717875280878	9	-16464.75	3M	1.0000	2024-04-01	2031-04-01	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
198	6	LD500850551657413	1	-13727.46	12M	5.2000	2025-09-16	2032-09-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
199	149	LD676759005435634	2	-9078.69	12M	9.3000	2023-10-17	2027-10-17	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
200	186	LD118784027894443	4	-15439.53	3M	6.8000	2024-07-16	2027-07-16	2025-09-23 17:09:03.963736+07	2025-09-23 17:09:03.963736+07
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: phamdinhkhanh
--

COPY public.transactions (id, acc_id, tran_amt, tran_dt, created_at, updated_at) FROM stdin;
1	20	-3805.06	2021-02-03 12:07:34.950597+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
2	159	455.68	2024-06-04 12:44:13.979481+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
3	117	3395.75	2022-09-25 00:44:40.548274+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
4	3	-885.30	2024-05-01 06:11:52.281085+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
5	143	-3127.68	2025-05-17 07:34:15.325124+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
6	118	4659.77	2023-10-16 09:43:34.151561+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
7	273	2506.07	2025-02-15 19:27:56.705882+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
8	129	953.59	2024-01-11 04:24:45.267099+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
9	243	3635.04	2025-06-08 11:37:43.331973+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
10	200	-4008.23	2022-06-09 17:56:09.710562+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
11	49	1349.10	2021-08-19 16:58:57.393095+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
12	139	-1284.31	2021-06-20 15:29:17.726547+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
13	41	-1437.93	2025-01-19 16:39:13.51212+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
14	75	3472.55	2022-03-01 10:11:37.939738+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
15	278	3886.23	2021-12-14 10:16:20.293205+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
16	238	1369.60	2024-10-10 03:30:34.849037+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
17	98	4138.30	2025-02-20 06:35:42.739955+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
18	47	430.90	2020-12-01 14:33:34.155666+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
19	140	-4914.31	2023-12-05 05:03:15.920181+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
20	291	898.55	2023-05-14 10:39:23.853644+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
21	113	-1565.28	2024-03-30 14:44:09.052642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
22	53	3993.53	2021-11-22 05:15:32.399273+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
23	90	1887.58	2024-11-21 03:45:13.106555+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
24	65	-2275.27	2024-02-01 08:06:26.60366+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
25	283	-1345.79	2024-05-16 20:48:14.263161+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
26	227	-1974.52	2022-02-23 09:16:55.377046+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
27	273	4323.77	2023-12-28 11:43:12.134144+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
28	239	-4548.91	2022-06-18 08:16:03.883188+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
29	263	701.47	2020-12-17 05:39:50.425062+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
30	244	-2942.26	2023-10-07 07:45:13.701654+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
31	198	-1732.49	2024-09-03 08:29:24.389319+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
32	239	-4326.21	2023-02-24 05:02:28.314753+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
33	220	1677.06	2025-06-22 09:07:39.116956+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
34	141	4591.79	2025-05-07 00:44:24.362599+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
35	150	4296.88	2022-07-28 18:39:43.962377+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
36	181	3666.74	2024-02-24 06:23:48.602065+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
37	54	-349.47	2024-05-14 16:30:27.684973+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
38	15	3890.37	2021-03-29 17:16:51.439386+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
39	202	-2884.64	2021-05-23 10:54:28.461868+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
40	179	-4929.09	2022-07-03 19:04:06.377104+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
41	185	2668.74	2023-04-05 01:50:27.400774+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
42	152	4899.07	2022-05-14 13:53:58.634969+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
43	149	849.46	2020-10-21 15:30:33.166858+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
44	174	-1934.00	2022-01-18 05:04:54.770175+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
45	183	-31.86	2022-11-04 12:56:32.788622+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
46	260	2941.18	2021-11-18 04:04:04.542636+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
47	83	-3206.32	2022-12-12 00:53:31.415087+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
48	282	1256.77	2021-07-12 23:04:59.468973+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
49	54	3783.15	2024-05-04 03:18:43.175911+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
50	271	-3849.86	2024-08-22 22:22:04.226282+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
51	149	-345.17	2024-05-10 04:57:50.096441+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
52	252	4715.69	2024-12-28 09:24:38.173114+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
53	278	4317.57	2020-12-04 00:02:42.410312+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
54	288	3909.10	2023-01-26 21:29:15.433919+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
55	123	-1684.83	2023-01-16 14:59:55.181783+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
56	234	-153.24	2025-07-07 05:28:54.081595+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
57	81	3347.84	2023-01-15 22:05:10.874448+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
58	40	-2562.05	2023-08-25 23:56:40.62412+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
59	179	-1350.85	2021-08-02 20:17:56.476492+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
60	274	-3059.32	2023-05-10 14:38:03.81472+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
61	116	2372.86	2022-11-17 18:59:43.685429+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
62	99	3388.04	2024-04-21 17:50:56.337449+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
63	264	-3365.91	2023-05-15 20:04:24.489467+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
64	50	1998.77	2021-04-02 11:40:19.541076+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
65	43	2165.41	2022-01-29 02:57:31.47885+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
66	98	-3312.26	2024-04-13 20:06:58.219866+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
67	200	-875.24	2024-05-13 07:46:14.660119+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
68	260	-1892.54	2021-06-16 23:49:45.871708+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
69	4	-1776.73	2022-07-26 15:05:54.948073+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
70	145	-2516.45	2024-10-15 14:51:16.415512+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
71	80	1930.48	2022-02-20 10:56:55.648427+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
72	109	-2086.22	2025-05-19 18:48:25.432982+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
73	37	-681.13	2022-01-23 18:08:45.931504+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
74	65	1000.07	2022-02-13 11:08:57.936541+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
75	240	921.44	2023-07-23 19:06:18.446361+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
76	12	1190.05	2023-09-20 20:55:41.596704+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
77	286	1989.45	2023-06-21 19:33:01.37589+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
78	214	3695.35	2024-10-02 16:58:22.627987+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
79	238	-4946.30	2021-08-31 00:38:43.723908+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
80	101	924.69	2021-04-09 14:01:55.936851+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
81	130	-1079.17	2023-07-25 08:24:33.770455+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
82	91	-3024.83	2023-06-30 22:33:20.985595+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
83	67	2198.50	2021-04-04 12:16:53.009414+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
84	27	1597.25	2022-03-22 18:31:27.007079+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
85	120	3552.15	2021-07-19 16:28:34.068642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
86	221	2255.91	2023-07-06 00:56:36.079911+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
87	87	-3686.22	2022-02-10 02:00:45.330132+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
88	220	2974.28	2021-05-28 02:55:55.332144+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
89	45	-4616.37	2023-11-18 04:01:57.651551+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
90	52	-2961.69	2021-11-19 06:26:09.367474+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
91	232	375.53	2024-03-15 04:01:52.334958+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
92	183	-4545.73	2023-06-04 16:34:04.207073+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
93	138	-3101.46	2024-09-17 10:51:52.591647+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
94	11	-4847.89	2023-05-21 22:10:33.630339+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
95	169	-2201.61	2024-10-26 12:01:43.379472+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
96	275	3067.07	2022-02-19 18:39:09.137963+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
97	206	4795.12	2021-02-06 13:54:50.996912+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
98	289	-3525.08	2023-04-25 03:29:50.222692+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
99	257	-2453.99	2022-10-25 17:50:09.881338+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
100	177	-3303.51	2024-06-13 07:55:12.612023+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
101	163	1974.02	2021-09-14 09:16:07.820518+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
102	142	-1938.85	2021-06-04 06:18:25.057101+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
103	90	938.17	2022-08-05 13:16:14.056232+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
104	116	-592.00	2022-02-13 20:15:31.767428+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
105	144	2371.72	2022-03-10 03:15:14.335705+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
106	23	778.28	2022-01-03 21:50:58.211095+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
107	1	1895.45	2025-06-12 22:21:27.713684+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
108	46	3815.71	2025-08-15 19:49:27.357173+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
109	34	578.08	2022-08-04 18:18:41.172436+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
110	133	-2826.08	2025-08-10 09:57:05.547606+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
111	151	-1729.65	2022-05-24 22:53:02.821716+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
112	99	3538.18	2021-05-07 13:36:50.409314+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
113	83	-533.17	2024-08-22 06:20:29.981295+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
114	174	267.14	2024-06-02 20:18:43.905938+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
115	2	856.87	2024-02-16 08:09:51.264102+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
116	273	-1728.70	2021-08-07 13:47:28.544594+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
117	140	-2520.69	2023-01-06 09:49:19.337624+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
118	169	-2046.44	2020-10-09 02:27:54.185302+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
119	106	-4083.81	2022-05-04 01:02:08.64058+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
120	225	-881.77	2022-04-08 01:08:26.021975+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
121	144	-4913.71	2021-12-21 07:57:28.931855+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
122	134	2449.18	2024-02-09 13:44:03.871518+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
123	138	3317.10	2021-04-04 13:09:30.363812+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
124	135	4071.18	2022-10-12 05:10:51.957694+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
125	288	2074.81	2021-09-28 03:47:41.158188+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
126	35	-3696.63	2025-03-29 23:03:42.137618+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
127	222	2963.74	2020-10-21 02:32:54.190803+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
128	94	-1743.23	2022-07-16 10:32:28.656096+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
129	95	4379.57	2023-03-19 05:53:13.794528+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
130	44	4989.20	2023-08-03 08:18:04.620108+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
131	223	282.34	2024-11-30 23:33:41.58776+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
132	222	2731.23	2024-02-22 00:54:19.411131+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
133	75	4085.70	2023-12-20 17:41:43.361533+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
134	252	4706.90	2021-07-21 05:40:48.884979+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
135	176	1759.40	2024-01-05 14:28:30.506881+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
136	38	377.90	2020-11-02 01:22:38.433364+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
137	294	-1770.87	2021-12-22 09:54:49.414966+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
138	96	3258.41	2023-11-15 21:14:41.948881+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
139	83	-298.57	2022-04-25 17:48:29.201849+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
140	281	-3324.40	2025-08-03 23:29:05.809144+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
141	279	1651.55	2023-11-20 16:20:42.175908+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
142	38	4058.64	2023-06-11 16:31:43.642171+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
143	211	-3034.54	2023-02-01 22:28:42.442979+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
144	295	2733.46	2024-10-30 22:41:06.731556+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
145	188	-4738.45	2022-04-04 07:01:52.191072+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
146	160	-761.12	2024-06-19 13:15:38.799899+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
147	170	-1646.16	2021-10-20 10:07:45.654628+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
148	224	-958.16	2023-07-02 05:37:02.553017+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
149	70	-2705.20	2022-10-23 04:53:29.763843+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
150	170	3427.38	2021-05-14 13:46:03.230784+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
151	138	2541.43	2022-12-29 03:28:05.198543+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
152	237	3730.06	2024-05-20 02:14:08.937269+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
153	73	-3040.61	2022-10-28 11:51:06.056075+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
154	286	4294.47	2023-11-24 08:29:02.67344+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
155	13	-4096.87	2021-11-28 08:44:43.954029+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
156	12	-1922.30	2022-07-29 02:01:05.622511+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
157	158	-2137.94	2024-10-29 01:44:11.053886+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
158	127	-1290.03	2021-05-16 22:47:21.610205+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
159	266	2568.49	2025-05-13 00:06:38.584893+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
160	278	1033.83	2024-09-27 23:21:13.780192+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
161	130	-2303.60	2025-09-06 16:02:39.512078+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
162	292	77.22	2024-06-14 08:24:44.817647+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
163	92	-3773.57	2021-01-12 04:50:35.648523+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
164	129	1651.41	2021-12-26 00:58:13.034105+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
165	209	-2630.29	2023-11-05 11:51:01.582587+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
166	293	-744.62	2022-12-31 11:51:32.335447+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
167	10	-3414.03	2024-11-18 07:36:26.992192+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
168	176	-3834.03	2024-07-08 11:02:45.792511+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
169	170	-3404.99	2023-01-10 12:06:00.91428+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
170	171	134.84	2025-05-22 16:16:03.51568+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
171	237	-3734.61	2022-07-03 07:41:04.654465+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
172	40	-889.43	2024-02-23 06:12:26.420525+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
173	185	-488.26	2021-03-31 00:00:43.487081+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
174	55	-1956.52	2021-04-19 15:39:33.002208+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
175	212	-2668.30	2022-12-05 21:08:55.530966+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
176	5	-2512.27	2022-02-06 02:08:32.895486+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
177	227	1251.25	2024-09-29 05:55:32.302339+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
178	111	3897.42	2023-02-09 22:43:18.646724+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
179	77	1762.16	2023-11-22 21:46:07.937075+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
180	149	2980.81	2024-04-23 18:57:55.949761+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
181	191	-4736.84	2022-07-25 05:18:58.853378+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
182	55	-1272.89	2022-08-22 01:06:45.363683+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
183	244	3077.96	2023-09-07 06:46:03.637159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
184	192	-2498.97	2021-10-24 01:42:27.025494+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
185	245	3426.99	2024-11-21 14:05:56.220778+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
186	292	363.80	2025-06-11 09:39:47.409109+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
187	86	-760.70	2025-06-15 22:46:28.396872+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
188	1	3789.86	2021-03-01 05:44:23.663717+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
189	164	-3181.33	2024-08-01 08:54:04.794749+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
190	245	-733.84	2025-01-17 09:11:11.950266+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
191	119	2825.14	2025-08-12 20:47:34.299698+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
192	4	4815.94	2024-06-17 04:46:59.531167+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
193	168	-473.81	2024-01-30 01:02:51.380927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
194	237	-622.32	2022-09-13 18:41:56.201047+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
195	284	4711.63	2022-02-19 11:03:22.800526+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
196	83	-1447.89	2021-02-15 16:51:15.436635+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
197	41	4216.98	2024-08-08 16:53:46.572547+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
198	123	-1161.35	2024-12-18 12:30:51.329405+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
199	78	-4056.95	2024-04-01 20:16:27.448027+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
200	44	-796.75	2021-02-05 16:05:15.613307+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
201	3	-3789.13	2024-01-16 17:11:58.307935+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
202	243	529.71	2020-09-28 04:06:52.943496+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
203	28	-4476.58	2022-02-05 04:04:06.372688+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
204	268	1310.53	2024-01-28 09:52:42.081038+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
205	239	4327.05	2024-08-23 05:10:59.260384+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
206	85	-3340.05	2024-08-19 06:48:01.577587+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
207	114	2461.22	2021-09-03 17:30:45.534961+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
208	33	-143.07	2025-07-01 14:30:50.833108+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
209	54	3809.71	2024-12-21 11:08:49.033624+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
210	188	-1767.78	2024-09-05 20:20:51.762879+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
211	120	-4603.13	2024-11-12 10:39:03.888095+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
212	20	-1577.78	2021-10-05 16:50:25.261683+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
213	146	883.29	2024-07-01 16:44:40.215949+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
214	97	320.88	2021-04-02 16:45:33.381116+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
215	215	2618.39	2021-03-29 05:43:10.982156+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
216	217	1578.73	2021-07-28 07:47:07.22011+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
217	40	-3021.19	2020-10-14 04:56:57.678269+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
218	7	-1444.15	2025-04-29 03:39:00.62296+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
219	212	1077.16	2020-10-21 19:26:36.361872+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
220	292	-379.07	2022-01-17 00:16:45.371841+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
221	43	2197.52	2022-09-24 04:49:00.168059+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
222	2	-3543.37	2022-02-16 21:49:33.451168+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
223	9	4475.85	2021-08-11 05:35:28.709673+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
224	283	2365.61	2024-03-27 01:54:06.525486+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
225	283	-119.85	2023-10-10 02:45:37.760529+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
226	22	-4286.89	2024-07-05 03:26:06.399991+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
227	19	4868.67	2024-06-12 12:16:54.635267+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
228	275	3204.25	2022-08-06 07:41:51.134251+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
229	196	2324.02	2025-02-07 12:32:59.501513+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
230	104	-3823.53	2024-10-16 06:06:42.99163+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
231	294	3128.83	2022-06-09 00:46:03.730614+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
232	196	2448.90	2023-03-26 12:01:35.51139+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
233	144	-4488.70	2022-08-23 20:37:14.365839+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
234	149	-4504.86	2023-03-22 12:30:52.008611+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
235	235	3492.54	2024-06-06 01:43:20.226569+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
236	176	-1376.28	2023-08-21 22:24:28.353867+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
237	36	4705.14	2023-05-14 17:08:02.059954+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
238	18	-2233.18	2021-01-13 07:49:21.001832+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
239	199	1974.07	2022-03-04 13:02:55.751231+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
240	121	1202.51	2021-06-17 10:08:22.125794+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
241	210	-487.14	2021-07-25 20:07:15.679656+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
242	69	4053.89	2022-02-23 06:08:41.903853+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
243	27	-1253.16	2023-08-25 00:15:14.910046+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
244	234	1816.38	2021-11-03 23:19:15.069825+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
245	236	-1958.83	2022-05-30 23:09:35.725625+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
246	271	2270.06	2022-08-31 01:11:04.139034+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
247	18	-3149.56	2023-11-21 18:32:14.490845+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
248	116	1147.02	2023-02-12 10:44:59.026652+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
249	143	-168.68	2024-11-19 22:20:59.93245+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
250	190	-4133.00	2024-03-02 06:09:07.55689+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
251	83	-3592.41	2021-11-26 08:29:39.491554+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
252	137	3917.22	2023-07-22 23:04:55.199157+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
253	79	4279.69	2024-08-20 16:59:12.909109+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
254	15	2101.08	2024-12-14 20:01:20.812658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
255	217	-2326.32	2023-03-22 14:43:18.055969+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
256	150	2507.60	2024-06-17 19:22:33.684068+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
257	245	-3034.30	2024-07-17 18:10:50.335478+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
258	62	-2586.82	2024-05-28 16:29:05.590056+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
259	171	-1762.66	2021-05-19 14:08:15.148346+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
260	171	-3474.64	2022-10-23 07:39:25.086451+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
261	133	3634.49	2022-11-15 02:24:11.34714+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
262	29	4325.17	2023-05-13 06:36:14.813877+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
263	237	-4703.26	2022-02-26 18:33:59.131995+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
264	64	-3287.58	2021-08-04 04:59:29.852804+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
265	281	-2694.68	2021-07-10 03:16:50.559646+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
266	262	-4224.28	2022-05-29 11:19:59.209066+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
267	232	2235.56	2021-11-06 13:58:31.01354+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
268	126	806.04	2023-08-14 12:57:38.007949+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
269	30	1418.56	2021-10-13 03:20:46.658761+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
270	293	3995.58	2025-05-16 09:54:00.674734+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
271	299	-3768.68	2021-12-27 08:50:34.601761+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
272	255	-2386.23	2024-04-20 19:26:13.751507+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
273	240	395.68	2024-09-27 23:18:28.35788+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
274	165	4128.44	2023-11-26 11:35:03.076822+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
275	131	62.49	2022-04-26 09:35:05.16313+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
276	224	678.54	2023-09-16 10:06:35.742974+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
277	294	1897.56	2023-03-09 16:30:04.27066+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
278	22	-252.71	2025-08-02 09:55:00.561254+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
279	75	1737.36	2023-11-23 01:42:59.712238+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
280	74	4107.46	2021-10-08 07:38:49.491908+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
281	80	-3170.09	2024-09-14 02:05:28.608642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
282	270	-334.71	2023-11-18 19:31:46.150152+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
283	35	4175.16	2025-09-16 06:06:27.507286+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
284	212	4258.32	2023-09-19 09:50:06.859891+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
285	145	-56.45	2025-01-31 03:55:24.60372+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
286	23	-2893.28	2022-02-28 07:24:38.818136+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
287	139	3851.35	2021-07-06 17:34:46.073204+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
288	34	1437.08	2022-10-26 18:28:46.89607+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
289	275	3594.07	2022-05-22 01:24:27.569875+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
290	277	1756.31	2022-08-28 01:38:52.276362+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
291	284	-2558.52	2022-09-22 05:13:20.559212+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
292	264	-707.22	2022-10-13 03:03:27.771498+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
293	3	2135.16	2022-03-13 16:23:03.869472+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
294	283	456.05	2022-08-13 02:40:26.927191+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
295	154	1539.50	2021-03-28 19:46:30.819799+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
296	235	1359.90	2023-09-22 08:21:17.719674+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
297	267	-3587.34	2021-04-22 14:26:04.132922+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
298	168	967.97	2025-04-23 13:31:23.291984+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
299	274	2133.26	2022-02-15 17:29:03.217552+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
300	182	-4622.61	2021-02-07 21:34:55.789552+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
301	49	4121.10	2022-07-28 07:35:34.859813+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
302	105	3961.21	2025-08-15 01:49:50.486314+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
303	73	-4229.44	2022-04-29 14:43:39.32633+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
304	110	-1565.19	2023-09-03 01:03:27.444839+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
305	105	-4447.52	2021-12-30 21:59:19.58643+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
306	67	-4838.76	2021-05-27 22:38:37.921121+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
307	128	4459.74	2022-10-02 06:12:42.890509+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
308	210	-1222.36	2022-11-11 09:27:49.218793+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
309	281	2609.55	2023-06-10 18:15:28.884159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
310	275	2650.21	2022-06-21 05:17:29.92159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
311	241	-1686.01	2025-07-01 13:24:42.783342+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
312	186	1108.35	2020-12-21 08:51:38.469846+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
313	62	3876.09	2022-09-20 01:31:29.866927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
314	90	1576.91	2025-01-24 21:07:49.883501+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
315	102	1029.21	2021-07-03 11:33:05.078473+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
316	6	3896.83	2021-02-13 04:13:33.656343+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
317	147	3585.43	2023-01-05 12:37:34.097603+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
318	237	1099.59	2021-12-18 05:34:50.609074+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
319	266	-260.78	2025-02-27 17:36:06.536249+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
320	18	4236.02	2024-10-19 15:30:50.042897+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
321	141	3599.77	2024-04-23 05:16:57.909102+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
322	161	-1261.86	2022-08-11 23:49:47.450893+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
323	148	-4432.42	2024-09-02 15:01:59.099425+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
324	121	2661.27	2021-11-24 09:53:46.455619+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
325	27	1252.50	2023-10-17 00:24:38.049237+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
326	67	4429.00	2023-05-23 15:12:30.739831+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
327	75	-3383.76	2025-05-09 15:30:57.261099+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
328	185	2638.70	2022-10-23 20:12:33.078306+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
329	282	-1080.52	2021-09-26 14:14:30.669112+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
330	295	874.57	2021-02-25 13:06:31.144037+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
331	265	-1444.76	2022-04-26 03:24:35.053371+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
332	182	366.34	2021-06-24 14:22:30.173279+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
333	250	1627.94	2025-04-11 14:14:46.200942+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
334	192	-711.40	2024-08-20 10:34:45.914926+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
335	180	893.75	2024-12-04 03:03:09.635742+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
336	211	-3189.40	2021-06-21 05:22:19.734798+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
337	203	1960.63	2023-05-08 18:54:40.016229+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
338	39	-2992.37	2021-12-03 20:44:30.163275+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
339	99	3509.34	2025-01-08 08:29:55.287783+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
340	57	1340.82	2020-10-30 00:14:12.411174+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
341	217	-2420.11	2023-06-10 12:13:55.636307+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
342	292	-2924.06	2025-02-07 14:45:39.862925+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
343	196	2303.13	2023-10-29 00:16:58.63546+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
344	224	4021.83	2023-06-09 17:46:31.830049+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
345	262	-3080.80	2022-02-04 05:36:53.220807+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
346	95	-541.37	2021-12-07 10:18:13.619198+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
347	261	4972.49	2024-10-16 05:27:25.560011+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
348	221	-2638.63	2025-09-22 22:51:24.643236+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
349	140	2430.99	2025-01-05 12:30:51.291056+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
350	157	-3783.04	2021-04-24 07:05:35.498205+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
351	35	2248.73	2025-02-20 21:08:14.141675+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
352	161	-4786.44	2025-05-09 21:38:00.632277+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
353	196	-2531.41	2022-08-01 08:03:00.302399+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
354	6	261.32	2020-12-27 11:27:52.036887+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
355	74	-3814.88	2020-12-09 23:01:02.093848+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
356	101	-3456.52	2024-05-18 18:57:46.910858+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
357	270	515.44	2022-07-26 06:05:01.944104+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
358	270	-3990.48	2024-07-20 10:01:21.238149+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
359	109	4947.96	2021-03-26 11:31:39.909885+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
360	236	-1945.45	2025-03-30 23:53:47.877561+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
361	273	-3496.22	2024-05-09 12:06:04.573436+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
362	156	-843.16	2024-12-31 14:24:15.525892+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
363	46	-2117.24	2024-09-07 17:27:04.921138+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
364	299	2102.91	2020-11-13 03:12:51.373003+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
365	95	-4669.48	2023-10-14 18:03:15.6119+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
366	161	1129.09	2024-12-07 19:36:21.110075+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
367	115	80.18	2023-02-22 18:49:47.103407+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
368	177	-1367.34	2023-06-29 23:25:54.779296+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
369	44	4259.05	2023-08-23 00:47:02.394005+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
370	9	3803.79	2023-08-30 10:56:49.432806+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
371	109	2261.49	2022-10-28 18:42:24.547643+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
372	167	-1596.67	2025-08-19 15:10:14.797848+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
373	70	-3484.60	2025-05-31 19:24:39.46351+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
374	58	2979.58	2023-01-04 19:54:33.682471+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
375	111	3193.45	2024-04-10 16:27:46.383817+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
376	114	260.83	2021-07-19 15:51:16.325496+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
377	215	3792.26	2021-01-29 14:08:21.47267+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
378	205	-1041.47	2021-10-30 13:55:58.136411+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
379	184	-1455.96	2023-08-28 23:28:39.127582+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
380	21	-1502.09	2021-10-30 11:54:42.707665+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
381	25	-2896.61	2025-06-02 03:01:26.922366+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
382	93	4169.28	2025-05-04 12:08:09.154554+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
383	132	-4122.01	2024-03-16 05:48:30.564248+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
384	105	-2922.81	2020-10-06 19:18:03.081822+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
385	19	1082.39	2020-10-02 19:18:45.886395+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
386	236	-627.84	2024-06-15 21:53:27.839312+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
387	70	1058.91	2021-11-29 17:43:11.674134+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
388	2	676.24	2025-07-31 07:48:02.771768+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
389	109	4755.41	2023-10-04 22:48:33.44076+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
390	175	865.78	2023-12-17 16:54:30.212832+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
391	253	1539.02	2021-10-29 16:26:36.335265+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
392	141	868.02	2025-06-10 10:14:14.466388+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
393	174	4843.75	2021-10-13 20:59:34.894714+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
394	171	3312.18	2023-10-06 12:43:08.27002+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
395	239	801.95	2022-11-26 05:10:18.31922+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
396	117	3966.25	2022-11-20 04:53:20.036432+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
397	7	495.53	2024-01-10 09:00:06.086888+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
398	157	892.20	2021-06-16 08:41:45.013521+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
399	94	4713.04	2023-03-05 22:47:25.136992+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
400	162	-2334.73	2023-10-12 00:53:25.889349+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
401	293	-2333.49	2022-10-17 14:36:10.529718+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
402	280	2147.50	2023-09-06 11:12:47.71879+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
403	60	4611.79	2022-11-27 02:16:52.76273+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
404	134	1014.07	2022-09-15 00:12:36.553745+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
405	38	-3895.47	2025-09-03 04:40:36.812162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
406	170	-2232.96	2022-10-29 13:48:04.578684+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
407	158	-838.69	2022-07-27 06:17:41.215924+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
408	43	-2304.12	2023-11-01 16:50:18.105773+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
409	130	-259.35	2023-01-04 03:12:00.097752+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
410	119	-3823.45	2023-08-11 22:47:22.101249+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
411	178	-425.46	2022-07-23 02:16:13.973162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
412	264	2140.68	2023-09-02 20:02:08.072449+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
413	101	4752.57	2023-02-16 14:40:13.53984+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
414	16	-4830.51	2025-09-21 02:28:28.281656+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
415	72	699.07	2021-04-21 11:34:22.884301+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
416	1	4198.08	2025-09-20 19:55:49.305603+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
417	106	-2246.05	2023-01-03 10:42:20.218596+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
418	79	2253.48	2025-08-20 23:20:43.625766+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
419	42	4079.87	2025-06-24 01:23:38.03026+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
420	92	3909.43	2022-11-04 09:39:39.075943+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
421	144	1222.60	2024-05-13 00:55:44.226581+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
422	16	4610.56	2024-01-19 17:55:11.707578+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
423	189	-4513.85	2023-04-20 20:24:38.826724+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
424	136	1148.78	2020-11-28 02:41:21.353273+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
425	248	545.59	2025-01-01 01:26:46.849323+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
426	123	-301.12	2021-05-26 22:09:58.623962+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
427	182	3655.49	2025-04-14 14:23:50.063329+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
428	14	4991.79	2024-05-12 06:30:22.150744+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
429	233	-4185.32	2022-01-15 05:20:56.318946+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
430	271	-1536.01	2022-06-20 15:37:22.401086+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
431	206	-2722.17	2024-05-21 13:49:20.912041+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
432	160	-2450.86	2025-08-11 04:02:25.468358+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
433	234	2497.55	2023-11-02 04:37:33.946789+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
434	256	4840.59	2022-05-08 10:31:30.98909+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
435	27	4244.83	2024-10-16 06:53:04.911602+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
436	13	4269.83	2021-10-11 19:06:09.827796+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
437	71	-4121.71	2024-06-29 05:14:56.836467+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
438	162	2915.41	2024-05-21 18:29:10.437703+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
439	213	-4355.39	2023-11-09 20:41:19.567248+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
440	249	-4047.97	2022-09-06 08:11:53.770386+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
441	6	-3397.20	2024-10-17 06:37:54.426673+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
442	235	-2617.30	2020-11-15 20:42:58.194841+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
443	218	2000.76	2021-02-28 22:28:30.707412+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
444	24	1512.84	2023-09-07 01:38:38.994119+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
445	189	903.19	2021-02-07 04:45:34.767808+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
446	33	-2224.87	2024-05-07 10:19:17.264964+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
447	16	3969.45	2022-07-12 06:42:56.248582+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
448	251	2560.10	2023-12-28 22:37:16.490157+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
449	111	3156.61	2024-02-22 22:52:53.72173+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
450	53	2722.46	2025-01-12 00:13:08.438816+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
451	282	-3788.39	2024-11-18 09:53:54.555293+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
452	275	-3418.79	2021-11-09 10:56:53.609886+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
453	253	4208.76	2023-02-06 20:19:39.751993+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
454	154	-1421.74	2022-12-26 23:45:14.676301+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
455	183	-2001.44	2020-11-20 07:12:52.490482+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
456	154	-54.12	2020-10-06 12:14:57.483399+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
457	126	4356.26	2020-10-19 11:48:48.064402+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
458	38	2455.65	2023-12-18 18:16:11.041081+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
459	181	-3818.71	2021-11-24 00:17:15.976739+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
460	134	-3892.13	2023-12-14 21:09:55.255898+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
461	124	-4936.77	2022-07-31 00:18:24.113123+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
462	76	-3152.60	2022-05-31 05:46:22.075409+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
463	141	1080.63	2021-08-15 23:19:15.315726+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
464	16	-3893.32	2023-03-27 02:58:19.08927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
465	159	-1626.03	2024-11-27 06:00:42.458658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
466	270	3907.93	2022-10-31 07:13:28.231596+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
467	218	-3297.76	2024-09-19 17:57:13.777135+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
468	12	4117.28	2023-11-08 05:35:28.988893+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
469	192	917.36	2022-04-05 04:57:45.85696+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
470	67	4264.19	2024-07-21 04:54:57.802851+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
471	285	-2185.33	2023-11-30 22:33:37.0931+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
472	278	658.27	2022-06-25 04:31:33.278784+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
473	258	550.30	2024-08-24 22:11:14.115712+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
474	55	-4030.58	2021-09-19 23:19:43.977012+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
475	167	-2594.78	2022-05-22 10:52:50.556553+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
476	259	1821.90	2021-05-20 20:59:13.241157+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
477	262	-170.21	2021-12-24 06:07:10.028025+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
478	18	1371.32	2024-04-23 20:09:24.688249+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
479	287	-242.90	2025-06-09 00:05:19.928133+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
480	248	-4127.49	2022-09-17 02:39:13.841605+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
481	25	-2305.71	2021-09-21 21:28:02.373365+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
482	21	-234.82	2021-10-28 20:05:50.391149+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
483	62	1049.53	2021-12-10 23:12:58.036242+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
484	153	65.09	2025-08-04 07:25:36.709483+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
485	294	-2984.52	2025-01-23 07:09:08.685661+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
486	220	-2946.13	2022-03-29 19:31:42.949108+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
487	205	-1387.74	2022-04-27 02:20:51.375035+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
488	228	-3653.90	2023-02-16 09:34:28.839159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
489	79	-4618.49	2024-12-20 06:47:20.195631+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
490	34	877.21	2025-07-16 16:23:46.105215+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
491	48	3153.93	2022-10-27 19:43:22.696814+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
492	242	4857.41	2024-08-16 05:15:19.055486+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
493	62	-4567.05	2022-02-14 16:21:56.721434+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
494	200	-3441.89	2021-05-08 15:48:49.245064+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
495	276	-380.10	2025-03-26 11:58:15.751671+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
496	277	-1614.13	2024-07-04 23:45:50.471381+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
497	23	-2427.70	2021-05-27 22:53:19.381001+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
498	110	2528.34	2025-04-22 05:58:44.663663+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
499	244	3396.98	2022-12-03 16:14:49.949782+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
500	159	-139.35	2025-02-17 18:24:56.624357+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
501	294	-3967.87	2023-08-24 20:26:24.319416+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
502	55	-1588.27	2025-04-29 04:38:33.49919+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
503	211	-1370.07	2021-11-22 09:17:24.967755+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
504	155	2272.49	2021-03-24 20:35:48.074982+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
505	282	3750.36	2022-05-29 16:46:28.684206+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
506	276	3193.45	2024-02-29 18:06:10.509736+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
507	241	-4488.07	2022-05-23 20:55:13.538665+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
508	282	-451.04	2024-03-13 10:24:02.390035+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
509	60	-880.28	2023-05-08 19:21:52.627019+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
510	16	4428.27	2021-07-18 19:03:08.893088+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
511	119	4142.05	2020-11-28 03:21:17.029774+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
512	195	1219.37	2022-11-27 03:35:34.455642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
513	27	3532.68	2021-09-01 06:50:45.145665+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
514	12	-4419.71	2021-09-14 06:20:39.507069+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
515	122	2746.16	2024-08-16 15:48:36.483123+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
516	296	1404.71	2024-01-01 07:34:42.476368+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
517	225	-2835.29	2021-06-29 04:08:03.969529+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
518	12	4108.55	2022-04-02 23:33:33.691952+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
519	36	-3250.31	2025-04-20 12:08:10.556658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
520	238	-1457.26	2024-12-24 06:04:56.554694+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
521	172	3164.36	2021-02-10 10:49:55.094221+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
522	83	-4709.59	2025-03-17 15:23:37.38679+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
523	249	770.75	2024-10-19 02:52:51.795283+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
524	156	-4771.50	2021-09-02 02:31:14.637267+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
525	145	2077.83	2024-12-18 10:30:32.12757+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
526	191	3400.98	2022-02-06 22:24:27.255235+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
527	98	-3146.85	2024-09-16 06:58:01.907551+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
528	239	-223.20	2025-04-15 02:08:16.990847+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
529	128	2569.04	2023-02-16 20:40:03.568256+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
530	197	2881.51	2024-10-21 15:36:43.826887+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
531	296	1158.12	2024-08-02 05:19:41.755797+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
532	278	1372.99	2025-04-09 04:01:29.196181+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
533	89	-1297.49	2022-08-06 23:22:41.571242+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
534	242	-2354.15	2022-12-10 04:43:55.137729+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
535	35	-1659.61	2022-02-16 03:57:41.185553+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
536	54	-210.19	2021-06-03 11:31:01.395972+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
537	143	4272.79	2024-01-08 13:49:21.265561+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
538	229	1550.02	2021-02-14 22:04:28.995726+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
539	206	3498.10	2025-08-23 20:12:58.128259+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
540	231	3156.35	2023-12-17 18:27:25.314597+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
541	176	602.19	2021-04-10 03:37:20.013138+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
542	137	1977.10	2024-12-25 22:10:52.850356+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
543	247	-3180.04	2025-08-29 14:04:02.227309+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
544	29	4694.37	2024-05-13 22:11:02.63601+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
545	21	-418.51	2022-08-14 22:40:57.38326+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
546	244	66.66	2022-09-13 07:43:54.645965+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
547	71	3102.76	2022-07-02 11:37:50.255447+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
548	10	456.22	2021-08-21 14:25:41.174636+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
549	93	-961.09	2022-04-30 01:06:10.80971+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
550	124	3921.39	2021-12-24 20:18:58.80948+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
551	237	2142.12	2021-08-01 00:53:27.556689+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
552	230	-84.25	2022-05-11 13:24:13.516996+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
553	64	2404.80	2022-12-30 05:29:51.477307+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
554	294	41.99	2024-01-06 20:15:53.640798+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
555	29	-4220.70	2023-01-07 02:45:08.401163+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
556	220	-1338.69	2023-05-12 09:42:25.427095+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
557	180	-404.79	2023-04-03 05:03:50.441718+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
558	38	-1479.78	2023-12-07 23:20:06.736856+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
559	253	-4481.30	2025-03-25 07:32:14.029866+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
560	172	-4413.03	2022-04-19 17:49:22.98048+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
561	46	-928.08	2022-05-17 23:29:45.710531+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
562	6	1028.40	2021-05-31 06:50:18.007506+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
563	230	2897.13	2022-09-30 15:00:35.499524+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
564	292	-3676.56	2024-01-29 04:47:31.805657+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
565	224	1068.69	2022-02-24 12:21:40.047162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
566	115	-2109.38	2023-12-23 06:12:35.436616+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
567	143	-562.35	2021-05-08 23:51:09.656452+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
568	12	-4019.44	2022-08-16 12:16:51.01322+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
569	93	4897.85	2022-03-13 20:18:22.433849+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
570	258	-1149.47	2021-05-26 21:12:44.375603+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
571	179	151.34	2021-07-24 03:22:31.053512+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
572	115	-3599.21	2023-11-20 22:17:03.53748+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
573	297	4566.43	2021-02-19 11:24:35.184607+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
574	10	2240.31	2025-06-25 15:26:24.052663+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
575	197	4942.65	2022-03-03 02:22:55.691384+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
576	270	-438.22	2023-05-08 00:08:37.560963+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
577	252	-2254.50	2023-11-02 16:21:02.561321+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
578	67	-4225.87	2021-01-04 23:52:42.91642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
579	70	1687.05	2020-10-22 09:34:51.188464+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
580	64	4921.24	2021-03-25 16:58:58.198443+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
581	119	2912.67	2022-06-23 20:42:05.017197+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
582	218	1962.87	2024-10-09 02:13:16.751728+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
583	159	985.75	2023-09-30 19:03:14.435927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
584	189	-3485.47	2025-04-06 05:18:40.0199+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
585	4	230.41	2023-11-29 04:33:14.280926+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
586	182	-4251.35	2023-07-01 10:50:31.564395+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
587	251	1094.28	2025-01-27 21:41:34.726662+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
588	155	103.38	2025-04-27 09:29:50.117565+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
589	199	4356.23	2022-11-19 05:04:26.011305+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
590	236	-3840.20	2024-04-05 06:13:56.43291+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
591	75	3069.28	2023-11-22 08:59:09.403252+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
592	82	2586.19	2021-03-19 11:32:39.914938+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
593	295	-110.16	2022-05-18 12:32:07.050014+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
594	188	-4370.00	2021-06-18 12:30:11.660367+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
595	158	3825.66	2025-05-04 21:34:57.006659+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
596	89	3860.53	2023-07-28 23:04:21.904029+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
597	150	-2907.12	2024-02-03 12:26:29.120238+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
598	176	-765.53	2021-12-07 22:12:17.822215+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
599	252	3336.71	2023-06-27 23:35:16.802968+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
600	56	-2347.64	2025-05-11 15:30:07.830762+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
601	120	-2766.17	2022-07-30 01:41:45.80365+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
602	35	2876.85	2021-07-11 06:52:05.738002+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
603	145	-1408.43	2021-03-02 16:04:05.285222+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
604	200	771.21	2023-07-08 05:34:18.234986+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
605	210	-1962.69	2022-05-27 22:49:21.932579+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
606	279	-2311.65	2024-08-15 23:53:22.952988+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
607	103	-2651.70	2024-07-29 02:13:35.991957+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
608	128	-3550.61	2024-03-24 23:44:55.965728+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
609	228	-1693.22	2021-07-21 22:51:12.475016+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
610	71	3600.07	2022-09-01 05:16:41.850078+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
611	152	3328.65	2022-02-21 17:56:32.662258+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
612	107	-3372.68	2024-10-24 19:42:24.820962+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
613	203	2830.46	2022-05-14 08:38:31.326107+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
614	217	2148.05	2024-02-12 16:44:15.001667+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
615	192	3202.65	2024-03-17 02:07:06.50654+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
616	122	1838.95	2020-12-29 16:14:10.643389+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
617	117	2336.91	2022-07-26 08:29:41.355105+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
618	243	-2440.44	2022-07-28 17:55:42.053296+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
619	88	-4083.70	2024-03-06 10:02:31.140758+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
620	55	2116.60	2024-07-12 20:02:18.873056+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
621	19	-2562.21	2024-07-27 04:33:27.79919+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
622	192	-52.91	2025-06-02 22:25:08.718691+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
623	138	1388.31	2024-12-25 20:05:20.773555+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
624	115	2513.36	2020-12-31 21:19:07.823716+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
625	224	3936.96	2021-11-28 05:59:10.544383+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
626	231	-1616.92	2025-03-15 20:11:35.635802+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
627	171	-702.58	2023-10-20 16:32:31.529774+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
628	226	3510.11	2025-02-08 06:04:13.423076+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
629	93	-441.36	2024-09-02 20:27:02.422385+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
630	13	319.40	2022-06-03 19:33:09.732748+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
631	156	-4845.03	2022-07-06 12:41:39.373077+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
632	17	-3683.40	2021-09-21 22:44:34.319472+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
633	266	-3510.76	2021-10-16 23:01:51.624868+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
634	246	-55.38	2023-09-18 22:54:22.177409+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
635	188	2465.01	2020-12-06 22:07:34.054488+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
636	273	-475.21	2022-06-27 14:07:21.042214+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
637	30	545.28	2021-01-17 16:58:41.646962+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
638	216	3953.55	2022-03-30 11:29:35.525531+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
639	247	435.67	2023-10-22 06:57:35.110798+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
640	300	2772.48	2021-08-23 05:24:02.196524+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
641	67	1614.52	2022-10-02 15:01:10.179907+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
642	238	1279.05	2023-12-31 22:32:21.480089+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
643	36	-1665.60	2024-08-06 09:38:20.214233+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
644	78	4783.61	2023-05-08 13:50:30.218254+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
645	289	3278.43	2023-11-22 07:25:55.706937+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
646	128	1058.42	2025-01-30 03:03:50.573367+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
647	218	4874.50	2024-01-01 03:09:58.351485+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
648	200	3858.28	2021-12-30 01:18:24.597847+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
649	129	4203.76	2023-03-06 19:09:08.440058+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
650	191	-2139.58	2022-05-14 19:27:45.638032+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
651	178	4717.22	2021-03-17 01:16:51.985063+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
652	22	721.16	2025-09-04 05:52:05.172548+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
653	251	4179.59	2022-11-15 04:10:56.368515+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
654	282	-1665.82	2023-03-20 16:25:17.843655+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
655	150	-1572.62	2022-05-10 09:16:12.298343+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
656	196	4056.28	2021-04-23 10:56:46.324938+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
657	300	2960.43	2025-06-09 19:54:08.621487+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
658	49	4390.06	2023-02-02 04:38:55.378525+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
659	243	2542.14	2021-06-05 14:47:38.329591+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
660	99	-2880.51	2024-05-06 15:15:52.684966+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
661	13	-4535.49	2022-09-29 22:34:01.687137+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
662	81	1565.03	2022-02-19 13:38:58.39971+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
663	12	2246.43	2022-08-22 14:13:59.938198+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
664	253	2391.78	2023-04-20 09:16:03.917382+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
665	204	3585.47	2021-02-03 17:12:13.684205+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
666	290	-1673.97	2025-08-12 16:40:54.049214+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
667	79	-450.11	2023-10-04 19:56:14.080265+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
668	279	1213.08	2023-09-10 23:03:05.601372+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
669	65	1413.07	2023-04-26 22:01:20.451293+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
670	138	539.77	2023-05-17 10:04:31.280687+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
671	72	991.47	2025-09-20 18:13:29.534808+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
672	195	-4857.68	2023-03-19 09:02:46.508277+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
673	295	-390.05	2024-08-30 01:43:47.90659+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
674	67	995.43	2022-10-05 00:54:15.570311+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
675	249	3636.13	2024-10-07 01:54:39.67007+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
676	285	1576.72	2023-04-01 06:38:13.782522+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
677	214	2980.81	2024-05-23 13:52:53.753626+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
678	237	3523.49	2024-12-13 08:53:50.733435+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
679	167	538.86	2020-10-14 21:54:43.619058+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
680	12	548.37	2024-07-16 10:25:58.870981+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
681	39	-1510.64	2024-05-10 16:10:44.684428+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
682	235	3931.63	2023-02-08 13:19:54.287983+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
683	228	2719.27	2025-07-22 05:23:09.154027+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
684	286	-1115.57	2025-09-14 06:02:24.479927+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
685	137	4962.17	2024-12-29 07:24:15.673558+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
686	28	3827.23	2024-05-05 15:49:49.963661+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
687	262	839.55	2022-10-19 08:42:40.162529+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
688	283	-1146.35	2024-09-07 20:48:21.163997+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
689	33	-654.14	2024-11-02 19:49:20.827724+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
690	279	3314.44	2025-06-09 16:38:46.748113+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
691	102	-1339.26	2024-06-13 04:31:17.70685+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
692	208	-3396.51	2024-01-11 00:12:06.329886+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
693	231	1079.47	2023-05-02 15:47:52.583502+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
694	261	-3736.43	2024-09-28 17:56:13.122602+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
695	250	-594.25	2025-07-30 22:43:42.959388+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
696	167	4669.45	2021-07-06 13:41:41.451244+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
697	22	1470.92	2025-06-02 16:08:09.546517+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
698	297	3231.89	2023-04-21 21:04:14.315246+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
699	210	253.78	2023-11-02 17:51:25.61105+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
700	162	906.95	2021-12-17 08:10:48.125737+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
701	157	-3736.17	2023-11-09 21:09:50.270596+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
702	246	884.17	2021-10-04 03:45:42.475283+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
703	32	2713.74	2022-10-12 07:51:23.610946+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
704	51	-2714.65	2023-02-15 01:19:00.089679+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
705	40	-2169.09	2021-11-17 09:28:09.118014+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
706	179	-3211.09	2022-01-29 01:27:19.205596+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
707	222	-348.20	2025-02-21 06:02:09.273789+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
708	165	1397.08	2023-10-19 02:07:13.278257+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
709	171	-3030.03	2023-07-25 05:26:21.522345+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
710	101	243.86	2021-05-01 20:19:41.886713+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
711	35	-3951.77	2022-08-13 06:34:28.56535+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
712	193	-1661.27	2023-06-02 06:32:39.089331+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
713	8	-2361.91	2021-09-17 21:46:04.185502+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
714	46	-2797.21	2022-04-01 03:57:26.370573+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
715	54	-1426.08	2023-11-29 20:55:04.668407+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
716	219	-1109.08	2024-10-21 17:22:05.84729+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
717	65	917.46	2024-01-11 14:04:34.156357+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
718	18	-2094.25	2024-08-30 03:27:13.430406+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
719	268	1193.55	2023-09-29 10:16:17.738022+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
720	70	-4239.32	2021-11-09 09:36:00.119827+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
721	141	-953.37	2022-03-15 01:51:05.847196+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
722	174	986.27	2020-12-22 10:41:10.730201+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
723	152	3355.53	2022-05-20 01:34:12.506437+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
724	197	-1034.43	2022-08-17 06:40:36.109103+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
725	100	-2250.94	2024-10-02 00:52:00.324144+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
726	293	-3021.89	2022-11-08 01:28:00.805454+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
727	298	-1091.06	2021-05-25 13:40:15.164049+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
728	115	3928.43	2022-04-09 08:17:56.865862+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
729	298	-4009.00	2024-01-13 13:07:14.960576+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
730	25	3148.68	2023-04-12 17:31:29.400335+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
731	51	3668.71	2024-07-05 06:57:34.385594+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
732	158	1817.89	2023-10-02 18:46:47.046161+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
733	261	-2017.33	2024-12-10 06:38:28.900094+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
734	299	-1149.40	2023-08-04 23:51:03.857851+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
735	66	506.03	2021-03-07 03:37:43.010103+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
736	242	1772.43	2024-05-10 22:11:16.594899+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
737	3	-4444.20	2024-07-25 03:44:45.979432+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
738	12	3818.95	2025-02-02 12:45:26.341329+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
739	42	-2799.46	2020-12-07 07:57:20.318483+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
740	190	-4326.22	2024-04-11 19:23:08.290166+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
741	267	-4029.45	2021-01-07 03:19:17.001586+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
742	45	-1023.44	2021-09-19 07:18:42.121534+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
743	271	689.70	2024-01-21 04:24:44.496533+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
744	65	-3814.90	2024-04-13 09:05:46.450169+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
745	78	-259.38	2021-05-22 10:22:28.150736+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
746	291	-2473.32	2023-06-08 08:12:34.832573+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
747	215	-1621.85	2025-08-02 15:29:22.52405+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
748	241	-4219.72	2024-03-15 15:30:24.102838+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
749	98	-377.35	2020-12-14 07:52:30.644105+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
750	269	-291.71	2025-03-03 00:56:00.535628+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
751	85	-3037.69	2025-01-17 00:35:50.893383+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
752	33	220.69	2021-08-06 23:22:12.382342+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
753	155	-1848.00	2023-03-19 03:41:59.437552+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
754	46	-1483.35	2022-05-01 08:07:23.641512+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
755	12	4850.27	2023-04-26 06:52:40.118725+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
756	30	-1530.88	2022-01-23 06:49:40.778056+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
757	107	2923.99	2022-08-05 16:01:46.069709+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
758	96	1358.23	2023-12-06 19:44:51.394044+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
759	7	1874.43	2022-10-25 10:25:11.241645+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
760	132	2807.01	2022-12-05 05:03:23.672644+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
761	274	2463.67	2022-06-22 16:57:55.595384+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
762	272	-2959.70	2024-06-29 02:39:42.222584+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
763	31	-4429.68	2025-03-05 09:58:20.51779+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
764	189	903.42	2023-11-19 02:30:03.607061+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
765	290	-2794.26	2021-10-31 18:15:16.936298+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
766	224	1371.79	2025-04-01 09:16:03.778014+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
767	15	-2450.01	2024-09-30 12:10:42.667861+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
768	156	2921.81	2022-07-16 02:35:22.500339+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
769	258	-2438.81	2022-10-07 22:23:29.453201+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
770	108	-3168.15	2024-01-25 18:43:21.631075+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
771	53	-1176.33	2021-02-03 09:42:59.385162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
772	144	-1089.01	2025-06-14 13:08:23.899995+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
773	163	-1908.83	2020-10-28 22:25:29.06066+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
774	35	144.93	2024-03-02 14:34:38.573797+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
775	152	2185.21	2022-03-09 19:16:45.150547+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
776	280	-3590.73	2024-01-05 06:03:20.844072+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
777	249	1395.03	2022-10-13 02:29:32.031692+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
778	4	-47.76	2024-05-05 16:32:30.126819+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
779	158	-2304.56	2023-06-27 19:48:28.707857+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
780	66	4548.66	2020-12-26 15:01:54.680368+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
781	178	4993.73	2023-01-26 04:56:28.408671+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
782	247	3235.86	2024-05-02 21:10:27.871276+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
783	71	3417.40	2021-01-07 18:51:36.220746+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
784	164	-1641.72	2023-12-25 09:37:59.819594+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
785	57	-1082.86	2022-05-22 03:46:28.422523+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
786	219	615.77	2021-08-19 10:26:02.262653+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
787	6	-1135.52	2023-11-06 05:56:54.656281+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
788	139	-555.68	2024-12-27 16:53:55.487871+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
789	269	-1551.28	2022-01-03 16:48:26.197393+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
790	27	4967.74	2020-10-22 12:40:27.394289+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
791	156	-1768.85	2024-06-08 10:12:19.93128+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
792	147	4645.01	2024-06-25 10:35:33.667479+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
793	171	4340.65	2022-11-15 21:47:26.644882+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
794	234	-3261.27	2023-09-10 16:17:55.611642+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
795	236	-4422.88	2025-09-14 22:19:26.801405+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
796	229	2860.67	2022-06-22 14:25:54.736436+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
797	84	-3077.14	2022-07-22 10:37:12.085537+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
798	177	-1555.56	2021-04-12 06:23:14.83346+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
799	92	-1329.11	2020-10-10 09:50:20.198932+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
800	278	-1377.08	2024-09-11 02:14:50.255844+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
801	194	3172.30	2025-06-12 09:54:30.431652+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
802	73	2677.04	2021-01-28 06:21:54.381124+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
803	26	3799.00	2022-01-30 20:08:48.395184+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
804	286	3776.73	2021-09-20 07:44:55.437781+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
805	248	4887.77	2024-04-01 15:44:27.106987+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
806	162	524.40	2022-08-08 10:25:00.421054+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
807	280	3908.29	2024-08-05 02:21:31.71291+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
808	23	-1486.79	2025-01-14 21:22:44.328367+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
809	253	4421.58	2024-01-27 11:30:45.179115+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
810	146	4016.59	2021-02-26 16:37:15.560308+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
811	141	435.63	2022-12-17 19:56:35.733369+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
812	237	3215.84	2021-11-10 09:02:09.820352+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
813	242	4372.76	2024-02-15 17:13:08.003516+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
814	258	-2709.87	2021-07-23 09:06:12.412833+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
815	258	-838.60	2025-02-03 23:53:32.921174+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
816	298	-2453.58	2024-02-12 01:28:40.708947+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
817	95	1714.86	2023-02-05 12:54:22.328219+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
818	143	4853.63	2023-07-10 04:32:21.772275+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
819	231	2744.42	2022-06-23 07:20:41.158953+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
820	215	-4019.01	2024-03-05 23:11:40.843786+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
821	279	3001.13	2024-11-25 06:10:05.532178+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
822	88	1832.51	2024-11-20 01:05:41.781951+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
823	257	-1245.71	2021-02-04 18:28:01.457942+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
824	136	-4317.74	2025-05-27 03:03:08.143467+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
825	281	-719.14	2024-11-15 18:21:06.077269+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
826	268	4718.98	2021-04-13 15:11:47.47965+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
827	256	4200.12	2023-07-23 14:07:36.269865+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
828	53	4170.01	2021-08-15 07:46:33.756658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
829	199	1112.17	2022-11-25 15:27:59.37716+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
830	125	2962.02	2023-08-06 14:18:11.789571+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
831	184	534.47	2022-05-22 01:09:31.535289+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
832	36	4351.79	2024-09-07 10:46:29.852527+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
833	35	3946.52	2025-05-13 15:12:02.623185+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
834	135	4954.85	2022-05-16 17:49:21.329016+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
835	218	3658.02	2025-02-01 00:02:41.354847+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
836	92	75.32	2021-06-23 00:11:22.222666+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
837	158	1492.59	2023-04-19 11:20:06.56336+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
838	23	4840.70	2021-08-05 00:40:58.273669+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
839	97	-1694.04	2023-06-26 21:33:25.781121+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
840	280	-1026.79	2023-04-25 21:11:04.730454+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
841	223	2278.75	2024-04-22 01:47:59.963079+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
842	245	-1551.49	2024-12-25 04:37:57.37159+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
843	225	-775.40	2022-09-09 19:56:38.489315+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
844	148	4411.78	2023-10-05 20:11:21.596508+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
845	238	-2474.69	2021-07-19 17:17:36.865244+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
846	98	18.52	2021-09-10 03:25:58.652057+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
847	288	-1753.86	2023-03-19 02:51:42.712701+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
848	256	2786.40	2021-02-18 21:47:33.840405+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
849	102	1531.76	2023-01-14 15:56:00.312137+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
850	74	-4171.32	2023-11-20 16:13:40.618392+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
851	264	2644.18	2023-01-31 06:44:06.734445+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
852	8	2286.47	2021-04-28 04:13:20.250344+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
853	150	1910.32	2024-12-09 07:31:30.080975+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
854	182	-3916.40	2025-09-07 16:47:55.657398+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
855	225	928.30	2022-11-10 05:00:23.840394+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
856	47	1320.64	2020-12-15 23:50:24.91827+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
857	178	-1847.51	2025-09-12 12:46:46.415419+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
858	206	409.00	2024-07-21 01:34:56.863658+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
859	99	1277.77	2022-08-09 22:29:37.77953+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
860	253	-4750.76	2022-06-17 00:09:22.570431+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
861	7	-4984.06	2022-11-10 16:24:53.145291+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
862	173	897.18	2021-05-04 14:49:32.213447+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
863	116	-4956.16	2022-05-21 02:58:48.007522+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
864	53	1251.08	2023-11-14 18:33:04.835495+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
865	151	-1426.26	2024-11-17 07:19:59.28723+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
866	175	-4190.16	2025-08-19 09:33:41.750234+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
867	270	-4001.78	2023-08-14 19:22:29.239792+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
868	84	-2904.04	2025-01-27 21:47:58.677433+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
869	280	2979.17	2025-06-27 01:30:08.952891+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
870	237	-3156.44	2023-05-10 14:02:25.325116+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
871	64	-1143.91	2024-04-14 11:07:05.129679+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
872	134	1352.08	2022-11-17 20:37:56.942884+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
873	17	1102.09	2024-11-21 14:39:44.639038+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
874	110	-2142.63	2022-07-29 13:46:37.505712+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
875	168	711.83	2024-10-14 22:27:38.437925+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
876	175	-4928.81	2023-09-07 19:30:21.505866+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
877	196	-3701.67	2025-03-17 09:04:53.437468+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
878	289	-1413.53	2023-07-11 18:22:44.56086+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
879	229	4451.61	2020-10-27 13:28:27.71237+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
880	156	-3754.95	2024-05-15 13:05:54.97079+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
881	5	2679.17	2022-07-15 04:23:55.916086+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
882	23	4080.10	2023-08-03 02:15:01.287104+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
883	266	2552.10	2024-09-10 22:28:51.904471+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
884	196	1023.02	2024-07-18 23:07:40.385024+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
885	230	3763.09	2022-01-05 11:47:36.047098+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
886	247	3805.00	2022-10-13 01:10:21.034865+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
887	296	2852.43	2024-10-26 16:38:52.619118+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
888	183	2918.22	2022-09-05 05:10:40.175895+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
889	113	-1997.74	2023-07-26 06:15:24.162805+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
890	21	-3937.16	2025-02-20 19:39:36.940652+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
891	214	-3367.11	2024-03-28 16:11:30.450265+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
892	25	4026.95	2023-12-05 10:39:41.147196+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
893	181	185.31	2025-05-04 02:29:11.003372+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
894	7	-2089.61	2022-03-07 18:11:28.127314+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
895	205	-2123.21	2024-10-15 05:13:47.649623+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
896	57	1959.91	2024-01-26 19:55:40.53219+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
897	166	-2248.35	2022-03-03 00:47:23.492585+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
898	235	742.50	2021-10-09 11:21:38.802521+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
899	192	4354.13	2023-05-24 09:10:58.019706+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
900	60	-918.66	2024-09-23 14:22:22.000417+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
901	282	-3764.19	2023-09-26 16:29:48.783094+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
902	109	-2333.03	2022-06-04 21:44:09.027874+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
903	248	4881.53	2021-07-12 05:05:14.702522+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
904	114	-4202.77	2023-02-22 06:18:25.329902+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
905	240	2573.74	2025-01-17 16:37:40.373424+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
906	175	-638.59	2021-06-06 13:29:15.80191+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
907	235	165.70	2023-04-20 23:10:16.184147+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
908	206	1950.85	2021-03-18 07:24:50.913323+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
909	30	-2274.19	2020-10-20 05:08:46.737289+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
910	154	-4389.93	2023-04-29 13:06:14.952499+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
911	91	-4746.45	2021-07-01 12:12:08.001799+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
912	287	1330.72	2022-06-15 19:22:44.188334+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
913	184	-178.86	2022-04-14 07:02:34.936865+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
914	38	-1939.08	2024-01-25 18:38:37.508291+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
915	66	-848.54	2022-03-20 22:37:56.052768+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
916	97	-2948.62	2021-03-21 20:21:01.936611+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
917	119	-2692.94	2020-12-02 05:34:06.011378+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
918	287	836.33	2021-01-30 07:18:45.964195+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
919	165	-3892.14	2024-10-23 12:34:22.821492+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
920	237	3006.25	2024-11-10 18:53:24.445013+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
921	82	-1915.34	2024-03-03 07:23:48.950973+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
922	175	2310.51	2022-02-26 22:09:40.126668+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
923	166	4404.87	2021-03-12 23:19:26.537808+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
924	90	2703.07	2024-09-25 09:56:27.694246+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
925	271	-81.15	2025-07-12 21:33:11.024508+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
926	146	-3512.10	2024-08-06 10:51:21.549558+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
927	208	-1815.46	2025-02-01 12:38:39.446228+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
928	163	2838.57	2021-08-18 12:24:56.426778+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
929	229	3043.56	2024-12-02 13:13:00.43738+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
930	150	2298.81	2023-02-09 05:21:15.732117+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
931	130	49.77	2024-10-22 03:12:13.031149+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
932	239	3207.92	2022-09-29 11:18:17.700271+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
933	25	4333.57	2025-01-14 23:35:16.532456+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
934	253	2549.35	2020-10-30 18:58:39.614763+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
935	238	4803.53	2022-06-26 14:11:00.423801+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
936	79	1387.71	2023-02-22 15:25:55.146255+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
937	103	3636.49	2024-09-19 15:28:20.563063+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
938	199	-4397.27	2024-11-07 07:44:51.894922+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
939	59	1290.78	2021-07-29 16:20:24.555042+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
940	241	-804.92	2021-07-04 18:08:50.235492+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
941	50	1802.30	2022-07-13 07:47:08.168602+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
942	2	2099.13	2024-09-21 23:04:09.331604+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
943	281	165.01	2023-06-02 21:49:56.315723+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
944	284	-4578.06	2021-11-19 04:41:38.637535+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
945	159	-4389.79	2022-02-17 11:28:10.251045+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
946	203	-4588.88	2021-01-01 01:32:04.632272+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
947	260	-3740.97	2022-10-13 18:18:49.682622+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
948	271	-3550.29	2022-12-01 14:29:55.612411+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
949	223	1826.44	2023-11-28 17:13:40.725481+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
950	296	298.96	2022-02-20 15:52:50.224317+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
951	73	2952.39	2021-12-18 16:29:36.922747+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
952	284	3998.79	2022-05-23 04:10:40.544523+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
953	146	3681.22	2023-10-14 20:13:28.632583+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
954	202	2900.31	2022-02-05 11:59:28.631483+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
955	54	-674.49	2023-10-24 13:55:02.931169+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
956	78	1128.82	2025-02-21 10:43:02.161478+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
957	132	4597.36	2021-07-14 14:44:53.122027+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
958	90	1790.67	2023-07-29 18:38:18.729905+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
959	227	3182.69	2021-11-04 18:03:41.480317+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
960	82	-3199.16	2020-11-27 17:13:36.172371+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
961	152	281.14	2024-03-01 13:36:34.132639+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
962	22	-363.09	2025-06-28 21:36:28.71579+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
963	149	-3743.27	2021-12-17 05:04:38.012853+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
964	83	4556.65	2022-07-14 12:43:20.59661+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
965	72	3050.24	2025-02-16 12:44:51.76162+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
966	237	2816.14	2024-02-13 00:14:47.764179+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
967	228	4938.73	2021-06-07 22:24:52.163632+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
968	64	-1308.05	2021-08-21 07:42:44.80652+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
969	240	-4207.23	2025-01-11 16:00:48.17682+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
970	21	2287.29	2022-03-13 14:23:47.751834+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
971	260	2032.78	2024-01-23 19:41:30.03124+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
972	293	-877.39	2023-12-19 05:19:24.034823+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
973	231	-3635.45	2024-08-02 19:39:03.278178+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
974	19	1806.46	2024-03-07 22:00:56.814662+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
975	147	3081.59	2025-05-23 21:21:23.010751+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
976	175	364.21	2023-07-26 01:12:08.157398+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
977	261	-3838.93	2023-02-25 19:14:17.671886+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
978	258	-2012.86	2022-03-27 11:09:02.144455+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
979	152	1488.46	2023-01-13 11:10:37.176552+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
980	158	46.51	2021-11-15 13:47:16.847624+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
981	280	1419.42	2021-10-03 17:27:00.337653+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
982	246	2532.32	2022-03-12 18:41:33.855873+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
983	83	1078.99	2025-07-17 04:51:49.046268+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
984	294	-4040.64	2025-02-02 04:30:43.097051+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
985	163	-445.93	2023-02-07 22:38:45.565797+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
986	21	-274.88	2021-12-08 10:36:26.396474+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
987	113	-449.28	2024-10-18 10:09:54.477915+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
988	127	-2195.33	2024-10-12 11:46:49.023849+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
989	256	1651.34	2022-09-19 00:15:40.962521+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
990	278	3416.23	2024-10-31 10:27:07.61771+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
991	285	1045.44	2021-10-06 15:55:51.637373+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
992	241	-3470.74	2024-06-04 21:29:38.657038+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
993	178	1476.63	2021-08-12 23:14:50.920274+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
994	200	-4534.56	2023-07-26 16:44:36.870834+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
995	32	-1210.58	2025-09-22 23:39:36.056609+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
996	227	-1580.48	2023-03-09 17:13:34.118989+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
997	271	-1513.62	2022-12-25 23:05:27.331798+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
998	149	1101.29	2022-02-06 05:49:57.420811+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
999	254	3383.99	2025-01-13 08:55:07.363239+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
1000	119	-134.69	2022-02-26 14:10:16.578995+07	2025-09-23 17:09:04.002871+07	2025-09-23 17:09:04.002871+07
\.


--
-- Name: Accounts_account_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."Accounts_account_id_seq"', 1, false);


--
-- Name: Branches_branch_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."Branches_branch_id_seq"', 1, false);


--
-- Name: Cards_card_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."Cards_card_id_seq"', 1, false);


--
-- Name: Customers_customer_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."Customers_customer_id_seq"', 1, false);


--
-- Name: DepositTypes_deposit_type_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."DepositTypes_deposit_type_id_seq"', 1, false);


--
-- Name: Deposits_deposit_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."Deposits_deposit_id_seq"', 1, false);


--
-- Name: LoanTypes_loan_type_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."LoanTypes_loan_type_id_seq"', 1, false);


--
-- Name: Loans_loan_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."Loans_loan_id_seq"', 1, false);


--
-- Name: Transactions_transaction_id_seq; Type: SEQUENCE SET; Schema: g_current; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('g_current."Transactions_transaction_id_seq"', 1, false);


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.accounts_id_seq', 300, true);


--
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.branches_id_seq', 4, true);


--
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.cards_id_seq', 150, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.customers_id_seq', 200, true);


--
-- Name: deposit_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.deposit_types_id_seq', 10, true);


--
-- Name: deposits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.deposits_id_seq', 200, true);


--
-- Name: loan_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.loan_types_id_seq', 10, true);


--
-- Name: loans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.loans_id_seq', 200, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: phamdinhkhanh
--

SELECT pg_catalog.setval('public.transactions_id_seq', 1000, true);


--
-- Name: Accounts Accounts_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (account_id);


--
-- Name: Branches Branches_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Branches"
    ADD CONSTRAINT "Branches_pkey" PRIMARY KEY (branch_id);


--
-- Name: Cards Cards_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Cards"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (card_id);


--
-- Name: Customers Customers_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY (customer_id);


--
-- Name: DepositTypes DepositTypes_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."DepositTypes"
    ADD CONSTRAINT "DepositTypes_pkey" PRIMARY KEY (deposit_type_id);


--
-- Name: Deposits Deposits_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Deposits"
    ADD CONSTRAINT "Deposits_pkey" PRIMARY KEY (deposit_id);


--
-- Name: LoanTypes LoanTypes_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."LoanTypes"
    ADD CONSTRAINT "LoanTypes_pkey" PRIMARY KEY (loan_type_id);


--
-- Name: Loans Loans_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Loans"
    ADD CONSTRAINT "Loans_pkey" PRIMARY KEY (loan_id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (transaction_id);


--
-- Name: Accounts Accounts_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (account_id);


--
-- Name: Branches Branches_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Branches"
    ADD CONSTRAINT "Branches_pkey" PRIMARY KEY (branch_id);


--
-- Name: Cards Cards_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Cards"
    ADD CONSTRAINT "Cards_pkey" PRIMARY KEY (card_id);


--
-- Name: Customers Customers_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY (customer_id);


--
-- Name: DepositTypes DepositTypes_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."DepositTypes"
    ADD CONSTRAINT "DepositTypes_pkey" PRIMARY KEY (deposit_type_id);


--
-- Name: Deposits Deposits_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Deposits"
    ADD CONSTRAINT "Deposits_pkey" PRIMARY KEY (deposit_id);


--
-- Name: LoanTypes LoanTypes_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."LoanTypes"
    ADD CONSTRAINT "LoanTypes_pkey" PRIMARY KEY (loan_type_id);


--
-- Name: Loans Loans_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Loans"
    ADD CONSTRAINT "Loans_pkey" PRIMARY KEY (loan_id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: g_current; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_current."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (transaction_id);


--
-- Name: accounts accounts_acc_num_key; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.accounts
    ADD CONSTRAINT accounts_acc_num_key UNIQUE (acc_num);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: cards cards_cc_num_key; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.cards
    ADD CONSTRAINT cards_cc_num_key UNIQUE (cc_num);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: customers customers_cus_email_key; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.customers
    ADD CONSTRAINT customers_cus_email_key UNIQUE (cus_email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: deposit_types deposit_types_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.deposit_types
    ADD CONSTRAINT deposit_types_pkey PRIMARY KEY (id);


--
-- Name: deposits deposits_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.deposits
    ADD CONSTRAINT deposits_pkey PRIMARY KEY (id);


--
-- Name: loan_types loan_types_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.loan_types
    ADD CONSTRAINT loan_types_pkey PRIMARY KEY (id);


--
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: g_prev; Owner: phamdinhkhanh
--

ALTER TABLE ONLY g_prev.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: accounts accounts_acc_num_key; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_acc_num_key UNIQUE (acc_num);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: cards cards_cc_num_key; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_cc_num_key UNIQUE (cc_num);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: customers customers_cus_email_key; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_cus_email_key UNIQUE (cus_email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: deposit_types deposit_types_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.deposit_types
    ADD CONSTRAINT deposit_types_pkey PRIMARY KEY (id);


--
-- Name: deposits deposits_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_pkey PRIMARY KEY (id);


--
-- Name: loan_types loan_types_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.loan_types
    ADD CONSTRAINT loan_types_pkey PRIMARY KEY (id);


--
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: Accounts fk_accounts_customer_id; Type: FK CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Accounts"
    ADD CONSTRAINT fk_accounts_customer_id FOREIGN KEY (customer_id) REFERENCES banking_new."Customers"(customer_id) ON DELETE CASCADE;


--
-- Name: Cards fk_cards_customer_id; Type: FK CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Cards"
    ADD CONSTRAINT fk_cards_customer_id FOREIGN KEY (customer_id) REFERENCES banking_new."Customers"(customer_id) ON DELETE CASCADE;


--
-- Name: Customers fk_customers_branch_id; Type: FK CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Customers"
    ADD CONSTRAINT fk_customers_branch_id FOREIGN KEY (branch_id) REFERENCES banking_new."Branches"(branch_id) ON DELETE CASCADE;


--
-- Name: Deposits fk_deposits_customer_id; Type: FK CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Deposits"
    ADD CONSTRAINT fk_deposits_customer_id FOREIGN KEY (customer_id) REFERENCES banking_new."Customers"(customer_id) ON DELETE CASCADE;


--
-- Name: Deposits fk_deposits_deposit_type_id; Type: FK CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Deposits"
    ADD CONSTRAINT fk_deposits_deposit_type_id FOREIGN KEY (deposit_type_id) REFERENCES banking_new."DepositTypes"(deposit_type_id) ON DELETE CASCADE;


--
-- Name: Loans fk_loans_customer_id; Type: FK CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Loans"
    ADD CONSTRAINT fk_loans_customer_id FOREIGN KEY (customer_id) REFERENCES banking_new."Customers"(customer_id) ON DELETE CASCADE;


--
-- Name: Loans fk_loans_loan_type_id; Type: FK CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Loans"
    ADD CONSTRAINT fk_loans_loan_type_id FOREIGN KEY (loan_type_id) REFERENCES banking_new."LoanTypes"(loan_type_id) ON DELETE CASCADE;


--
-- Name: Transactions fk_transactions_account_id; Type: FK CONSTRAINT; Schema: banking_new; Owner: phamdinhkhanh
--

ALTER TABLE ONLY banking_new."Transactions"
    ADD CONSTRAINT fk_transactions_account_id FOREIGN KEY (account_id) REFERENCES banking_new."Accounts"(account_id) ON DELETE CASCADE;


--
-- Name: accounts accounts_cus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: cards cards_cus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: customers customers_brc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_brc_fkey FOREIGN KEY (brc) REFERENCES public.branches(id) ON DELETE RESTRICT;


--
-- Name: deposits deposits_cus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: deposits deposits_de_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.deposits
    ADD CONSTRAINT deposits_de_type_id_fkey FOREIGN KEY (de_type_id) REFERENCES public.deposit_types(id) ON DELETE RESTRICT;


--
-- Name: loans loans_cus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_cus_id_fkey FOREIGN KEY (cus_id) REFERENCES public.customers(id) ON DELETE CASCADE;


--
-- Name: loans loans_ln_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_ln_type_id_fkey FOREIGN KEY (ln_type_id) REFERENCES public.loan_types(id) ON DELETE RESTRICT;


--
-- Name: transactions transactions_acc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: phamdinhkhanh
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_acc_id_fkey FOREIGN KEY (acc_id) REFERENCES public.accounts(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict JlRRZmlLXc0TWMO67DWyh0zEt7c2THzMpjBzzTqmfYcgQmqdqL0OFHUeYGhIULw

