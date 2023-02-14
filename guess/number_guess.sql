--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

ALTER TABLE ONLY public.games DROP CONSTRAINT games_user_id_fkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.games ALTER COLUMN game_id DROP DEFAULT;
DROP SEQUENCE public.users_user_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.games_game_id_seq;
DROP TABLE public.games;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    try_count integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (4, 7, 4);
INSERT INTO public.games VALUES (5, 9, 92);
INSERT INTO public.games VALUES (6, 9, 9);
INSERT INTO public.games VALUES (7, 10, 101);
INSERT INTO public.games VALUES (8, 10, 10);
INSERT INTO public.games VALUES (9, 9, 70);
INSERT INTO public.games VALUES (10, 9, 53);
INSERT INTO public.games VALUES (11, 9, 37);
INSERT INTO public.games VALUES (12, 11, 763);
INSERT INTO public.games VALUES (13, 11, 472);
INSERT INTO public.games VALUES (14, 12, 240);
INSERT INTO public.games VALUES (15, 12, 106);
INSERT INTO public.games VALUES (16, 11, 245);
INSERT INTO public.games VALUES (17, 11, 271);
INSERT INTO public.games VALUES (18, 11, 500);
INSERT INTO public.games VALUES (19, 13, 652);
INSERT INTO public.games VALUES (20, 13, 979);
INSERT INTO public.games VALUES (21, 14, 324);
INSERT INTO public.games VALUES (22, 14, 860);
INSERT INTO public.games VALUES (23, 13, 1);
INSERT INTO public.games VALUES (24, 13, 298);
INSERT INTO public.games VALUES (25, 13, 920);
INSERT INTO public.games VALUES (26, 15, 308);
INSERT INTO public.games VALUES (27, 15, 958);
INSERT INTO public.games VALUES (28, 16, 584);
INSERT INTO public.games VALUES (29, 16, 167);
INSERT INTO public.games VALUES (30, 15, 648);
INSERT INTO public.games VALUES (31, 15, 893);
INSERT INTO public.games VALUES (32, 15, 995);
INSERT INTO public.games VALUES (33, 17, 623);
INSERT INTO public.games VALUES (34, 17, 783);
INSERT INTO public.games VALUES (35, 18, 484);
INSERT INTO public.games VALUES (36, 18, 676);
INSERT INTO public.games VALUES (37, 17, 533);
INSERT INTO public.games VALUES (38, 17, 256);
INSERT INTO public.games VALUES (39, 17, 91);
INSERT INTO public.games VALUES (40, 19, 201);
INSERT INTO public.games VALUES (41, 19, 34);
INSERT INTO public.games VALUES (42, 20, 417);
INSERT INTO public.games VALUES (43, 20, 132);
INSERT INTO public.games VALUES (44, 19, 950);
INSERT INTO public.games VALUES (45, 19, 214);
INSERT INTO public.games VALUES (46, 19, 726);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (7, 'v9');
INSERT INTO public.users VALUES (8, 'v7');
INSERT INTO public.users VALUES (9, 'user_1676373708294');
INSERT INTO public.users VALUES (10, 'user_1676373708293');
INSERT INTO public.users VALUES (11, 'user_1676373885178');
INSERT INTO public.users VALUES (12, 'user_1676373885177');
INSERT INTO public.users VALUES (13, 'user_1676373963482');
INSERT INTO public.users VALUES (14, 'user_1676373963481');
INSERT INTO public.users VALUES (15, 'user_1676373998148');
INSERT INTO public.users VALUES (16, 'user_1676373998147');
INSERT INTO public.users VALUES (17, 'user_1676374018008');
INSERT INTO public.users VALUES (18, 'user_1676374018007');
INSERT INTO public.users VALUES (19, 'user_1676374099607');
INSERT INTO public.users VALUES (20, 'user_1676374099606');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 46, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

