--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.13
-- Dumped by pg_dump version 9.3.13
-- Started on 2016-06-10 18:16:29 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 16862)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(32) NOT NULL,
    password character varying(64) NOT NULL,
    firstname character varying(64) NOT NULL,
    lastname character varying(64) NOT NULL,
    email character varying(128) NOT NULL,
    phone character varying(11),
    address text,
    salt character(10) NOT NULL,
    newpassword character varying(64),
    _roles text,
    auth_key character varying(64),
    access_token character varying(64)
);


--
-- TOC entry 172 (class 1259 OID 16860)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1951 (class 0 OID 0)
-- Dependencies: 172
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 1835 (class 2604 OID 16865)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1946 (class 0 OID 16862)
-- Dependencies: 173
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users (id, username, password, firstname, lastname, email, phone, address, salt, newpassword, _roles, auth_key, access_token) VALUES (40, 'admin', 'SKUCsJUL7pJiw', 'Admin', 'Nimda', 'webmaster@home.local.one', '11223322223', 'The city.', 'SK!Qcbs-6"', NULL, 'admin', NULL, NULL);
INSERT INTO users (id, username, password, firstname, lastname, email, phone, address, salt, newpassword, _roles, auth_key, access_token) VALUES (37, 'customer', 'c0VZfJcNaWpkA', 'Cust', 'Omer', 'customer@home.local.one', '10223322223', 'Краснодар. улю Рабочая.', 'c038c9fdc5', NULL, NULL, NULL, NULL);


--
-- TOC entry 1952 (class 0 OID 0)
-- Dependencies: 172
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 1837 (class 2606 OID 16870)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2016-06-10 18:16:29 MSK

--
-- PostgreSQL database dump complete
--

