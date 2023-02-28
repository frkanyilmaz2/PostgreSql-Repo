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
    name character varying(40) NOT NULL,
    star_count integer,
    has_civilization text,
    civilization_level integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_darkside boolean,
    has_life boolean,
    planet_name character varying(40),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_life boolean,
    moon_count integer,
    notes text,
    star_id integer,
    galaxy_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: pmoon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.pmoon (
    pmoon_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(40)
);


ALTER TABLE public.pmoon OWNER TO freecodecamp;

--
-- Name: pmoon_pmoon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.pmoon_pmoon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pmoon_pmoon_id_seq OWNER TO freecodecamp;

--
-- Name: pmoon_pmoon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.pmoon_pmoon_id_seq OWNED BY public.pmoon.pmoon_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_count numeric,
    distance_to_earth numeric NOT NULL,
    age_in_gyr numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: pmoon pmoon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pmoon ALTER COLUMN pmoon_id SET DEFAULT nextval('public.pmoon_pmoon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 20, 'It has life but a bunch of savages...', 3);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 20, 'Alec Ryder and his team discovered life forms...', 3);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 20, 'Yet to be discovered...', 0);
INSERT INTO public.galaxy VALUES (4, 'Backward', 20, 'Yet to be discovered...', 0);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 20, 'Yet to be discovered...', 0);
INSERT INTO public.galaxy VALUES (6, 'Butterfly', 20, 'Yet to be discovered...', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, false, 'Earth', 1);
INSERT INTO public.moon VALUES (4, 'Ashla', false, true, 'Earth', 1);
INSERT INTO public.moon VALUES (5, 'Bogan', true, true, 'Earth', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', true, false, 'Mars', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', true, false, 'Mars', 2);
INSERT INTO public.moon VALUES (6, 'Cordellia', false, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (7, 'Ophelia', true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (8, 'Bianca', true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (9, 'Cressida', true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (10, 'Desdemnoia', false, true, 'Uranus', 7);
INSERT INTO public.moon VALUES (11, 'Juliet', true, true, 'Uranus', 7);
INSERT INTO public.moon VALUES (12, 'Portia', false, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (13, 'Rosalind', true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (14, 'Cupid', true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (15, 'Belinda', true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (16, 'Perdita', false, true, 'Uranus', 7);
INSERT INTO public.moon VALUES (17, 'Puck', true, true, 'Uranus', 7);
INSERT INTO public.moon VALUES (18, 'Mab', false, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (19, 'Miranda', true, false, 'Uranus', 7);
INSERT INTO public.moon VALUES (20, 'Ariel', true, false, 'Uranus', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (6, 'Saturn', false, 83, 'All unconfirmed', 1, 1);
INSERT INTO public.planet VALUES (1, 'Earth', true, 1, 'Avoid at all cost', 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', false, 0, 'dead', 1, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 0, 'dead', 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, 'Matt Damon shot a movie on here', 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 95, '45 unconfirmed', 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 27, 'all confirmed', 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 14, '1 unconfirmed', 1, 1);
INSERT INTO public.planet VALUES (9, 'Uyduruk-1', true, 5, 'I made it up', 2, 1);
INSERT INTO public.planet VALUES (10, 'Uyduruk-2', true, 5, 'Population:100k', 3, 1);
INSERT INTO public.planet VALUES (11, 'Tatooine', true, 95, 'Home of Bananakin', 5, 1);
INSERT INTO public.planet VALUES (12, 'Dantoine', true, 31, 'IDK this lol', 3, 1);
INSERT INTO public.planet VALUES (13, 'Dromund Kaas', true, 69, 'Sith Planet', 5, 1);
INSERT INTO public.planet VALUES (14, 'Coruscant', true, 27, 'Home of Republic', 7, 2);
INSERT INTO public.planet VALUES (15, 'Felucia', true, 14, 'Colonists live here', 7, 2);
INSERT INTO public.planet VALUES (16, 'Yavinn', true, 5, 'Fackin Ewoks', 8, 2);
INSERT INTO public.planet VALUES (17, 'Alderaan', true, 5, 'Population:550k', 8, 2);


--
-- Data for Name: pmoon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.pmoon VALUES (1, 1, 1, NULL);
INSERT INTO public.pmoon VALUES (2, 1, 2, NULL);
INSERT INTO public.pmoon VALUES (3, 2, 2, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 0.00016, 4.572, 1);
INSERT INTO public.star VALUES (2, 'YZ Ceti', 3, 11.74, 4, 1);
INSERT INTO public.star VALUES (3, 'Tau Ceti', 4, 11.905, 5.8, 1);
INSERT INTO public.star VALUES (4, 'Kepler-90', 8, 2840, 2, 1);
INSERT INTO public.star VALUES (5, 'TRAPPISt-1', 7, 39.5, 7.6, 1);
INSERT INTO public.star VALUES (6, 'Alpheratz', NULL, 97, NULL, 2);
INSERT INTO public.star VALUES (7, 'Mirach', NULL, 199, NULL, 2);
INSERT INTO public.star VALUES (8, 'Almach', NULL, 355, NULL, 2);
INSERT INTO public.star VALUES (9, 'Sadiradra', NULL, 101, NULL, 2);
INSERT INTO public.star VALUES (10, 'Nembus', NULL, 174, NULL, 2);
INSERT INTO public.star VALUES (11, 'Titawin', NULL, 44, NULL, 2);
INSERT INTO public.star VALUES (12, 'Adhil', NULL, 199, NULL, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: pmoon_pmoon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.pmoon_pmoon_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: planet name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: pmoon pmoon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pmoon
    ADD CONSTRAINT pmoon_name_key UNIQUE (name);


--
-- Name: pmoon pmoon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pmoon
    ADD CONSTRAINT pmoon_pkey PRIMARY KEY (pmoon_id);


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
-- Name: planet galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: pmoon pmoon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pmoon
    ADD CONSTRAINT pmoon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: pmoon pmoon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pmoon
    ADD CONSTRAINT pmoon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
