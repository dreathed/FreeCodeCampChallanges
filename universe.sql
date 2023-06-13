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
    discovered_by text,
    dicovered_date date
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
    is_fictional boolean,
    apparant_magnitude numeric,
    diameter_in_ly integer
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
    planet_id integer NOT NULL,
    is_fictional boolean NOT NULL,
    apparent_magnitude numeric,
    discovered_by text,
    dicovered_date date
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_monn_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_monn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_monn_id_seq OWNER TO freecodecamp;

--
-- Name: moon_monn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_monn_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer NOT NULL,
    description text,
    apparent_magnitude numeric,
    is_fictional boolean NOT NULL,
    age_in_mio_years integer
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
    galaxy_id integer NOT NULL,
    apparant_magnitude numeric,
    discovered_by text,
    discovered_date date,
    is_fictional boolean NOT NULL,
    name character varying(30) NOT NULL
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

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_monn_id_seq'::regclass);


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

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 'Its quite a thing to see this thing.', NULL, NULL);
INSERT INTO public.comet VALUES (2, 'Klinkenberg Comet', '', 'Jan de Munck', '1743-11-29');
INSERT INTO public.comet VALUES (3, '2P/Encke', '', 'Jean-Louis Pons', '1818-11-27');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', false, NULL, 90000);
INSERT INTO public.galaxy VALUES (2, 'NGC 4696', false, 10.2, 180000);
INSERT INTO public.galaxy VALUES (3, 'Messier 32', false, 8.1, 8000);
INSERT INTO public.galaxy VALUES (4, 'Andromedagalaxie M31', false, 3.5, 200000);
INSERT INTO public.galaxy VALUES (5, 'Messier 89', false, 9.9, 80000);
INSERT INTO public.galaxy VALUES (6, 'Messier 90', false, 9.4, 150000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymed', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Kallisto', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Tethys', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Dione', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Titan', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', 7, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Triton', 8, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Charon', 9, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Nix', 9, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Wegthor', 11, true, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Planet closest to the sun.', -2.43, false, 4568);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Also awesome woman', -4.8, false, 4568);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Planet we live on. Also known as: The blue planet and Giant Dirt Ball', NULL, false, 4568);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Probably home to the first extraterrestrial threat or friend. Also known as: The red planet.', -2.94, false, 4568);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Romans loved this one.', -2.94, false, 4568);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Aka Lord of the Rings.', -0.55, false, 4568);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'In 1995 he won the prize for most funny name. In 2022 the award was replaced by the award for the most offensive name of a celestrial body. Effords are made by students to rename the planet.', 5.38, false, 4568);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Is super jealous about earth beeing the blue planet. Had some beef with Ullysses.', 7.67, false, 4568);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Aka the fake planet, aka Mikeys dog.', 13.65, false, 4568);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 'Brings discomford.', 18.8, false, 4568);
INSERT INTO public.planet VALUES (11, 'Krypton', 2, 'Supermans home.', NULL, true, NULL);
INSERT INTO public.planet VALUES (12, 'Namek', 3, 'Freezers home. Son Goku travels there for 137 episodes.', NULL, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, -26.74, NULL, NULL, false, 'Sun');
INSERT INTO public.star VALUES (2, 1, NULL, NULL, NULL, true, 'Rao');
INSERT INTO public.star VALUES (3, 1, 11.13, 'Robert Innes', '1915-01-01', false, 'Proxima Centauri');
INSERT INTO public.star VALUES (4, 1, -0.27, 'Ptolemy', '0200-01-01', false, 'Alpha Centauri');
INSERT INTO public.star VALUES (5, 1, 9.54, 'Edward Emerson Barnard', '1916-01-01', false, 'Bernards Arrow Star');
INSERT INTO public.star VALUES (6, 1, 13.51, 'Max Wolf', '1918-01-01', false, 'Wolf 359');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_monn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_monn_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


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
-- Name: galaxy unique_galaxy_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_names UNIQUE (name);


--
-- Name: moon unique_moon_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_names UNIQUE (name);


--
-- Name: planet unique_planet_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_names UNIQUE (name);


--
-- Name: star unique_star_names; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_names UNIQUE (name);


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

