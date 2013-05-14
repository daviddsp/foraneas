--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.9
-- Dumped by pg_dump version 9.1.9
-- Started on 2013-05-13 20:32:11 VET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 167 (class 3079 OID 11644)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1883 (class 0 OID 0)
-- Dependencies: 167
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 164 (class 1259 OID 20783)
-- Dependencies: 5
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado (
    id integer NOT NULL,
    nombre_estado character(80) NOT NULL,
    id_estado integer,
    nb_municipio character(1)
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 20777)
-- Dependencies: 5
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_id_seq OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 20781)
-- Dependencies: 164 5
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estados_id_seq OWNER TO postgres;

--
-- TOC entry 1885 (class 0 OID 0)
-- Dependencies: 163
-- Name: estados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estados_id_seq OWNED BY estado.id;


--
-- TOC entry 166 (class 1259 OID 20791)
-- Dependencies: 5
-- Name: municipio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE municipio (
    id integer NOT NULL,
    id_estado integer NOT NULL,
    nb_municipio character(80) NOT NULL
);


ALTER TABLE public.municipio OWNER TO postgres;

--
-- TOC entry 162 (class 1259 OID 20779)
-- Dependencies: 5
-- Name: municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipio_id_seq OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 20789)
-- Dependencies: 5 166
-- Name: new_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE new_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_table_id_seq OWNER TO postgres;

--
-- TOC entry 1886 (class 0 OID 0)
-- Dependencies: 165
-- Name: new_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE new_table_id_seq OWNED BY municipio.id;


--
-- TOC entry 1863 (class 2604 OID 20786)
-- Dependencies: 164 163 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estado ALTER COLUMN id SET DEFAULT nextval('estados_id_seq'::regclass);


--
-- TOC entry 1864 (class 2604 OID 20794)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipio ALTER COLUMN id SET DEFAULT nextval('new_table_id_seq'::regclass);


--
-- TOC entry 1873 (class 0 OID 20783)
-- Dependencies: 164 1876
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado (id, nombre_estado, id_estado, nb_municipio) FROM stdin;
20	Dto.Capital                                                                     	\N	\N
\.


--
-- TOC entry 1887 (class 0 OID 0)
-- Dependencies: 161
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estado_id_seq', 1, false);


--
-- TOC entry 1888 (class 0 OID 0)
-- Dependencies: 163
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estados_id_seq', 20, true);


--
-- TOC entry 1875 (class 0 OID 20791)
-- Dependencies: 166 1876
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY municipio (id, id_estado, nb_municipio) FROM stdin;
20	20	Libertador                                                                      
\.


--
-- TOC entry 1889 (class 0 OID 0)
-- Dependencies: 162
-- Name: municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('municipio_id_seq', 1, false);


--
-- TOC entry 1890 (class 0 OID 0)
-- Dependencies: 165
-- Name: new_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('new_table_id_seq', 20, true);


--
-- TOC entry 1866 (class 2606 OID 20788)
-- Dependencies: 164 164 1877
-- Name: estados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- TOC entry 1868 (class 2606 OID 20796)
-- Dependencies: 166 166 1877
-- Name: new_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT new_table_pkey PRIMARY KEY (id);


--
-- TOC entry 1869 (class 2606 OID 20813)
-- Dependencies: 164 166 1865 1877
-- Name: new_table_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipio
    ADD CONSTRAINT new_table_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES estado(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 1882 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 1884 (class 0 OID 0)
-- Dependencies: 164
-- Name: estado; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE estado FROM PUBLIC;
REVOKE ALL ON TABLE estado FROM postgres;
GRANT ALL ON TABLE estado TO postgres;
GRANT ALL ON TABLE estado TO PUBLIC;


--
-- TOC entry 1426 (class 826 OID 20846)
-- Dependencies: 1877
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres REVOKE ALL ON TABLES  FROM postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO PUBLIC;


-- Completed on 2013-05-13 20:32:11 VET

--
-- PostgreSQL database dump complete
--

