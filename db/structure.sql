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
-- Name: comments_schema; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA comments_schema;


--
-- Name: posts_schema; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA posts_schema;


SET default_tablespace = '';

--
-- Name: comments; Type: TABLE; Schema: comments_schema; Owner: -
--

CREATE TABLE comments_schema.comments (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    body character varying,
    deleted boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: comments_schema; Owner: -
--

CREATE SEQUENCE comments_schema.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: comments_schema; Owner: -
--

ALTER SEQUENCE comments_schema.comments_id_seq OWNED BY comments_schema.comments.id;


--
-- Name: posts; Type: TABLE; Schema: posts_schema; Owner: -
--

CREATE TABLE posts_schema.posts (
    id bigint NOT NULL,
    title character varying,
    body character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: posts_schema; Owner: -
--

CREATE SEQUENCE posts_schema.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: posts_schema; Owner: -
--

ALTER SEQUENCE posts_schema.posts_id_seq OWNED BY posts_schema.posts.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: comments id; Type: DEFAULT; Schema: comments_schema; Owner: -
--

ALTER TABLE ONLY comments_schema.comments ALTER COLUMN id SET DEFAULT nextval('comments_schema.comments_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: posts_schema; Owner: -
--

ALTER TABLE ONLY posts_schema.posts ALTER COLUMN id SET DEFAULT nextval('posts_schema.posts_id_seq'::regclass);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: comments_schema; Owner: -
--

ALTER TABLE ONLY comments_schema.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: posts_schema; Owner: -
--

ALTER TABLE ONLY posts_schema.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_comments_schema.comments_on_post_id; Type: INDEX; Schema: comments_schema; Owner: -
--

CREATE INDEX "index_comments_schema.comments_on_post_id" ON comments_schema.comments USING btree (post_id);


--
-- Name: comments fk_rails_fa20f4e7fb; Type: FK CONSTRAINT; Schema: comments_schema; Owner: -
--

ALTER TABLE ONLY comments_schema.comments
    ADD CONSTRAINT fk_rails_fa20f4e7fb FOREIGN KEY (post_id) REFERENCES posts_schema.posts(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210406162838'),
('20210406162908');


