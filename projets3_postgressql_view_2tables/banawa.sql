--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-05 08:22:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16760)
-- Name: rmbanawa; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA rmbanawa;


ALTER SCHEMA rmbanawa OWNER TO datama2mi181;

SET default_tablespace = '';

--
-- TOC entry 365 (class 1259 OID 23279)
-- Name: client; Type: TABLE; Schema: rmbanawa; Owner: datama2mi181
--

CREATE TABLE rmbanawa.client (
    client_id integer NOT NULL,
    client_fname character varying(28) NOT NULL,
    client_lname character varying(28) NOT NULL,
    client_address character varying(28) NOT NULL,
    client_phone integer NOT NULL
);


ALTER TABLE rmbanawa.client OWNER TO datama2mi181;

--
-- TOC entry 364 (class 1259 OID 23277)
-- Name: client_client_id_seq; Type: SEQUENCE; Schema: rmbanawa; Owner: datama2mi181
--

CREATE SEQUENCE rmbanawa.client_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rmbanawa.client_client_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 364
-- Name: client_client_id_seq; Type: SEQUENCE OWNED BY; Schema: rmbanawa; Owner: datama2mi181
--

ALTER SEQUENCE rmbanawa.client_client_id_seq OWNED BY rmbanawa.client.client_id;


--
-- TOC entry 367 (class 1259 OID 23290)
-- Name: purchase_order; Type: TABLE; Schema: rmbanawa; Owner: datama2mi181
--

CREATE TABLE rmbanawa.purchase_order (
    purchase_id integer NOT NULL,
    print_material character varying(50),
    print_method character varying(50),
    print_color character varying(28),
    print_size character varying(28),
    date date,
    print_quantity integer
);


ALTER TABLE rmbanawa.purchase_order OWNER TO datama2mi181;

--
-- TOC entry 368 (class 1259 OID 23296)
-- Name: client_purchase; Type: VIEW; Schema: rmbanawa; Owner: datama2mi181
--

CREATE VIEW rmbanawa.client_purchase AS
 SELECT client.client_id,
    client.client_fname,
    client.client_lname,
    purchase_order.purchase_id,
    purchase_order.print_color,
    purchase_order.print_material
   FROM (rmbanawa.client
     JOIN rmbanawa.purchase_order ON ((client.client_id = purchase_order.purchase_id)));


ALTER TABLE rmbanawa.client_purchase OWNER TO datama2mi181;

--
-- TOC entry 366 (class 1259 OID 23288)
-- Name: purchase_order_purchase_id_seq; Type: SEQUENCE; Schema: rmbanawa; Owner: datama2mi181
--

CREATE SEQUENCE rmbanawa.purchase_order_purchase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rmbanawa.purchase_order_purchase_id_seq OWNER TO datama2mi181;

--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 366
-- Name: purchase_order_purchase_id_seq; Type: SEQUENCE OWNED BY; Schema: rmbanawa; Owner: datama2mi181
--

ALTER SEQUENCE rmbanawa.purchase_order_purchase_id_seq OWNED BY rmbanawa.purchase_order.purchase_id;


--
-- TOC entry 3274 (class 2604 OID 23282)
-- Name: client client_id; Type: DEFAULT; Schema: rmbanawa; Owner: datama2mi181
--

ALTER TABLE ONLY rmbanawa.client ALTER COLUMN client_id SET DEFAULT nextval('rmbanawa.client_client_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 23293)
-- Name: purchase_order purchase_id; Type: DEFAULT; Schema: rmbanawa; Owner: datama2mi181
--

ALTER TABLE ONLY rmbanawa.purchase_order ALTER COLUMN purchase_id SET DEFAULT nextval('rmbanawa.purchase_order_purchase_id_seq'::regclass);


--
-- TOC entry 3423 (class 0 OID 23279)
-- Dependencies: 365
-- Data for Name: client; Type: TABLE DATA; Schema: rmbanawa; Owner: datama2mi181
--

INSERT INTO rmbanawa.client VALUES (1, 'rovyyc', 'banawa', 'makati city', 912345678);


--
-- TOC entry 3425 (class 0 OID 23290)
-- Dependencies: 367
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: rmbanawa; Owner: datama2mi181
--

INSERT INTO rmbanawa.purchase_order VALUES (1, 'pvc sheet', 'silk printing', 'red', '28x28', '2019-10-05', 2);
INSERT INTO rmbanawa.purchase_order VALUES (2, 'HQ paper', 'laser print', 'black', '12x12', '2001-10-05', 5);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 364
-- Name: client_client_id_seq; Type: SEQUENCE SET; Schema: rmbanawa; Owner: datama2mi181
--

SELECT pg_catalog.setval('rmbanawa.client_client_id_seq', 2, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 366
-- Name: purchase_order_purchase_id_seq; Type: SEQUENCE SET; Schema: rmbanawa; Owner: datama2mi181
--

SELECT pg_catalog.setval('rmbanawa.purchase_order_purchase_id_seq', 2, true);


--
-- TOC entry 3277 (class 2606 OID 23284)
-- Name: client client_pk; Type: CONSTRAINT; Schema: rmbanawa; Owner: datama2mi181
--

ALTER TABLE ONLY rmbanawa.client
    ADD CONSTRAINT client_pk PRIMARY KEY (client_id);


--
-- TOC entry 3279 (class 2606 OID 23295)
-- Name: purchase_order purchase_order_pk; Type: CONSTRAINT; Schema: rmbanawa; Owner: datama2mi181
--

ALTER TABLE ONLY rmbanawa.purchase_order
    ADD CONSTRAINT purchase_order_pk PRIMARY KEY (purchase_id);


--
-- TOC entry 3280 (class 2606 OID 24920)
-- Name: client client_fk; Type: FK CONSTRAINT; Schema: rmbanawa; Owner: datama2mi181
--

ALTER TABLE ONLY rmbanawa.client
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES rmbanawa.purchase_order(purchase_id);


-- Completed on 2019-12-05 08:22:13

--
-- PostgreSQL database dump complete
--

