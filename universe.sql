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
    name character varying(255) NOT NULL,
    galaxy_type character varying(255),
    distance_from_earth_in_ly integer,
    mass_in_solar_mass integer,
    diameter_in_1000ly integer
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km integer,
    moon_id integer NOT NULL,
    believed_habitable boolean
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
-- Name: other_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_bodies (
    other_bodies_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    description text
);


ALTER TABLE public.other_bodies OWNER TO freecodecamp;

--
-- Name: other_bodies_celestial_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_bodies_celestial_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_bodies_celestial_body_id_seq OWNER TO freecodecamp;

--
-- Name: other_bodies_celestial_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_bodies_celestial_body_id_seq OWNED BY public.other_bodies.other_bodies_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    believed_habitable boolean,
    has_life boolean,
    age_in_millions_of_years integer,
    what_this_planet_means_to_you text,
    name character varying(255) NOT NULL,
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
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_type character varying(255),
    galaxy_id integer NOT NULL,
    distance_from_earth_in_ly integer,
    luminosity_in_watts integer,
    radius numeric,
    chemical_composition character varying(255)
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
-- Name: other_bodies other_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies ALTER COLUMN other_bodies_id SET DEFAULT nextval('public.other_bodies_celestial_body_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0, 11500, 80);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 25000, 1500, 152);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Magellanic spiral', 16300, 13800, 32);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Dwarf Irregular', 204000, 700, 19);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Spiral', 32000, 50000, 61);
INSERT INTO public.galaxy VALUES (6, 'That Other Milky Way', 'Semi-Barred Spiral', 40, 1551500, 800);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon', 3, NULL, 1, false);
INSERT INTO public.moon VALUES ('Phobos', 4, NULL, 2, false);
INSERT INTO public.moon VALUES ('Deimos', 4, NULL, 3, false);
INSERT INTO public.moon VALUES ('Charon', 9, NULL, 4, false);
INSERT INTO public.moon VALUES ('TARDIS', 11, NULL, 5, true);
INSERT INTO public.moon VALUES ('ENDOR', 12, NULL, 6, true);
INSERT INTO public.moon VALUES ('IO', 5, NULL, 7, false);
INSERT INTO public.moon VALUES ('Uropa', 5, NULL, 8, false);
INSERT INTO public.moon VALUES ('Ganymede', 5, NULL, 9, false);
INSERT INTO public.moon VALUES ('Callisto', 5, NULL, 10, false);
INSERT INTO public.moon VALUES ('Scylla', 10, NULL, 11, true);
INSERT INTO public.moon VALUES ('Charibdys', 10, NULL, 12, true);
INSERT INTO public.moon VALUES ('Titan', 7, NULL, 13, true);
INSERT INTO public.moon VALUES ('Rhea', 7, NULL, 14, true);
INSERT INTO public.moon VALUES ('Phoebe', 7, NULL, 15, false);
INSERT INTO public.moon VALUES ('Titania', 6, NULL, 16, true);
INSERT INTO public.moon VALUES ('Miranda', 6, NULL, 17, false);
INSERT INTO public.moon VALUES ('Ariel', 6, NULL, 18, false);
INSERT INTO public.moon VALUES ('Unbriel', 6, NULL, 19, false);
INSERT INTO public.moon VALUES ('Oberon', 6, NULL, 20, false);


--
-- Data for Name: other_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_bodies VALUES (1, 'ISS', 1, 'A Space Station');
INSERT INTO public.other_bodies VALUES (2, 'The Death Star', 5, 'A Planet Sized Super Weapon');
INSERT INTO public.other_bodies VALUES (3, 'Asteroid Belt', 1, 'A Bunch of asteroids');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, false, false, 4568, NULL, 'Mercury', 1);
INSERT INTO public.planet VALUES (2, false, false, 4568, NULL, 'Venus', 1);
INSERT INTO public.planet VALUES (3, true, true, 4568, NULL, 'EARTH', 1);
INSERT INTO public.planet VALUES (4, true, false, 4568, NULL, 'MARS', 1);
INSERT INTO public.planet VALUES (5, false, false, 4568, NULL, 'JUPITER', 1);
INSERT INTO public.planet VALUES (6, false, false, 4568, NULL, 'URANUS', 1);
INSERT INTO public.planet VALUES (7, false, false, 4568, NULL, 'SATURN', 1);
INSERT INTO public.planet VALUES (8, false, false, 4568, NULL, 'NEPTUNE', 1);
INSERT INTO public.planet VALUES (9, false, false, 4568, NULL, 'PLUTO', 1);
INSERT INTO public.planet VALUES (10, true, true, 8856, NULL, 'Mondas', 6);
INSERT INTO public.planet VALUES (11, true, true, 88888888, NULL, 'Gallifrey', 4);
INSERT INTO public.planet VALUES (12, false, true, 90, NULL, 'Tatooine', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1, NULL, 277, 53.4, 'Primarily Hydrogen and Helium');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 1, 4, 31, -8555.45, 'Burning Fire');
INSERT INTO public.star VALUES (3, 'Superstar', 'Powerup', 5, NULL, 351, 58.56, 'Argon');
INSERT INTO public.star VALUES (4, 'Polaris', 'A cold one', 3, NULL, 435, 346.346, 'Ice');
INSERT INTO public.star VALUES (5, 'Starfruit', 'Fruit', 2, 23, 344, NULL, 'Flesh');
INSERT INTO public.star VALUES (6, 'Yosuboe', 'Fictional', 6, 435, NULL, NULL, 'Imagination');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: other_bodies_celestial_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_bodies_celestial_body_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_bodies name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: other_bodies name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: other_bodies other_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies
    ADD CONSTRAINT other_bodies_pkey PRIMARY KEY (other_bodies_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


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
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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
-- Name: other_bodies other_bodies_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_bodies
    ADD CONSTRAINT other_bodies_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

