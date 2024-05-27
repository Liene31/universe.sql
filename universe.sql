--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    name character varying(30)
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    category text,
    diameter_ly numeric(6,3),
    is_visible boolean
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
    name character varying(30),
    discovered_by text NOT NULL,
    temperature integer,
    named_after text,
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
    name character varying(30),
    discovered_by text NOT NULL,
    known_satellites integer,
    composition_by text NOT NULL,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation text,
    distance numeric(6,3),
    temperature numeric(6,3),
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, true, false, 'spherical');
INSERT INTO public.description VALUES (2, false, false, 'not spherical');
INSERT INTO public.description VALUES (3, true, true, 'spherical');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral Galaxy', 105.700, true);
INSERT INTO public.galaxy VALUES (2, 'Antennae Galaxy', 'Spiral Galaxy', 500.000, true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 'Spiral Galaxy', 220.000, true);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Irregular Galaxy', 37.000, true);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'Spiral Galaxy', 52.962, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'Spiral Galaxy', 170.000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Triton', 'William Lassell', 38, 'Trītōn', 1);
INSERT INTO public.moon VALUES (2, 'Thalassa', 'Richard J. Terrile', 51, 'Thalassa', 1);
INSERT INTO public.moon VALUES (3, 'Hippocamp', 'M. R. Showalter', NULL, 'Hippokampos', 1);
INSERT INTO public.moon VALUES (4, 'Titan', 'Christiaan Huygens', 94, 'Titan', 2);
INSERT INTO public.moon VALUES (5, 'Enceladus', 'William Herschel', 75, 'Egkelados', 2);
INSERT INTO public.moon VALUES (6, 'Mimas', 'William Herschel', 64, 'Mimās', 2);
INSERT INTO public.moon VALUES (7, 'Dione', 'Giovanni Cassini', 87, 'Diōnē', 2);
INSERT INTO public.moon VALUES (8, 'Iapetus', 'G. D. Cassini', 90, 'Īapetus', 2);
INSERT INTO public.moon VALUES (9, 'Phobos', 'Asaph Hall', 233, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Deimos', 'Asaph Hall', 233, NULL, 4);
INSERT INTO public.moon VALUES (11, 'Europa', 'Galileo Galilei', 102, 'Eurōpē', 6);
INSERT INTO public.moon VALUES (12, 'Ganymede', 'Galileo Galilei', 110, 'Ganymēdēs', 6);
INSERT INTO public.moon VALUES (13, 'Io', 'Galileo Galilei', 110, 'Īō', 6);
INSERT INTO public.moon VALUES (14, 'Callisto', 'Galileo Galilei', 134, 'Kallistō', 6);
INSERT INTO public.moon VALUES (15, 'Titania', 'William Herschel', 70, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 'William Herschel', 70, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Gerard P. Kuiper', 60, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Dysnomia', 'M. E. Brown', NULL, 'Dysnomia', 9);
INSERT INTO public.moon VALUES (19, 'Namaka', 'M. E. Brown', 32, NULL, 11);
INSERT INTO public.moon VALUES (20, 'Charon', 'James W. Christy', 53, 'Kharōn', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Neptune', 'Johann Galle', 16, 'hydrogen', 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 'Urbain Le Verrier', 146, 'helium', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Galileo Galilei', NULL, 'nitrogen', 3);
INSERT INTO public.planet VALUES (4, 'Mars', 'Galileo Galilei', 2, 'argon', 3);
INSERT INTO public.planet VALUES (5, 'Mercury', 'Galileo Galilei', NULL, 'oxygen', 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'Galileo Galilei', 95, 'hydrogen', 5);
INSERT INTO public.planet VALUES (7, 'Uranus', 'William Herschel', 28, 'helium', 5);
INSERT INTO public.planet VALUES (9, 'Eris', 'M. E. Brown', 1, 'helium', 3);
INSERT INTO public.planet VALUES (10, 'Makemake', 'M. E. Brown', 1, 'nitrogen', 4);
INSERT INTO public.planet VALUES (11, 'Haumea', 'M. E. Brown', 2, 'argon', 5);
INSERT INTO public.planet VALUES (12, '90377 Sedna', 'M. E. Brown', NULL, 'hydrgen', 1);
INSERT INTO public.planet VALUES (8, 'Pluto', 'Clyde W. Tombaugh', 5, 'nitrogen', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Antares', 'Scorpius', 550.000, 18.500, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Orion', 548.000, 3.600, 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 'Andromeda', 97.000, 11.950, 3);
INSERT INTO public.star VALUES (4, 'Mirach', 'Andromeda', 199.270, 3.802, 3);
INSERT INTO public.star VALUES (5, '51 Andromedae', 'Andromeda', 169.000, 4.951, 3);
INSERT INTO public.star VALUES (6, 'Mu Cephei', 'Cepheus', 3.060, 3.750, 1);


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: description description_description_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_description_id_key UNIQUE (description_id);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


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

