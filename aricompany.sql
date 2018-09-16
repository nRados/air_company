--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aircraft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aircraft (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.aircraft OWNER TO postgres;

--
-- Name: aircraft_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aircraft_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aircraft_id_seq OWNER TO postgres;

--
-- Name: aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aircraft_id_seq OWNED BY public.aircraft.id;


--
-- Name: crew_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crew_member (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.crew_member OWNER TO postgres;

--
-- Name: crew_member_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crew_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crew_member_id_seq OWNER TO postgres;

--
-- Name: crew_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crew_member_id_seq OWNED BY public.crew_member.id;


--
-- Name: leastexperienced; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leastexperienced (
    id bigint,
    name character varying(50),
    age integer,
    highest_countair bigint
);


ALTER TABLE public.leastexperienced OWNER TO postgres;

--
-- Name: members_aircrafts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members_aircrafts (
    id_cm bigint NOT NULL,
    id_air bigint NOT NULL
);


ALTER TABLE public.members_aircrafts OWNER TO postgres;

--
-- Name: members_aircrafts_id_air_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_aircrafts_id_air_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_aircrafts_id_air_seq OWNER TO postgres;

--
-- Name: members_aircrafts_id_air_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_aircrafts_id_air_seq OWNED BY public.members_aircrafts.id_air;


--
-- Name: members_aircrafts_id_cm_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_aircrafts_id_cm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_aircrafts_id_cm_seq OWNER TO postgres;

--
-- Name: members_aircrafts_id_cm_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_aircrafts_id_cm_seq OWNED BY public.members_aircrafts.id_cm;


--
-- Name: mostexperienced; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mostexperienced (
    id bigint,
    name character varying(50),
    age integer,
    highest_countair bigint
);


ALTER TABLE public.mostexperienced OWNER TO postgres;

--
-- Name: oldest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oldest (
    name character varying(50),
    age integer
);


ALTER TABLE public.oldest OWNER TO postgres;

--
-- Name: aircraft id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircraft ALTER COLUMN id SET DEFAULT nextval('public.aircraft_id_seq'::regclass);


--
-- Name: crew_member id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crew_member ALTER COLUMN id SET DEFAULT nextval('public.crew_member_id_seq'::regclass);


--
-- Name: members_aircrafts id_cm; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members_aircrafts ALTER COLUMN id_cm SET DEFAULT nextval('public.members_aircrafts_id_cm_seq'::regclass);


--
-- Name: members_aircrafts id_air; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members_aircrafts ALTER COLUMN id_air SET DEFAULT nextval('public.members_aircrafts_id_air_seq'::regclass);


--
-- Name: aircraft aircraft_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);


--
-- Name: crew_member crew_member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crew_member
    ADD CONSTRAINT crew_member_pkey PRIMARY KEY (id);


--
-- Name: members_aircrafts members_aircrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members_aircrafts
    ADD CONSTRAINT members_aircrafts_pkey PRIMARY KEY (id_cm, id_air);


--
-- Name: members_aircrafts members_aircrafts_id_air_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members_aircrafts
    ADD CONSTRAINT members_aircrafts_id_air_fkey FOREIGN KEY (id_air) REFERENCES public.aircraft(id);


--
-- Name: members_aircrafts members_aircrafts_id_cm_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members_aircrafts
    ADD CONSTRAINT members_aircrafts_id_cm_fkey FOREIGN KEY (id_cm) REFERENCES public.crew_member(id);


--
-- PostgreSQL database dump complete
--

