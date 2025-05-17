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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    composition text,
    diameter_km numeric NOT NULL,
    orbital_period_days numeric,
    is_potentially_hazardous boolean,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    galaxy_type text,
    is_spherical boolean,
    average_diameter_in_light_years integer,
    category_number integer
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
    name character varying(255) NOT NULL,
    mass numeric NOT NULL,
    lunar_composition text,
    is_visible_from_earth boolean,
    lunar_phases integer,
    distance_from_earth integer,
    planet_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    planet_type text,
    has_life boolean,
    number_of_moons integer,
    one_year integer,
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
    star_temperature numeric NOT NULL,
    type_of_star text,
    massive_star boolean,
    star_age integer,
    phases_of_star_life integer,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Rock and Ice', 945, 1680, false, NULL);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Rocky Metallic', 525, 1325, false, NULL);
INSERT INTO public.asteroid VALUES (3, 'Eros', 'Silicaceous', 17, 643, false, NULL);
INSERT INTO public.asteroid VALUES (4, 'Itokawa', 'Rubber-like Rocky', 0.3, 556, false, NULL);
INSERT INTO public.asteroid VALUES (5, 'Psyche', 'Metallic Iron-Nickel', 226, 1825, false, NULL);
INSERT INTO public.asteroid VALUES (6, 'Apophis', 'Silicaceous', 0.37, 323, true, NULL);
INSERT INTO public.asteroid VALUES (7, 'Bennu', 'Carbonaceous', 0.49, 436, true, NULL);
INSERT INTO public.asteroid VALUES (8, 'Ryugu', 'Carbonaceous', 0.88, 480, false, NULL);
INSERT INTO public.asteroid VALUES (9, 'Toutatis', 'Silicaceous', 4.5, 1467, false, NULL);
INSERT INTO public.asteroid VALUES (10, 'Ganymed', 'Silicaceous', 31, 1360, false, NULL);
INSERT INTO public.asteroid VALUES (11, 'Icarus', 'Silicaceous', 1.4, 409, false, NULL);
INSERT INTO public.asteroid VALUES (12, 'Daedalus', 'Rocky', 3.7, 828, false, NULL);
INSERT INTO public.asteroid VALUES (13, 'Pallas', 'Rocky', 510, 1685, false, NULL);
INSERT INTO public.asteroid VALUES (14, 'Hygiea', 'Carbonaceous', 431, 2038, false, NULL);
INSERT INTO public.asteroid VALUES (15, 'Davida', 'Carbonaceous', 326, 1860, false, NULL);
INSERT INTO public.asteroid VALUES (16, 'Hermes', 'Silicaceous', 1.1, 777, false, NULL);
INSERT INTO public.asteroid VALUES (17, 'Juno', 'Rocky', 258, 1593, false, NULL);
INSERT INTO public.asteroid VALUES (18, 'Astraea', 'Rocky', 120, 1546, false, NULL);
INSERT INTO public.asteroid VALUES (19, 'Interamnia', 'Carbonaceous', 350, 2001, false, NULL);
INSERT INTO public.asteroid VALUES (20, 'Hathor', 'Silicaceous', 0.29, 513, true, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10000, 'Spiral', true, 220000, 1);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13600, 'Barred Spiral', true, 105700, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 4000, 'Spiral', true, 60000, 3);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 400, 'Spiral', false, 76000, 4);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 6000, 'Elliptical', true, 120000, 5);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 9000, 'Spiral', true, 50000, 6);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 500, 'Ring', false, 150000, 7);
INSERT INTO public.galaxy VALUES (8, 'IC 1101', 13000, 'Elliptical', true, 600000, 8);
INSERT INTO public.galaxy VALUES (9, 'Cigar Galaxy', 700, 'Irregular', false, 50000, 9);
INSERT INTO public.galaxy VALUES (10, 'Hoag’s Object', 8000, 'Ring', true, 125000, 10);
INSERT INTO public.galaxy VALUES (11, 'Centaurus A', 11000, 'Elliptical', true, 65000, 11);
INSERT INTO public.galaxy VALUES (12, 'Messier 81', 7000, 'Spiral', true, 85000, 12);
INSERT INTO public.galaxy VALUES (13, 'Tadpole Galaxy', 3000, 'Spiral', false, 280000, 13);
INSERT INTO public.galaxy VALUES (14, 'NGC 1300', 5000, 'Barred Spiral', true, 110000, 14);
INSERT INTO public.galaxy VALUES (15, 'NGC 6744', 10000, 'Spiral', true, 175000, 15);
INSERT INTO public.galaxy VALUES (16, 'Maffei 1', 12000, 'Elliptical', true, 140000, 16);
INSERT INTO public.galaxy VALUES (17, 'NGC 4414', 2000, 'Spiral', false, 65000, 17);
INSERT INTO public.galaxy VALUES (18, 'NGC 4622', 6000, 'Spiral', false, 75000, 18);
INSERT INTO public.galaxy VALUES (19, 'NGC 4889', 9000, 'Elliptical', true, 200000, 19);
INSERT INTO public.galaxy VALUES (20, 'Malin 1', 11000, 'Spiral', true, 650000, 20);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 73500000000000000000000, 'Rocky, Silicaceous', true, 8, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 10800000000000000, 'Rocky, Carbonaceous', true, 4, 9378, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1480000000000000, 'Rocky, Carbonaceous', true, 4, 23460, 4);
INSERT INTO public.moon VALUES (4, 'Io', 89300000000000000000000, 'Volcanic, Sulfuric', false, 8, 421700, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 48000000000000000000000, 'Water Ice, Rocky Core', false, 8, 670900, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 148000000000000000000000, 'Water Ice, Silicates', false, 8, 1070400, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 108000000000000000000000, 'Water Ice, Rocky Core', false, 8, 1882700, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 135000000000000000000000, 'Nitrogen-Rich, Hydrocarbon Lakes', false, 8, 1221870, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 108000000000000000000, 'Water Ice, Silicates', false, 8, 238042, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 37500000000000000000, 'Water Ice, Silicates', false, 8, 185539, 6);
INSERT INTO public.moon VALUES (11, 'Triton', 21400000000000000000000, 'Water Ice, Nitrogen Atmosphere', false, 8, 354759, 8);
INSERT INTO public.moon VALUES (12, 'Himalia', 9560000000000000000, 'Carbonaceous Rock', false, 8, 11461000, 5);
INSERT INTO public.moon VALUES (13, 'Oberon', 3010000000000000000000, 'Water Ice, Rocky Core', false, 8, 583520, 7);
INSERT INTO public.moon VALUES (14, 'Titania', 3490000000000000000000, 'Water Ice, Rocky Core', false, 8, 435910, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1270000000000000000000, 'Water Ice, Carbonaceous', false, 8, 266000, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 1350000000000000000000, 'Water Ice, Silicates', false, 8, 191020, 7);
INSERT INTO public.moon VALUES (17, 'Dione', 1100000000000000000000, 'Water Ice, Rocky Core', false, 8, 377400, 6);
INSERT INTO public.moon VALUES (18, 'Rhea', 2310000000000000000000, 'Water Ice, Rocky Core', false, 8, 527000, 6);
INSERT INTO public.moon VALUES (19, 'Hyperion', 10800000000000000000, 'Porous Water Ice', false, 8, 1500000, 6);
INSERT INTO public.moon VALUES (20, 'Iapetus', 1810000000000000000000, 'Water Ice, Dark Carbon Compounds', false, 8, 3561000, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 'Terrestrial', false, 0, 88, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500, 'Terrestrial', false, 0, 225, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500, 'Terrestrial', true, 1, 365, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500, 'Terrestrial', false, 2, 687, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500, 'Gas Giant', false, 79, 4380, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500, 'Gas Giant', false, 83, 10756, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, 'Ice Giant', false, 27, 30688, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500, 'Ice Giant', false, 14, 60225, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2000, 'Exoplanet', true, 3, 289, 5);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 4500, 'Exoplanet', true, 2, 38, 6);
INSERT INTO public.planet VALUES (11, 'TrES-2b', 1000, 'Gas Giant', false, 0, 3, 7);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 500, 'Hot Jupiter', false, 0, 4, 8);
INSERT INTO public.planet VALUES (13, 'WASP-12b', 300, 'Hot Jupiter', false, 0, 1, 9);
INSERT INTO public.planet VALUES (14, 'HR 8799 b', 100, 'Gas Giant', false, 4, 4590, 10);
INSERT INTO public.planet VALUES (15, 'KOI-456.04', 4500, 'Exoplanet', true, 1, 365, 11);
INSERT INTO public.planet VALUES (16, 'LHS 1140b', 5000, 'Super Earth', false, 0, 25, 12);
INSERT INTO public.planet VALUES (17, 'Ross 128b', 4500, 'Exoplanet', true, 0, 10, 13);
INSERT INTO public.planet VALUES (18, 'Proxima b', 4500, 'Exoplanet', true, 0, 11, 14);
INSERT INTO public.planet VALUES (19, '55 Cancri e', 1000, 'Super Earth', false, 0, 18, 15);
INSERT INTO public.planet VALUES (20, 'Kepler-442b', 5000, 'Super Earth', true, 0, 112, 16);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 5700, 'Yellow Dwarf', false, 6000, 3, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 3500, 'Red Supergiant', true, 8000, 4, 2);
INSERT INTO public.star VALUES (3, 'Rigel', 11000, 'Blue Supergiant', true, 9000, 4, 2);
INSERT INTO public.star VALUES (4, 'Vega', 9600, 'White Main Sequence', false, 455, 2, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 9940, 'White Main Sequence', false, 300, 2, 3);
INSERT INTO public.star VALUES (6, 'Canopus', 7350, 'Yellow Giant', true, 10000, 3, 5);
INSERT INTO public.star VALUES (7, 'Aldebaran', 3910, 'Red Giant', true, 7000, 3, 6);
INSERT INTO public.star VALUES (8, 'Arcturus', 4290, 'Red Giant', true, 8700, 3, 1);
INSERT INTO public.star VALUES (9, 'Capella', 5770, 'Yellow Giant', false, 1000, 3, 4);
INSERT INTO public.star VALUES (10, 'Procyon', 6530, 'White Main Sequence', false, 1500, 2, 3);
INSERT INTO public.star VALUES (11, 'Antares', 3300, 'Red Supergiant', true, 12000, 4, 5);
INSERT INTO public.star VALUES (12, 'Altair', 7700, 'White Main Sequence', false, 1100, 2, 6);
INSERT INTO public.star VALUES (13, 'Deneb', 8525, 'Blue Supergiant', true, 15000, 4, 7);
INSERT INTO public.star VALUES (14, 'Fomalhaut', 8700, 'White Main Sequence', false, 440, 2, 8);
INSERT INTO public.star VALUES (15, 'Bellatrix', 22000, 'Blue Giant', true, 7000, 3, 9);
INSERT INTO public.star VALUES (16, 'Polaris', 7200, 'Yellow Supergiant', true, 8000, 4, 10);
INSERT INTO public.star VALUES (17, 'Castor', 10100, 'White Main Sequence', false, 600, 2, 11);
INSERT INTO public.star VALUES (18, 'Almach', 4500, 'Orange Giant', false, 5000, 3, 12);
INSERT INTO public.star VALUES (19, 'Spica', 20000, 'Blue Giant', true, 12000, 3, 13);
INSERT INTO public.star VALUES (20, 'Regulus', 10000, 'White Main Sequence', false, 300, 2, 14);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: asteroid fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

