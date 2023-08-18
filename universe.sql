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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    diameter_in_km integer,
    mass_in_kg integer,
    speed_in_km_h numeric(20,1)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    num_planets integer,
    num_stars integer,
    num_comets integer,
    distance_from_earth_ly numeric(10,1),
    is_active boolean
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
    name character varying(30) NOT NULL,
    description text,
    diameter_in_km integer,
    mass_in_kg integer,
    distance_from_earth_ly numeric(10,1),
    regular_orbit boolean,
    planet_id integer,
    concatenated_name text
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
    name character varying(30) NOT NULL,
    description text,
    diameter_in_km integer,
    mass_in_kg integer,
    distance_from_earth_ly numeric(10,1),
    has_a_moon boolean,
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
    description text,
    diameter_in_km integer,
    mass_in_kg integer,
    distance_from_earth_ly numeric(10,1),
    has_a_moon boolean,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley Comet', 'Famous periodic comet', 11, 22000000, 70500.5);
INSERT INTO public.comet VALUES (2, 'Encke', NULL, 4, 11000000, 37000.8);
INSERT INTO public.comet VALUES (3, 'Hale-Bopp', 'Great Comet of 1997', 60, 44000000, 21300.2);
INSERT INTO public.comet VALUES (4, 'McNaught', 'Brightest comet in over 40 years', 7, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 8, 1000000000, 100000000, 100000.0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy', 1, 100000000, 50000000, 2500000.0, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small galaxy', 0, 50000000, 10000000, 3000000.0, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Edge-on spiral galaxy', 3, 200000000, 2000000, 29000000.0, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Interacting spiral galaxy', 2, 150000000, 3000000, 23000000.0, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical galaxy with an active nucleus', 0, 50000000, 15000000, 11000000.0, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (22, 'Luna', 'Earth natural satellite', 3474, 734770000, 0.0, true, 1, 'Luna_1');
INSERT INTO public.moon VALUES (23, 'Phobos', 'Mars largest moon', 22, 1065800, 0.0, true, 2, 'Phobos_2');
INSERT INTO public.moon VALUES (24, 'Deimos', 'Mars smaller moon', 12, 147600, 0.0, true, 2, 'Deimos_2');
INSERT INTO public.moon VALUES (25, 'Io', 'Jupiter moon with active volcanoes', 3660, 89319000, 0.0, true, 3, 'Io_3');
INSERT INTO public.moon VALUES (26, 'Europa', 'Jupiter ice-covered moon', 3122, 47970000, 0.0, true, 3, 'Europa_3');
INSERT INTO public.moon VALUES (27, 'Ganymede', 'Largest moon in the solar system', 5262, 148190000, 0.0, true, 3, 'Ganymede_3');
INSERT INTO public.moon VALUES (28, 'Callisto', 'Jupiter heavily cratered moon', 4821, 107590000, 0.0, true, 3, 'Callisto_3');
INSERT INTO public.moon VALUES (29, 'Titan', 'Saturn largest moon with thick atmosphere', 5150, 134550000, 0.0, true, 5, 'Titan_5');
INSERT INTO public.moon VALUES (30, 'Enceladus', 'Saturn moon with geysers', 504, 1076000, 0.0, true, 5, 'Enceladus_5');
INSERT INTO public.moon VALUES (31, 'Mimas', 'Saturn moon with a large crater', 397, 37493, 0.0, true, 5, 'Mimas_5');
INSERT INTO public.moon VALUES (32, 'Triton', 'Neptune largest moon', 2707, 21400000, 0.0, true, 6, 'Triton_6');
INSERT INTO public.moon VALUES (33, 'Nereid', 'Neptune irregular moon', 340, 300000, 0.0, false, 6, 'Nereid_6');
INSERT INTO public.moon VALUES (34, 'Oberon', 'Uranus moon', 1522, 30140000, 0.0, true, 7, 'Oberon_7');
INSERT INTO public.moon VALUES (35, 'Miranda', 'Uranus moon with a strange surface', 471, 659000, 0.0, true, 7, 'Miranda_7');
INSERT INTO public.moon VALUES (36, 'Ariel', 'Uranus moon', 1157, 13300000, 0.0, true, 7, 'Ariel_7');
INSERT INTO public.moon VALUES (37, 'Titania', 'Uranus largest moon', 1578, 35270000, 0.0, true, 7, 'Titania_7');
INSERT INTO public.moon VALUES (38, 'Triton', 'Pluto largest moon', 2707, 21400000, 0.0, true, 9, 'Triton_9');
INSERT INTO public.moon VALUES (39, 'Charon', 'Pluto largest moon', 1212, 1550000, 0.0, true, 9, 'Charon_9');
INSERT INTO public.moon VALUES (40, 'PSR B1257+12 A b', 'Exoplanet moon orbiting a pulsar', 3500, 100000, 2300.0, true, 12, 'PSR B1257+12 A b_12');
INSERT INTO public.moon VALUES (41, 'solid', 'nothing moon', 341212, 16550000, 0.0, true, 3, 'solid_3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', 12742, 597200000, 0.0, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The red planet', 6779, 64171000, 0.0, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Largest planet in our solar system', 139822, 18980000, 0.0, true, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 'The morning and evening star', 12104, 486770000, 0.0, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Ringed planet', 116464, 56840000, 0.0, true, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Blue gas giant', 49244, 10243000, 0.0, true, 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Closest planet to the Sun', 4879, 33011000, 0.0, false, 1);
INSERT INTO public.planet VALUES (8, 'Pluto', 'Dwarf planet at the edge of the solar system', 2370, 130000, 0.0, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 'Exoplanet similar to Earth', 20851, 136570000, 1400.0, false, 2);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 'Hot Jupiter exoplanet', 143000, 10800000, 150.0, false, 3);
INSERT INTO public.planet VALUES (11, 'PSR B1257+12 A', 'Exoplanet orbiting a pulsar', 8000, 21589000, 2300.0, false, 4);
INSERT INTO public.planet VALUES (12, 'Uranus', 'Tilted ice giant', 50724, 86832000, 0.0, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', 1392684, 1989000, 0.0, false, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', 19830000, 33300000, 8.6, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Closest star system to Earth', 1914156, 224700000, 4.4, false, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant star in Orion', 1409460000, 2330000, 640.0, false, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Closest known star to the Sun', 201320, 225000000, 4.2, false, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'Bright star in the constellation Lyra', 35674000, 2540000, 25.0, false, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 41, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: moon unique_concatenated_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_concatenated_name UNIQUE (concatenated_name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

