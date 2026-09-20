--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:CqCSYGtlMJivhY01fDY5Fg==$CLCbfDqVj9LTCOkOi618J0mBWrQlYXPzLqnNbh9z6CU=:XzGp6xMHZcIIQbWRNDz35dkR2EZqPkCNDzyVQoFZrio=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

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
-- PostgreSQL database dump complete
--

--
-- Database "admin_db" dump
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
-- Name: admin_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE admin_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE admin_db OWNER TO postgres;

\connect admin_db

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
-- Name: Admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Admin" (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    role text DEFAULT 'ADMIN'::text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Admin" OWNER TO postgres;

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
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Admin" (id, email, password, role, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
aa9eaffb-120f-4ea2-8a9f-2ed62605dc24	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-04-09 09:48:26.947076+00	20260113113023_init	\N	\N	2026-04-09 09:48:26.885549+00	1
b7f7736e-9765-4d21-8652-97a9c78129c5	75649a0077e50cc655f864206a2ad71cd580800a263aa183d961f8917c5f2296	2026-04-09 09:48:27.041128+00	20260115081120_init	\N	\N	2026-04-09 09:48:26.95481+00	1
2a2d17e5-4144-4036-bf69-08da0a8eebed	618d9bb64b11efe6420925d12dd2ce8bba2df11b4aa25dba7ac19d98079235d9	2026-04-09 09:48:27.091753+00	20260115091038_init	\N	\N	2026-04-09 09:48:27.047869+00	1
c01aab55-0266-4a5c-8154-d42901da6a66	c957f291338fe48b10dc144bba9f0e14521434eeae9e367772fe01301e50595c	2026-04-09 09:48:27.159848+00	20260201104926_init	\N	\N	2026-04-09 09:48:27.098839+00	1
\.


--
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Admin_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Admin_email_key" ON public."Admin" USING btree (email);


--
-- PostgreSQL database dump complete
--

--
-- Database "analytics_db" dump
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
-- Name: analytics_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE analytics_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE analytics_db OWNER TO postgres;

\connect analytics_db

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
-- Name: AnalyticsEvent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AnalyticsEvent" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    data jsonb,
    event text NOT NULL,
    "userId" text NOT NULL
);


ALTER TABLE public."AnalyticsEvent" OWNER TO postgres;

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
-- Data for Name: AnalyticsEvent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AnalyticsEvent" (id, "createdAt", data, event, "userId") FROM stdin;
b14ea903-7bbf-4532-b277-bf45dce54870	2026-04-10 14:08:27.121	{"productId": "cmncsqpkp00003jx9cs4gxo3z"}	PRODUCT_VIEWED	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3
81247017-fff0-4965-bd1b-c85c0d6fd2cc	2026-04-22 11:52:27.14	{"productId": "cmncsqpkp00003jx9cs4gxo3z"}	PRODUCT_VIEWED	777af8fb5-d6c5-4b39-96d9-c7ce8f2823d3
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
c9191a3d-b86a-42e6-9958-375101096187	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-04-09 09:28:16.493786+00	20260113113023_init	\N	\N	2026-04-09 09:28:16.434247+00	1
dbe2f376-b506-4636-9537-7a2908f20d2b	01a9bc84e26d3ebce4282f7ec55d4aa9165db0ac2e2eec76d4af7a293e31ffd6	2026-04-09 09:28:16.545959+00	20260203100118_init	\N	\N	2026-04-09 09:28:16.500119+00	1
\.


--
-- Name: AnalyticsEvent AnalyticsEvent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AnalyticsEvent"
    ADD CONSTRAINT "AnalyticsEvent_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "auth_db" dump
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
-- Name: auth_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE auth_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE auth_db OWNER TO postgres;

\connect auth_db

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
-- Name: AuthUser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AuthUser" (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    role public."Role" DEFAULT 'USER'::public."Role" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    "resetToken" text,
    "resetTokenExpiry" timestamp(3) without time zone,
    address text,
    name text,
    phone text,
    "vendorStatus" public."VendorStatus"
);


ALTER TABLE public."AuthUser" OWNER TO postgres;

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
-- Data for Name: AuthUser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AuthUser" (id, email, password, role, "createdAt", "updatedAt", "isVerified", "resetToken", "resetTokenExpiry", address, name, phone, "vendorStatus") FROM stdin;
2cb05d18-310b-415e-8f82-5a2ced57bc57	swapnaadav123@gmail.com	$2b$10$.0ODrRHfq/24NQOIfLWt.uVm3/auCEkKGYCbcbgjKp6DMKyG7aP6.	USER	2026-03-24 12:37:57.633	2026-03-24 12:37:57.633	t	\N	\N		Swapna Adhav		\N
3b45b73b-f58a-441c-a691-ade3095fb51b	swapna123@gmail.com	$2b$10$4m.M3IOxFDmFuOWU9u3qpuUvKelS8rF2uIZACW8Mzm.rnhuMa3FJe	USER	2026-03-24 17:04:34.537	2026-03-24 17:04:34.537	t	\N	\N	\N	Test User	\N	\N
33b90461-9085-4066-9418-62333fac528a	swapna123@rediffmail.com	$2b$10$CF6gELmr0OrPzxO5835WGOB0KjMr0UbvWMGlJLreAJsnGlCcRtouO	USER	2026-03-24 17:06:15.75	2026-03-24 17:06:15.75	t	\N	\N	\N	Test User	\N	\N
f9b1a101-901a-487c-8c41-7094525eaf76	swapna123@gmmail.com	$2b$10$YVwA9sedpZGPSh5biChpEu5tDU5i6u4R.Dwy2fWL4676VFIHIr9OO	USER	2026-03-24 17:47:28.018	2026-03-24 17:47:28.018	t	\N	\N	\N	Swapna Adhav	\N	\N
e7915365-d69e-4f0b-83a2-68e249232271	testuser123@gmail.com	$2b$10$rgb2iXG817qh5L3V6kmPyue1TUVk40F8A4/Y7N3uYBpkLDOsge3Yq	USER	2026-06-15 15:57:20.66	2026-06-15 15:57:20.66	t	\N	\N	\N	Test User	\N	\N
62a9de94-c143-4957-97b3-578b038a9c51	admin@shopsphere.com	$2b$10$qcEdxyqgzAXGYfxQW8nZEOPDk5i641B4SKtGiVKOyLebunNW0qzmW	ADMIN	2026-08-15 18:11:40.08	2026-08-16 06:41:21.806	t	\N	\N	\N	ShopSphere Admin	\N	\N
e7ef5307-80be-4bf0-b096-a25ecc280178	beautystore@example.com	$2b$10$EbcqS5bGbXNpSWbkO7V4teUNbYgR4LkfTxGqMc4WkYkYnggaqZNEu	VENDOR	2026-09-03 11:09:21.593	2026-09-03 13:55:41.049	t	\N	\N	Mumbai	Beauty Store	9876543210	APPROVED
0bb07334-1b8d-43cb-81bf-477683721c3f	anushkaa@gmail.com	$2b$10$bE/mxHi3x.d5Al7NnJ/qWuNTmlCYx785wtzUXQi0CCycBvg/kvPn6	USER	2026-09-07 11:39:39.071	2026-09-07 11:39:39.071	t	\N	\N	parel	Anushka Adhav	123456	\N
b276aaf3-75a1-42d2-ae94-4031ccbbbc3c	testvendor2026b@example.com	$2b$10$RBmJlO29p7qZ8W1bJaUXDOUlqrbZt8PuRL76OBjL5tjCaNzIqXgZ6	VENDOR	2026-09-02 10:30:08.961	2026-09-02 10:30:08.961	t	\N	\N	Mumbai, Maharashtra	Test Vendor 2	9876543211	PENDING
54b5df74-b815-4851-a82d-a4dc711a9c2e	vendor@samsung.com	$2b$10$PclDtasOeiy2vmll8EF9YOVXSbHCzYdV4md/V0JZeoaa9rTGezIHq	VENDOR	2026-08-20 08:52:58.387	2026-08-20 08:52:58.387	t	\N	\N	Mumbai	Samsung Store	9876543211	APPROVED
77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	swapnaadhav123@gmail.com	$2b$10$bg/UpC6eDl9s.2E8c6LYoegdbabbRN/5KTqaX/br5YneIVDpBubzC	VENDOR	2026-03-30 05:17:24.866	2026-09-07 11:42:05.241	t	843307adc1da6e946b02c145d9344f87b32651287547ed1b97dd204b26cbbb1c	2026-09-07 11:57:05.235	\N	Swapna	\N	APPROVED
855eaf49-89b3-48cc-8cd5-03afa26b4d00	swapnaadhav@rediffmail.com	$2b$10$fcKP5588BcmLH/D9RU/Qbe071z740gdywN/233YETZDG/Xl43Cw66	VENDOR	2026-08-15 18:17:14.437	2026-08-17 13:39:03.174	t	\N	\N	Flat 204, 2nd Flr, Shantiniketan CHS, Sector 8, Plot 8, Kharghar	Swapna Adhav	9876543210	APPROVED
8a734868-281d-430d-9352-953d01538dfc	testvendor@example.com	$2b$10$PWVnp8KOnn9AAVY29vATnOOzXTPtrTZwhay4Ceddmw.Hvzo6JQnJW	VENDOR	2026-08-15 18:14:35.461	2026-08-17 13:39:03.394	t	\N	\N	Kharghar	Test Vendor	09167455961	APPROVED
970da6b3-f208-4fb7-8071-e9b8ba4b627f	vendor@apple.com	$2b$10$lp5UpQvf/fx5RwPXejWUauL1yT4zReC6c.G85eaG4Y7EOFwyJ99mi	VENDOR	2026-08-20 09:06:12.145	2026-08-20 09:06:12.145	t	\N	\N	pune	Apple Store	9876543212	APPROVED
af4dd319-0984-4379-9ad4-ff65143b6628	vendor@sony.com	$2b$10$M/s4lyLONwBSBC3BfqpE2.PqkjFNChkcq2ETNAf6MH20XbM.iNEUa	VENDOR	2026-08-20 09:09:07.075	2026-08-20 09:09:07.075	t	\N	\N	Banglore	Sony Store	9876543219	PENDING
95811ede-ba0d-4339-a31a-3b289ea81e1c	testregister987@example.com	$2b$10$PTjIc4Gbw7P.nCe7iPzrDOo3eogLHhUnibk0D.xfSR9KsXYjbn/Ba	USER	2026-08-21 13:49:14.559	2026-08-21 13:49:14.559	t	\N	\N	bangalore	Test User	1234	\N
9064c563-3473-4983-a02a-8af71e8adbfb	testregister988@example.com	$2b$10$zfmuZfTG2fYv7ZXA34C9tOtQf3lRjnUBQyZqzq5zPsP9W/X2ADZGi	USER	2026-08-21 14:25:36.156	2026-08-21 14:25:36.156	t	\N	\N	Bangalore	Test User 2	1234567890	\N
62eda059-ed5b-418e-9b7d-b3bdad2a452c	swapna-test-20260821@example.com	$2b$10$RNqF3IIMVo58IgXrYYsw/uChj880MtLcfEYVemp6.A6NqS7GSD.uG	USER	2026-08-21 14:36:49.428	2026-08-21 14:36:49.428	t	\N	\N	Bangalore	Swapna Test	9876543210	\N
e7d4e8d1-a13a-4486-9ffe-345c75035d61	ritikavaz@gmail.com	$2b$10$UF6TJyumCQYqKS032kGCUe0bjYLuDePHkSY69jJzBjmzRPewCTa4W	USER	2026-08-21 16:10:12.909	2026-08-21 16:10:12.909	t	\N	\N	kochi	Riika g	4567891011	\N
1305a800-4d61-4330-a3ee-a2e7edc18afb	sony-store-123@gmail.com	$2b$10$OgNyJq5Y4txWGeqEhVvsYeEQP18lWpQJangAYnl610lKINR7tZibG	VENDOR	2026-08-20 09:13:38.135	2026-08-20 09:13:38.135	t	\N	\N	Mumbai	Sony Store	9876543219	APPROVED
6d08cd81-a5a1-46a0-af8c-1948011c9ab7	admin@example.com	$2b$10$rnPsALAlhgW9aRTmHTmkruPtyVJuCSz79/SR79VEIIIR1wZDFjZUK	ADMIN	2026-08-28 13:04:34.477	2026-08-28 13:04:34.477	t	\N	\N	\N	Admin User	\N	\N
73fb6fd8-14d4-4784-989c-15154c89fb8d	testvendor2026@example.com	$2b$10$jnfdSfNuNu9U9cGS.in83u8KW6M8laNXFebUyG8kxPVGux4D7pJ0W	VENDOR	2026-09-02 10:25:49.287	2026-09-02 10:25:49.287	t	\N	\N	Mumbai, Maharashtra	Test Vendor	9876543210	PENDING
59b95785-45f5-4ccf-900c-2174a9cf0178	testvendor2@example.com	$2b$10$SaF8/4k0tc/IZhWSoybYr.OyfXyPnn6KVKrcwAo8Sc0DvVRMTUeEu	VENDOR	2026-08-19 08:42:38.157	2026-08-20 09:32:38.192	t	\N	\N	Mumbai	Test Vendor 2	9876543210	APPROVED
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
8e9edfdc-584f-4d42-9655-14cc4b497201	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-03-24 12:16:30.082341+00	20260113113023_init	\N	\N	2026-03-24 12:16:30.025595+00	1
dda05381-319c-45ef-96b2-d76eba1f7987	e94ac992d8178fd1ba63ea2b3ce0b3a7bc0b4c6d296aac21c631c2b6ea735231	2026-03-24 12:16:30.207946+00	20260119091400_init	\N	\N	2026-03-24 12:16:30.089864+00	1
a7fd3e54-7d0f-4217-9770-60d5dc136838	1baf4744a2cb06d579d800f72ee777a32c7a4b0a86b9ae412c2e089265edb901	2026-03-24 12:16:30.271302+00	20260119114208_init	\N	\N	2026-03-24 12:16:30.214977+00	1
51dd8e86-d12a-4eaf-ac02-0523c0194c21	dac5e7a150597d393d09413ec46691f1fbbe8e0ae7c215ecdd6ff32115e274eb	2026-03-24 12:16:30.320793+00	20260210161638_	\N	\N	2026-03-24 12:16:30.278243+00	1
36ab2fda-abba-4402-82fe-5bb548ae0147	183de4fc7d634e74bf828bad87a9fa76c0611768adce64a78088f4851a37d3c8	2026-03-24 12:16:30.355199+00	20260213104942_init	\N	\N	2026-03-24 12:16:30.327697+00	1
dfcec1a7-6d4d-403b-83e4-f22b7342d5e1	a27d5276bb63b5ae73e01a261566636f8f40dcd3555ed058b38acdeeb9ee007d	2026-03-24 12:16:30.392031+00	20260214091013_add_name_field	\N	\N	2026-03-24 12:16:30.362064+00	1
4586a73a-0e48-4602-8020-13e621b2b2aa	9741d8f6ebbd8435bd4bdb59bccfd58e7c9efdc961eebecaef2543fc7ea096f7	2026-09-02 08:43:40.570438+00	20260902084340_add_vendor_status	\N	\N	2026-09-02 08:43:40.498971+00	1
\.


--
-- Name: AuthUser AuthUser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AuthUser"
    ADD CONSTRAINT "AuthUser_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: AuthUser_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuthUser_email_idx" ON public."AuthUser" USING btree (email);


--
-- Name: AuthUser_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "AuthUser_email_key" ON public."AuthUser" USING btree (email);


--
-- Name: AuthUser_role_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuthUser_role_idx" ON public."AuthUser" USING btree (role);


--
-- Name: AuthUser_vendorStatus_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AuthUser_vendorStatus_idx" ON public."AuthUser" USING btree ("vendorStatus");


--
-- PostgreSQL database dump complete
--

--
-- Database "cart_db" dump
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
-- Name: cart_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE cart_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE cart_db OWNER TO postgres;

\connect cart_db

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
-- Name: CartItemType; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CartItemType" AS ENUM (
    'CART',
    'WISHLIST'
);


ALTER TYPE public."CartItemType" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cart" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Cart" OWNER TO postgres;

--
-- Name: CartItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CartItem" (
    id text NOT NULL,
    "cartId" text NOT NULL,
    "productId" text NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL,
    type public."CartItemType" DEFAULT 'CART'::public."CartItemType" NOT NULL
);


ALTER TABLE public."CartItem" OWNER TO postgres;

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
-- Data for Name: Cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cart" (id, "userId", "updatedAt", "createdAt") FROM stdin;
cmn63e9pv0000xlk6xx0qd1ls	33b90461-9085-4066-9418-62333fac528a	2026-03-25 13:41:45.522	2026-03-25 13:41:45.522
cmnboeqne0000e7wmy9hi2c0u	2cb05d18-310b-415e-8f82-5a2ced57bc57	2026-03-29 11:28:50.282	2026-03-29 11:28:50.282
cmnct0v590000nbev3h4jgc8k	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	2026-03-30 06:25:47.137	2026-03-30 06:25:47.137
\.


--
-- Data for Name: CartItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CartItem" (id, "cartId", "productId", quantity, price, type) FROM stdin;
cmnnew4j50003juioc3v2ipgs	cmnboeqne0000e7wmy9hi2c0u	cmn4xbhbk0000fvd4br8fvyja	1	80000	WISHLIST
cmnjxcl7v000113nbpz6pnzcs	cmnboeqne0000e7wmy9hi2c0u	cmn4xab4600016ehypgarj7ra	1	80000	WISHLIST
cmo9u1vby0001vrfu8b1kkmhq	cmnct0v590000nbev3h4jgc8k	cmo9sqpd30000qx6n39izvfbk	1	70000	WISHLIST
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
91bc1586-7ba9-4371-8f4e-8cdc4f60a86a	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-03-25 13:40:07.085762+00	20260113113023_init	\N	\N	2026-03-25 13:40:06.613443+00	1
dda80c5c-59e6-45aa-8c20-ef78f5d31ffb	1d0bc8d62e26f06bb5aaf7b7f2868575702b3b068316d22817cbaa20388c1a26	2026-03-25 13:40:07.258398+00	20260116133644_init	\N	\N	2026-03-25 13:40:07.092524+00	1
779e2206-51ec-4fd6-91dc-04cdc7a57f79	110d181e1676dcc33ee52fd0e20848a5847b43605dac1da564dc5fc15d712fa7	2026-03-25 13:40:07.33492+00	20260317060504_init	\N	\N	2026-03-25 13:40:07.269039+00	1
64125a37-5945-42f6-aa1b-eca0b7e5d25a	93a96dbe82fb52af85c001e57d8b0ad3fe408ff582f70089378dd35adfd24203	2026-03-25 13:40:07.368817+00	20260320094130_init	\N	\N	2026-03-25 13:40:07.342316+00	1
\.


--
-- Name: CartItem CartItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CartItem"
    ADD CONSTRAINT "CartItem_pkey" PRIMARY KEY (id);


--
-- Name: Cart Cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cart"
    ADD CONSTRAINT "Cart_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Cart_userId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Cart_userId_key" ON public."Cart" USING btree ("userId");


--
-- Name: CartItem CartItem_cartId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CartItem"
    ADD CONSTRAINT "CartItem_cartId_fkey" FOREIGN KEY ("cartId") REFERENCES public."Cart"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

--
-- Database "ecommerce-postgres" dump
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
-- Name: ecommerce-postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ecommerce-postgres" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "ecommerce-postgres" OWNER TO postgres;

\connect -reuse-previous=on "dbname='ecommerce-postgres'"

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
-- PostgreSQL database dump complete
--

--
-- Database "email_db" dump
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
-- Name: email_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE email_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE email_db OWNER TO postgres;

\connect email_db

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
-- PostgreSQL database dump complete
--

--
-- Database "inventory_db" dump
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
-- Name: inventory_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE inventory_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE inventory_db OWNER TO postgres;

\connect inventory_db

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
-- Name: Inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Inventory" (
    id text NOT NULL,
    "productId" text NOT NULL,
    quantity integer NOT NULL,
    reserved integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Inventory" OWNER TO postgres;

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
-- Data for Name: Inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Inventory" (id, "productId", quantity, reserved, "createdAt", "updatedAt") FROM stdin;
c081f627-9197-4ec5-9712-24d9ba4740a9	cmp5b0bl50000lhtd3p2fsyox	99	0	2026-05-14 09:54:38.338	2026-05-14 10:16:10.438
21db3e76-2452-4b58-8218-fd72ed8dd40e	cmncsqpkp00003jx9cs4gxo3z	19	0	2026-04-09 10:14:29.596	2026-06-05 10:50:31.705
6629cde0-3eed-4b9d-8188-4163252c2f4b	cmn4xbhbk0000fvd4br8fvyja	35	0	2026-04-22 10:05:48.942	2026-06-09 12:04:55.792
ea0c03e3-b7f9-4c39-843b-bb1bf06f752c	cmo9sqpd30000qx6n39izvfbk	79	0	2026-04-22 10:09:38.971	2026-06-09 12:04:55.867
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
665711ae-e3aa-47b0-8eae-b40ece4a6c58	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-04-09 10:06:03.69141+00	20260113113023_init	\N	\N	2026-04-09 10:06:03.629354+00	1
b46ada29-46d1-4b57-aacd-c8b5d7f3d0ea	880dd49883a9062475946fc5cbd31a8da1bd4224b9921d9345a2d4cb0ecc403c	2026-04-09 10:06:03.805215+00	20260115092925_init	\N	\N	2026-04-09 10:06:03.69779+00	1
af1142ca-9011-4a77-8312-5170ba3985ec	18259e631cb997d5312c2d41d9c9865bad8df8df8a78391b383d1d063a591b87	2026-04-09 10:06:03.871321+00	20260130133008_init	\N	\N	2026-04-09 10:06:03.811521+00	1
\.


--
-- Name: Inventory Inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Inventory"
    ADD CONSTRAINT "Inventory_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Inventory_productId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Inventory_productId_key" ON public."Inventory" USING btree ("productId");


--
-- PostgreSQL database dump complete
--

--
-- Database "invoice_db" dump
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
-- Name: invoice_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE invoice_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE invoice_db OWNER TO postgres;

\connect invoice_db

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
-- Name: Invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Invoice" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    "userId" text NOT NULL,
    "fileUrl" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Invoice" OWNER TO postgres;

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
-- Data for Name: Invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Invoice" (id, "orderId", "userId", "fileUrl", "createdAt") FROM stdin;
4b851cc1-791b-4185-a3c2-da86da94cde6	cmnoigwwl0008307df498y1zp	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	86d411e6-8615-4a29-a4cd-37fe00186c72.pdf	2026-04-09 14:26:03.674
4c224bdc-6f5f-42d6-a865-93ae2ddee71d	cmp5c2e3a0000ctsf0xy9nc4d	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	de0b275c-1e74-48fb-bfa6-acdc7e674661.pdf	2026-05-14 10:50:07.623
41ef16e6-b3b3-44f3-a5d0-16433519ae5e	cmq0ugvso000ok01mkl5usgk3	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	857595fd-8c6a-4775-9dba-1288fc72e6f9.pdf	2026-06-05 11:32:12.363
06ab83e6-2eec-431b-a340-72ce79dacc67	cmq0un03a000qk01mf6s47k6q	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	c1c9685a-0a07-4bf5-b3f6-0bfef810cac8.pdf	2026-06-05 11:36:57.287
e016d779-28af-4689-bb08-2a487c678992	cmq99y93k000273l1vi1726f3	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	87c8127d-6620-47a8-8cbd-644f192c420d.pdf	2026-06-11 09:07:46.379
e0abdf52-c232-4070-a557-cfffedc389fb	cmq9cj9uk0000wkw2hztc2rd7	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	f88cdd47-984a-4f3d-ad5b-34dba2ec3e2e.pdf	2026-06-11 10:20:30.478
f1af9942-9b0d-4096-8b14-3eb360a6ac99	cmtb5zcqk0000yto4vnhqlgza	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	29e8cdf6-c086-4335-8d6e-4b4978029f5f.pdf	2026-08-27 06:52:34.458
106c24c5-c55e-4770-8d9c-9f03dcf0c7d8	cmtb6ke3f0004yto4fdo22qy2	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	04b090f1-efe7-4296-bbf1-81bb3dbc6e5e.pdf	2026-08-27 07:07:46.854
9665849b-0a91-445e-bd09-589d44dc12b8	cmtb6rtaq0006yto4mkvxjtni	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	16083295-da4c-46da-835f-71fd4a512e56.pdf	2026-08-27 07:13:28.889
62ac403f-e92c-4c1a-baff-387c5749bb53	cmtb8cpyr0008yto4zvfpcx5a	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	8c083f0f-fd84-4b46-9666-9efd84934aca.pdf	2026-08-27 07:57:45.708
f1b902f0-7d6f-4151-a8ad-d81b7404b26d	cmtb95qh4000byto474qvh5e7	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	f1b902f0-7d6f-4151-a8ad-d81b7404b26d.pdf	2026-08-27 08:20:21.515
90ad388a-3e1a-4c36-ada3-32cc278018b5	cmtb9hsvj000dyto4zut3m90o	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	90ad388a-3e1a-4c36-ada3-32cc278018b5.pdf	2026-08-27 08:29:45.592
54bfe935-becb-4c1a-9e1c-974d9f0d1adc	cmtpyqwpv000013xtbe6w90nl	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	54bfe935-becb-4c1a-9e1c-974d9f0d1adc.pdf	2026-09-06 15:26:18.404
a565004d-3473-4acc-9636-34388349419f	cmtqzi4oh0008mm664gmlqzdt	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	a565004d-3473-4acc-9636-34388349419f.pdf	2026-09-07 09:18:16.563
419e9f08-3948-43ef-9a38-3735758e5243	cmtr51tw0000014dvnznewd9r	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	419e9f08-3948-43ef-9a38-3735758e5243.pdf	2026-09-07 11:10:10.692
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
cd044b38-499a-4e5d-8e3d-995d1eff53c0	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-03-29 10:25:57.833341+00	20260113113023_init	\N	\N	2026-03-29 10:25:57.739463+00	1
bf31d8b9-1b26-4817-8a99-c38477b88118	635eae06733ed73b6023ad1785d9b32323b0eee97ec5a9511d40c2591641ed74	2026-03-29 10:25:57.911414+00	20260115121848_init	\N	\N	2026-03-29 10:25:57.84094+00	1
\.


--
-- Name: Invoice Invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Invoice"
    ADD CONSTRAINT "Invoice_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Invoice_orderId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Invoice_orderId_key" ON public."Invoice" USING btree ("orderId");


--
-- PostgreSQL database dump complete
--

--
-- Database "notification_db" dump
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
-- Name: notification_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE notification_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE notification_db OWNER TO postgres;

\connect notification_db

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
-- PostgreSQL database dump complete
--

--
-- Database "order_db" dump
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
-- Name: order_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE order_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE order_db OWNER TO postgres;

\connect order_db

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
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "totalAmount" double precision NOT NULL,
    currency text DEFAULT 'INR'::text NOT NULL,
    "paymentMethod" text NOT NULL,
    "paymentStatus" text DEFAULT 'PENDING'::text NOT NULL,
    status text DEFAULT 'PENDING'::text NOT NULL,
    "addressLine1" text NOT NULL,
    "addressLine2" text,
    city text NOT NULL,
    state text NOT NULL,
    country text DEFAULT 'India'::text NOT NULL,
    pincode text NOT NULL,
    phone text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderItem" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    "productId" text NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public."OrderItem" OWNER TO postgres;

--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Order" (id, "userId", "totalAmount", currency, "paymentMethod", "paymentStatus", status, "addressLine1", "addressLine2", city, state, country, pincode, phone, "createdAt", "updatedAt") FROM stdin;
cmpy8cyt4000ohvginc06awy9	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 15:37:40.348	2026-06-03 15:37:41.543
cmo9vazq40008m7g6cmiuh4id	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	70000	INR	COD	PENDING	CONFIRMED	Shantiniketan CHSL	Flat-204	Kharghar	Maharashtra	India	410210	9999999999	2026-04-22 09:46:02.321	2026-04-22 09:47:09.063
cmpzelgsg0006bvb4jt16gtu7	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-04 11:20:00.823	2026-06-04 11:20:02.049
cmpxy3zsz0000hvgi66zwkj6q	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 10:50:45.631	2026-06-03 10:50:53.038
cmpxyed320002hvgime39yu0k	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 10:58:49.047	2026-06-03 10:58:53.382
cmpxyhz6v0004hvgic54uv0gf	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 11:01:37.882	2026-06-03 11:01:39.39
cmpxzjigs0006hvgi149cxcv0	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 11:30:49.147	2026-06-03 11:30:51.661
cmpy19oov0008hvgioacxgmqz	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 12:19:09.745	2026-06-03 12:19:12.572
cmpy1bvr8000ahvgiw6wmvhxn	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 12:20:51.731	2026-06-03 12:20:55.562
cmpy1j94g000chvgiplcxdovj	2cb05d18-310b-415e-8f82-5a2ced57bc57	1890000	INR	COD	PENDING	CONFIRMED	Shantiniketan chsl	sector-8, flat- 8	Kharghar, Navi  MUmbai	Maharasthtra	India	410210	9167455961	2026-06-03 12:26:36.148	2026-06-03 12:26:38.438
cmpy1n2mv000ehvgijadomqq5	2cb05d18-310b-415e-8f82-5a2ced57bc57	80000	INR	COD	PENDING	CONFIRMED	shantiniketan	flat-204	Navi Mumbai	Maharashtra	India	410210	9167455961	2026-06-03 12:29:34.517	2026-06-03 12:29:34.928
cmpy3rp4p000ghvgioxc6uf6h	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 13:29:09.284	2026-06-03 13:29:13.784
cmpy3yupk000ihvgif4p0yd03	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 13:34:43.141	2026-06-03 13:34:47.654
cmpy4frd6000khvgis5ir20cy	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 13:47:52.108	2026-06-03 13:47:54.813
cmpy89ycu000mhvgitjp4uh67	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 15:35:19.499	2026-06-03 15:35:23.027
cmpy8ruau000qhvgiauhipsae	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 15:49:14.152	2026-06-03 15:49:17.291
cmpy93wvd000shvgihfpjfu0g	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 15:58:37.491	2026-06-03 15:58:38.727
cmpy9xpkd000uhvgi28uk7v36	2cb05d18-310b-415e-8f82-5a2ced57bc57	80000	INR	COD	PENDING	CONFIRMED	shantiniketan 	flat-204	Navi Mumbai	Maharashtra	India	410210	9167455961	2026-06-03 16:21:47.672	2026-06-03 16:21:49.648
cmpya9vd3000whvgiayhngw1w	2cb05d18-310b-415e-8f82-5a2ced57bc57	80000	INR	COD	PENDING	CONFIRMED	shantiniketan	Flat-204/E	Navi Mumbai	Maharashtra	India	410210	9167455961	2026-06-03 16:31:15.002	2026-06-03 16:31:16.663
cmpyb1868000yhvgievhuq7cj	2cb05d18-310b-415e-8f82-5a2ced57bc57	80000	INR	COD	PENDING	CONFIRMED	shantiniketan	flat-204	Navi Mumbai	Maharashtra	India	410210	9167455961	2026-06-03 16:52:31.366	2026-06-03 16:52:36.49
cmpyba2550010hvgij800x8ou	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-03 16:59:23.479	2026-06-03 16:59:26.478
cmpybmyf10012hvgixn90ja7n	2cb05d18-310b-415e-8f82-5a2ced57bc57	80000	INR	COD	PENDING	CONFIRMED	shantiniketan chsl	flat-204/E	Navi Mumbai	Maharashtra	India	410210	9167455961	2026-06-03 17:09:25.15	2026-06-03 17:09:26.927
cmpz8c3cr0000bvb4vsnkkfj3	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-04 08:24:45.813	2026-06-04 08:24:47.732
cmp5c2e3a0000ctsf0xy9nc4d	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	99999	INR	COD	PENDING	CONFIRMED	Demo Address	Flat 101	Pune	Maharashtra	India	411001	9999999999	2026-05-14 10:16:06.336	2026-06-04 10:00:33.401
cmpzcpajx0002bvb4map9hrhu	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-04 10:26:59.991	2026-06-04 10:27:01.834
cmpzdgtu80004bvb4dl1okozq	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-04 10:48:24.764	2026-06-04 10:48:25.5
cmpzficw30008bvb4cr0v7ux6	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-04 11:45:35.322	2026-06-04 11:45:36.853
cmpzkfamw000abvb4sp28027b	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-04 14:03:10.456	2026-06-04 14:03:11.878
cmq0nae7p0000k01mjow9cqpp	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 08:11:06.987	2026-06-05 08:11:13.235
cmq0ns6870002k01mcwijrknb	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 08:24:56.355	2026-06-05 08:24:57.166
cmq0o56pb0004k01m53s91qdb	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 08:35:03.562	2026-06-05 08:35:05.257
cmq0ow2sa0006k01mhsrfjxxo	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 08:55:58.137	2026-06-05 08:55:59.184
cmq0p40tl0008k01mr3jzc5li	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 09:02:08.908	2026-06-05 09:02:09.571
cmq0p61no000ak01m7umjmnia	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	70000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 09:03:43.331	2026-06-05 09:03:43.45
cmq0ph5o1000ck01mgaegiekm	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 09:12:21.531	2026-06-05 09:12:22.583
cmq0pkae3000ek01mey4iz03q	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 09:14:47.813	2026-06-05 09:14:47.984
cmq0ptipz000gk01mh7k9npwe	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 09:21:58.429	2026-06-05 09:21:58.882
cmq0r5dfy000ik01md5zubtle	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 09:59:10.849	2026-06-05 09:59:13.929
cmq0szcog000kk01mx25dvw7k	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	70000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 10:50:29.371	2026-06-05 10:50:30.509
cmq0u61qd000mk01micfbqkiq	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 11:23:40.892	2026-06-05 11:23:47.472
cmq0ugvso000ok01mkl5usgk3	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 11:32:07.005	2026-06-05 11:32:08.368
cmq0un03a000qk01mf6s47k6q	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 11:36:52.43	2026-06-05 11:36:53.229
cmq0viy9x000sk01m38bp29yk	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 12:01:43.005	2026-06-05 12:01:44.301
cmq15lrd9000uk01m7eecu4s1	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-05 16:43:48.025	2026-06-05 16:43:54.945
cmq24de3u0000tpfqdh2atzs7	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-06 08:57:06.471	2026-06-06 08:57:09.354
cmq52vht0000013hodysmfrsn	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-08 10:38:30.37	2026-06-08 10:38:31.473
cmq54bxdm000213ho4h3jg8zj	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	70000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	Sector8 PLot 8, Kharghar	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-08 11:19:16.56	2026-06-08 11:19:18.674
cmq7pkoxi0000xcafdzdv6hfr	CURRENT_USER	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-10 06:49:29.907	2026-06-10 06:49:32.639
cmq6hovs50000t2gwhsvo084b	CURRENT_USER	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-09 10:21:02.306	2026-06-09 10:21:06.271
cmq6hy4m10002t2gwct6b8j8u	CURRENT_USER	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-09 10:28:13.209	2026-06-09 10:28:15.309
cmq7ye62i0000ww6f0b2xj91u	CURRENT_USER	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-10 10:56:22.071	2026-06-10 10:56:25.528
cmq6i12i60004t2gwp6nxn40c	CURRENT_USER	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-09 10:30:30.402	2026-06-09 10:30:34.86
cmq7pmcds0002xcafsu1ynmvk	CURRENT_USER	160000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-10 06:50:46.959	2026-06-10 06:50:47.053
cmq6mtafs0000n1iepl82463q	CURRENT_USER	160000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-09 12:44:26.004	2026-06-09 12:44:27.978
cmq8367a90004ww6fg29cdwk8	CURRENT_USER	160000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-10 13:10:08.119	2026-06-10 13:10:11.696
cmq7u3ivs0000u7d5z997oact	CURRENT_USER	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-10 08:56:06.989	2026-06-10 08:56:09.938
cmq7yf1090002ww6fnon9vyk9	CURRENT_USER	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-10 10:57:02.165	2026-06-10 10:57:02.319
cmq99wnk6000073l1hy1ymlqx	CURRENT_USER	80000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-11 09:06:26.499	2026-06-11 09:06:30.696
cmq9cj9uk0000wkw2hztc2rd7	CURRENT_USER	5000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-11 10:20:01.049	2026-06-11 10:20:04.495
cmq99y93k000273l1vi1726f3	CURRENT_USER	70000	INR	COD	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-06-11 09:07:41.054	2026-06-11 09:07:41.758
cmsk74yzw00001fig72xirdu0	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	ONLINE	PENDING	PENDING	Mumbai	\N	Mumbai	Maharashtra	India	400001	9999999999	2026-08-08 09:53:48.249	2026-08-08 09:53:48.249
cmshnzgoa0001nm6jzrxfjwdh	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	PENDING	Mumbai	\N	Mumbai	Maharashtra	India	400001	9999999999	2026-08-06 15:22:06.05	2026-08-06 15:22:06.05
cmshnzgnl0000nm6jszgk3qye	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	80000	INR	COD	PENDING	PENDING	Mumbai	\N	Mumbai	Maharashtra	India	400001	9999999999	2026-08-06 15:22:06.05	2026-08-06 15:22:06.05
cmsrkyfo00000102up5z2m0ly	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	194999	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-13 13:55:01.2	2026-08-13 13:56:22.879
cmt14181a0000zc4qbp3oqno4	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	355000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-20 05:58:59.557	2026-08-20 05:59:08.361
cmt147qff0003zc4qi2e880ut	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	400000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-20 06:04:03.248	2026-08-20 06:04:05.23
cmt14o55m0006zc4qhrsulw7j	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	445000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-20 06:16:48.62	2026-08-20 06:16:53.761
cmt15vzg80009zc4qroeprm8j	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	490000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-20 06:50:54.275	2026-08-20 06:50:59.607
cmt16ebdx000czc4qqxa4yfvs	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	625000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-20 07:05:09.558	2026-08-20 07:05:11.795
cmt8jsb4w000fzl2sfrq78mor	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	93498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-25 10:54:20.299	2026-08-25 10:54:32.358
cmt19gdu10000fuybidtsi7s9	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	725000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-20 08:30:45.001	2026-08-20 08:31:28.874
cmt8dtt7f0000l7z83o6ilmvq	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	7497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-25 08:07:33.146	2026-08-25 08:08:50.732
cmt8jsqna000izl2sbmcz75ol	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	93498	INR	ONLINE	PENDING	PENDING	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-25 10:54:40.643	2026-08-25 10:54:40.643
cmt19gkgl0003fuyb0sca2ag9	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	725000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-20 08:30:53.589	2026-08-20 08:34:45.372
cmt5l04bq0000unt27y3xw50a	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	132498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-23 09:05:06.267	2026-08-23 09:05:18.442
cmt5mej8u0000crizh1p8zwyl	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	202498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-23 09:44:18.408	2026-08-23 09:44:24.088
cmt71pmv40000wmzbv24d4qkp	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	45000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-24 09:40:36.736	2026-08-24 09:43:20.266
cmt8ih3ir0000977h4ur53jvr	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	229998	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-25 10:17:38.066	2026-08-25 10:18:34.923
cmt71s0fh0004wmzbwt0jta24	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	49299	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-24 09:42:27.627	2026-08-24 09:43:20.663
cmtb2tdma000014du196jldxs	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:22:35.69	2026-08-27 05:22:51.479
cmt71pu8t0002wmzbyhokcwvz	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	45000	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-24 09:40:46.301	2026-08-24 09:44:20.808
cmt8jqyrn0000zl2s0llr7bfs	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	93498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-25 10:53:18.081	2026-08-25 10:53:25.853
cmt8jr5in0003zl2stlvuqy41	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	93498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-25 10:53:26.83	2026-08-25 10:53:30.23
cmt8jrh0v0006zl2szhccl1lb	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	93498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-25 10:53:41.725	2026-08-25 10:53:46.246
cmt8jrmm90009zl2stb1m5vci	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	93498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-25 10:53:48.989	2026-08-25 10:53:57.184
cmt8jrxvn000czl2s8v6ypcps	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	93498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-25 10:54:03.587	2026-08-25 10:54:11.814
cmtb2tr9r000414dup9cl9dyb	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:22:53.391	2026-08-27 05:22:53.833
cmtb2tv0p000814dujoop0s3y	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:22:58.249	2026-08-27 05:22:59.398
cmtb2u8tp000c14du4bqb1ww2	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:23:16.07	2026-08-27 05:23:18.06
cmtb2ucyv000g14dupir3lpg2	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:23:21.266	2026-08-27 05:23:25.824
cmtb2ulem000k14du78afapuy	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:23:31.586	2026-08-27 05:23:34.063
cmtb2uu6f000o14duqv2hu9cx	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:23:43.815	2026-08-27 05:23:48.091
cmtb2wnlr000s14dutmxyhapw	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:25:08.533	2026-08-27 05:25:10.446
cmtb2wwbn000w14du8n77m7h6	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:25:19.907	2026-08-27 05:25:21.733
cmtb2x5bh001014duodittdgi	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:25:31.104	2026-08-27 05:25:34.237
cmtb2x8cj001414du55cr4baq	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:25:35.491	2026-08-27 05:25:36.644
cmtb2xc3w001814dus4qpr288	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:25:40.365	2026-08-27 05:25:46.824
cmtb2xnz0001c14duzpj7map6	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:25:55.739	2026-08-27 05:25:57.115
cmtb2xsty001g14dussj369s8	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:26:02.029	2026-08-27 05:26:02.631
cmtb2xvuw001k14duyuse8a4x	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:26:05.961	2026-08-27 05:26:06.589
cmtb2xyyn001o14du2i33qoi9	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	118497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-08-27 05:26:09.984	2026-08-27 05:26:10.224
cmto7ti7d00001089uuqrmp3p	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	434997	INR	ONLINE	PENDING	PENDING	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-09-05 10:03:40.008	2026-09-05 10:03:40.008
cmtb5zcqk0000yto4vnhqlgza	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	138498	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-27 06:51:13.337	2026-08-27 06:51:53.828
cmtb6ke3f0004yto4fdo22qy2	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	2499	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-27 07:07:34.778	2026-08-27 07:07:39.255
cmtb6rtaq0006yto4mkvxjtni	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	1299	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-27 07:13:21.087	2026-08-27 07:13:25.085
cmtb8cpyr0008yto4zvfpcx5a	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	6798	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-27 07:57:36.143	2026-08-27 07:57:40.604
cmtplq7sh000012ejb7977ze9	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	438496	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-06 09:20:47.344	2026-09-06 09:24:20.867
cmtb95qh4000byto474qvh5e7	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	4999	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-27 08:20:09.799	2026-08-27 08:20:15.498
cmtqxtyz6000cz6043sjo15vk	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:47:15.212	2026-09-07 07:49:37.297
cmtb9hsvj000dyto4zut3m90o	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	83499	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-08-27 08:29:32.795	2026-08-27 08:29:38.261
cmtpw0q1g0000b7wsvtiah0pr	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	4999	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-06 14:08:53.716	2026-09-06 14:09:01.215
cmtqxv4jl000fz60492nk9tnl	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:48:17.083	2026-09-07 07:49:37.329
cmtpyqwpv000013xtbe6w90nl	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	49999	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-06 15:25:14.659	2026-09-06 15:25:36.49
cmtqxvd27000iz604c459fcsg	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:48:28.89	2026-09-07 07:49:37.38
cmtqxrd7r0000z604ufm8eooj	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:45:22.58	2026-09-07 07:49:36.844
cmtqxrt2x0003z6041y8q2t77	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:45:42.771	2026-09-07 07:49:37.11
cmtqxsd0m0006z6040xme77jk	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:46:08.154	2026-09-07 07:49:37.161
cmtqxspe80009z604t22p9lux	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:46:24.888	2026-09-07 07:49:37.226
cmtqxxf27000oz6047ey78xch	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:50:04.898	2026-09-07 07:50:05.283
cmtqxw60o000lz604l1riyynm	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:49:06.434	2026-09-07 07:49:37.533
cmtqxxo0f000rz6047a6wd45v	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	12897	INR	ONLINE	PENDING	CONFIRMED	Flat 204, 2nd Flr, Shantiniketan Chs	\N	Navi Mumbai	Maharashtra	India	410210	09167455961	2026-09-07 07:50:16.528	2026-09-07 07:50:16.844
cmtqzhd3j0000mm66e73oofrm	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	14196	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-09-07 08:33:35.119	2026-09-07 08:33:37.942
cmtqzhr5e0004mm66dkqd72i2	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	14196	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-09-07 08:33:53.188	2026-09-07 08:33:54.487
cmtqzi4oh0008mm664gmlqzdt	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	14196	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-09-07 08:34:10.828	2026-09-07 08:43:45.646
cmtr51tw0000014dvnznewd9r	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	5497	INR	ONLINE	PENDING	CONFIRMED	Shantiniketan cshl, Flat-204/E, Sector-8, Plot-8	\N	Navi Mumbai	Maharashtra	India	410210	08169302084	2026-09-07 11:09:28.066	2026-09-07 11:09:36.823
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderItem" (id, "orderId", "productId", quantity, price) FROM stdin;
cmo9vazs10009m7g6001ww35v	cmo9vazq40008m7g6cmiuh4id	cmn4xbhbk0000fvd4br8fvyja	1	70000
cmp5c2e3t0001ctsf39trgg1m	cmp5c2e3a0000ctsf0xy9nc4d	cmp5b0bl50000lhtd3p2fsyox	1	99999
cmpxy3zt10001hvgi9c9l0icr	cmpxy3zsz0000hvgi66zwkj6q	cmn4xab4600016ehypgarj7ra	1	80000
cmpxyed3f0003hvgi91d942su	cmpxyed320002hvgime39yu0k	cmn4xab4600016ehypgarj7ra	1	80000
cmpxyhz8c0005hvgigie3zqjd	cmpxyhz6v0004hvgic54uv0gf	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmpxzjigw0007hvgisx0oy7an	cmpxzjigs0006hvgi149cxcv0	cmn4xab4600016ehypgarj7ra	1	80000
cmpy19opb0009hvgigqp3sx38	cmpy19oov0008hvgioacxgmqz	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmpy1bvrf000bhvgijjb4z5ps	cmpy1bvr8000ahvgiw6wmvhxn	cmn4xab4600016ehypgarj7ra	1	80000
cmpy1j94h000dhvgiedqngmit	cmpy1j94g000chvgiplcxdovj	cmncsqpkp00003jx9cs4gxo3z	27	70000
cmpy1n2mw000fhvgizg8shjv8	cmpy1n2mv000ehvgijadomqq5	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmpy3rp4t000hhvgii5bc7j7l	cmpy3rp4p000ghvgioxc6uf6h	cmn4xab4600016ehypgarj7ra	1	80000
cmpy3yupq000jhvgi2xv4m986	cmpy3yupk000ihvgif4p0yd03	cmn4xab4600016ehypgarj7ra	1	80000
cmpy4frd7000lhvgi1709xy1y	cmpy4frd6000khvgis5ir20cy	cmn4xab4600016ehypgarj7ra	1	80000
cmpy89yd0000nhvgihglk5y8q	cmpy89ycu000mhvgitjp4uh67	cmn4xab4600016ehypgarj7ra	1	80000
cmpy8cytk000phvgi88qzglgx	cmpy8cyt4000ohvginc06awy9	cmn4xab4600016ehypgarj7ra	1	80000
cmpy8rub7000rhvgif0t59ccb	cmpy8ruau000qhvgiauhipsae	cmn4xab4600016ehypgarj7ra	1	80000
cmpy93wvl000thvgiedgte2be	cmpy93wvd000shvgihfpjfu0g	cmn4xny4900003llq1rzp2un8	1	80000
cmpy9xpks000vhvgi9i4aja9r	cmpy9xpkd000uhvgi28uk7v36	cmn4xab4600016ehypgarj7ra	1	80000
cmpya9vde000xhvgit6icekt3	cmpya9vd3000whvgiayhngw1w	cmn4xab4600016ehypgarj7ra	1	80000
cmpyb186k000zhvgiebxj0mm0	cmpyb1868000yhvgievhuq7cj	cmn4xab4600016ehypgarj7ra	1	80000
cmpyba26g0011hvgi2g2z30ns	cmpyba2550010hvgij800x8ou	cmn4xab4600016ehypgarj7ra	1	80000
cmpybmyf80013hvgips50t610	cmpybmyf10012hvgixn90ja7n	cmn4xab4600016ehypgarj7ra	1	80000
cmpz8c3cs0001bvb4v2hn7pc5	cmpz8c3cr0000bvb4vsnkkfj3	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmpzcpajy0003bvb4vrkkm6q8	cmpzcpajx0002bvb4map9hrhu	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmpzdgtu90005bvb48vfudgtj	cmpzdgtu80004bvb4dl1okozq	cmn4xab4600016ehypgarj7ra	1	80000
cmpzelgsj0007bvb4gr64m3bt	cmpzelgsg0006bvb4jt16gtu7	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmpzficw40009bvb4524oaf3e	cmpzficw30008bvb4cr0v7ux6	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmpzkfamx000bbvb4dolwbcd3	cmpzkfamw000abvb4sp28027b	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmq0nae7r0001k01mo8onas2o	cmq0nae7p0000k01mjow9cqpp	cmn4xab4600016ehypgarj7ra	1	80000
cmq0ns68g0003k01muor5vlj1	cmq0ns6870002k01mcwijrknb	cmn4xab4600016ehypgarj7ra	1	80000
cmq0o56pq0005k01mduu0i9p9	cmq0o56pb0004k01m53s91qdb	cmn4xny4900003llq1rzp2un8	1	80000
cmq0ow2sc0007k01mn2bgpdgm	cmq0ow2sa0006k01mhsrfjxxo	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmq0p40tn0009k01mobybmcqf	cmq0p40tl0008k01mr3jzc5li	cmn4xab4600016ehypgarj7ra	1	80000
cmq0p61no000bk01m6af2e825	cmq0p61no000ak01m7umjmnia	cmncsqpkp00003jx9cs4gxo3z	1	70000
cmq0ph5o3000dk01mqmdu5q7l	cmq0ph5o1000ck01mgaegiekm	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmq0pkae5000fk01m5xf0pu7r	cmq0pkae3000ek01mey4iz03q	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmq0ptiq0000hk01mzv5errim	cmq0ptipz000gk01mh7k9npwe	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmq0r5dgf000jk01mbumac5as	cmq0r5dfy000ik01md5zubtle	cmn5qhf470000m645g8p9181p	1	80000
cmq0szcon000lk01mty8ln5lj	cmq0szcog000kk01mx25dvw7k	cmncsqpkp00003jx9cs4gxo3z	1	70000
cmq0u61qf000nk01m89qdza33	cmq0u61qd000mk01micfbqkiq	cmn4xab4600016ehypgarj7ra	1	80000
cmq0ugvsr000pk01mcfjik54f	cmq0ugvso000ok01mkl5usgk3	cmn4xab4600016ehypgarj7ra	1	80000
cmq0un03b000rk01m7a2na91v	cmq0un03a000qk01mf6s47k6q	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmq0viya0000tk01mh3y0d1dl	cmq0viy9x000sk01m38bp29yk	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmq15lrdn000vk01ma9jt6ztv	cmq15lrd9000uk01m7eecu4s1	cmn4xab4600016ehypgarj7ra	1	80000
cmq24de3v0001tpfqiej72vi0	cmq24de3u0000tpfqdh2atzs7	cmn4xab4600016ehypgarj7ra	1	80000
cmq52vht2000113houmdrfoga	cmq52vht0000013hodysmfrsn	cmn4xbhbk0000fvd4br8fvyja	1	80000
cmq54bxdp000313hou76lihlp	cmq54bxdm000213ho4h3jg8zj	cmo9sqpd30000qx6n39izvfbk	1	70000
cmq6hovs70001t2gwzbxxr43s	cmq6hovs50000t2gwhsvo084b	cmn4xab4600016ehypgarj7ra	1	80000
cmq6hy4ma0003t2gw5f22jpgi	cmq6hy4m10002t2gwct6b8j8u	cmn4xab4600016ehypgarj7ra	1	80000
cmq6i12i60005t2gwqeh4e15h	cmq6i12i60004t2gwp6nxn40c	cmn4xab4600016ehypgarj7ra	1	80000
cmq6mtafu0001n1ieulm01t36	cmq6mtafs0000n1iepl82463q	cmn4xab4600016ehypgarj7ra	2	80000
cmq7pkoxk0001xcafbpiz7f29	cmq7pkoxi0000xcafdzdv6hfr	cmn4xab4600016ehypgarj7ra	1	80000
cmq7pmcdt0003xcafag7tif8x	cmq7pmcds0002xcafsu1ynmvk	cmn4xab4600016ehypgarj7ra	2	80000
cmq7u3ivy0001u7d5o95bqb5p	cmq7u3ivs0000u7d5z997oact	cmn4xab4600016ehypgarj7ra	1	80000
cmq7ye62j0001ww6f4dp38rf8	cmq7ye62i0000ww6f0b2xj91u	cmn4xab4600016ehypgarj7ra	1	80000
cmq7yf1090003ww6fydqm64uq	cmq7yf1090002ww6fnon9vyk9	cmn4xab4600016ehypgarj7ra	1	80000
cmq8367a90005ww6fx6zoht3u	cmq8367a90004ww6fg29cdwk8	cmn4xab4600016ehypgarj7ra	1	80000
cmq8367a90006ww6fvrcvax8x	cmq8367a90004ww6fg29cdwk8	cmn4xny4900003llq1rzp2un8	1	80000
cmq99wnk9000173l1kzvse4cg	cmq99wnk6000073l1hy1ymlqx	cmn4xny4900003llq1rzp2un8	1	80000
cmq99y93k000373l1tu3azbfi	cmq99y93k000273l1vi1726f3	mixer-001	1	70000
cmq9cj9um0001wkw2k5ulh6h4	cmq9cj9uk0000wkw2hztc2rd7	cmn5qhf470000m645g8p9181p	1	5000
cmshnzgqp0002nm6j97zvhyye	cmshnzgnl0000nm6jszgk3qye	cmn5qhf470000m645g8p9181p	1	80000
cmshnzgqq0003nm6j36g3abru	cmshnzgoa0001nm6jzrxfjwdh	cmn5qhf470000m645g8p9181p	1	80000
cmsk74z3o00011fig0ibhkmg1	cmsk74yzw00001fig72xirdu0	cmn5qhf470000m645g8p9181p	1	80000
cmsrkyfo10001102utes1tyus	cmsrkyfo00000102up5z2m0ly	cmp5b0bl50000lhtd3p2fsyox	1	99999
cmsrkyfo10002102urcgqcgdq	cmsrkyfo00000102up5z2m0ly	cmn5qhf470000m645g8p9181p	3	5000
cmsrkyfo10003102ugknf0vy6	cmsrkyfo00000102up5z2m0ly	cmn4xny4900003llq1rzp2un8	1	80000
cmt14181d0001zc4qew2kj5gx	cmt14181a0000zc4qbp3oqno4	cmszx90yh0000xiobwtozftmk	3	45000
cmt14181d0002zc4q9u8itps9	cmt14181a0000zc4qbp3oqno4	cmsyylz32000110rkphzjk78x	4	55000
cmt147qfg0004zc4q0491wbk8	cmt147qff0003zc4qi2e880ut	cmszx90yh0000xiobwtozftmk	4	45000
cmt147qfg0005zc4qycmk8pn1	cmt147qff0003zc4qi2e880ut	cmsyylz32000110rkphzjk78x	4	55000
cmt14o55o0007zc4qt9jzr16b	cmt14o55m0006zc4qhrsulw7j	cmszx90yh0000xiobwtozftmk	5	45000
cmt14o55p0008zc4qkhkba3i5	cmt14o55m0006zc4qhrsulw7j	cmsyylz32000110rkphzjk78x	4	55000
cmt15vzgb000azc4qc7n65a3c	cmt15vzg80009zc4qroeprm8j	cmszx90yh0000xiobwtozftmk	6	45000
cmt15vzgb000bzc4qlao7vs1d	cmt15vzg80009zc4qroeprm8j	cmsyylz32000110rkphzjk78x	4	55000
cmt16ebe0000dzc4qwpskrowz	cmt16ebdx000czc4qqxa4yfvs	cmszx90yh0000xiobwtozftmk	9	45000
cmt16ebe0000ezc4qqr33wivy	cmt16ebdx000czc4qqxa4yfvs	cmsyylz32000110rkphzjk78x	4	55000
cmt19gdu10001fuybtj5409pm	cmt19gdu10000fuybidtsi7s9	cmqgc4e360000pxv015goc7j3	4	80000
cmt19gdu10002fuybz1twft13	cmt19gdu10000fuybidtsi7s9	cmszx90yh0000xiobwtozftmk	9	45000
cmt19gkgl0004fuyb66bm9ynn	cmt19gkgl0003fuyb0sca2ag9	cmqgc4e360000pxv015goc7j3	4	80000
cmt19gkgl0005fuybkjfthlya	cmt19gkgl0003fuyb0sca2ag9	cmszx90yh0000xiobwtozftmk	9	45000
cmt5l04bq0001unt21l4p2kmm	cmt5l04bq0000unt27y3xw50a	cmt1jor140015jgovfne2vpgs	1	129999
cmt5l04bq0002unt2gk0o85fr	cmt5l04bq0000unt27y3xw50a	cmt1gd8td000ujgov44mw0ut4	1	2499
cmt5mej8v0001crizzbpfrpmx	cmt5mej8u0000crizh1p8zwyl	cmncsqpkp00003jx9cs4gxo3z	1	70000
cmt5mej8v0002criz35vn3afh	cmt5mej8u0000crizh1p8zwyl	cmt1jor140015jgovfne2vpgs	1	129999
cmt5mej8v0003crizq3hjl7an	cmt5mej8u0000crizh1p8zwyl	cmt1gd8td000ujgov44mw0ut4	1	2499
cmt71pmv50001wmzbgspy9r0s	cmt71pmv40000wmzbv24d4qkp	cmt1jlf2j0013jgovfvqvfqly	1	45000
cmt71pu8t0003wmzbt8ygdeuc	cmt71pu8t0002wmzbyhokcwvz	cmt1jlf2j0013jgovfvqvfqly	1	45000
cmt71s0fh0005wmzb1cj67q0k	cmt71s0fh0004wmzbwt0jta24	cmt1fx3fc000njgovki4yh0dj	1	4299
cmt71s0fh0006wmzbp0j71jef	cmt71s0fh0004wmzbwt0jta24	cmt1jlf2j0013jgovfvqvfqly	1	45000
cmt8dtt7g0001l7z8y4gjwdau	cmt8dtt7f0000l7z83o6ilmvq	cmt1gd8td000ujgov44mw0ut4	1	2499
cmt8dtt7g0002l7z8u0k5k6wc	cmt8dtt7f0000l7z83o6ilmvq	cmt1jrawh0019jgovga858g7k	1	3499
cmt8dtt7g0003l7z8aiuty75y	cmt8dtt7f0000l7z83o6ilmvq	cmt1gtcgf000xjgovpot8xygc	1	1499
cmt8ih3ir0001977hkcotx3ge	cmt8ih3ir0000977h4ur53jvr	cmt1e1j730009jgovwxdlrhah	1	114999
cmt8ih3ir0002977h3juiel7l	cmt8ih3ir0000977h4ur53jvr	cmt1e1j730009jgovwxdlrhah	1	114999
cmt8jqytb0001zl2sszkcey4u	cmt8jqyrn0000zl2s0llr7bfs	cmt1evv1l000fjgovkqkab4md	1	89999
cmt8jqytb0002zl2syf34vyno	cmt8jqyrn0000zl2s0llr7bfs	cmt1jrawh0019jgovga858g7k	1	3499
cmt8jr5io0004zl2s3u2m059c	cmt8jr5in0003zl2stlvuqy41	cmt1evv1l000fjgovkqkab4md	1	89999
cmt8jr5io0005zl2svjt0znst	cmt8jr5in0003zl2stlvuqy41	cmt1jrawh0019jgovga858g7k	1	3499
cmt8jrh0v0007zl2s7vfslvzu	cmt8jrh0v0006zl2szhccl1lb	cmt1evv1l000fjgovkqkab4md	1	89999
cmt8jrh0v0008zl2snzkv3c8y	cmt8jrh0v0006zl2szhccl1lb	cmt1jrawh0019jgovga858g7k	1	3499
cmt8jrmmr000azl2shbcifp7n	cmt8jrmm90009zl2stb1m5vci	cmt1evv1l000fjgovkqkab4md	1	89999
cmt8jrmmr000bzl2so3kpt47h	cmt8jrmm90009zl2stb1m5vci	cmt1jrawh0019jgovga858g7k	1	3499
cmt8jrxvn000dzl2sb03x0tn8	cmt8jrxvn000czl2s8v6ypcps	cmt1evv1l000fjgovkqkab4md	1	89999
cmt8jrxvn000ezl2s1djree5d	cmt8jrxvn000czl2s8v6ypcps	cmt1jrawh0019jgovga858g7k	1	3499
cmt8jsb4w000gzl2sajhds1ug	cmt8jsb4w000fzl2sfrq78mor	cmt1evv1l000fjgovkqkab4md	1	89999
cmt8jsb4x000hzl2s3t2qixuz	cmt8jsb4w000fzl2sfrq78mor	cmt1jrawh0019jgovga858g7k	1	3499
cmt8jsqnb000jzl2sz3ww4ydl	cmt8jsqna000izl2sbmcz75ol	cmt1evv1l000fjgovkqkab4md	1	89999
cmt8jsqnb000kzl2snt7ipp42	cmt8jsqna000izl2sbmcz75ol	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2tdma000114duoqridjxq	cmtb2tdma000014du196jldxs	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2tdma000214duh8xeoj56	cmtb2tdma000014du196jldxs	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2tdma000314dug5qvn9jg	cmtb2tdma000014du196jldxs	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2tr9r000514dukec9k9su	cmtb2tr9r000414dup9cl9dyb	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2tr9r000614dupzgvb1yd	cmtb2tr9r000414dup9cl9dyb	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2tr9r000714du20uk804c	cmtb2tr9r000414dup9cl9dyb	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2tv0p000914dul4jacqtb	cmtb2tv0p000814dujoop0s3y	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2tv0p000a14duppurrlac	cmtb2tv0p000814dujoop0s3y	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2tv0p000b14dup2trsywg	cmtb2tv0p000814dujoop0s3y	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2u8tp000d14du3w83smcn	cmtb2u8tp000c14du4bqb1ww2	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2u8tp000e14du0k83r8jy	cmtb2u8tp000c14du4bqb1ww2	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2u8tp000f14duo7g0u0xv	cmtb2u8tp000c14du4bqb1ww2	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2ud21000h14dummsq6ht2	cmtb2ucyv000g14dupir3lpg2	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2ud21000i14dub1ntx5cl	cmtb2ucyv000g14dupir3lpg2	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2ud21000j14dugurnpdqz	cmtb2ucyv000g14dupir3lpg2	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2ulen000l14du2htm6q2t	cmtb2ulem000k14du78afapuy	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2ulen000m14dutwzraglb	cmtb2ulem000k14du78afapuy	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2ulen000n14duir239h9n	cmtb2ulem000k14du78afapuy	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2uu6f000p14duqykn32yn	cmtb2uu6f000o14duqv2hu9cx	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2uu6f000q14duxl8pehbn	cmtb2uu6f000o14duqv2hu9cx	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2uu6g000r14dujt4l9hxq	cmtb2uu6f000o14duqv2hu9cx	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2wnlr000t14du2s6z92zf	cmtb2wnlr000s14dutmxyhapw	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2wnlr000u14dum31yzcgi	cmtb2wnlr000s14dutmxyhapw	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2wnlr000v14duevo4n8on	cmtb2wnlr000s14dutmxyhapw	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2wwbn000x14du5nj9u582	cmtb2wwbn000w14du8n77m7h6	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2wwbn000y14du8tneibrn	cmtb2wwbn000w14du8n77m7h6	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2wwbn000z14du21eguh1p	cmtb2wwbn000w14du8n77m7h6	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2x5bi001114du2r8w4kh5	cmtb2x5bh001014duodittdgi	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2x5bi001214dul003szmk	cmtb2x5bh001014duodittdgi	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2x5bi001314duw4dwwx6u	cmtb2x5bh001014duodittdgi	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2x8cj001514ducko3euut	cmtb2x8cj001414du55cr4baq	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2x8cj001614duaqy7glor	cmtb2x8cj001414du55cr4baq	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2x8cj001714duzqjawr3j	cmtb2x8cj001414du55cr4baq	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2xc3x001914du61u04vh3	cmtb2xc3w001814dus4qpr288	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2xc3x001a14duho4p3pdx	cmtb2xc3w001814dus4qpr288	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2xc3x001b14du1r4n79fj	cmtb2xc3w001814dus4qpr288	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2xo1h001d14duhrwhw79k	cmtb2xnz0001c14duzpj7map6	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2xo1h001e14du3iwgwfnv	cmtb2xnz0001c14duzpj7map6	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2xo1h001f14du4hcofbeb	cmtb2xnz0001c14duzpj7map6	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2xsty001h14dubv7abwhd	cmtb2xsty001g14dussj369s8	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2xsty001i14du4cy4ql5a	cmtb2xsty001g14dussj369s8	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2xsty001j14dugh16jmqr	cmtb2xsty001g14dussj369s8	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2xvux001l14duo1hqeot7	cmtb2xvuw001k14duyuse8a4x	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2xvux001m14duid4eawy0	cmtb2xvuw001k14duyuse8a4x	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2xvux001n14durn2jartu	cmtb2xvuw001k14duyuse8a4x	cmt1jrawh0019jgovga858g7k	1	3499
cmtb2xyyo001p14dunlkj97wd	cmtb2xyyn001o14du2i33qoi9	cmt1jq71w0017jgov1detm0xh	1	24999
cmtb2xyyo001q14duh6cbt14x	cmtb2xyyn001o14du2i33qoi9	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb2xyyo001r14du5wnz0cze	cmtb2xyyn001o14du2i33qoi9	cmt1jrawh0019jgovga858g7k	1	3499
cmtb5zcql0001yto42izoi0wk	cmtb5zcqk0000yto4vnhqlgza	cmt1jlf2j0013jgovfvqvfqly	1	45000
cmtb5zcql0002yto4v05syxwl	cmtb5zcqk0000yto4vnhqlgza	cmt1evv1l000fjgovkqkab4md	1	89999
cmtb5zcql0003yto47tqrriyc	cmtb5zcqk0000yto4vnhqlgza	cmt1jrawh0019jgovga858g7k	1	3499
cmtb6ke3g0005yto4xl88kaih	cmtb6ke3f0004yto4fdo22qy2	cmt1gugi4000zjgovp5hwezl3	1	2499
cmtb6rtaq0007yto44l4h64mx	cmtb6rtaq0006yto4mkvxjtni	cmt1gaey8000qjgov4n270bsb	1	1299
cmtb8cpys0009yto4izd9btqq	cmtb8cpyr0008yto4zvfpcx5a	cmt1gugi4000zjgovp5hwezl3	1	2499
cmtb8cpys000ayto4mkdg1mzw	cmtb8cpyr0008yto4zvfpcx5a	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtb95qh5000cyto4kbny3844	cmtb95qh4000byto474qvh5e7	cmt1gvjgl0011jgovx6ockzz8	1	4999
cmtb9hsvp000eyto4u79gw958	cmtb9hsvj000dyto4zut3m90o	cmn4xab4600016ehypgarj7ra	1	80000
cmtb9hsvp000fyto4nq26wsd9	cmtb9hsvj000dyto4zut3m90o	cmt1jrawh0019jgovga858g7k	1	3499
cmto7ti7e00011089nwy5o1uy	cmto7ti7d00001089uuqrmp3p	cmt1jlf2j0013jgovfvqvfqly	1	45000
cmto7ti7e00021089lqy32rxm	cmto7ti7d00001089uuqrmp3p	cmt1jor140015jgovfne2vpgs	3	129999
cmtplq7sh000112ejkthda4xz	cmtplq7sh000012ejb7977ze9	cmt1jrawh0019jgovga858g7k	1	3499
cmtplq7sh000212ejh27bmisq	cmtplq7sh000012ejb7977ze9	cmt1jlf2j0013jgovfvqvfqly	1	45000
cmtplq7sh000312eji80ybvd8	cmtplq7sh000012ejb7977ze9	cmt1jor140015jgovfne2vpgs	3	129999
cmtpw0q1h0001b7ws1julr4h3	cmtpw0q1g0000b7wsvtiah0pr	cmt1gvjgl0011jgovx6ockzz8	1	4999
cmtpyqwpv000113xtdbc07r02	cmtpyqwpv000013xtbe6w90nl	cmt1jlf2j0013jgovfvqvfqly	1	45000
cmtpyqwpv000213xtvm238m67	cmtpyqwpv000013xtbe6w90nl	cmt1gvjgl0011jgovx6ockzz8	1	4999
cmtqxrd7s0001z604ll90frry	cmtqxrd7r0000z604ufm8eooj	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxrd7s0002z6049hswqq26	cmtqxrd7r0000z604ufm8eooj	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxrt2x0004z604sgcmp49o	cmtqxrt2x0003z6041y8q2t77	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxrt2x0005z6043k5sj13p	cmtqxrt2x0003z6041y8q2t77	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxsd1a0007z604f2vrflv4	cmtqxsd0m0006z6040xme77jk	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxsd1a0008z604d36bptgf	cmtqxsd0m0006z6040xme77jk	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxsper000az604b08b2blz	cmtqxspe80009z604t22p9lux	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxspes000bz604u8j9mgsr	cmtqxspe80009z604t22p9lux	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxu0w4000dz604a2ncmga4	cmtqxtyz6000cz6043sjo15vk	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxu0w4000ez604pz0c24i2	cmtqxtyz6000cz6043sjo15vk	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxv4jl000gz604fss456r3	cmtqxv4jl000fz60492nk9tnl	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxv4jl000hz604mmwj89v2	cmtqxv4jl000fz60492nk9tnl	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxvd2t000jz604nj2n0x4p	cmtqxvd27000iz604c459fcsg	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxvd2t000kz6047qhc10ne	cmtqxvd27000iz604c459fcsg	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxw60o000mz604o1lki7x1	cmtqxw60o000lz604l1riyynm	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxw60o000nz604kd4k77wp	cmtqxw60o000lz604l1riyynm	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxxf2p000pz604lzgai05z	cmtqxxf27000oz6047ey78xch	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxxf2p000qz604qc3yea5q	cmtqxxf27000oz6047ey78xch	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqxxo0g000sz6048mm1y2bb	cmtqxxo0f000rz6047a6wd45v	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqxxo0g000tz604b1u211wd	cmtqxxo0f000rz6047a6wd45v	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqzhd3j0001mm66387cd4xl	cmtqzhd3j0000mm66e73oofrm	cmt1gaey8000qjgov4n270bsb	1	1299
cmtqzhd3j0002mm66llwwpxtb	cmtqzhd3j0000mm66e73oofrm	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqzhd3j0003mm66g7f4p9z6	cmtqzhd3j0000mm66e73oofrm	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqzhr5e0005mm66nw4xje6q	cmtqzhr5e0004mm66dkqd72i2	cmt1gaey8000qjgov4n270bsb	1	1299
cmtqzhr5e0006mm6688hb6ldy	cmtqzhr5e0004mm66dkqd72i2	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqzhr5e0007mm669y2mniek	cmtqzhr5e0004mm66dkqd72i2	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtqzi4oh0009mm66jf23witj	cmtqzi4oh0008mm664gmlqzdt	cmt1gaey8000qjgov4n270bsb	1	1299
cmtqzi4oh000amm66yjf0txn8	cmtqzi4oh0008mm664gmlqzdt	cmt1fx3fc000njgovki4yh0dj	1	4299
cmtqzi4oh000bmm669ld33thx	cmtqzi4oh0008mm664gmlqzdt	cmt1fx3fc000njgovki4yh0dj	2	4299
cmtr51tw1000114dv8d9iluro	cmtr51tw0000014dvnznewd9r	cmtmodxwc000384bleeosn2ba	1	499
cmtr51tw1000214dv0p8yr9yg	cmtr51tw0000014dvnznewd9r	cmt1gugi4000zjgovp5hwezl3	1	2499
cmtr51tw1000314dv26ebdo8o	cmtr51tw0000014dvnznewd9r	cmt1gugi4000zjgovp5hwezl3	1	2499
\.


--
-- Name: OrderItem OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: OrderItem OrderItem_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItem"
    ADD CONSTRAINT "OrderItem_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "payment_db" dump
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
-- Name: payment_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE payment_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE payment_db OWNER TO postgres;

\connect payment_db

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
-- Name: Payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payment" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    amount double precision NOT NULL,
    provider text NOT NULL,
    "transactionId" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "cardNumber" text,
    currency text NOT NULL,
    name text,
    "refundedAmount" double precision DEFAULT 0,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "userId" text NOT NULL,
    status text NOT NULL
);


ALTER TABLE public."Payment" OWNER TO postgres;

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
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payment" (id, "orderId", amount, provider, "transactionId", "createdAt", "cardNumber", currency, name, "refundedAmount", "updatedAt", "userId", status) FROM stdin;
cmn6apo0y0000jmbcu882xup5	YOUR_ORDER_ID	160000	COD	\N	2026-03-25 17:06:34.59	\N	INR	\N	0	2026-03-25 17:06:34.59	33b90461-9085-4066-9418-62333fac528a	PENDING
cmn6asvjx0001jmbciey4mfbf	cmn6a53u20002qetdf78smnht	160000	COD	\N	2026-03-25 17:09:04.314	\N	INR	\N	0	2026-03-25 17:09:04.314	33b90461-9085-4066-9418-62333fac528a	PENDING
cmn6c3lbj000096nrrdkhslog	cmn6a53u20002qetdf78smnht	160000	COD	\N	2026-03-25 17:45:23.74	\N	INR	\N	0	2026-03-25 17:45:25.235	33b90461-9085-4066-9418-62333fac528a	SUCCESS
cmnieowuw0000sb3cp6wz1zi4	cmnielbwl0000cl4nh43n1ti7	70000	COD	\N	2026-04-03 04:31:11.947	\N	INR	\N	0	2026-04-03 04:31:14.527	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmniesz7e0001sb3c6p9yco5s	cmnielbwl0000cl4nh43n1ti7	70000	COD	\N	2026-04-03 04:34:21.555	\N	INR	\N	0	2026-04-03 04:34:21.642	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmnlk5o8d0000pfokfn3rajzl	cmnlk5amp00001pb6ew1v9o98	320000	COD	\N	2026-04-05 09:27:30.535	\N	INR	\N	0	2026-04-05 09:27:30.787	USER_ID	SUCCESS
cmnne0q9e0000i12qra69jagc	cmnne0mai000cdzzm9ufdcgyi	880000	COD	\N	2026-04-06 16:11:14.538	\N	INR	\N	0	2026-04-06 16:11:14.69	test-user-id	SUCCESS
cmnneu6o20001i12q6xrsi44r	cmnnetvti0004iq2c9p8rggfr	960000	COD	\N	2026-04-06 16:34:07.685	\N	INR	\N	0	2026-04-06 16:34:09.367	test-user-id	SUCCESS
cmnnfpwh20002i12qzgmay9hk	cmnnfpmol000ciq2c9lm1l6d2	1040000	COD	\N	2026-04-06 16:58:47.865	\N	INR	\N	0	2026-04-06 16:58:48.876	test-user-id	SUCCESS
cmno52ymk0000j2e2opc7rjvh	cmnielbwl0000cl4nh43n1ti7	70000	COD	\N	2026-04-07 04:48:48.324	\N	INR	\N	0	2026-04-07 04:48:48.485	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmnocnxf00001j2e2049it2qf	cmnociht50000307d5eyoafd7	70000	COD	\N	2026-04-07 08:21:02.085	\N	INR	\N	0	2026-04-07 08:21:05.061	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmnohoakc0002j2e2vn393qcq	cmnoge5v70004307dwjczngva	70000	COD	\N	2026-04-07 10:41:16.419	\N	INR	\N	0	2026-04-07 10:41:19.181	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmnohsar30003j2e2grjgjaej	cmnohni3v0006307di28q9j56	70000	COD	\N	2026-04-07 10:44:25.816	\N	INR	\N	0	2026-04-07 10:44:25.887	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmnoilqz30004j2e2gfvxwi09	cmnoigwwl0008307df498y1zp	70000	COD	\N	2026-04-07 11:07:19.766	\N	INR	\N	0	2026-04-07 11:07:19.91	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmnoj4t2b0005j2e2i195jtj6	cmnoigwwl0008307df498y1zp	70000	COD	\N	2026-04-07 11:22:08.981	\N	INR	\N	0	2026-04-07 11:22:09.077	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmo9vf3dp00004o1a6bagla02	cmnoigwwl0008307df498y1zp	70000	COD	\N	2026-04-22 09:49:14.001	\N	INR	\N	0	2026-04-22 09:49:14.633	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmp5c75q3000080q0hk5xbz1r	cmp5c2e3a0000ctsf0xy9nc4d	99999	COD	\N	2026-05-14 10:19:48.793	\N	INR	\N	0	2026-05-14 10:19:48.851	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmq0uoppc0000rg2ihk7gm9dw	cmq0un03a000qk01mf6s47k6q	80000	razorpay	\N	2026-06-05 11:38:12.37	\N	INR	\N	0	2026-06-05 11:38:12.37	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq0vj4nr0001rg2ii5v6peef	cmq0viy9x000sk01m38bp29yk	80000	razorpay	\N	2026-06-05 12:01:51.283	\N	INR	\N	0	2026-06-05 12:01:51.283	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq15m3qx0002rg2ifmi0qv44	cmq15lrd9000uk01m7eecu4s1	80000	razorpay	\N	2026-06-05 16:44:05.915	\N	INR	\N	0	2026-06-05 16:44:05.915	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq24dk140000v0bzk6p2xmph	cmq24de3u0000tpfqdh2atzs7	80000	razorpay	\N	2026-06-06 08:57:14.147	\N	INR	\N	0	2026-06-06 08:57:14.147	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq52vqnf0000v9qkeioy2zk5	cmq52vht0000013hodysmfrsn	80000	razorpay	\N	2026-06-08 10:38:41.831	\N	INR	\N	0	2026-06-08 10:38:41.831	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq54c6fd0001v9qkkt8mj9lm	cmq54bxdm000213ho4h3jg8zj	70000	razorpay	\N	2026-06-08 11:19:28.203	\N	INR	\N	0	2026-06-08 11:19:28.203	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq6hy6ho0000dru846udo1lj	cmq6hy4m10002t2gwct6b8j8u	80000	COD	\N	2026-06-09 10:28:16.083	\N	INR	\N	0	2026-06-09 10:28:16.282	CURRENT_USER	SUCCESS
cmq6hzzus0001dru85pai3m65	cmq6hy4m10002t2gwct6b8j8u	80000	razorpay	\N	2026-06-09 10:29:40.673	\N	INR	\N	0	2026-06-09 10:29:40.673	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq6i15fh0002dru80tvfac56	cmq6i12i60004t2gwp6nxn40c	80000	COD	\N	2026-06-09 10:30:34.62	\N	INR	\N	0	2026-06-09 10:30:34.834	CURRENT_USER	SUCCESS
cmq6mtcnj0000kbyblceyc4cy	cmq6mtafs0000n1iepl82463q	160000	COD	\N	2026-06-09 12:44:28.873	\N	INR	\N	0	2026-06-09 12:44:28.96	CURRENT_USER	SUCCESS
cmq6mvxnp0001kbyba37t9sox	cmq6mtafs0000n1iepl82463q	160000	razorpay	\N	2026-06-09 12:46:29.312	\N	INR	\N	0	2026-06-09 12:46:29.312	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq7pkr5k0000bgulv3mvcnfx	cmq7pkoxi0000xcafdzdv6hfr	80000	COD	\N	2026-06-10 06:49:32.786	\N	INR	\N	0	2026-06-10 06:49:34.339	CURRENT_USER	SUCCESS
cmq7plho00001bgulrkq0svqx	cmq7pkoxi0000xcafdzdv6hfr	80000	razorpay	\N	2026-06-10 06:50:07.15	\N	INR	\N	0	2026-06-10 06:50:07.15	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq7pmcra0002bgul02bkaece	cmq7pmcds0002xcafsu1ynmvk	160000	COD	\N	2026-06-10 06:50:47.444	\N	INR	\N	0	2026-06-10 06:50:47.452	CURRENT_USER	SUCCESS
cmq7pmgv80003bgul9thahzdk	cmq7pmcds0002xcafsu1ynmvk	160000	razorpay	\N	2026-06-10 06:50:52.773	\N	INR	\N	0	2026-06-10 06:50:52.773	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq7u3lir0000pxnk0or3zsq5	cmq7u3ivs0000u7d5z997oact	80000	COD	\N	2026-06-10 08:56:10.414	\N	INR	\N	0	2026-06-10 08:56:10.503	CURRENT_USER	SUCCESS
cmq7u3w5y0001pxnksf867kck	cmq7u3ivs0000u7d5z997oact	80000	razorpay	\N	2026-06-10 08:56:24.214	\N	INR	\N	0	2026-06-10 08:56:24.214	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq7ye8v10000au6miocq750z	cmq7ye62i0000ww6f0b2xj91u	80000	COD	\N	2026-06-10 10:56:25.664	\N	INR	\N	0	2026-06-10 10:56:25.965	CURRENT_USER	SUCCESS
cmq7yeixg0001au6mgt5gwyjp	cmq7ye62i0000ww6f0b2xj91u	80000	razorpay	\N	2026-06-10 10:56:38.739	\N	INR	\N	0	2026-06-10 10:56:38.739	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq7yf1fs0002au6mwv99451j	cmq7yf1090002ww6fnon9vyk9	80000	COD	\N	2026-06-10 10:57:02.722	\N	INR	\N	0	2026-06-10 10:57:02.738	CURRENT_USER	SUCCESS
cmq8369yh0003au6ma4l0l2mt	cmq8367a90004ww6fg29cdwk8	160000	COD	\N	2026-06-10 13:10:11.688	\N	INR	\N	0	2026-06-10 13:10:12.019	CURRENT_USER	SUCCESS
cmq836gwt0004au6mq95mes3k	cmq8367a90004ww6fg29cdwk8	160000	razorpay	\N	2026-06-10 13:10:20.942	\N	INR	\N	0	2026-06-10 13:10:20.942	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq99wqgj0000a5dgs6w3pii7	cmq99wnk6000073l1hy1ymlqx	80000	COD	\N	2026-06-11 09:06:30.255	\N	INR	\N	0	2026-06-11 09:06:30.481	CURRENT_USER	SUCCESS
cmq99x0x60001a5dga8ys8gbx	cmq99wnk6000073l1hy1ymlqx	80000	razorpay	\N	2026-06-11 09:06:43.81	\N	INR	\N	0	2026-06-11 09:06:43.81	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmq99y9kb0002a5dgidza4oon	cmq99y93k000273l1vi1726f3	70000	COD	\N	2026-06-11 09:07:41.619	\N	INR	\N	0	2026-06-11 09:07:41.72	CURRENT_USER	SUCCESS
cmq9cjc8x00001265emuxq7vv	cmq9cj9uk0000wkw2hztc2rd7	5000	COD	\N	2026-06-11 10:20:04.155	\N	INR	\N	0	2026-06-11 10:20:04.279	CURRENT_USER	SUCCESS
cmskngcob00006n18uh9af8u3	cmsk74yzw00001fig72xirdu0	80000	razorpay	\N	2026-08-08 17:30:33.083	\N	INR	\N	0	2026-08-08 17:30:33.083	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmsknjfcm00016n18m6rbas99	cmsk74yzw00001fig72xirdu0	80000	razorpay	\N	2026-08-08 17:32:56.522	\N	INR	\N	0	2026-08-08 17:32:56.522	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmsrkyu1v0000igsqsn7gvlbu	cmsrkyfo00000102up5z2m0ly	194999	COD	\N	2026-08-13 13:55:19.843	\N	INR	\N	0	2026-08-13 13:55:19.884	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmsrkzk8h0001igsq782bop1d	cmsrkyfo00000102up5z2m0ly	194999	NETBANKING	\N	2026-08-13 13:55:53.762	\N	INR	\N	0	2026-08-13 13:55:53.762	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmsrl02iw0002igsqcyuyhzv7	cmsrkyfo00000102up5z2m0ly	194999	COD	\N	2026-08-13 13:56:17.48	\N	INR	\N	0	2026-08-13 13:56:17.49	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmsrl06my0003igsqf4evlw1k	cmsrkyfo00000102up5z2m0ly	194999	COD	\N	2026-08-13 13:56:22.81	\N	INR	\N	0	2026-08-13 13:56:22.822	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt141puh0000cz6cxgywriyl	cmt14181a0000zc4qbp3oqno4	355000	COD	\N	2026-08-20 05:59:22.649	\N	INR	\N	0	2026-08-20 05:59:22.769	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt141w9k0001cz6ci4x4i6tg	cmt14181a0000zc4qbp3oqno4	355000	COD	\N	2026-08-20 05:59:30.854	\N	INR	\N	0	2026-08-20 05:59:31.049	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt14802n0002cz6c9s55vpin	cmt147qff0003zc4qi2e880ut	400000	COD	\N	2026-08-20 06:04:15.68	\N	INR	\N	0	2026-08-20 06:04:15.951	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt15w5uf0003cz6cnrh95gpy	cmt15vzg80009zc4qroeprm8j	490000	COD	\N	2026-08-20 06:51:02.388	\N	INR	\N	0	2026-08-20 06:51:02.727	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt16eh110004cz6cd54fa8cw	cmt16ebdx000czc4qqxa4yfvs	625000	COD	\N	2026-08-20 07:05:16.79	\N	INR	\N	0	2026-08-20 07:05:17.082	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt19h6r50000t8cvowrtmne3	cmt19gkgl0003fuyb0sca2ag9	725000	COD	\N	2026-08-20 08:31:22.443	\N	INR	\N	0	2026-08-20 08:31:22.783	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt19i4fc0001t8cv299716qo	cmt19gkgl0003fuyb0sca2ag9	725000	COD	\N	2026-08-20 08:32:05.898	\N	INR	\N	0	2026-08-20 08:32:06.882	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt19j3fs0002t8cvm3kg1w6k	cmt19gkgl0003fuyb0sca2ag9	725000	COD	\N	2026-08-20 08:32:50.755	\N	INR	\N	0	2026-08-20 08:32:51.944	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt19lj3n0003t8cvym34mz43	cmt19gkgl0003fuyb0sca2ag9	725000	UPI	\N	2026-08-20 08:34:45.039	\N	INR	\N	0	2026-08-20 08:34:45.039	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	PENDING
cmt5menif0000bzsumbarwisw	cmt5mej8u0000crizh1p8zwyl	202498	COD	\N	2026-08-23 09:44:23.943	\N	INR	\N	0	2026-08-23 09:44:23.999	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt71tw6d0000t5a62u9qa3rg	cmt71pu8t0002wmzbyhokcwvz	45000	COD	\N	2026-08-24 09:43:55.409	\N	INR	\N	0	2026-08-24 09:43:55.843	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt71u7ix0001t5a6ozcw5ba7	cmt71pu8t0002wmzbyhokcwvz	45000	COD	\N	2026-08-24 09:44:09.883	\N	INR	\N	0	2026-08-24 09:44:11.401	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt8dvgwr0000z9atyg9skgt6	cmt8dtt7f0000l7z83o6ilmvq	7497	COD	\N	2026-08-25 08:08:50.523	\N	INR	\N	0	2026-08-25 08:08:50.558	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt8ii0lv0000jkg3fy5phyvj	cmt8ih3ir0000977h4ur53jvr	229998	COD	\N	2026-08-25 10:18:20.945	\N	INR	\N	0	2026-08-25 10:18:20.989	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmt8ii9190001jkg3ev1bvlct	cmt8ih3ir0000977h4ur53jvr	229998	COD	\N	2026-08-25 10:18:31.753	\N	INR	\N	0	2026-08-25 10:18:32.222	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtb607i70000illnve0qkd92	cmtb5zcqk0000yto4vnhqlgza	138498	COD	\N	2026-08-27 06:51:53.214	\N	INR	\N	0	2026-08-27 06:51:53.286	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtb6khd20001illnqopeng9x	cmtb6ke3f0004yto4fdo22qy2	2499	COD	\N	2026-08-27 07:07:38.977	\N	INR	\N	0	2026-08-27 07:07:39.166	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtb6rw8p0002illnuhvj9kqw	cmtb6rtaq0006yto4mkvxjtni	1299	COD	\N	2026-08-27 07:13:24.896	\N	INR	\N	0	2026-08-27 07:13:25.017	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtb8ct8o0003illnp6ie3ppx	cmtb8cpyr0008yto4zvfpcx5a	6798	COD	\N	2026-08-27 07:57:40.374	\N	INR	\N	0	2026-08-27 07:57:40.537	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtb95un30004illneyfpunbw	cmtb95qh4000byto474qvh5e7	4999	COD	\N	2026-08-27 08:20:15.176	\N	INR	\N	0	2026-08-27 08:20:15.372	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtb9hwvf0005illnyz6t024c	cmtb9hsvj000dyto4zut3m90o	83499	COD	\N	2026-08-27 08:29:38.002	\N	INR	\N	0	2026-08-27 08:29:38.145	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtplus1i0000yod4m3balu8v	cmtplq7sh000012ejb7977ze9	438496	COD	\N	2026-09-06 09:24:20.213	\N	INR	\N	0	2026-09-06 09:24:20.299	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtpyr1ge00001178jrh3jizt	cmtpyqwpv000013xtbe6w90nl	49999	COD	\N	2026-09-06 15:25:20.796	\N	INR	\N	0	2026-09-06 15:25:20.985	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtpyrdhi00011178bd2qqin3	cmtpyqwpv000013xtbe6w90nl	49999	COD	\N	2026-09-06 15:25:36.362	\N	INR	\N	0	2026-09-06 15:25:36.412	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtqziikz0000zww16w9ei1bs	cmtqzi4oh0008mm664gmlqzdt	14196	COD	\N	2026-09-07 08:34:28.595	\N	INR	\N	0	2026-09-07 08:34:34.627	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtqzjaqo0001zww1c2s044j3	cmtqzi4oh0008mm664gmlqzdt	14196	COD	\N	2026-09-07 08:35:05.319	\N	INR	\N	0	2026-09-07 08:35:05.398	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtqzjghu0002zww1kdinvb9l	cmtqzi4oh0008mm664gmlqzdt	14196	COD	\N	2026-09-07 08:35:12.835	\N	INR	\N	0	2026-09-07 08:35:12.902	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtqzuf0r0003zww1zevay1yn	cmtqzi4oh0008mm664gmlqzdt	14196	COD	\N	2026-09-07 08:43:43.572	\N	INR	\N	0	2026-09-07 08:43:44.459	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
cmtr51zuo0000zj7fcta9fqo5	cmtr51tw0000014dvnznewd9r	5497	COD	\N	2026-09-07 11:09:35.684	\N	INR	\N	0	2026-09-07 11:09:36.106	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	SUCCESS
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
df120950-1721-4a57-951b-bdf1dd9a848c	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-03-24 12:15:23.224407+00	20260113113023_init	\N	\N	2026-03-24 12:15:23.135659+00	1
4591f9d2-0d91-4469-b592-632ac6656c96	de0107dac8e6a73842e15a8765a8bcc68b268fdf83fe0fcd1b6a1d1934608abe	2026-03-24 12:15:23.328188+00	20260115102953_init	\N	\N	2026-03-24 12:15:23.231424+00	1
9b905397-d3ca-429e-a9b3-a9effc5032f8	2e2ca6b6d9ee5d6edc716b8eb29df6cfbb826b801245cf83b73eca9b7db781ff	2026-03-24 12:15:23.387434+00	20260317060921_init	\N	\N	2026-03-24 12:15:23.335834+00	1
\.


--
-- Name: Payment Payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

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
-- PostgreSQL database dump complete
--

--
-- Database "prisma_migrate_shadow_db_79d1b998-7919-4248-aea8-8d1df0b6ba57" dump
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
-- Name: prisma_migrate_shadow_db_79d1b998-7919-4248-aea8-8d1df0b6ba57; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "prisma_migrate_shadow_db_79d1b998-7919-4248-aea8-8d1df0b6ba57" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "prisma_migrate_shadow_db_79d1b998-7919-4248-aea8-8d1df0b6ba57" OWNER TO postgres;

\connect -reuse-previous=on "dbname='prisma_migrate_shadow_db_79d1b998-7919-4248-aea8-8d1df0b6ba57'"

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
-- PostgreSQL database dump complete
--

--
-- Database "product_db" dump
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
-- Name: product_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE product_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE product_db OWNER TO postgres;

\connect product_db

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
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    name text NOT NULL,
    slug text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    "vendorId" text NOT NULL,
    name text NOT NULL,
    price double precision NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    description text,
    stock integer NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "priceRange" text,
    "categoryId" text
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- Name: ProductImage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProductImage" (
    id text NOT NULL,
    url text NOT NULL,
    "productId" text NOT NULL,
    "altText" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."ProductImage" OWNER TO postgres;

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
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Category" (id, name, slug, "createdAt", "updatedAt") FROM stdin;
cat-electronics	Electronics	electronics	2026-08-21 08:39:43.914	2026-08-21 08:39:43.914
cat-fashion	Fashion	fashion	2026-08-21 08:39:43.914	2026-08-21 08:39:43.914
cat-home-kitchen	Home	home	2026-08-21 08:39:43.914	2026-08-21 08:39:43.914
cat-beauty	Beauty	beauty	2026-08-21 08:49:16.877	2026-08-21 08:49:16.877
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Product" (id, "vendorId", name, price, "createdAt", description, stock, "updatedAt", "priceRange", "categoryId") FROM stdin;
cmt1fw1rw000ljgovwv5ou0wf	2c9f0f5d-b039-4a43-af46-7eb21217782d	Prestige Induction Cooktop	3499	2026-08-20 11:30:53.556	Efficient induction cooktop with multiple cooking modes, convenient temperature controls, quick heating, and a compact design suitable for modern kitchens.	25	2026-08-20 11:30:53.556	\N	cat-home-kitchen
cmt1fx3fc000njgovki4yh0dj	2c9f0f5d-b039-4a43-af46-7eb21217782d	Bajaj Mixer Grinder 750W	4299	2026-08-20 11:31:42.356	Powerful 750W mixer grinder designed for blending, grinding, mixing, and everyday kitchen preparation with durable jars and convenient controls.	18	2026-08-20 11:31:42.356	\N	cat-home-kitchen
cmt1ck0z40000jgovrue7m3j5	6ec84042-bf74-4dbb-a885-376cfd507a26	Samsung Galaxy S25 Ultra	129999	2026-08-20 09:57:33.797	Flagship Samsung smartphone with a premium design, high-performance processor, advanced camera system, and large AMOLED display.	15	2026-08-20 09:57:33.797	\N	cat-electronics
cmt1fuv94000jjgov8dko1x3k	2c9f0f5d-b039-4a43-af46-7eb21217782d	Philips Air Fryer 6.2L	8499	2026-08-20 11:29:58.38	Large-capacity air fryer designed for convenient and healthier cooking with less oil, adjustable temperature controls, and easy everyday operation.	20	2026-08-20 11:29:58.38	\N	cat-home-kitchen
mixer-001	6ec84042-bf74-4dbb-a885-376cfd507a26	mixer-grinder	70000	2026-04-22 08:34:16.904	Powerful mixer grinder for easy cooking and blending.	5	2026-06-10 11:19:38.812	₹2,000 - ₹8,000	cat-home-kitchen
cmt1jlf2j0013jgovfvqvfqly	6f7e6756-2da5-4001-967b-d083cac4c787	Refrigerator	45000	2026-08-20 13:14:36.035	Powerful and energy-efficient washing machine for effortless cleaning.	20	2026-08-20 13:14:36.035	\N	cat-home-kitchen
cmncsqpkp00003jx9cs4gxo3z	57ae3c9a-aa95-43b7-b79b-70dfa49e5649	womens-clothing	70000	2026-03-30 06:17:53.4	Trendy women's clothing with comfort and elegance.	5	2026-06-10 11:19:38.812	₹500 - ₹8,000	cat-fashion
cmp5b0bl50000lhtd3p2fsyox	57ae3c9a-aa95-43b7-b79b-70dfa49e5649	kids-wear	99999	2026-05-14 09:46:29.968	Comfortable and stylish clothes for kids.	10	2026-06-10 11:19:38.812	₹300 - ₹2,000	cat-fashion
cmn5qhf470000m645g8p9181p	8eef14ba-6072-412a-81f3-c98edbbdab22	mens-clothing	5000	2026-03-25 07:40:17.476	Modern men's clothing with comfort and style.	10	2026-06-10 11:19:38.812	₹500 - ₹5,000	cat-fashion
cmt1gaey8000qjgov4n270bsb	57ae3c9a-aa95-43b7-b79b-70dfa49e5649	Women's Cotton Kurta Set	1299	2026-08-20 11:42:03.717	Comfortable and stylish cotton kurta set designed for everyday wear, featuring a breathable fabric, elegant pattern, and versatile design suitable for casual occasions.	30	2026-08-20 11:42:03.717	\N	cat-fashion
cmt1gbz56000sjgov3j8hdnfa	57ae3c9a-aa95-43b7-b79b-70dfa49e5649	Women's Casual Handbag	1899	2026-08-20 11:43:16.644	Stylish everyday handbag with a spacious interior, durable construction, and convenient compartments for carrying personal essentials.	20	2026-08-20 11:43:16.644	\N	cat-fashion
cmt1gd8td000ujgov44mw0ut4	57ae3c9a-aa95-43b7-b79b-70dfa49e5649	Women's Running Shoes	2499	2026-08-20 11:44:15.836	Lightweight and comfortable running shoes designed for walking, exercise, running, and everyday activities with supportive cushioning and a breathable design.	20	2026-08-20 11:44:15.836	\N	cat-fashion
cmqgc4e360000pxv015goc7j3	57ae3c9a-aa95-43b7-b79b-70dfa49e5649	beauy-products	80000	2026-06-16 07:42:49.937	Enhance your natural beauty with premium skincare and cosmetics.	100	2026-07-30 10:30:14.527	₹200 - ₹8,000	cat-beauty
cmt1cmduw0003jgov6u41kzkg	6ec84042-bf74-4dbb-a885-376cfd507a26	Samsung Galaxy Tab S10 Ultra	108999	2026-08-20 09:59:23.814	Premium Android tablet with a large AMOLED display, powerful performance, S Pen support, and long-lasting battery.	10	2026-08-20 09:59:23.814	\N	cat-electronics
cmt1cnub10005jgov4cfn3ocb	6ec84042-bf74-4dbb-a885-376cfd507a26	Samsung 55 Inch QLED 4K Smart TV	74999	2026-08-20 10:00:31.787	55-inch QLED 4K Smart TV with vivid colors, smart features, immersive sound, and a slim modern design.	8	2026-08-20 10:00:31.787	\N	cat-electronics
cmt1e0dg60007jgovzqu51m6g	0d56df83-b041-4b98-8b48-b6e59edd4c55	Apple iPhone 17 Pro Max	149999	2026-08-20 10:38:16.029	Premium Apple smartphone with a powerful processor, advanced camera system, bright high-resolution display, excellent battery life, and a premium design	12	2026-08-20 10:38:16.029	\N	cat-electronics
cmt1e1j730009jgovwxdlrhah	0d56df83-b041-4b98-8b48-b6e59edd4c55	Apple MacBook Air M4	114999	2026-08-20 10:39:10.182	Lightweight and powerful Apple laptop featuring the M4 chip, high-resolution display, long battery life, and a slim portable design for work and everyday use.	8	2026-08-20 10:39:10.182	\N	cat-electronics
cmt1e2p6v000bjgovqzc6ma2x	0d56df83-b041-4b98-8b48-b6e59edd4c55	Apple iPad Pro M5	99999	2026-08-20 10:40:04.613	High-performance Apple tablet with a stunning display, powerful M5 processor, premium design, and excellent performance for productivity, entertainment, and creative work.	10	2026-08-20 10:40:04.613	\N	cat-electronics
cmt1euih9000djgovb5knybj4	aeb67e06-4014-41b0-9e93-a949f2023a08	Sony WH-1000XM6 Headphones	39990	2026-08-20 11:01:42.226	Premium wireless over-ear headphones with advanced noise cancellation, immersive sound quality, comfortable ear cushions, and long-lasting battery performance	15	2026-08-20 11:01:42.226	\N	cat-electronics
cmt1evv1l000fjgovkqkab4md	aeb67e06-4014-41b0-9e93-a949f2023a08	Sony Bravia 55 Inch 4K Smart TV	89999	2026-08-20 11:02:45.224	55-inch 4K smart television delivering detailed picture quality, vibrant colors, immersive audio, smart streaming features, and a sleek modern design.	7	2026-08-20 11:02:45.224	\N	cat-electronics
cmt1ewrqk000hjgovbzwfqd3w	aeb67e06-4014-41b0-9e93-a949f2023a08	Sony PlayStation 5	54990	2026-08-20 11:03:27.594	Next-generation gaming console featuring high-quality graphics, fast loading times, immersive gameplay, advanced controller technology, and access to a large collection of games.	10	2026-08-20 11:03:27.594	\N	cat-electronics
cmn4xab4600016ehypgarj7ra	8eef14ba-6072-412a-81f3-c98edbbdab22	iPhone	80000	2026-03-24 18:02:56.758	Premium smartphone with great camera and smooth performance.	10	2026-06-10 11:33:26.204	₹50,000 - ₹1,50,000	cat-electronics
speaker-001	8eef14ba-6072-412a-81f3-c98edbbdab22	speaker	80000	2026-03-24 18:03:51.536	Clear sound speaker with strong bass and wireless support.	10	2026-06-10 11:19:38.812	₹1,000 - ₹15,000	cat-electronics
cmn4xny4900003llq1rzp2un8	57ae3c9a-aa95-43b7-b79b-70dfa49e5649	laptop	80000	2026-03-24 18:13:33.177	Powerful laptop with fast performance, SSD storage, and clear display.	10	2026-06-10 11:19:38.812	₹40,000 - ₹90,000	cat-electronics
cmt1gtcgf000xjgovpot8xygc	8a734868-281d-430d-9352-953d01538dfc	Logitech Wireless Mouse	1499	2026-08-20 11:56:47.014	Ergonomic wireless mouse providing smooth and accurate tracking, comfortable handling, reliable connectivity, and convenient everyday computer navigation.	20	2026-08-20 11:56:47.014	\N	cat-electronics
cmt1gugi4000zjgovp5hwezl3	8a734868-281d-430d-9352-953d01538dfc	Logitech Wireless Keyboard	2499	2026-08-20 11:57:38.953	Comfortable wireless keyboard designed for home and office use, featuring responsive keys, reliable wireless connectivity, and a compact practical design.	20	2026-08-20 11:57:38.953	\N	cat-electronics
cmt1gvjgl0011jgovx6ockzz8	8a734868-281d-430d-9352-953d01538dfc	JBL Bluetooth Speaker	4999	2026-08-20 11:58:29.444	Portable Bluetooth speaker delivering powerful and clear audio with wireless connectivity, compact construction, and a battery suitable for everyday entertainment.	80	2026-08-20 11:58:29.444	\N	cat-electronics
cmt1jor140015jgovfne2vpgs	6f7e6756-2da5-4001-967b-d083cac4c787	ASUS ROG Gaming Laptop	129999	2026-08-20 13:17:11.509	High-performance gaming laptop designed for demanding games, multitasking, and creative workloads, featuring powerful hardware, a high-refresh-rate display, and advanced cooling.	8	2026-08-20 13:17:11.509	\N	cat-electronics
cmt1jq71w0017jgov1detm0xh	6f7e6756-2da5-4001-967b-d083cac4c787	Dell 27 Inch Monitor	24999	2026-08-20 13:18:18.886	27-inch computer monitor offering a large viewing area, sharp visuals, comfortable viewing, and a practical design suitable for productivity, entertainment, and everyday computing.	10	2026-08-20 13:18:18.886	\N	cat-electronics
cmt1jrawh0019jgovga858g7k	6f7e6756-2da5-4001-967b-d083cac4c787	Mechanical Gaming Keyboard	3499	2026-08-20 13:19:10.575	Responsive mechanical gaming keyboard designed for fast and accurate typing, gaming performance, durable key switches, and comfortable long-duration use.	20	2026-08-20 13:19:10.575	\N	cat-electronics
cmtmodxwc000384bleeosn2ba	a6bd48e8-58e0-4f6b-979b-68dff52deff3	Lakme Face Cream	499	2026-09-04 08:11:54.132	Lakme face cream for daily skincare	20	2026-09-04 08:11:54.132	\N	cat-beauty
cmtshcrmi0001qump0mhezkxn	a6bd48e8-58e0-4f6b-979b-68dff52deff3	NARS Radiant Creamy Concealer	3200	2026-09-08 09:41:39.617	Creamy, buildable concealer that provides smooth, natural-looking coverage. Helps conceal imperfections and brighten the appearance of the under-eye area while leaving a comfortable, radiant finish.	30	2026-09-08 09:41:39.617	\N	cat-beauty
\.


--
-- Data for Name: ProductImage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProductImage" (id, url, "productId", "altText", "createdAt", "updatedAt") FROM stdin;
cmt1gvjgl0012jgov49kienb6	http://localhost:9000/products/a364c1a7-5f03-4f61-8611-aecc0e9dc20f-jbl Blueooth speaker.jfif	cmt1gvjgl0011jgovx6ockzz8	\N	2026-08-20 11:58:29.444	2026-08-20 11:58:29.444
cmt1jlf2l0014jgovvsriwmi0	http://localhost:9000/products/e1139b7b-c628-4706-956f-69819c551714-Refrigerator.jfif	cmt1jlf2j0013jgovfvqvfqly	\N	2026-08-20 13:14:36.035	2026-08-20 13:14:36.035
cmt1jor180016jgove6xkx038	http://localhost:9000/products/3c63bb41-3b67-49dc-b91a-2616f9199dac-asus laptop.jfif	cmt1jor140015jgovfne2vpgs	\N	2026-08-20 13:17:11.509	2026-08-20 13:17:11.509
cmt1jq71w0018jgovtv094eja	http://localhost:9000/products/4590c52b-bcf1-4677-9311-701e162e0bac-Dell 27 Inch Monitor.jfif	cmt1jq71w0017jgov1detm0xh	\N	2026-08-20 13:18:18.886	2026-08-20 13:18:18.886
cmt1jrawh001ajgovkczozh38	http://localhost:9000/products/821f355e-432d-4880-9f42-a79dbf5ed6ee-Mechanical Gaming Keyboard.jfif	cmt1jrawh0019jgovga858g7k	\N	2026-08-20 13:19:10.575	2026-08-20 13:19:10.575
cmtmodxwh000484blkmet0eal	http://localhost:9000/products/1d1b6f54-f95f-4e22-872d-f770f59437ec-Lakme Face Cream.jfif	cmtmodxwc000384bleeosn2ba	\N	2026-09-04 08:11:54.132	2026-09-04 08:11:54.132
aa3dd516-f002-4848-81b5-bf361d9e6625	http://localhost:9000/products/laptop.jpg	cmn4xny4900003llq1rzp2un8	\N	2026-06-08 12:41:34.478	2026-06-10 11:44:10.006
ab856445-02be-4736-9c45-e26eb793a073	http://localhost:9000/products/iphone.jpg	cmn4xab4600016ehypgarj7ra	\N	2026-06-08 12:41:34.478	2026-06-10 11:44:10.006
cmtshcrmk0002qumpexm6jrim	http://localhost:9000/products/35f576c6-da67-497b-a50b-08de85d8e382-NARS products.jfif	cmtshcrmi0001qump0mhezkxn	\N	2026-09-08 09:41:39.617	2026-09-08 09:41:39.617
3a6e7a18-388c-474a-885e-10eccb0d4229	http://localhost:9000/products/womens-clothing.jpg	cmncsqpkp00003jx9cs4gxo3z	\N	2026-06-08 12:41:34.478	2026-06-10 11:44:10.006
d4ef8b63-9e02-46aa-9f1d-9d804e3c5789	http://localhost:9000/products/mens-clothing.jpg	cmn5qhf470000m645g8p9181p	\N	2026-06-08 12:41:34.478	2026-06-10 11:44:10.006
c53c0c94-5281-470c-81f8-0aff5a13c0e8	http://localhost:9000/products/kids-wear.jpg	cmp5b0bl50000lhtd3p2fsyox	\N	2026-06-08 12:41:34.478	2026-06-10 11:49:49.965
cmo9sqpd30000qx6n39izvfbk	http://localhost:9000/products/speaker.jpg	speaker-001	\N	2026-06-08 11:41:15.01	2026-06-10 11:44:10.006
cmq5546nc0001ladvs68hh91y	http://localhost:9000/products/mixer-grinder.jpg	mixer-001	\N	2026-06-08 11:41:15.01	2026-06-10 11:44:10.006
beauty-image-001	http://localhost:9000/products/beauty-products.jpg	cmqgc4e360000pxv015goc7j3	\N	2026-07-30 12:12:39.873	2026-07-30 12:12:39.873
cmt1ck0zf0001jgovbq6mczgj	http://localhost:9000/products/5e2475a1-329b-4641-a906-10a6ba90a0a0-S25 Ultra.jfif	cmt1ck0z40000jgovrue7m3j5	\N	2026-08-20 09:57:33.797	2026-08-20 09:57:33.797
cmt1cmduw0004jgov0etjlu1c	http://localhost:9000/products/edf02dab-9812-46be-8fcd-5ee8d0344fc8-S10 Ultra Tab.jfif	cmt1cmduw0003jgov6u41kzkg	\N	2026-08-20 09:59:23.814	2026-08-20 09:59:23.814
cmt1cnub20006jgova2maw6ym	http://localhost:9000/products/c07642ac-943b-4828-a6c7-8c84568b93dd-QLED Ultra Smart TV.jfif	cmt1cnub10005jgov4cfn3ocb	\N	2026-08-20 10:00:31.787	2026-08-20 10:00:31.787
cmt1e0dga0008jgov3ovui2w3	http://localhost:9000/products/7bea75d4-d248-45ef-82a1-3f97c6d8d357-iPhone 17 Prm Max.jfif	cmt1e0dg60007jgovzqu51m6g	\N	2026-08-20 10:38:16.029	2026-08-20 10:38:16.029
cmt1e1j74000ajgov1nsw0sa2	http://localhost:9000/products/6b430ae7-fe6e-43e1-9562-690016566d35-macbook.jfif	cmt1e1j730009jgovwxdlrhah	\N	2026-08-20 10:39:10.182	2026-08-20 10:39:10.182
cmt1e2p6v000cjgov7lsad85t	http://localhost:9000/products/caf540b2-bbeb-4c89-9315-a1afa58d775b-apple ipad.jfif	cmt1e2p6v000bjgovqzc6ma2x	\N	2026-08-20 10:40:04.613	2026-08-20 10:40:04.613
cmt1euihb000ejgovsqxysctp	http://localhost:9000/products/e8d35c7b-9070-4659-bbdc-4a7baf5eb5d1-sony headphones.jfif	cmt1euih9000djgovb5knybj4	\N	2026-08-20 11:01:42.226	2026-08-20 11:01:42.226
cmt1evv1l000gjgovr9zwchi4	http://localhost:9000/products/876205e8-55f3-4dae-9546-09278a1b6a82-Sony Bravia.jfif	cmt1evv1l000fjgovkqkab4md	\N	2026-08-20 11:02:45.224	2026-08-20 11:02:45.224
cmt1ewrqk000ijgovqu2is425	http://localhost:9000/products/93dd552d-b796-4eca-8c42-4806aa739ed4-sony playstation.jfif	cmt1ewrqk000hjgovbzwfqd3w	\N	2026-08-20 11:03:27.594	2026-08-20 11:03:27.594
cmt1fuv9a000kjgovn681cb31	http://localhost:9000/products/648cd415-9f70-4688-9c3c-9fc51666d8c9-phillips airfryer.jfif	cmt1fuv94000jjgov8dko1x3k	\N	2026-08-20 11:29:58.38	2026-08-20 11:29:58.38
cmt1fw1rw000mjgov5wkg9a6e	http://localhost:9000/products/4a2d4fa5-eb18-4bbc-a067-a53e638d095b-induction cooker.jfif	cmt1fw1rw000ljgovwv5ou0wf	\N	2026-08-20 11:30:53.556	2026-08-20 11:30:53.556
cmt1fx3fc000ojgovjb8cwqa9	http://localhost:9000/products/c3b72375-1d0a-4970-9987-97bfcfd9d21b-bajaj mixer grinder.jfif	cmt1fx3fc000njgovki4yh0dj	\N	2026-08-20 11:31:42.356	2026-08-20 11:31:42.356
cmt1gaeyi000rjgovjghc6a6l	http://localhost:9000/products/1e1f3de5-d803-489a-bfb4-83eec01ab943-women kurtis.jfif	cmt1gaey8000qjgov4n270bsb	\N	2026-08-20 11:42:03.717	2026-08-20 11:42:03.717
cmt1gbz56000tjgovfo6jl0rc	http://localhost:9000/products/d9d3c3e9-613a-4263-a862-d383e7086307-womens handbags.jfif	cmt1gbz56000sjgov3j8hdnfa	\N	2026-08-20 11:43:16.644	2026-08-20 11:43:16.644
cmt1gd8td000vjgovo3v1l8js	http://localhost:9000/products/a899f2fd-a736-41ed-b0da-020258cd1f26-womens running shoes.jfif	cmt1gd8td000ujgov44mw0ut4	\N	2026-08-20 11:44:15.836	2026-08-20 11:44:15.836
cmt1gtcgf000yjgovbfebi58q	http://localhost:9000/products/f94d2390-4963-4db8-95b3-9692d1825f77-wireless mouse.jfif	cmt1gtcgf000xjgovpot8xygc	\N	2026-08-20 11:56:47.014	2026-08-20 11:56:47.014
cmt1gugi40010jgovj9s2l82h	http://localhost:9000/products/78ec673f-5904-497f-85f9-e0bc9a5a9c81-logitech wireless keyboard.jfif	cmt1gugi4000zjgovp5hwezl3	\N	2026-08-20 11:57:38.953	2026-08-20 11:57:38.953
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
1b99ec0e-aea5-4343-aa98-4aec23c4e6b2	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-03-24 17:58:40.782344+00	20260113113023_init	\N	\N	2026-03-24 17:58:40.671686+00	1
9ba162fc-e914-4de0-a007-f82c7321dfc3	4fb71ae7ad2f12c11c868d62b13880a624b832b60513a2df4029eac38476b64d	2026-03-24 17:58:41.013367+00	20260115105845_init	\N	\N	2026-03-24 17:58:40.789841+00	1
fa6cc0be-c3d5-43e2-8052-4a55769e03c1	0ddd58e2cdc9253e00b32480d061bd1e8249d73d89e1a776168b2e6e0d9cc97d	2026-03-24 17:58:41.162509+00	20260123125707_init	\N	\N	2026-03-24 17:58:41.021805+00	1
2c9db8f8-f079-48e8-8c63-ed77923732b0	16083a06c615083d685f08838e7d149ab2829d774d1eea2d7f075f909fcc1437	2026-03-24 17:58:41.279085+00	20260129105430_init	\N	\N	2026-03-24 17:58:41.170324+00	1
9db24117-7fcb-4758-834b-17efbac323cb	3d1c741c8565c9e31a6b9ad84d7c586f09da29f4ef2e0f0618c661915fab8a79	2026-03-24 17:58:41.312145+00	20260129114431_init	\N	\N	2026-03-24 17:58:41.286184+00	1
34729a59-6226-41b7-9e58-4c1bd5638716	6cada775ba183e8befc502ff44bd4869b3c1222444267c8d40aa4730b66f37c4	2026-03-24 17:58:41.36488+00	20260129124819_init_product	\N	\N	2026-03-24 17:58:41.318793+00	1
dcd96d80-161d-4b30-94d9-b8a07b998642	445e7bcb77cdbcc6755f2ee5acef9bbd4780c5a9631529b0be15b94d489bc8a7	2026-03-24 17:58:41.436739+00	20260317054711_init	\N	\N	2026-03-24 17:58:41.372056+00	1
b088c407-4b09-450e-bf45-49fb1e3f11c6	9b102954f9e15c2ba9d170b8ca57460b40f27b1fe976f56a4eb977287c9c0779	2026-03-30 11:25:08.54232+00	20260330112508_init	\N	\N	2026-03-30 11:25:08.495725+00	1
bc7f20e0-6da1-442e-844a-4899a4d92046	c1d7f129f626fac40a8d424c08312f48663ed6df5f952bcf0ec0cad3b22ddfb4	2026-06-05 16:33:35.099225+00	20260605163334_init	\N	\N	2026-06-05 16:33:35.010592+00	1
13df5329-179a-4dd3-84cb-8b0d9274fac2	185646b3cd07576f01ed4a318edae7fc538535153674fe9767b4a466a351eaca	2026-06-06 10:02:15.827635+00	20260606100215_add_product_images	\N	\N	2026-06-06 10:02:15.774767+00	1
\.


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: ProductImage ProductImage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImage"
    ADD CONSTRAINT "ProductImage_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Category_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Category_name_key" ON public."Category" USING btree (name);


--
-- Name: Category_slug_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Category_slug_key" ON public."Category" USING btree (slug);


--
-- Name: ProductImage ProductImage_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProductImage"
    ADD CONSTRAINT "ProductImage_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Product Product_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

--
-- Database "rating_db" dump
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
-- Name: rating_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE rating_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE rating_db OWNER TO postgres;

\connect rating_db

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
-- Name: AnalyticsEvent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AnalyticsEvent" (
    id text NOT NULL,
    "eventType" text NOT NULL,
    "entityId" text NOT NULL,
    payload jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."AnalyticsEvent" OWNER TO postgres;

--
-- Name: Rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rating" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "productId" text NOT NULL,
    rating integer NOT NULL,
    review text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "isDeleted" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."Rating" OWNER TO postgres;

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
-- Data for Name: AnalyticsEvent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AnalyticsEvent" (id, "eventType", "entityId", payload, "createdAt") FROM stdin;
\.


--
-- Data for Name: Rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rating" (id, "userId", "productId", rating, review, "createdAt", "updatedAt", "isDeleted") FROM stdin;
cmnq3ijmr000011u2axz6cgce	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	cmncsqpkp00003jx9cs4gxo3z	5	\N	2026-04-08 13:40:28.412	2026-04-08 13:40:28.412	f
cmnx0co8j00007l2kw5j6av05	2cb05d18-310b-415e-8f82-5a2ced57bc57	cmncsqpkp00003jx9cs4gxo3z	3	\N	2026-04-13 09:46:18.932	2026-04-13 09:46:18.932	f
cmo9vvmo600008e6vxrpb8ll6	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	cmn4xbhbk0000fvd4br8fvyja	5	\N	2026-04-22 10:02:05.569	2026-04-22 10:02:05.569	f
cmp5e4zjo0000sjtpr8unpb65	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	cmp5b0bl50000lhtd3p2fsyox	5	Excellent demo product	2026-05-14 11:14:06.705	2026-05-14 11:14:06.705	f
cmqje67lh000010iccaxpsoh7	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3	prod_123	5	\N	2026-06-18 11:03:32.587	2026-06-18 11:03:32.587	f
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
5f6e3820-a0c2-4563-b609-e0f1984f0eba	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-04-08 11:08:49.574992+00	20260113113023_init	\N	\N	2026-04-08 11:08:49.50714+00	1
95baf33a-82a1-4145-bde0-55944abfb8ba	793e43aa2f67f62d22fa6877adee6bf93e6ff33c254f87ae139467b07d655410	2026-04-08 11:08:49.637765+00	20260115095510_init	\N	\N	2026-04-08 11:08:49.583111+00	1
8ff59d79-c7ae-4b30-9870-3970e3ab3999	2bcbaf75cca5bfd14cf93f3873709d590359035fd97a4902f09c548537592b18	2026-04-08 11:08:49.709541+00	20260208165935_init	\N	\N	2026-04-08 11:08:49.645494+00	1
30ac6bd7-529e-4def-bba1-ae23d407e278	9d6a33ea096ff86f783450a41911c32fbb70d6f88ee16d590e588fe82d433aac	2026-04-08 11:08:52.419484+00	20260408110852_init	\N	\N	2026-04-08 11:08:52.360694+00	1
3acfa7b0-2d30-4ff6-bf2d-12d5cd7ef6a6	9ec3729872981e69224b63a0eeac7f4484f1d19bf73ce34b4f2b1969633e326d	2026-04-08 11:18:02.362514+00	20260408111802_init	\N	\N	2026-04-08 11:18:02.271175+00	1
22321376-011c-4b09-ba23-2555c580a91c	6dce930f3a85020f355d7eab92f23ad416954e9f7bed35ae9f0efa5f0e3f08c6	2026-04-08 12:12:03.043289+00	20260408121202_init	\N	\N	2026-04-08 12:12:02.667744+00	1
\.


--
-- Name: AnalyticsEvent AnalyticsEvent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AnalyticsEvent"
    ADD CONSTRAINT "AnalyticsEvent_pkey" PRIMARY KEY (id);


--
-- Name: Rating Rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rating"
    ADD CONSTRAINT "Rating_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: AnalyticsEvent_createdAt_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AnalyticsEvent_createdAt_idx" ON public."AnalyticsEvent" USING btree ("createdAt");


--
-- Name: AnalyticsEvent_entityId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AnalyticsEvent_entityId_idx" ON public."AnalyticsEvent" USING btree ("entityId");


--
-- Name: AnalyticsEvent_eventType_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "AnalyticsEvent_eventType_idx" ON public."AnalyticsEvent" USING btree ("eventType");


--
-- Name: Rating_isDeleted_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Rating_isDeleted_idx" ON public."Rating" USING btree ("isDeleted");


--
-- Name: Rating_productId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Rating_productId_idx" ON public."Rating" USING btree ("productId");


--
-- Name: Rating_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Rating_userId_idx" ON public."Rating" USING btree ("userId");


--
-- Name: Rating_userId_productId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Rating_userId_productId_key" ON public."Rating" USING btree ("userId", "productId");


--
-- PostgreSQL database dump complete
--

--
-- Database "refund_db" dump
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
-- Name: refund_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE refund_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE refund_db OWNER TO postgres;

\connect refund_db

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
-- Name: RefundStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RefundStatus" AS ENUM (
    'REQUESTED',
    'APPROVED',
    'REJECTED',
    'PICKED_UP',
    'COMPLETED'
);


ALTER TYPE public."RefundStatus" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Refund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Refund" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    "userId" text NOT NULL,
    reason text NOT NULL,
    status public."RefundStatus" DEFAULT 'REQUESTED'::public."RefundStatus" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    amount double precision NOT NULL,
    "paymentId" text NOT NULL
);


ALTER TABLE public."Refund" OWNER TO postgres;

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
-- Data for Name: Refund; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Refund" (id, "orderId", "userId", reason, status, "createdAt", "updatedAt", amount, "paymentId") FROM stdin;
cmn8sukxj0000yylfvxerkiue	cmn6a53u20002qetdf78smnht	33b90461-9085-4066-9418-62333fac528a	Customer requested return	REJECTED	2026-03-27 11:09:49.287	2026-03-27 11:09:50.671	160000	cmn6c3lbj000096nrrdkhslog
cmn8uh5tb0000qn83q0d6pqf4	cmn6a53u20002qetdf78smnht	33b90461-9085-4066-9418-62333fac528a	Customer requested return	REJECTED	2026-03-27 11:55:22.315	2026-03-27 11:56:15.503	160000	cmn6c3lbj000096nrrdkhslog
cmn95g82j0000dh2phlohxx8m	cmn6a53u20002qetdf78smnht	33b90461-9085-4066-9418-62333fac528a	Customer requested return	REJECTED	2026-03-27 17:02:34.086	2026-03-27 17:02:38.908	160000	cmn6c3lbj000096nrrdkhslog
cmna2ybfz00005qls9r29f8yq	cmn6a53u20002qetdf78smnht	33b90461-9085-4066-9418-62333fac528a	Customer requested return	COMPLETED	2026-03-28 08:40:25.963	2026-03-28 08:40:28.056	160000	cmn6c3lbj000096nrrdkhslog
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
7c9af4ae-84a7-4ee9-ab15-bcc6f10dd9cb	11ba089e6fbeba45dc88f0a70d7afde4241c027d5aec90944c8bad1e73ac85cf	2026-03-26 16:23:27.592472+00	20260317121148_init	\N	\N	2026-03-26 16:23:27.236793+00	1
f05136a5-0691-4934-b342-fe0dfd4ae540	4ccf89047c8d6d895d664c7781e881e212c9aff4021b2c2aa929c997329aac29	2026-03-26 16:23:42.318631+00	20260326162341_init	\N	\N	2026-03-26 16:23:41.685103+00	1
\.


--
-- Name: Refund Refund_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Refund"
    ADD CONSTRAINT "Refund_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Refund_orderId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Refund_orderId_idx" ON public."Refund" USING btree ("orderId");


--
-- Name: Refund_userId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Refund_userId_idx" ON public."Refund" USING btree ("userId");


--
-- PostgreSQL database dump complete
--

--
-- Database "search_db" dump
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
-- Name: search_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE search_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE search_db OWNER TO postgres;

\connect search_db

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
-- Name: SearchProduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SearchProduct" (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    price double precision,
    "vendorId" text,
    "categoryId" text,
    "isActive" boolean DEFAULT true NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."SearchProduct" OWNER TO postgres;

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
-- Data for Name: SearchProduct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SearchProduct" (id, name, description, price, "vendorId", "categoryId", "isActive", "createdAt", "updatedAt") FROM stdin;
1	Samsung Galaxy S23	Flagship Samsung phone	75000	\N	\N	t	2026-04-10 12:04:53.564	2026-04-10 12:04:53.564
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
36a19986-4e07-4dbb-90eb-639d44630db7	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-04-09 09:33:57.80345+00	20260113113023_init	\N	\N	2026-04-09 09:33:57.74261+00	1
74238134-052a-41a3-8959-602b2e321931	e94ac992d8178fd1ba63ea2b3ce0b3a7bc0b4c6d296aac21c631c2b6ea735231	2026-04-09 09:33:57.880571+00	20260119091400_init	\N	\N	2026-04-09 09:33:57.811479+00	1
c236988e-e5a0-4461-a0ee-9cabd3369a62	1baf4744a2cb06d579d800f72ee777a32c7a4b0a86b9ae412c2e089265edb901	2026-04-09 09:33:57.938686+00	20260119114208_init	\N	\N	2026-04-09 09:33:57.887093+00	1
72feab98-eaca-4aa6-8d83-f8c65953d73e	9b3f0f1eec2c15a50a07879f4f7bad77b065def69bfee1ee6c3b5241536f233d	2026-04-09 09:33:57.994616+00	20260129100811_init	\N	\N	2026-04-09 09:33:57.946152+00	1
2487a63c-f871-42d5-8e5f-4995550f43c2	a96b77ea6c75918727c2333fe9da04a30cecc589eede9104a8f374792684ab21	2026-04-09 09:33:58.059992+00	20260131162124_init	\N	\N	2026-04-09 09:33:58.000428+00	1
\.


--
-- Name: SearchProduct SearchProduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SearchProduct"
    ADD CONSTRAINT "SearchProduct_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: SearchProduct_categoryId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SearchProduct_categoryId_idx" ON public."SearchProduct" USING btree ("categoryId");


--
-- Name: SearchProduct_name_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SearchProduct_name_idx" ON public."SearchProduct" USING btree (name);


--
-- Name: SearchProduct_vendorId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SearchProduct_vendorId_idx" ON public."SearchProduct" USING btree ("vendorId");


--
-- PostgreSQL database dump complete
--

--
-- Database "shipping_db" dump
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
-- Name: shipping_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE shipping_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE shipping_db OWNER TO postgres;

\connect shipping_db

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
-- Name: Shipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Shipment" (
    id text NOT NULL,
    "orderId" text NOT NULL,
    status text DEFAULT 'CREATED'::text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    address text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "trackingId" text NOT NULL,
    "userId" text NOT NULL
);


ALTER TABLE public."Shipment" OWNER TO postgres;

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
-- Data for Name: Shipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Shipment" (id, "orderId", status, "createdAt", address, "updatedAt", "trackingId", "userId") FROM stdin;
1aff036c-4247-4d7b-8bb4-070118a7f841	cmnociht50000307d5eyoafd7	CREATED	2026-04-08 10:46:54.404	"Mumbai, India"	2026-04-08 10:46:54.404	TRK-1001	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3
c1500a3a-11fc-4fc6-a5de-0188bbd7128a	cmnoigwwl0008307df498y1zp	CREATED	2026-04-22 09:52:22.169	"Mumbai, India"	2026-04-22 09:52:22.169	TRK-1001	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3
ac3cda8f-1f02-483e-8247-13f8bfe635a0	cmp5c2e3a0000ctsf0xy9nc4d	CREATED	2026-05-14 10:32:01.867	"Pune, Maharashtra, India"	2026-05-14 10:32:01.867	TRK-IPHONE15PRO-1001	77af8fb5-d6c5-4b39-96d9-c7ce8f2823d3
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
38eee18d-d9ea-45fb-8272-bdd10ca0b134	2badcb8c29b09449ef2f773844c70323d565aa82dcdb36d967768c8c74e204dd	2026-04-07 04:35:46.275197+00	20260113113023_init	\N	\N	2026-04-07 04:35:46.219677+00	1
4fca5fe6-4c63-4ec1-8364-4ee0310aea21	d99906c5999ceefa492e5e7e5ef655d8bc46e9f15cf5ad1a720dfa449cf6a365	2026-04-07 04:35:46.332669+00	20260203081547_init	\N	\N	2026-04-07 04:35:46.281628+00	1
98cbcddc-fae4-4e3d-9bba-083ca0ed39e0	2d26bae8ef8402770918618c63327a1c50b1cd18ea496e2c7105398df51085a0	2026-04-07 05:01:35.130364+00	20260407050135_init	\N	\N	2026-04-07 05:01:35.074276+00	1
a81ec238-42d9-40e1-961e-b1df1f914888	575c869974e6d134448205fc9da7d30e6af517616a65bca7afc49b978c9d318f	2026-04-07 17:11:47.211091+00	20260407171146_init	\N	\N	2026-04-07 17:11:46.944345+00	1
\.


--
-- Name: Shipment Shipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shipment"
    ADD CONSTRAINT "Shipment_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Shipment_orderId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Shipment_orderId_key" ON public."Shipment" USING btree ("orderId");


--
-- PostgreSQL database dump complete
--

--
-- Database "user_db" dump
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

