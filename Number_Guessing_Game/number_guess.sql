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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    game_guesses integer NOT NULL,
    user_id integer NOT NULL
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
    user_name character varying(50) NOT NULL
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

INSERT INTO public.games VALUES (64, 448, 38);
INSERT INTO public.games VALUES (65, 525, 38);
INSERT INTO public.games VALUES (66, 983, 39);
INSERT INTO public.games VALUES (67, 769, 39);
INSERT INTO public.games VALUES (68, 398, 38);
INSERT INTO public.games VALUES (69, 283, 38);
INSERT INTO public.games VALUES (70, 518, 38);
INSERT INTO public.games VALUES (72, 52, 41);
INSERT INTO public.games VALUES (73, 340, 41);
INSERT INTO public.games VALUES (74, 733, 42);
INSERT INTO public.games VALUES (75, 703, 42);
INSERT INTO public.games VALUES (76, 44, 41);
INSERT INTO public.games VALUES (77, 789, 41);
INSERT INTO public.games VALUES (78, 112, 41);
INSERT INTO public.games VALUES (79, 441, 43);
INSERT INTO public.games VALUES (80, 700, 43);
INSERT INTO public.games VALUES (81, 49, 44);
INSERT INTO public.games VALUES (82, 283, 44);
INSERT INTO public.games VALUES (83, 435, 43);
INSERT INTO public.games VALUES (84, 9, 43);
INSERT INTO public.games VALUES (85, 877, 43);
INSERT INTO public.games VALUES (86, 808, 45);
INSERT INTO public.games VALUES (87, 596, 45);
INSERT INTO public.games VALUES (88, 685, 46);
INSERT INTO public.games VALUES (89, 972, 46);
INSERT INTO public.games VALUES (90, 38, 45);
INSERT INTO public.games VALUES (91, 691, 45);
INSERT INTO public.games VALUES (92, 180, 45);
INSERT INTO public.games VALUES (93, 139, 47);
INSERT INTO public.games VALUES (94, 283, 47);
INSERT INTO public.games VALUES (95, 950, 48);
INSERT INTO public.games VALUES (96, 579, 48);
INSERT INTO public.games VALUES (97, 657, 47);
INSERT INTO public.games VALUES (98, 213, 47);
INSERT INTO public.games VALUES (99, 940, 47);
INSERT INTO public.games VALUES (100, 185, 49);
INSERT INTO public.games VALUES (101, 109, 49);
INSERT INTO public.games VALUES (102, 481, 50);
INSERT INTO public.games VALUES (103, 299, 50);
INSERT INTO public.games VALUES (104, 918, 49);
INSERT INTO public.games VALUES (105, 31, 49);
INSERT INTO public.games VALUES (106, 396, 49);
INSERT INTO public.games VALUES (107, 896, 51);
INSERT INTO public.games VALUES (108, 475, 51);
INSERT INTO public.games VALUES (109, 945, 52);
INSERT INTO public.games VALUES (110, 533, 52);
INSERT INTO public.games VALUES (111, 767, 51);
INSERT INTO public.games VALUES (112, 79, 51);
INSERT INTO public.games VALUES (113, 345, 51);
INSERT INTO public.games VALUES (114, 435, 53);
INSERT INTO public.games VALUES (115, 232, 53);
INSERT INTO public.games VALUES (116, 417, 54);
INSERT INTO public.games VALUES (117, 65, 54);
INSERT INTO public.games VALUES (118, 638, 53);
INSERT INTO public.games VALUES (119, 77, 53);
INSERT INTO public.games VALUES (120, 564, 53);
INSERT INTO public.games VALUES (121, 534, 55);
INSERT INTO public.games VALUES (122, 565, 55);
INSERT INTO public.games VALUES (123, 871, 56);
INSERT INTO public.games VALUES (124, 577, 56);
INSERT INTO public.games VALUES (125, 458, 55);
INSERT INTO public.games VALUES (126, 175, 55);
INSERT INTO public.games VALUES (127, 885, 55);
INSERT INTO public.games VALUES (128, 315, 57);
INSERT INTO public.games VALUES (129, 444, 57);
INSERT INTO public.games VALUES (130, 548, 58);
INSERT INTO public.games VALUES (131, 160, 58);
INSERT INTO public.games VALUES (132, 430, 57);
INSERT INTO public.games VALUES (133, 922, 57);
INSERT INTO public.games VALUES (134, 738, 57);
INSERT INTO public.games VALUES (135, 211, 59);
INSERT INTO public.games VALUES (136, 81, 59);
INSERT INTO public.games VALUES (137, 65, 60);
INSERT INTO public.games VALUES (138, 920, 60);
INSERT INTO public.games VALUES (139, 291, 59);
INSERT INTO public.games VALUES (140, 253, 59);
INSERT INTO public.games VALUES (141, 822, 59);
INSERT INTO public.games VALUES (142, 983, 61);
INSERT INTO public.games VALUES (143, 44, 61);
INSERT INTO public.games VALUES (144, 708, 62);
INSERT INTO public.games VALUES (145, 730, 62);
INSERT INTO public.games VALUES (146, 6, 61);
INSERT INTO public.games VALUES (147, 579, 61);
INSERT INTO public.games VALUES (148, 479, 61);
INSERT INTO public.games VALUES (149, 173, 63);
INSERT INTO public.games VALUES (150, 184, 63);
INSERT INTO public.games VALUES (151, 515, 64);
INSERT INTO public.games VALUES (152, 914, 64);
INSERT INTO public.games VALUES (153, 664, 63);
INSERT INTO public.games VALUES (154, 306, 63);
INSERT INTO public.games VALUES (155, 588, 63);
INSERT INTO public.games VALUES (156, 286, 65);
INSERT INTO public.games VALUES (157, 83, 65);
INSERT INTO public.games VALUES (158, 209, 66);
INSERT INTO public.games VALUES (159, 99, 66);
INSERT INTO public.games VALUES (160, 335, 65);
INSERT INTO public.games VALUES (161, 951, 65);
INSERT INTO public.games VALUES (162, 371, 65);
INSERT INTO public.games VALUES (163, 137, 67);
INSERT INTO public.games VALUES (164, 88, 67);
INSERT INTO public.games VALUES (165, 310, 68);
INSERT INTO public.games VALUES (166, 55, 68);
INSERT INTO public.games VALUES (167, 321, 67);
INSERT INTO public.games VALUES (168, 867, 67);
INSERT INTO public.games VALUES (169, 63, 67);
INSERT INTO public.games VALUES (170, 745, 69);
INSERT INTO public.games VALUES (171, 799, 69);
INSERT INTO public.games VALUES (172, 417, 70);
INSERT INTO public.games VALUES (173, 295, 70);
INSERT INTO public.games VALUES (174, 847, 69);
INSERT INTO public.games VALUES (175, 800, 69);
INSERT INTO public.games VALUES (176, 360, 69);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (38, 'user_1659805760259');
INSERT INTO public.users VALUES (39, 'user_1659805760258');
INSERT INTO public.users VALUES (40, 'Frank');
INSERT INTO public.users VALUES (41, 'user_1659806161522');
INSERT INTO public.users VALUES (42, 'user_1659806161521');
INSERT INTO public.users VALUES (43, 'user_1659806197178');
INSERT INTO public.users VALUES (44, 'user_1659806197177');
INSERT INTO public.users VALUES (45, 'user_1659806217148');
INSERT INTO public.users VALUES (46, 'user_1659806217147');
INSERT INTO public.users VALUES (47, 'user_1659806239948');
INSERT INTO public.users VALUES (48, 'user_1659806239947');
INSERT INTO public.users VALUES (49, 'user_1659806265974');
INSERT INTO public.users VALUES (50, 'user_1659806265973');
INSERT INTO public.users VALUES (51, 'user_1659806275892');
INSERT INTO public.users VALUES (52, 'user_1659806275891');
INSERT INTO public.users VALUES (53, 'user_1659806302336');
INSERT INTO public.users VALUES (54, 'user_1659806302335');
INSERT INTO public.users VALUES (55, 'user_1659806307595');
INSERT INTO public.users VALUES (56, 'user_1659806307594');
INSERT INTO public.users VALUES (57, 'user_1659806402237');
INSERT INTO public.users VALUES (58, 'user_1659806402236');
INSERT INTO public.users VALUES (59, 'user_1659806500042');
INSERT INTO public.users VALUES (60, 'user_1659806500041');
INSERT INTO public.users VALUES (61, 'user_1659806505302');
INSERT INTO public.users VALUES (62, 'user_1659806505301');
INSERT INTO public.users VALUES (63, 'user_1659806524198');
INSERT INTO public.users VALUES (64, 'user_1659806524197');
INSERT INTO public.users VALUES (65, 'user_1659806529598');
INSERT INTO public.users VALUES (66, 'user_1659806529597');
INSERT INTO public.users VALUES (67, 'user_1659806533467');
INSERT INTO public.users VALUES (68, 'user_1659806533466');
INSERT INTO public.users VALUES (69, 'user_1659806536906');
INSERT INTO public.users VALUES (70, 'user_1659806536905');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 176, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 70, true);


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

