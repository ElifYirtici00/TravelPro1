--
-- PostgreSQL database dump
--

\restrict LGPq8l7arRX4CyyFRn2kliyhZhX9MON9c4RaqgtjA79TaVNq6LVeHQVAMPXTaAx

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Busses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Busses" (
    "busId" integer NOT NULL,
    agency character varying(16) NOT NULL,
    origin character varying(16) NOT NULL,
    destination character varying(16) NOT NULL
);


ALTER TABLE public."Busses" OWNER TO postgres;

--
-- Name: Passengers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Passengers" (
    "passengerId" integer NOT NULL,
    "passengerName" character varying(16) CONSTRAINT "Passengers_name_not_null" NOT NULL,
    "passengerAdress" character varying(32) CONSTRAINT "Passengers_address_not_null" NOT NULL,
    telephone character varying(16) NOT NULL
);


ALTER TABLE public."Passengers" OWNER TO postgres;

--
-- Name: Travels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Travels" (
    "passengerId" integer NOT NULL,
    "busId" integer NOT NULL,
    date date NOT NULL,
    "time" time without time zone CONSTRAINT "Travels_Time_not_null" NOT NULL,
    price character varying(16) CONSTRAINT "Travels_Price_not_null" NOT NULL,
    seat character varying(3) NOT NULL,
    "travelId" integer DEFAULT 16 NOT NULL
);


ALTER TABLE public."Travels" OWNER TO postgres;

--
-- Data for Name: Busses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Busses" VALUES
	(54, 'Tatangalar', 'Sakarya', 'Nevşehir'),
	(35, 'Sahil', 'İzmir', 'Antalya'),
	(34, 'Galata', 'İstanbul', 'Ankara');


--
-- Data for Name: Passengers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Passengers" VALUES
	(3, 'Ayşem', 'İstanbul', '05789624678'),
	(2, 'Elif', 'Gaziantep', '05478433675'),
	(1, 'Fatma', 'Ankara', '05645696363');


--
-- Data for Name: Travels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Travels" VALUES
	(3, 54, '2026-02-03', '05:00:00', '80', '18', 16),
	(1, 34, '2026-02-20', '01:00:00', '90$', '12', 20);


--
-- Name: Passengers Passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Passengers"
    ADD CONSTRAINT "Passengers_pkey" PRIMARY KEY ("passengerId");


--
-- Name: Travels Travels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Travels"
    ADD CONSTRAINT "Travels_pkey" PRIMARY KEY ("travelId");


--
-- Name: Busses unique_Busses_busId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Busses"
    ADD CONSTRAINT "unique_Busses_busId" PRIMARY KEY ("busId");


--
-- Name: Passengers unique_Passengers_passengerId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Passengers"
    ADD CONSTRAINT "unique_Passengers_passengerId" UNIQUE ("passengerId");


--
-- Name: Travels unique_Travels_travelId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Travels"
    ADD CONSTRAINT "unique_Travels_travelId" UNIQUE ("travelId");


--
-- Name: Travels TravelPassengerFk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Travels"
    ADD CONSTRAINT "TravelPassengerFk" FOREIGN KEY ("passengerId") REFERENCES public."Passengers"("passengerId");


--
-- Name: Travels TravelbusFk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Travels"
    ADD CONSTRAINT "TravelbusFk" FOREIGN KEY ("busId") REFERENCES public."Busses"("busId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict LGPq8l7arRX4CyyFRn2kliyhZhX9MON9c4RaqgtjA79TaVNq6LVeHQVAMPXTaAx

