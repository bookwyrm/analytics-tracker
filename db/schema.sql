--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

DROP INDEX public.unique_schema_migrations;
DROP INDEX public.index_users_on_reset_password_token;
DROP INDEX public.index_users_on_email;
DROP INDEX public.index_users_on_account_id;
DROP INDEX public.index_sites_on_account_id;
DROP INDEX public.index_analytics_entries_on_site_id;
DROP INDEX public.index_accounts_on_account_owner_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.sites DROP CONSTRAINT sites_pkey;
ALTER TABLE ONLY public.analytics_entries DROP CONSTRAINT analytics_entries_pkey;
ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sites ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.analytics_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.sites_id_seq;
DROP TABLE public.sites;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.analytics_entries_id_seq;
DROP TABLE public.analytics_entries;
DROP SEQUENCE public.accounts_id_seq;
DROP TABLE public.accounts;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: matt
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO matt;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: matt
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: matt; Tablespace: 
--

CREATE TABLE accounts (
    id bigint NOT NULL,
    company_name character varying(255),
    primary_timezone character varying(255),
    account_owner_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sharding_key bigint
);


ALTER TABLE public.accounts OWNER TO matt;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO matt;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: analytics_entries; Type: TABLE; Schema: public; Owner: matt; Tablespace: 
--

CREATE TABLE analytics_entries (
    id integer NOT NULL,
    site_id integer,
    url character varying(255),
    user_agent character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.analytics_entries OWNER TO matt;

--
-- Name: analytics_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE analytics_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_entries_id_seq OWNER TO matt;

--
-- Name: analytics_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE analytics_entries_id_seq OWNED BY analytics_entries.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: matt; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO matt;

--
-- Name: sites; Type: TABLE; Schema: public; Owner: matt; Tablespace: 
--

CREATE TABLE sites (
    id integer NOT NULL,
    account_id integer,
    domain_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sites OWNER TO matt;

--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_id_seq OWNER TO matt;

--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE sites_id_seq OWNED BY sites.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: matt; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    account_id integer
);


ALTER TABLE public.users OWNER TO matt;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO matt;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY analytics_entries ALTER COLUMN id SET DEFAULT nextval('analytics_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY sites ALTER COLUMN id SET DEFAULT nextval('sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: matt; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: analytics_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: matt; Tablespace: 
--

ALTER TABLE ONLY analytics_entries
    ADD CONSTRAINT analytics_entries_pkey PRIMARY KEY (id);


--
-- Name: sites_pkey; Type: CONSTRAINT; Schema: public; Owner: matt; Tablespace: 
--

ALTER TABLE ONLY sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: matt; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_accounts_on_account_owner_id; Type: INDEX; Schema: public; Owner: matt; Tablespace: 
--

CREATE INDEX index_accounts_on_account_owner_id ON accounts USING btree (account_owner_id);


--
-- Name: index_analytics_entries_on_site_id; Type: INDEX; Schema: public; Owner: matt; Tablespace: 
--

CREATE INDEX index_analytics_entries_on_site_id ON analytics_entries USING btree (site_id);


--
-- Name: index_sites_on_account_id; Type: INDEX; Schema: public; Owner: matt; Tablespace: 
--

CREATE INDEX index_sites_on_account_id ON sites USING btree (account_id);


--
-- Name: index_users_on_account_id; Type: INDEX; Schema: public; Owner: matt; Tablespace: 
--

CREATE INDEX index_users_on_account_id ON users USING btree (account_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: matt; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: matt; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: matt; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: matt
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM matt;
GRANT ALL ON SCHEMA public TO matt;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

