--
-- PostgreSQL database dump
--

\restrict SgfrDpNtsT0CUUULPuYDmwhT2HtzQa1haT9qVJfyW0Qbxw8TF0elclXQc7Xdeas

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-03-18 09:50:51

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

DROP DATABASE vgpl_ems_backend;
--
-- TOC entry 5027 (class 1262 OID 29798)
-- Name: vgpl_ems_backend; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE vgpl_ems_backend WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE vgpl_ems_backend OWNER TO postgres;

\unrestrict SgfrDpNtsT0CUUULPuYDmwhT2HtzQa1haT9qVJfyW0Qbxw8TF0elclXQc7Xdeas
\connect vgpl_ems_backend
\restrict SgfrDpNtsT0CUUULPuYDmwhT2HtzQa1haT9qVJfyW0Qbxw8TF0elclXQc7Xdeas

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 29819)
-- Name: meter_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meter_mapping (
    meter_id integer NOT NULL,
    meter_name character varying(50),
    meter_db character varying(50),
    meter_panel character varying(100),
    meter_location character varying(100)
);


ALTER TABLE public.meter_mapping OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 29818)
-- Name: meter_mapping_meter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meter_mapping_meter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.meter_mapping_meter_id_seq OWNER TO postgres;

--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 221
-- Name: meter_mapping_meter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meter_mapping_meter_id_seq OWNED BY public.meter_mapping.meter_id;


--
-- TOC entry 220 (class 1259 OID 29800)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    password_hash text NOT NULL,
    user_role character varying(30) DEFAULT 'user'::character varying NOT NULL,
    last_login_at timestamp with time zone,
    password_changed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 29799)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4864 (class 2604 OID 29822)
-- Name: meter_mapping meter_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meter_mapping ALTER COLUMN meter_id SET DEFAULT nextval('public.meter_mapping_meter_id_seq'::regclass);


--
-- TOC entry 5021 (class 0 OID 29819)
-- Dependencies: 222
-- Data for Name: meter_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.meter_mapping VALUES (18, NULL, 'db5g2m3', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (19, NULL, 'db5g2m4', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (20, NULL, 'db5g2m5', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (21, NULL, 'db5g2m6', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (22, NULL, 'db5g2m7', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (23, NULL, 'db5g2m8', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (24, NULL, 'db5g2m9', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (25, NULL, 'db5g3m1', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (26, NULL, 'db5g3m10', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (27, NULL, 'db5g3m11', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (28, NULL, 'db5g3m12', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (29, NULL, 'db5g3m2', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (30, NULL, 'db5g3m3', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (31, NULL, 'db5g3m4', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (32, NULL, 'db5g3m5', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (33, NULL, 'db5g3m6', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (34, NULL, 'db5g3m7', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (35, NULL, 'db5g3m8', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (36, NULL, 'db5g3m9', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (37, NULL, 'db5g4m1', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (38, NULL, 'db5g4m10', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (39, NULL, 'db5g4m11', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (40, NULL, 'db5g4m12', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (41, NULL, 'db5g4m2', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (42, NULL, 'db5g4m3', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (43, NULL, 'db5g4m4', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (44, NULL, 'db5g4m5', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (45, NULL, 'db5g4m6', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (46, NULL, 'db5g4m7', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (47, NULL, 'db5g4m8', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (48, NULL, 'db5g4m9', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (49, NULL, 'db5g5m1', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (50, NULL, 'db5g5m10', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (51, NULL, 'db5g5m11', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (52, NULL, 'db5g5m12', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (53, NULL, 'db5g5m2', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (54, NULL, 'db5g5m3', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (55, NULL, 'db5g5m4', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (56, NULL, 'db5g5m5', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (57, NULL, 'db5g5m6', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (58, NULL, 'db5g5m7', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (59, NULL, 'db5g5m8', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (60, NULL, 'db5g5m9', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (61, NULL, 'db5g6m1', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (62, NULL, 'db5g6m10', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (63, NULL, 'db5g6m11', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (64, NULL, 'db5g6m12', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (65, NULL, 'db5g6m2', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (66, NULL, 'db5g6m3', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (67, NULL, 'db5g6m4', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (68, NULL, 'db5g6m5', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (69, NULL, 'db5g6m6', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (70, NULL, 'db5g6m7', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (71, NULL, 'db5g6m8', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (72, NULL, 'db5g6m9', NULL, 'location1');
INSERT INTO public.meter_mapping VALUES (3, 'SPARE', 'db5g1m11', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (4, 'SPARE', 'db5g1m12', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (5, 'HT1METER2', 'db5g1m2', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (6, 'HT1METER3', 'db5g1m3', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (7, 'HT1METER4', 'db5g1m4', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (9, 'HT1METER6', 'db5g1m6', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (10, 'HT1METER7', 'db5g1m7', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (11, 'HT1METER8', 'db5g1m8', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (12, 'HT1METER9', 'db5g1m9', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (13, 'PCC1METER1', 'db5g2m1', 'PCC01', 'location1');
INSERT INTO public.meter_mapping VALUES (2, 'HT1METER10', 'db5g1m10', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (14, 'PCC1METER10', 'db5g2m10', 'PCC01', 'location1');
INSERT INTO public.meter_mapping VALUES (15, 'PCC1METER11', 'db5g2m11', 'PCC01', 'location1');
INSERT INTO public.meter_mapping VALUES (16, 'PCC1METER12', 'db5g2m12', 'PCC01', 'location1');
INSERT INTO public.meter_mapping VALUES (17, 'PCC1METER2', 'db5g2m2', 'PCC01', 'location1');
INSERT INTO public.meter_mapping VALUES (1, 'HT1METER5', 'db5g1m1', 'HT01', 'location1');
INSERT INTO public.meter_mapping VALUES (8, 'HT1METER', 'db5g1m5', 'HT01', 'location1');


--
-- TOC entry 5019 (class 0 OID 29800)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (1, 'pritesh', '1234hhj', 'user', NULL, NULL, '2026-02-01 10:13:39.306931+05:30', '2026-02-01 10:13:39.306931+05:30');
INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (2, 'sam', '1234sam', 'user', NULL, NULL, '2026-02-01 10:13:53.316187+05:30', '2026-02-01 10:13:53.316187+05:30');


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 221
-- Name: meter_mapping_meter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meter_mapping_meter_id_seq', 72, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4870 (class 2606 OID 29829)
-- Name: meter_mapping meter_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meter_mapping
    ADD CONSTRAINT meter_mapping_pkey PRIMARY KEY (meter_id);


--
-- TOC entry 4866 (class 2606 OID 29815)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 29817)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


-- Completed on 2026-03-18 09:50:51

--
-- PostgreSQL database dump complete
--

\unrestrict SgfrDpNtsT0CUUULPuYDmwhT2HtzQa1haT9qVJfyW0Qbxw8TF0elclXQc7Xdeas

