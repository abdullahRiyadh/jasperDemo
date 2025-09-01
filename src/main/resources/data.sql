--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer_orders; Type: TABLE; Schema: public; Owner: a_r
--

CREATE TABLE public.customer_orders (
    id integer NOT NULL,
    customer_id integer,
    product_name character varying(100) NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total numeric(10,2)
);


ALTER TABLE public.customer_orders OWNER TO a_r;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: a_r
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.customers OWNER TO a_r;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: a_r
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO a_r;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: a_r
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: a_r
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO a_r;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: a_r
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.customer_orders.id;


--
-- Name: customer_orders id; Type: DEFAULT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.customer_orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Data for Name: customer_orders; Type: TABLE DATA; Schema: public; Owner: a_r
--

COPY public.customer_orders (id, customer_id, product_name, quantity, price, order_date, total) FROM stdin;
1	1	Laptop	1	1200.00	2025-08-01 00:00:00	1200.00
2	1	Mouse	2	25.50	2025-08-03 00:00:00	51.00
3	2	Keyboard	1	75.00	2025-08-02 00:00:00	75.00
4	2	Monitor	2	300.00	2025-08-04 00:00:00	600.00
5	3	USB Drive	5	15.00	2025-08-05 00:00:00	75.00
6	4	Headphones	1	150.00	2025-08-06 00:00:00	150.00
7	4	Webcam	1	80.00	2025-08-07 00:00:00	80.00
8	5	Chair	2	200.00	2025-08-08 00:00:00	400.00
9	5	Desk	1	350.00	2025-08-09 00:00:00	350.00
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: a_r
--

COPY public.customers (id, name, email, phone, created_at) FROM stdin;
2	Babu	babu@example.com	555-1002	2025-08-26 11:26:12.010861
3	Azim	azim@example.com	555-1003	2025-08-26 11:26:12.010861
4	Rashik	rashik@example.com	555-1004	2025-08-26 11:26:12.010861
5	Partho	partho@example.com	555-1005	2025-08-26 11:26:12.010861
1	Nasim	nasim@example.com	555-1001	2025-08-26 11:26:12.010861
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: a_r
--

SELECT pg_catalog.setval('public.customers_id_seq', 5, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: a_r
--

SELECT pg_catalog.setval('public.orders_id_seq', 9, true);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customer_orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: customer_orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.customer_orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- PostgreSQL database dump complete
--


