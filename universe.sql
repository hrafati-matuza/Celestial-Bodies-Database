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
-- Name: celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_bodies (
    name character varying(30) NOT NULL,
    celestial_bodies_id integer NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.celestial_bodies OWNER TO freecodecamp;

--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_bodies_id_seq OWNED BY public.celestial_bodies.celestial_bodies_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    shape character varying(40),
    distance_in_thousands_of_lightyears numeric(10,2),
    size_in_thousands_of_lightyears numeric(10,2)
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    climate text,
    size_in_km integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    no_of_moons integer NOT NULL,
    radius_in_k_km numeric(10,2),
    description text,
    has_life boolean NOT NULL,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    no_of_planets integer NOT NULL,
    galaxy_id integer NOT NULL,
    is_stable boolean
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
-- Name: celestial_bodies celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies ALTER COLUMN celestial_bodies_id SET DEFAULT nextval('public.celestial_bodies_id_seq'::regclass);


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
-- Data for Name: celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_bodies VALUES ('galaxy', 1, NULL);
INSERT INTO public.celestial_bodies VALUES ('stars', 2, NULL);
INSERT INTO public.celestial_bodies VALUES ('planets', 3, NULL);
INSERT INTO public.celestial_bodies VALUES ('moons', 4, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 1, 'spiral', 2530.00, 260.00);
INSERT INTO public.galaxy VALUES ('Cigar', 2, 'elongated eliptical', 11420.00, 37.00);
INSERT INTO public.galaxy VALUES ('Black Eye', 3, 'spiral', 17290.00, 26.48);
INSERT INTO public.galaxy VALUES ('Whirlpool', 4, 'spiral', 23000.00, 70.75);
INSERT INTO public.galaxy VALUES ('Messier 87', 5, 'elliptical', 55000.00, 120.00);
INSERT INTO public.galaxy VALUES ('Sombrero', 6, 'spiral', 29000.00, 50.00);
INSERT INTO public.galaxy VALUES ('Milky Way', 7, 'spiral', 0.00, 100.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 15, 'cold', 3474);
INSERT INTO public.moon VALUES ('Phobos', 2, 16, 'cold', 22);
INSERT INTO public.moon VALUES ('Deimos', 3, 16, 'cold', 12);
INSERT INTO public.moon VALUES ('Io', 4, 17, 'hot', 3642);
INSERT INTO public.moon VALUES ('Europa', 5, 17, 'cold', 3121);
INSERT INTO public.moon VALUES ('Ganymede', 6, 17, 'cold', 5262);
INSERT INTO public.moon VALUES ('Callisto', 7, 17, 'cold', 4800);
INSERT INTO public.moon VALUES ('Titan', 8, 18, 'cold', 5150);
INSERT INTO public.moon VALUES ('Rhea', 9, 18, 'cold', 1528);
INSERT INTO public.moon VALUES ('Iapetus', 10, 18, 'cold', 1469);
INSERT INTO public.moon VALUES ('Miranda', 11, 19, 'cold', 471);
INSERT INTO public.moon VALUES ('Ariel', 12, 19, 'cold', 1158);
INSERT INTO public.moon VALUES ('Triton', 23, 19, 'cold', 2705);
INSERT INTO public.moon VALUES ('Charon', 24, 20, 'cold', 1208);
INSERT INTO public.moon VALUES ('Dione', 25, 18, 'cold', 1120);
INSERT INTO public.moon VALUES ('Tethys', 26, 18, 'cold', 1062);
INSERT INTO public.moon VALUES ('Enceladus', 27, 18, 'cold', 504);
INSERT INTO public.moon VALUES ('Mimas', 28, 18, 'cold', 396);
INSERT INTO public.moon VALUES ('Hyperion', 29, 18, 'cold', 270);
INSERT INTO public.moon VALUES ('Phoebe', 30, 18, 'cold', 213);
INSERT INTO public.moon VALUES ('Naiad', 31, 20, 'cold', 60);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 13, 0, 0.38, 'Mercury is the smallest planet in the Solar System and the closest to the Sun.', false, 11);
INSERT INTO public.planet VALUES ('Venus', 14, 0, 0.95, 'Venus is the second planet from the Sun and the hottest planet in the Solar System.', false, 11);
INSERT INTO public.planet VALUES ('Earth', 15, 1, 1.00, 'Earth is the third planet from the Sun and the only known planet to support life.', true, 11);
INSERT INTO public.planet VALUES ('Mars', 16, 2, 0.53, 'Mars is the fourth planet from the Sun and known as the Red Planet.', false, 11);
INSERT INTO public.planet VALUES ('Jupiter', 17, 79, 11.21, 'Jupiter is the largest planet in the Solar System and known for its Great Red Spot.', false, 11);
INSERT INTO public.planet VALUES ('Saturn', 18, 82, 9.45, 'Saturn is known for its rings made of ice and dust particles.', false, 11);
INSERT INTO public.planet VALUES ('Uranus', 19, 27, 4.01, 'Uranus is the seventh planet from the Sun and rotates on its side.', false, 11);
INSERT INTO public.planet VALUES ('Neptune', 20, 14, 3.88, 'Neptune is the eighth planet from the Sun and known for its blue color.', false, 11);
INSERT INTO public.planet VALUES ('Pluto', 21, 5, 0.19, 'Pluto is a dwarf planet and was reclassified from a planet to a dwarf planet in 2006.', false, 11);
INSERT INTO public.planet VALUES ('Tau Ceti e', 22, 0, 0.19, 'Tau Ceti e is an exoplanet orbiting the star Tau Ceti.', false, 14);
INSERT INTO public.planet VALUES ('Tau Ceti f', 23, 0, 0.19, 'Tau Ceti f is an exoplanet orbiting the star Tau Ceti.', false, 14);
INSERT INTO public.planet VALUES ('Tau Ceti g', 24, 0, 0.19, 'Tau Ceti g is an exoplanet orbiting the star Tau Ceti.', false, 14);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Andromeda Star A', 5, 1, 1, true);
INSERT INTO public.star VALUES ('Cigar Galaxy Star 1', 6, 0, 2, NULL);
INSERT INTO public.star VALUES ('Black Eye Galaxy Star 1', 7, 0, 3, NULL);
INSERT INTO public.star VALUES ('Whirlpool Galaxy Star 1', 8, 1, 4, true);
INSERT INTO public.star VALUES ('Messier 87 Star 1', 9, 0, 5, NULL);
INSERT INTO public.star VALUES ('Sombrero Galaxy Star 1', 10, 0, 6, NULL);
INSERT INTO public.star VALUES ('Sun', 11, 8, 7, true);
INSERT INTO public.star VALUES ('Alpha Centauri', 12, 1, 7, true);
INSERT INTO public.star VALUES ('Sirius', 13, 0, 7, true);
INSERT INTO public.star VALUES ('Tau Ceti', 14, 4, 7, true);
INSERT INTO public.star VALUES ('Kepler-62', 15, 5, 7, true);
INSERT INTO public.star VALUES ('TRAPPIST-1', 16, 7, 7, true);
INSERT INTO public.star VALUES ('Gliese 581', 17, 4, 7, true);
INSERT INTO public.star VALUES ('HD 209458', 18, 1, 7, true);
INSERT INTO public.star VALUES ('Kepler-186', 19, 1, 7, true);


--
-- Name: celestial_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_bodies_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 31, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 19, true);


--
-- Name: celestial_bodies celestial_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_name_key UNIQUE (name);


--
-- Name: celestial_bodies celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_pkey PRIMARY KEY (celestial_bodies_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

