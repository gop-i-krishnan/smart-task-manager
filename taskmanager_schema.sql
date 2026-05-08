--
-- PostgreSQL database dump
--

\restrict tGW6Qa580SKZ6fbdecUj0mtxzNf9zW5391oMFIoZkfI4riaGcDzXlmbNxg8sWFL

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-08 23:53:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 222 (class 1259 OID 16402)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    priority character varying(50),
    status character varying(50),
    created_date timestamp without time zone
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16401)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 221
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(200) NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 4862 (class 2604 OID 16405)
-- Name: task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- TOC entry 4861 (class 2604 OID 16393)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 5019 (class 0 OID 16402)
-- Dependencies: 222
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task (id, title, description, priority, status, created_date) FROM stdin;
24	Pay Electricity Bill	Complete online payment before due date	Medium	Completed	2026-05-08 17:37:33.164914
25	Workout at gym	Complete 45-minute evening gym	Low	Pending	2026-05-08 17:37:55.463477
26	Prepare for Technical Interview	Practice Python and REST API interview questions	High	Pending	2026-05-08 17:38:25.780359
27	Drink 2L of water	Today itself	Medium	Completed	2026-05-08 17:39:04.498889
28	Buy Groceries	Remember to buy vegetables	Medium	Pending	2026-05-08 17:40:03.991453
\.


--
-- TOC entry 5017 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, password) FROM stdin;
1	alex	scrypt:32768:8:1$eHvnzJHQvxSqqZu5$cdb5aeb28a921ff04b3f02bfaf1415c6db4680b6898234851a2a22a28cbef5a04f3564aa71f9bcd939cd9209dd5f122197122c715b7f64e62395d80c16fbdd23
\.


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 221
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_id_seq', 28, true);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- TOC entry 4868 (class 2606 OID 16411)
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- TOC entry 4864 (class 2606 OID 16398)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 4866 (class 2606 OID 16400)
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


-- Completed on 2026-05-08 23:53:52

--
-- PostgreSQL database dump complete
--

\unrestrict tGW6Qa580SKZ6fbdecUj0mtxzNf9zW5391oMFIoZkfI4riaGcDzXlmbNxg8sWFL

