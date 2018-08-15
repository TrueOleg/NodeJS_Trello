--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.5.13

-- Started on 2018-08-15 07:26:28 +03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16531)
-- Name: boards; Type: TABLE; Schema: public; Owner: oleg
--

CREATE TABLE public.boards (
    title character varying,
    user_id bigint,
    id bigint NOT NULL,
    secret character varying
);


ALTER TABLE public.boards OWNER TO oleg;

--
-- TOC entry 184 (class 1259 OID 16539)
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE public.boards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_id_seq OWNER TO oleg;

--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 184
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;


--
-- TOC entry 186 (class 1259 OID 16587)
-- Name: tasks; Type: TABLE; Schema: public; Owner: oleg
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    board_id bigint,
    title character varying,
    content character varying,
    status character varying,
    "position" bigint
);


ALTER TABLE public.tasks OWNER TO oleg;

--
-- TOC entry 185 (class 1259 OID 16585)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO oleg;

--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 185
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- TOC entry 182 (class 1259 OID 16403)
-- Name: users; Type: TABLE; Schema: public; Owner: oleg
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    avatar character varying,
    password character varying,
    email character varying
);


ALTER TABLE public.users OWNER TO oleg;

--
-- TOC entry 181 (class 1259 OID 16401)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: oleg
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO oleg;

--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 181
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oleg
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2038 (class 2604 OID 16541)
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 16590)
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 16406)
-- Name: id; Type: DEFAULT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2043 (class 2606 OID 16549)
-- Name: boards_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 16595)
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 2041 (class 2606 OID 16442)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: oleg
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE boards; Type: ACL; Schema: public; Owner: oleg
--

REVOKE ALL ON TABLE public.boards FROM PUBLIC;
REVOKE ALL ON TABLE public.boards FROM oleg;
GRANT ALL ON TABLE public.boards TO oleg;
GRANT ALL ON TABLE public.boards TO PUBLIC;


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 186
-- Name: TABLE tasks; Type: ACL; Schema: public; Owner: oleg
--

REVOKE ALL ON TABLE public.tasks FROM PUBLIC;
REVOKE ALL ON TABLE public.tasks FROM oleg;
GRANT ALL ON TABLE public.tasks TO oleg;
GRANT ALL ON TABLE public.tasks TO PUBLIC;


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 182
-- Name: TABLE users; Type: ACL; Schema: public; Owner: oleg
--

REVOKE ALL ON TABLE public.users FROM PUBLIC;
REVOKE ALL ON TABLE public.users FROM oleg;
GRANT ALL ON TABLE public.users TO oleg;
GRANT ALL ON TABLE public.users TO PUBLIC;


--
-- TOC entry 1648 (class 826 OID 16400)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: oleg
--

ALTER DEFAULT PRIVILEGES FOR ROLE oleg REVOKE ALL ON TABLES  FROM PUBLIC;
ALTER DEFAULT PRIVILEGES FOR ROLE oleg REVOKE ALL ON TABLES  FROM oleg;
ALTER DEFAULT PRIVILEGES FOR ROLE oleg GRANT ALL ON TABLES  TO oleg;
ALTER DEFAULT PRIVILEGES FOR ROLE oleg GRANT ALL ON TABLES  TO PUBLIC;


-- Completed on 2018-08-15 07:26:28 +03

--
-- PostgreSQL database dump complete
--

