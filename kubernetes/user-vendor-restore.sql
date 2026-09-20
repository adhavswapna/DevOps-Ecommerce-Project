SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: user_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE user_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE user_db OWNER TO postgres;

\connect user_db

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

--
-- Name: Role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Role" AS ENUM (
    'USER',
    'VENDOR',
    'ADMIN'
);


ALTER TYPE public."Role" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    role public."Role" DEFAULT 'USER'::public."Role" NOT NULL,
    name text,
    phone text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, email, role, name, phone, "createdAt", "updatedAt") FROM stdin;
77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	swapnaadhav123@gmail.com	USER	Swapna	\N	2026-03-30 05:17:45.442	2026-03-30 05:17:45.442
e7915365-d69e-4f0b-83a2-68e249232271	testuser123@gmail.com	USER	Test User	\N	2026-06-16 08:06:27.996	2026-06-16 08:06:27.996
8a734868-281d-430d-9352-953d01538dfc	testvendor@example.com	VENDOR	Test Vendor	\N	2026-08-15 18:14:37.691	2026-08-15 18:14:37.691
855eaf49-89b3-48cc-8cd5-03afa26b4d00	swapnaadhav@rediffmail.com	VENDOR	Swapna Adhav	\N	2026-08-15 18:17:14.467	2026-08-15 18:17:14.467
59b95785-45f5-4ccf-900c-2174a9cf0178	testvendor2@example.com	VENDOR	Test Vendor 2	\N	2026-08-19 08:42:42.894	2026-08-19 08:42:42.894
54b5df74-b815-4851-a82d-a4dc711a9c2e	vendor@samsung.com	VENDOR	Samsung Store	\N	2026-08-20 08:53:02.088	2026-08-20 08:53:02.088
970da6b3-f208-4fb7-8071-e9b8ba4b627f	vendor@apple.com	VENDOR	Apple Store	\N	2026-08-20 09:06:12.923	2026-08-20 09:06:12.923
af4dd319-0984-4379-9ad4-ff65143b6628	vendor@sony.com	VENDOR	Sony Store	\N	2026-08-20 09:09:07.145	2026-08-20 09:09:07.145
1305a800-4d61-4330-a3ee-a2e7edc18afb	sony-store-123@gmail.com	VENDOR	Sony Store	\N	2026-08-20 09:13:38.174	2026-08-20 09:13:38.174
95811ede-ba0d-4339-a31a-3b289ea81e1c	testregister987@example.com	USER	Test User	\N	2026-08-21 13:49:17.903	2026-08-21 13:49:17.903
9064c563-3473-4983-a02a-8af71e8adbfb	testregister988@example.com	USER	Test User 2	\N	2026-08-21 14:25:40.26	2026-08-21 14:25:40.26
62eda059-ed5b-418e-9b7d-b3bdad2a452c	swapna-test-20260821@example.com	USER	Swapna Test	\N	2026-08-21 14:36:52.434	2026-08-21 14:36:52.434
e7d4e8d1-a13a-4486-9ffe-345c75035d61	ritikavaz@gmail.com	USER	Riika g	\N	2026-08-21 16:10:16.023	2026-08-21 16:10:16.023
6d08cd81-a5a1-46a0-af8c-1948011c9ab7	admin@example.com	USER	Admin User	\N	2026-08-28 13:04:38.129	2026-08-28 13:04:38.129
73fb6fd8-14d4-4784-989c-15154c89fb8d	testvendor2026@example.com	VENDOR	Test Vendor	\N	2026-09-02 10:25:57.66	2026-09-02 10:25:57.66
b276aaf3-75a1-42d2-ae94-4031ccbbbc3c	testvendor2026b@example.com	VENDOR	Test Vendor 2	\N	2026-09-02 10:30:09.295	2026-09-02 10:30:09.295
e7ef5307-80be-4bf0-b096-a25ecc280178	beautystore@example.com	VENDOR	Beauty Store	\N	2026-09-03 11:09:25.642	2026-09-03 11:09:25.642
0bb07334-1b8d-43cb-81bf-477683721c3f	anushkaa@gmail.com	USER	Anushka Adhav	\N	2026-09-07 11:39:48.584	2026-09-07 11:39:48.584
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
acf74c0a-520e-462b-be74-0b1e8dde44fe	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-03-24 12:32:11.41807+00	20260113113023_init	\N	\N	2026-03-24 12:32:11.311513+00	1
06fe0e6c-bab8-4317-a47a-b127db39df59	e94ac992d8178fd1ba63ea2b3ce0b3a7bc0b4c6d296aac21c631c2b6ea735231	2026-03-24 12:32:11.484949+00	20260119091400_init	\N	\N	2026-03-24 12:32:11.42533+00	1
6e3c01cb-da93-4765-9968-09884813d379	1baf4744a2cb06d579d800f72ee777a32c7a4b0a86b9ae412c2e089265edb901	2026-03-24 12:32:11.549958+00	20260119114208_init	\N	\N	2026-03-24 12:32:11.492297+00	1
225eb9ea-a922-467a-bdc7-70080c77eb92	9b3f0f1eec2c15a50a07879f4f7bad77b065def69bfee1ee6c3b5241536f233d	2026-03-24 12:32:11.619211+00	20260129100811_init	\N	\N	2026-03-24 12:32:11.559481+00	1
11410813-b019-421f-bd31-453f3e6c3ad3	6dd7c7a6839639338ef7c8d0efe49793d87b332a50ab16eccbb230a8fe46a8e2	2026-03-24 12:32:11.651627+00	20260206092239_init	\N	\N	2026-03-24 12:32:11.626428+00	1
8ce3a4dc-9b47-445e-afeb-d7ef042638b3	7b9f837a31a1ea91569ee9ee615b65d41c5a97d9ec9976a5be1593933383876e	2026-03-24 12:32:11.684768+00	20260215091716_init	\N	\N	2026-03-24 12:32:11.659619+00	1
dbc92896-ede0-4b73-9775-4afde04eef4a	98d56b878059515c6544ce63407e302637b3d9b0f30dd5b67e5851951b0d820d	2026-03-24 12:32:11.718887+00	20260315121458_init	\N	\N	2026-03-24 12:32:11.692684+00	1
\.


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- PostgreSQL database dump complete
--

--
-- Database "vendor_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-2.pgdg120+1)

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

--
-- Name: vendor_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE vendor_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE vendor_db OWNER TO postgres;

\connect vendor_db

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

--
-- Name: VendorStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."VendorStatus" AS ENUM (
    'PENDING',
    'APPROVED',
    'REJECTED'
);


ALTER TYPE public."VendorStatus" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Vendor" (
    id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    address text,
    phone text,
    status public."VendorStatus" DEFAULT 'PENDING'::public."VendorStatus" NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "userId" text
);


ALTER TABLE public."Vendor" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Data for Name: Vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Vendor" (id, name, email, "isActive", "createdAt", address, phone, status, "updatedAt", "userId") FROM stdin;
a6bd48e8-58e0-4f6b-979b-68dff52deff3	Beauty Store	beautystore@example.com	t	2026-09-03 11:09:25.962	Mumbai	9876543210	APPROVED	2026-09-03 13:55:25.129	e7ef5307-80be-4bf0-b096-a25ecc280178
57ae3c9a-aa95-43b7-b79b-70dfa49e5649	Swapna	swapnaadhav@rediffmail.com	t	2026-08-15 18:33:45.129	Kharghar	09167455961	APPROVED	2026-08-15 18:33:45.129	855eaf49-89b3-48cc-8cd5-03afa26b4d00
8a734868-281d-430d-9352-953d01538dfc	Test Vendor	testvendor@example.com	t	2026-08-17 18:14:14.927	\N	\N	APPROVED	2026-08-17 18:14:14.927	8a734868-281d-430d-9352-953d01538dfc
6f7e6756-2da5-4001-967b-d083cac4c787	Test Vendor 2	testvendor2@example.com	t	2026-08-19 08:42:40.861	Mumbai	9876543210	APPROVED	2026-08-19 08:42:40.861	59b95785-45f5-4ccf-900c-2174a9cf0178
8eef14ba-6072-412a-81f3-c98edbbdab22	Apple Store	swapna123@rediffmail.com	t	2026-03-24 17:45:13.913	\N	\N	APPROVED	2026-08-19 11:51:41.425	\N
6ec84042-bf74-4dbb-a885-376cfd507a26	Samsung Store	vendor@samsung.com	t	2026-04-10 16:27:55.308	\N	\N	APPROVED	2026-08-20 09:02:17.278	54b5df74-b815-4851-a82d-a4dc711a9c2e
0d56df83-b041-4b98-8b48-b6e59edd4c55	Apple Store	vendor@apple.com	t	2026-04-22 08:18:37.825	Pune	9876543212	APPROVED	2026-04-22 08:20:59.746	970da6b3-f208-4fb7-8071-e9b8ba4b627f
aeb67e06-4014-41b0-9e93-a949f2023a08	Sony Store	sony-store-123@gmail.com	t	2026-06-16 07:41:49.146	Mumbai	9876543219	APPROVED	2026-08-20 09:15:07.318	1305a800-4d61-4330-a3ee-a2e7edc18afb
2c9f0f5d-b039-4a43-af46-7eb21217782d	Swapna Adhav	swapnaadhav123@gmail.com	t	2026-08-15 13:28:25	Flat 204, 2nd Flr, Shantiniketan Chs	09167455961	APPROVED	2026-08-15 13:28:25	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3
8a886564-8855-4c98-abec-c7da908bf1bb	Sony Store	vendor@sony.com	f	2026-08-20 09:09:07.227	Banglore	9876543219	PENDING	2026-08-20 09:09:07.227	af4dd319-0984-4379-9ad4-ff65143b6628
f81c5333-29bd-482d-a9bd-6b51bc3a6999	Test Vendor 2	testvendor2026b@example.com	f	2026-09-02 10:30:09.433	Mumbai, Maharashtra	9876543211	PENDING	2026-09-02 10:30:09.433	b276aaf3-75a1-42d2-ae94-4031ccbbbc3c
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
6c503599-79b7-4358-8b8c-6a473af745bf	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-03-24 17:19:55.566748+00	20260113113023_init	\N	\N	2026-03-24 17:19:55.410599+00	1
e4c68d13-b823-4be8-812c-ff551b0328df	61f6a43383f5deecc485ad27e7fb93a8014b3d3cec642237761b7ca117ad03d9	2026-03-24 17:19:55.663593+00	20260115114337_init	\N	\N	2026-03-24 17:19:55.574181+00	1
b0789f24-443d-478e-83d2-f6b00b298d49	d1b78b0950a680c8648b8d77a71b82e2b4a18a8b6de9db344b119b8d411ade2c	2026-04-11 06:39:59.170087+00	20260411063958_init	\N	\N	2026-04-11 06:39:58.63562+00	1
f1e80437-614d-4f32-bf19-70c4245c50c4	4ef77357a8876a02516163707361015537ed5c978cc7dbdf29147acf35202a8b	2026-09-02 10:08:55.926498+00	20260902100850_vendor_inactive_by_default	\N	\N	2026-09-02 10:08:55.900894+00	1
\.


--
-- Name: Vendor Vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Vendor"
    ADD CONSTRAINT "Vendor_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Vendor_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Vendor_email_key" ON public."Vendor" USING btree (email);


--
-- Name: Vendor_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Vendor_userId_idx" ON public."Vendor" USING btree ("userId");


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

