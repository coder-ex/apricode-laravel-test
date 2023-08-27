--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Debian 14.7-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2023-08-27 15:19:47 UTC

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
-- TOC entry 222 (class 1259 OID 33604)
-- Name: game_genre_game; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.game_genre_game (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE public.game_genre_game OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 33603)
-- Name: game_genre_game_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.game_genre_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_genre_game_id_seq OWNER TO admin;

--
-- TOC entry 4038 (class 0 OID 0)
-- Dependencies: 221
-- Name: game_genre_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.game_genre_game_id_seq OWNED BY public.game_genre_game.id;


--
-- TOC entry 220 (class 1259 OID 33591)
-- Name: game_genres; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.game_genres (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL
);


ALTER TABLE public.game_genres OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 33590)
-- Name: game_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.game_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_genres_id_seq OWNER TO admin;

--
-- TOC entry 4039 (class 0 OID 0)
-- Dependencies: 219
-- Name: game_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.game_genres_id_seq OWNED BY public.game_genres.id;


--
-- TOC entry 214 (class 1259 OID 33548)
-- Name: games; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.games OWNER TO admin;

--
-- TOC entry 213 (class 1259 OID 33547)
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO admin;

--
-- TOC entry 4040 (class 0 OID 0)
-- Dependencies: 213
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- TOC entry 210 (class 1259 OID 33486)
-- Name: migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO admin;

--
-- TOC entry 209 (class 1259 OID 33485)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO admin;

--
-- TOC entry 4041 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 212 (class 1259 OID 33536)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO admin;

--
-- TOC entry 211 (class 1259 OID 33535)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO admin;

--
-- TOC entry 4042 (class 0 OID 0)
-- Dependencies: 211
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 218 (class 1259 OID 33574)
-- Name: studio_dev_game; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.studio_dev_game (
    id bigint NOT NULL,
    game_id bigint NOT NULL,
    dev_id bigint NOT NULL
);


ALTER TABLE public.studio_dev_game OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 33573)
-- Name: studio_dev_game_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.studio_dev_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studio_dev_game_id_seq OWNER TO admin;

--
-- TOC entry 4043 (class 0 OID 0)
-- Dependencies: 217
-- Name: studio_dev_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.studio_dev_game_id_seq OWNED BY public.studio_dev_game.id;


--
-- TOC entry 216 (class 1259 OID 33561)
-- Name: studio_devs; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.studio_devs (
    id bigint NOT NULL,
    name character varying(1000) NOT NULL,
    slug character varying(1000) NOT NULL
);


ALTER TABLE public.studio_devs OWNER TO admin;

--
-- TOC entry 215 (class 1259 OID 33560)
-- Name: studio_devs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.studio_devs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studio_devs_id_seq OWNER TO admin;

--
-- TOC entry 4044 (class 0 OID 0)
-- Dependencies: 215
-- Name: studio_devs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.studio_devs_id_seq OWNED BY public.studio_devs.id;


--
-- TOC entry 3846 (class 2604 OID 33607)
-- Name: game_genre_game id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_genre_game ALTER COLUMN id SET DEFAULT nextval('public.game_genre_game_id_seq'::regclass);


--
-- TOC entry 3845 (class 2604 OID 33594)
-- Name: game_genres id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_genres ALTER COLUMN id SET DEFAULT nextval('public.game_genres_id_seq'::regclass);


--
-- TOC entry 3842 (class 2604 OID 33551)
-- Name: games id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- TOC entry 3840 (class 2604 OID 33489)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3841 (class 2604 OID 33539)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3844 (class 2604 OID 33577)
-- Name: studio_dev_game id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.studio_dev_game ALTER COLUMN id SET DEFAULT nextval('public.studio_dev_game_id_seq'::regclass);


--
-- TOC entry 3843 (class 2604 OID 33564)
-- Name: studio_devs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.studio_devs ALTER COLUMN id SET DEFAULT nextval('public.studio_devs_id_seq'::regclass);


--
-- TOC entry 4032 (class 0 OID 33604)
-- Dependencies: 222
-- Data for Name: game_genre_game; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.game_genre_game (id, game_id, genre_id) FROM stdin;
1	1	1
2	1	3
5	3	1
6	3	3
9	2	3
\.


--
-- TOC entry 4030 (class 0 OID 33591)
-- Dependencies: 220
-- Data for Name: game_genres; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.game_genres (id, name, slug) FROM stdin;
1	RPG	rpg
3	new GANRE 2	new-ganre-2
\.


--
-- TOC entry 4024 (class 0 OID 33548)
-- Dependencies: 214
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.games (id, name, slug, created_at, updated_at) FROM stdin;
1	tundra	tundra	2023-08-27 12:14:04	2023-08-27 12:14:04
3	Conter Strike	conter-strike	2023-08-27 12:31:02	2023-08-27 12:31:02
2	Tundra v2	tundra-v-2	2023-08-27 12:15:23	2023-08-27 14:05:11
\.


--
-- TOC entry 4020 (class 0 OID 33486)
-- Dependencies: 210
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migrations (id, migration, batch) FROM stdin;
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2023_08_26_093124_create_games_table	1
7	2023_08_26_093514_create_studio_devs_table	1
8	2023_08_26_093516_create_studio_dev_game_table	1
9	2023_08_26_093528_create_game_genres_table	1
10	2023_08_26_093530_create_game_genre_game_table	1
\.


--
-- TOC entry 4022 (class 0 OID 33536)
-- Dependencies: 212
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4028 (class 0 OID 33574)
-- Dependencies: 218
-- Data for Name: studio_dev_game; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.studio_dev_game (id, game_id, dev_id) FROM stdin;
1	1	1
2	2	1
3	3	1
5	2	3
\.


--
-- TOC entry 4026 (class 0 OID 33561)
-- Dependencies: 216
-- Data for Name: studio_devs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.studio_devs (id, name, slug) FROM stdin;
1	Студия WEB дизайна	studiia-web-dizaina
3	Студия гейм-дизайна	studiia-geim-dizaina
\.


--
-- TOC entry 4045 (class 0 OID 0)
-- Dependencies: 221
-- Name: game_genre_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.game_genre_game_id_seq', 9, true);


--
-- TOC entry 4046 (class 0 OID 0)
-- Dependencies: 219
-- Name: game_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.game_genres_id_seq', 4, true);


--
-- TOC entry 4047 (class 0 OID 0)
-- Dependencies: 213
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.games_id_seq', 3, true);


--
-- TOC entry 4048 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.migrations_id_seq', 10, true);


--
-- TOC entry 4049 (class 0 OID 0)
-- Dependencies: 211
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 4050 (class 0 OID 0)
-- Dependencies: 217
-- Name: studio_dev_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.studio_dev_game_id_seq', 5, true);


--
-- TOC entry 4051 (class 0 OID 0)
-- Dependencies: 215
-- Name: studio_devs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.studio_devs_id_seq', 3, true);


--
-- TOC entry 3875 (class 2606 OID 33609)
-- Name: game_genre_game game_genre_game_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_genre_game
    ADD CONSTRAINT game_genre_game_pkey PRIMARY KEY (id);


--
-- TOC entry 3869 (class 2606 OID 33600)
-- Name: game_genres game_genres_name_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_genres
    ADD CONSTRAINT game_genres_name_unique UNIQUE (name);


--
-- TOC entry 3871 (class 2606 OID 33598)
-- Name: game_genres game_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_genres
    ADD CONSTRAINT game_genres_pkey PRIMARY KEY (id);


--
-- TOC entry 3873 (class 2606 OID 33602)
-- Name: game_genres game_genres_slug_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_genres
    ADD CONSTRAINT game_genres_slug_unique UNIQUE (slug);


--
-- TOC entry 3855 (class 2606 OID 33557)
-- Name: games games_name_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_name_unique UNIQUE (name);


--
-- TOC entry 3857 (class 2606 OID 33555)
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- TOC entry 3859 (class 2606 OID 33559)
-- Name: games games_slug_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_slug_unique UNIQUE (slug);


--
-- TOC entry 3848 (class 2606 OID 33491)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3850 (class 2606 OID 33543)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3852 (class 2606 OID 33546)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3867 (class 2606 OID 33579)
-- Name: studio_dev_game studio_dev_game_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.studio_dev_game
    ADD CONSTRAINT studio_dev_game_pkey PRIMARY KEY (id);


--
-- TOC entry 3861 (class 2606 OID 33570)
-- Name: studio_devs studio_devs_name_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.studio_devs
    ADD CONSTRAINT studio_devs_name_unique UNIQUE (name);


--
-- TOC entry 3863 (class 2606 OID 33568)
-- Name: studio_devs studio_devs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.studio_devs
    ADD CONSTRAINT studio_devs_pkey PRIMARY KEY (id);


--
-- TOC entry 3865 (class 2606 OID 33572)
-- Name: studio_devs studio_devs_slug_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.studio_devs
    ADD CONSTRAINT studio_devs_slug_unique UNIQUE (slug);


--
-- TOC entry 3853 (class 1259 OID 33544)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 3878 (class 2606 OID 33610)
-- Name: game_genre_game game_genre_game_game_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_genre_game
    ADD CONSTRAINT game_genre_game_game_id_foreign FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- TOC entry 3879 (class 2606 OID 33615)
-- Name: game_genre_game game_genre_game_genre_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.game_genre_game
    ADD CONSTRAINT game_genre_game_genre_id_foreign FOREIGN KEY (genre_id) REFERENCES public.game_genres(id);


--
-- TOC entry 3877 (class 2606 OID 33585)
-- Name: studio_dev_game studio_dev_game_dev_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.studio_dev_game
    ADD CONSTRAINT studio_dev_game_dev_id_foreign FOREIGN KEY (dev_id) REFERENCES public.studio_devs(id);


--
-- TOC entry 3876 (class 2606 OID 33580)
-- Name: studio_dev_game studio_dev_game_game_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.studio_dev_game
    ADD CONSTRAINT studio_dev_game_game_id_foreign FOREIGN KEY (game_id) REFERENCES public.games(id);


-- Completed on 2023-08-27 15:19:47 UTC

--
-- PostgreSQL database dump complete
--

