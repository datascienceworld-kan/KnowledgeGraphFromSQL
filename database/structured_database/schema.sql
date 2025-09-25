--
-- PostgreSQL database dump
--

\restrict U0TJLXuECyU4XNTIzpCSd5cdb8YACscEV8bY48sdPiFT7I7e6t2lj3ZqigFMh4g

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

\unrestrict U0TJLXuECyU4XNTIzpCSd5cdb8YACscEV8bY48sdPiFT7I7e6t2lj3ZqigFMh4g

