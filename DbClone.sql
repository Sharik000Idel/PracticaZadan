--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-24 14:23:33

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
-- TOC entry 3334 (class 1262 OID 16407)
-- Name: DataBasaPractic; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "DataBasaPractic" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE "DataBasaPractic" OWNER TO postgres;

\connect "DataBasaPractic"

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
-- TOC entry 214 (class 1259 OID 16415)
-- Name: Brans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Brans" (
    "ID_Brands" integer NOT NULL,
    "Name" text,
    "Active" boolean
);


ALTER TABLE public."Brans" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24576)
-- Name: Brans_ID_Brands_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Brans" ALTER COLUMN "ID_Brands" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Brans_ID_Brands_seq"
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16422)
-- Name: Models; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Models" (
    "ID_Models" integer NOT NULL,
    "Brand_ID" integer,
    "Name" text,
    "Active" boolean
);


ALTER TABLE public."Models" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24578)
-- Name: Models_ID_Models_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Models" ALTER COLUMN "ID_Models" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Models_ID_Models_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1
);


--
-- TOC entry 3325 (class 0 OID 16415)
-- Dependencies: 214
-- Data for Name: Brans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Brans" ("ID_Brands", "Name", "Active") OVERRIDING SYSTEM VALUE VALUES (1, 'BMW', true);
INSERT INTO public."Brans" ("ID_Brands", "Name", "Active") OVERRIDING SYSTEM VALUE VALUES (2, 'Tesla', true);
INSERT INTO public."Brans" ("ID_Brands", "Name", "Active") OVERRIDING SYSTEM VALUE VALUES (3, 'Nissan', true);
INSERT INTO public."Brans" ("ID_Brands", "Name", "Active") OVERRIDING SYSTEM VALUE VALUES (4, 'Audi', true);
INSERT INTO public."Brans" ("ID_Brands", "Name", "Active") OVERRIDING SYSTEM VALUE VALUES (5, 'Lada', true);


--
-- TOC entry 3326 (class 0 OID 16422)
-- Dependencies: 215
-- Data for Name: Models; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (1, 1, 'X7', true);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (2, 1, 'iX M60', true);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (3, 1, 'iX', true);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (4, 1, 'BMW X5 M', true);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (5, 2, 'Model E', true);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (6, 2, 'Model 3', true);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (7, 2, 'Model S', true);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (8, 5, 'Granta', false);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (10, 4, 'r8', true);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (11, 1, 'X71', false);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (13, 5, 'qwe22', false);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (12, 5, 'qwer2', false);
INSERT INTO public."Models" ("ID_Models", "Brand_ID", "Name", "Active") VALUES (9, 3, 'skyline', false);


--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 216
-- Name: Brans_ID_Brands_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Brans_ID_Brands_seq"', 5, true);


--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 217
-- Name: Models_ID_Models_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Models_ID_Models_seq"', 10, true);


--
-- TOC entry 3179 (class 2606 OID 16421)
-- Name: Brans Brans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Brans"
    ADD CONSTRAINT "Brans_pkey" PRIMARY KEY ("ID_Brands");


--
-- TOC entry 3181 (class 2606 OID 32769)
-- Name: Models Models_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Models"
    ADD CONSTRAINT "Models_pkey" PRIMARY KEY ("ID_Models");


--
-- TOC entry 3182 (class 2606 OID 16429)
-- Name: Models Models_Brand_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Models"
    ADD CONSTRAINT "Models_Brand_ID_fkey" FOREIGN KEY ("Brand_ID") REFERENCES public."Brans"("ID_Brands") NOT VALID;


-- Completed on 2023-03-24 14:23:34

--
-- PostgreSQL database dump complete
--

