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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type integer NOT NULL,
    age_in_millions_of_years numeric(4,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    description text,
    moon_type integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    description text,
    planet_type integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_more_info (
    planet_more_info_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    distance_from_earth numeric(4,1),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,1)
);


ALTER TABLE public.planet_more_info OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_more_info_planet_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_more_info_planet_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_more_info_planet_more_info_id_seq OWNED BY public.planet_more_info.planet_more_info_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    description text,
    star_type integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: planet_more_info planet_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info ALTER COLUMN planet_more_info_id SET DEFAULT nextval('public.planet_more_info_planet_more_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The appearance from Earth of the galaxy—a band of light', 2, 6.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda is the closest big galaxy to the Milky Way', 1, 5.0);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 'Appearance is similar to an insect antennae.', 3, 7.0);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 'Centaurus', 4, 8.0);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'Coma Berenices', 4, 8.0);
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy', 'Ursa Major', 4, 8.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 'Moon', 1);
INSERT INTO public.moon VALUES (2, 5, 'Phobos', 'Barnard', 1);
INSERT INTO public.moon VALUES (3, 5, 'Deimos', 'Moon', 1);
INSERT INTO public.moon VALUES (4, 5, 'Amalthea', 'Moon', 1);
INSERT INTO public.moon VALUES (5, 5, 'Thebe', 'Voyager', 1);
INSERT INTO public.moon VALUES (6, 5, 'Io', 'Galileo', 1);
INSERT INTO public.moon VALUES (7, 7, 'Europa', '', 1);
INSERT INTO public.moon VALUES (8, 7, 'Puck', '', 1);
INSERT INTO public.moon VALUES (9, 7, 'Ganymede', '', 1);
INSERT INTO public.moon VALUES (10, 7, 'Callisto', '', 1);
INSERT INTO public.moon VALUES (11, 7, 'Himalia', '', 1);
INSERT INTO public.moon VALUES (12, 7, 'Pan', '', 1);
INSERT INTO public.moon VALUES (13, 7, 'Atlas', '', 1);
INSERT INTO public.moon VALUES (14, 7, 'Prometheus', '', 1);
INSERT INTO public.moon VALUES (15, 7, 'Pandora', '', 1);
INSERT INTO public.moon VALUES (16, 7, 'Janus', '', 1);
INSERT INTO public.moon VALUES (17, 7, 'Epimetheus', '', 1);
INSERT INTO public.moon VALUES (18, 8, 'Mimas', '', 1);
INSERT INTO public.moon VALUES (19, 8, 'Enceladus', '', 1);
INSERT INTO public.moon VALUES (20, 8, 'Tethys', '', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Sun', NULL, 1);
INSERT INTO public.planet VALUES (2, 1, 'Earth', NULL, 1);
INSERT INTO public.planet VALUES (3, 1, 'Mercury', NULL, 1);
INSERT INTO public.planet VALUES (4, 1, 'Venus', NULL, 1);
INSERT INTO public.planet VALUES (5, 1, 'Mars', NULL, 1);
INSERT INTO public.planet VALUES (6, 1, 'Asteroid belt', NULL, 1);
INSERT INTO public.planet VALUES (7, 1, 'Jupiter', NULL, 1);
INSERT INTO public.planet VALUES (8, 1, 'Saturn', NULL, 1);
INSERT INTO public.planet VALUES (9, 1, 'Uranus', NULL, 1);
INSERT INTO public.planet VALUES (10, 1, 'Neptune', NULL, 1);
INSERT INTO public.planet VALUES (11, 1, 'Centaurs', NULL, 1);
INSERT INTO public.planet VALUES (12, 1, 'Pluto and Charon', NULL, 1);


--
-- Data for Name: planet_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_more_info VALUES (1, 'Mercury', 3, 4.5, false, true, 100.0);
INSERT INTO public.planet_more_info VALUES (2, 'Earth', 2, 4.5, true, true, 100.0);
INSERT INTO public.planet_more_info VALUES (3, 'Jupiter', 7, 4.5, true, true, 100.0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Solaris', 'Solaris system', 1);
INSERT INTO public.star VALUES (2, 1, 'WISE 0855−0714', 'WISE 0855', 1);
INSERT INTO public.star VALUES (3, 1, 'Sirius A and Sirius B Stars', NULL, 1);
INSERT INTO public.star VALUES (4, 1, 'Epsilon Eridani (Ran)', NULL, 1);
INSERT INTO public.star VALUES (5, 1, '61 Cygni A and 61 Cygni B', NULL, 1);
INSERT INTO public.star VALUES (6, 1, 'Procyon A and Procyon B', NULL, 1);


--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_more_info_planet_more_info_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_more_info planet_more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_name_key UNIQUE (name);


--
-- Name: planet_more_info planet_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_pkey PRIMARY KEY (planet_more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_more_info planet_more_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

