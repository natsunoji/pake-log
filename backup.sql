--
-- PostgreSQL database dump
--

\restrict ghRkHg4pigAVd0FCwL0I9DIyAm84Ex6iivHuPA0CPBmNkzIUfyK1euvnCCrn1wS

-- Dumped from database version 18.3 (Debian 18.3-1.pgdg12+1)
-- Dumped by pg_dump version 18.3 (Homebrew)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    name character varying(20) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    row_order integer
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    item_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: item_images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_images (
    id bigint NOT NULL,
    item_id bigint NOT NULL,
    image_url character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: item_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_images_id_seq OWNED BY public.item_images.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.items (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    category_id bigint,
    name character varying(40) NOT NULL,
    memo text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(20) NOT NULL,
    email character varying NOT NULL,
    avatar_url character varying,
    provider character varying,
    uid character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: item_images id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_images ALTER COLUMN id SET DEFAULT nextval('public.item_images_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
11	images	Item	7	11	2026-03-26 17:00:08.943908
24	images	Item	13	24	2026-03-29 09:54:10.018502
25	images	Item	14	25	2026-03-29 09:55:23.636338
26	images	Item	15	26	2026-03-29 09:56:33.228797
27	images	Item	16	27	2026-03-29 09:58:28.91422
28	images	Item	17	28	2026-03-31 13:08:56.985797
29	images	Item	17	29	2026-03-31 13:08:57.079188
30	images	Item	17	30	2026-03-31 13:08:57.171469
31	images	Item	18	31	2026-03-31 15:04:30.272084
32	images	Item	18	32	2026-03-31 15:04:30.36648
33	images	Item	18	33	2026-03-31 15:04:30.372815
34	images	Item	19	34	2026-04-01 02:09:34.076622
35	images	Item	20	35	2026-04-01 07:05:56.279385
36	images	Item	21	36	2026-04-01 11:28:53.769347
37	images	Item	22	37	2026-04-01 12:06:06.782287
38	images	Item	23	38	2026-04-01 12:08:19.074648
39	images	Item	24	39	2026-04-02 03:50:02.57416
40	images	Item	25	40	2026-04-02 13:13:59.56475
41	images	Item	26	41	2026-04-07 06:55:10.336228
42	images	Item	27	42	2026-04-07 06:56:54.539662
43	images	Item	28	43	2026-04-07 06:57:28.639238
44	images	Item	29	44	2026-04-08 05:14:14.134801
45	images	Item	30	45	2026-04-11 02:37:23.44056
46	images	Item	30	46	2026-04-11 02:37:23.462956
47	images	Item	31	47	2026-04-11 12:01:17.566945
48	images	Item	31	48	2026-04-11 12:01:17.644175
49	images	Item	32	49	2026-04-13 03:44:03.072635
50	images	Item	32	50	2026-04-13 03:44:03.14365
51	images	Item	33	51	2026-04-13 03:48:33.96005
52	images	Item	34	52	2026-04-16 09:21:32.045663
53	images	Item	34	53	2026-04-16 09:21:32.061982
54	images	Item	35	54	2026-04-16 10:28:04.748208
55	images	Item	36	55	2026-04-16 11:38:31.44963
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
37	rq75okfh768tvr9xhnjs5bszfb9x	IMG_2911.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	3316132	8fITRKRzzXeRkVVe/VTlEg==	2026-04-01 12:06:06.780098
38	53bsb9b3hs994hu9oblgmgzg9fhi	image.jpg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2647441	QfGRRbKbbxNaxZUr3HFQJw==	2026-04-01 12:08:19.071233
24	gyl37p98z5kwyegzvdawygt9989l	IMG_1996.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	3288877	sdGT1a/JpI7hO4JHAUG64A==	2026-03-29 09:54:09.927884
11	zrcherh14q9jfe476clm0xta5wyt	apple-touch-icon.png	image/png	{"identified":true,"width":360,"height":360,"analyzed":true}	cloudinary	149842	8+0A46tMY2gVlnQhufYHSg==	2026-03-26 17:00:08.843501
25	jjg5mza47myvt5cyj5lj413djq7q	IMG_1868.jpeg	image/jpeg	{"identified":true,"width":1108,"height":1477,"analyzed":true}	cloudinary	329105	agDHlREPmcdp59hDavu7Pg==	2026-03-29 09:55:23.631948
39	uw7p2pw0a67gdcxt38yu5kmeqykl	IMG_8484.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2239866	VPMoyDOjad03I2kLmqTbGg==	2026-04-02 03:50:02.570588
26	53u5quv43gda01lwgec9rzidu18w	IMG_1696.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	4537384	GY5I4IazK1GOUrzUQ6pVoA==	2026-03-29 09:56:33.226714
27	j74zvwiawjvmv6ncpibrtwbkgalq	IMG_1524.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2368193	rz9xnTK/MEoCLCensxyY8w==	2026-03-29 09:58:28.830083
28	fdn06xc9sbeo6u18gf7uz69wbi2s	IMG_9260.png	image/png	{"identified":true,"width":1170,"height":2532,"analyzed":true}	cloudinary	286184	wWdMIDpzU4Qk2TdnSYQjmg==	2026-03-31 13:08:56.961475
30	1wkj1f226wl7ek5g318n0s3mx6ya	IMG_9261.png	image/png	{"identified":true,"width":1170,"height":2532,"analyzed":true}	cloudinary	284941	NsQvvxzVfLZS85j5WL2roA==	2026-03-31 13:08:57.160764
29	ppnsfm0n3bacrwip6rpdnaqy56et	IMG_9262.png	image/png	{"identified":true,"width":1170,"height":2532,"analyzed":true}	cloudinary	335285	NLw6OesHwySC0PvWIa7k1Q==	2026-03-31 13:08:57.067701
32	hk2pzbbnurcgja07dx4m5xha87ai	IMG_9901.HEIC	image/heic	{"identified":true,"analyzed":true}	cloudinary	826041	fQqPXArJQyORK2/pzTsAYA==	2026-03-31 15:04:30.363126
31	f3xwkzs5w58szsilmb9nd605p425	IMG_9902.HEIC	image/heic	{"identified":true,"analyzed":true}	cloudinary	1137019	dBpbrN/II1Iq8NJtAHQjNw==	2026-03-31 15:04:30.175302
33	yl4a6mini1jcmu8cgrrsbhl7n4o8	IMG_9900.heic	image/heic	{"identified":true,"analyzed":true}	cloudinary	1614079	pD6JN9S2uVt1WnQJfqo/gg==	2026-03-31 15:04:30.370422
34	4ir77pdm4x2bb9ouxrgfy8e0kof8	1000006715.jpg	image/jpeg	{"identified":true,"width":4624,"height":3472,"analyzed":true}	cloudinary	5754152	2sSZWn8NVrfWBUSISRKetg==	2026-04-01 02:09:34.071187
35	iqjfx9p3yc9uvgb51yxgvc1yf016	Gemini_Generated_Image_iqnm6ciqnm6ciqnm.png	image/png	{"identified":true,"width":1024,"height":1024,"analyzed":true}	cloudinary	2119194	00kIye1mlOTg6VhA82x1Lw==	2026-04-01 07:05:56.277821
36	ywb3d5k4id5d7opqwgrb5jsr34jq	20250306_043850.jpg	image/jpeg	{"identified":true,"width":2048,"height":945,"analyzed":true}	cloudinary	413848	/bP/7OA1+DMsTSR5eeH1uA==	2026-04-01 11:28:53.766124
40	lhdamqojmi6w7srysgp15yavbotr	IMG_9916.jpeg	image/jpeg	{"identified":true,"width":819,"height":1024,"analyzed":true}	cloudinary	197268	jmX4xDtz5tSQSbQ4eISQIw==	2026-04-02 13:13:59.563216
41	4jexze9qxedgbpu7i5jz0ejhx4ei	IMG_1269.HEIC	image/heic	{"identified":true,"analyzed":true}	cloudinary	4399994	CcxrDRAhMIcLhBg6VbwXGg==	2026-04-07 06:55:10.255228
42	fnnml3as6u3ahqksngmoe4q45jig	savedata-howto.gif	image/gif	{"identified":true,"width":1143,"height":1074,"analyzed":true}	cloudinary	3133078	kO4wUTdHzjwaPhPCypnNkg==	2026-04-07 06:56:54.537833
43	px2o3rrub07e4l3d2ta2gnamwu5i	IMG_2808 2.HEIC	image/heic	{"identified":true,"analyzed":true}	cloudinary	2346081	7XejMfEAhsi0HLyoHqw1Mw==	2026-04-07 06:57:28.633569
44	e0l06q66judzhypr84doc40gxg8j	スクリーンショット 2025-12-18 23.28.57.png	image/png	{"identified":true,"width":1232,"height":1608,"analyzed":true}	cloudinary	3160744	UpZsPnxV4prAaI6RDAgwUA==	2026-04-08 05:14:14.130921
45	4fl40t6263c88sjiukfdtmdhau94	IMG_2196.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2353357	ofN+0BPJ+GKn5YslgOxHuQ==	2026-04-11 02:37:23.381989
46	7mywohg8dcqwnur44aek5z3txj5r	IMG_2197.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2655894	zxu2OBjE0jDbS9+gqGlD9A==	2026-04-11 02:37:23.447307
47	bg9l5ntpfbz52uwuwo943iunzkvi	image.jpg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2283196	D07K+h4CGlEajZwg7PbBKg==	2026-04-11 12:01:17.493666
48	it7l5wgpeyj4i7b0er2gp4w4n9bj	image.jpg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2732377	XnHOVa9Vh1s/AhMEe7nb6g==	2026-04-11 12:01:17.64078
50	tz1r030pvyfizvc6b2e1vv0vs587	IMG_0499.heic	image/heic	{"identified":true,"analyzed":true}	cloudinary	2411223	dACClQRKMhz24EnU019okg==	2026-04-13 03:44:03.140863
49	rymnsh76hwm2eai932advwligf0e	IMG_0500.heic	image/heic	{"identified":true,"analyzed":true}	cloudinary	2614630	Qeal9FzILQfzr0jtraP76g==	2026-04-13 03:44:03.07036
51	exfg1dghlyqfo4ymttjnx2e4wps1	IMG_4786.heic	image/heic	{"identified":true}	cloudinary	3377127	5ahocfmpdoQVmBb/74SWnA==	2026-04-13 03:48:33.95713
52	o3544gjxun28eklsc6ljlvzxbe21	IMG_2220.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	2518024	kDl4rjNCpUDeB2L0lSS+pg==	2026-04-16 09:21:31.969674
53	f1hxxn1cskxyxept7wqj9ensj5fb	IMG_2221.jpeg	image/jpeg	{"identified":true,"width":3024,"height":4032,"analyzed":true}	cloudinary	3081194	ITzmVuvy4MB58B+5Xs5Ofg==	2026-04-16 09:21:32.057787
54	tdltexyn94libm717omocim3qup7	9391.jpg	image/jpeg	{"identified":true,"width":3072,"height":4096,"analyzed":true}	cloudinary	2062348	Ptjs0TC0Jwq+ZYoY+Uz71Q==	2026-04-16 10:28:04.734216
55	q73kwxlzsatr8uc0unytwc1x6xes	IMG_2315.jpeg	image/jpeg	{"identified":true,"width":2268,"height":4032,"analyzed":true}	cloudinary	1207469	fmwElIjXfse+asLU6iRy5A==	2026-04-16 11:38:31.445063
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2026-03-25 08:02:21.490008	2026-03-25 08:02:21.490011
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, user_id, name, created_at, updated_at, row_order) FROM stdin;
7	2	家電	2026-03-26 13:38:11.788756	2026-03-26 13:38:11.788756	\N
8	2	食品	2026-03-26 13:38:11.882699	2026-03-26 13:38:11.882699	\N
9	2	交通	2026-03-26 13:38:11.88737	2026-03-26 13:38:11.88737	\N
10	2	くすり	2026-03-26 13:38:11.977538	2026-03-26 13:38:11.977538	\N
11	2	日用品	2026-03-26 13:38:11.988413	2026-03-26 13:38:11.988413	\N
12	2	その他	2026-03-26 13:38:11.992402	2026-03-26 13:38:11.992402	\N
13	3	家電	2026-03-26 16:10:38.313197	2026-03-26 16:10:38.313197	\N
14	3	食品	2026-03-26 16:10:38.404541	2026-03-26 16:10:38.404541	\N
15	3	交通	2026-03-26 16:10:38.407886	2026-03-26 16:10:38.407886	\N
16	3	くすり	2026-03-26 16:10:38.410961	2026-03-26 16:10:38.410961	\N
17	3	日用品	2026-03-26 16:10:38.413448	2026-03-26 16:10:38.413448	\N
18	3	その他	2026-03-26 16:10:38.417732	2026-03-26 16:10:38.417732	\N
19	4	家電	2026-03-28 13:40:23.228969	2026-03-28 13:40:23.228969	\N
20	4	食品	2026-03-28 13:40:23.314725	2026-03-28 13:40:23.314725	\N
21	4	交通	2026-03-28 13:40:23.322968	2026-03-28 13:40:23.322968	\N
22	4	くすり	2026-03-28 13:40:23.328362	2026-03-28 13:40:23.328362	\N
23	4	日用品	2026-03-28 13:40:23.414939	2026-03-28 13:40:23.414939	\N
24	4	その他	2026-03-28 13:40:23.420958	2026-03-28 13:40:23.420958	\N
25	5	家電	2026-03-29 01:53:07.572194	2026-03-29 01:53:07.572194	\N
26	5	食品	2026-03-29 01:53:07.585754	2026-03-29 01:53:07.585754	\N
27	5	交通	2026-03-29 01:53:07.59234	2026-03-29 01:53:07.59234	\N
28	5	くすり	2026-03-29 01:53:07.668352	2026-03-29 01:53:07.668352	\N
29	5	日用品	2026-03-29 01:53:07.674733	2026-03-29 01:53:07.674733	\N
30	5	その他	2026-03-29 01:53:07.683947	2026-03-29 01:53:07.683947	\N
31	6	家電	2026-03-29 09:38:21.1221	2026-03-29 09:38:21.1221	\N
32	6	食品	2026-03-29 09:38:21.132577	2026-03-29 09:38:21.132577	\N
33	6	交通	2026-03-29 09:38:21.216083	2026-03-29 09:38:21.216083	\N
34	6	くすり	2026-03-29 09:38:21.220417	2026-03-29 09:38:21.220417	\N
35	6	日用品	2026-03-29 09:38:21.231689	2026-03-29 09:38:21.231689	\N
36	6	その他	2026-03-29 09:38:21.31957	2026-03-29 09:38:21.31957	\N
37	7	家電	2026-03-30 02:37:50.560198	2026-03-30 02:37:50.560198	\N
38	7	食品	2026-03-30 02:37:50.573756	2026-03-30 02:37:50.573756	\N
39	7	交通	2026-03-30 02:37:50.579804	2026-03-30 02:37:50.579804	\N
40	7	くすり	2026-03-30 02:37:50.597848	2026-03-30 02:37:50.597848	\N
41	7	日用品	2026-03-30 02:37:50.617633	2026-03-30 02:37:50.617633	\N
42	7	その他	2026-03-30 02:37:50.629748	2026-03-30 02:37:50.629748	\N
43	8	家電	2026-03-31 03:47:11.458392	2026-03-31 03:47:11.458392	\N
44	8	食品	2026-03-31 03:47:11.559976	2026-03-31 03:47:11.559976	\N
45	8	交通	2026-03-31 03:47:11.65929	2026-03-31 03:47:11.65929	\N
46	8	くすり	2026-03-31 03:47:11.667907	2026-03-31 03:47:11.667907	\N
47	8	日用品	2026-03-31 03:47:11.760109	2026-03-31 03:47:11.760109	\N
48	8	その他	2026-03-31 03:47:11.858875	2026-03-31 03:47:11.858875	\N
49	9	家電	2026-03-31 13:03:57.380126	2026-03-31 13:03:57.380126	\N
50	9	食品	2026-03-31 13:03:57.475427	2026-03-31 13:03:57.475427	\N
51	9	交通	2026-03-31 13:03:57.485344	2026-03-31 13:03:57.485344	\N
52	9	くすり	2026-03-31 13:03:57.490236	2026-03-31 13:03:57.490236	\N
53	9	日用品	2026-03-31 13:03:57.564373	2026-03-31 13:03:57.564373	\N
54	9	その他	2026-03-31 13:03:57.567727	2026-03-31 13:03:57.567727	\N
55	10	家電	2026-03-31 13:07:21.978797	2026-03-31 13:07:21.978797	\N
56	10	食品	2026-03-31 13:07:22.075527	2026-03-31 13:07:22.075527	\N
57	10	交通	2026-03-31 13:07:22.087402	2026-03-31 13:07:22.087402	\N
58	10	くすり	2026-03-31 13:07:22.16453	2026-03-31 13:07:22.16453	\N
59	10	日用品	2026-03-31 13:07:22.172392	2026-03-31 13:07:22.172392	\N
60	10	その他	2026-03-31 13:07:22.182375	2026-03-31 13:07:22.182375	\N
61	11	家電	2026-03-31 14:31:53.568214	2026-03-31 14:31:53.568214	\N
62	11	食品	2026-03-31 14:31:53.572912	2026-03-31 14:31:53.572912	\N
63	11	交通	2026-03-31 14:31:53.577748	2026-03-31 14:31:53.577748	\N
64	11	くすり	2026-03-31 14:31:53.581229	2026-03-31 14:31:53.581229	\N
65	11	日用品	2026-03-31 14:31:53.662708	2026-03-31 14:31:53.662708	\N
66	11	その他	2026-03-31 14:31:53.670406	2026-03-31 14:31:53.670406	\N
67	12	家電	2026-04-01 01:32:29.191772	2026-04-01 01:32:29.191772	\N
68	12	食品	2026-04-01 01:32:29.262567	2026-04-01 01:32:29.262567	\N
69	12	交通	2026-04-01 01:32:29.275828	2026-04-01 01:32:29.275828	\N
70	12	くすり	2026-04-01 01:32:29.28989	2026-04-01 01:32:29.28989	\N
71	12	日用品	2026-04-01 01:32:29.296853	2026-04-01 01:32:29.296853	\N
72	12	その他	2026-04-01 01:32:29.305693	2026-04-01 01:32:29.305693	\N
73	13	家電	2026-04-01 02:07:28.77063	2026-04-01 02:07:28.77063	\N
74	13	食品	2026-04-01 02:07:28.778266	2026-04-01 02:07:28.778266	\N
75	13	交通	2026-04-01 02:07:28.781185	2026-04-01 02:07:28.781185	\N
76	13	くすり	2026-04-01 02:07:28.783821	2026-04-01 02:07:28.783821	\N
77	13	日用品	2026-04-01 02:07:28.86133	2026-04-01 02:07:28.86133	\N
78	13	その他	2026-04-01 02:07:28.866085	2026-04-01 02:07:28.866085	\N
79	14	家電	2026-04-01 11:24:28.768728	2026-04-01 11:24:28.768728	\N
80	14	食品	2026-04-01 11:24:28.776552	2026-04-01 11:24:28.776552	\N
81	14	交通	2026-04-01 11:24:28.784706	2026-04-01 11:24:28.784706	\N
82	14	くすり	2026-04-01 11:24:28.795706	2026-04-01 11:24:28.795706	\N
83	14	日用品	2026-04-01 11:24:28.859611	2026-04-01 11:24:28.859611	\N
84	14	その他	2026-04-01 11:24:28.874713	2026-04-01 11:24:28.874713	\N
87	15	交通	2026-04-01 11:27:19.862265	2026-04-01 11:27:19.862265	\N
88	15	くすり	2026-04-01 11:27:19.865217	2026-04-01 11:27:19.865217	\N
89	15	日用品	2026-04-01 11:27:19.867355	2026-04-01 11:27:19.867355	\N
90	15	その他	2026-04-01 11:27:19.869222	2026-04-01 11:27:19.869222	\N
91	16	家電	2026-04-02 03:48:50.682612	2026-04-02 03:48:50.682612	\N
92	16	食品	2026-04-02 03:48:50.690797	2026-04-02 03:48:50.690797	\N
93	16	交通	2026-04-02 03:48:50.756751	2026-04-02 03:48:50.756751	\N
94	16	くすり	2026-04-02 03:48:50.760732	2026-04-02 03:48:50.760732	\N
95	16	日用品	2026-04-02 03:48:50.76371	2026-04-02 03:48:50.76371	\N
96	16	その他	2026-04-02 03:48:50.852459	2026-04-02 03:48:50.852459	\N
97	17	家電	2026-04-02 13:45:42.054016	2026-04-02 13:45:42.054016	\N
98	17	食品	2026-04-02 13:45:42.058321	2026-04-02 13:45:42.058321	\N
99	17	交通	2026-04-02 13:45:42.061403	2026-04-02 13:45:42.061403	\N
100	17	くすり	2026-04-02 13:45:42.06362	2026-04-02 13:45:42.06362	\N
101	17	日用品	2026-04-02 13:45:42.070548	2026-04-02 13:45:42.070548	\N
102	17	その他	2026-04-02 13:45:42.08036	2026-04-02 13:45:42.08036	\N
103	18	家電	2026-04-02 15:15:55.695438	2026-04-02 15:15:55.695438	\N
104	18	食品	2026-04-02 15:15:55.705448	2026-04-02 15:15:55.705448	\N
105	18	交通	2026-04-02 15:15:55.716378	2026-04-02 15:15:55.716378	\N
106	18	くすり	2026-04-02 15:15:55.754327	2026-04-02 15:15:55.754327	\N
107	18	日用品	2026-04-02 15:15:55.769802	2026-04-02 15:15:55.769802	\N
108	18	その他	2026-04-02 15:15:55.779273	2026-04-02 15:15:55.779273	\N
109	19	家電	2026-04-04 11:33:24.143976	2026-04-04 11:33:24.143976	\N
110	19	食品	2026-04-04 11:33:24.158745	2026-04-04 11:33:24.158745	\N
111	19	交通	2026-04-04 11:33:24.169523	2026-04-04 11:33:24.169523	\N
112	19	くすり	2026-04-04 11:33:24.239815	2026-04-04 11:33:24.239815	\N
113	19	日用品	2026-04-04 11:33:24.252428	2026-04-04 11:33:24.252428	\N
85	15	家電	2026-04-01 11:27:19.771986	2026-04-24 02:11:41.532101	-536870913
86	15	食品	2026-04-01 11:27:19.7782	2026-04-24 02:11:34.579546	1073741824
114	19	その他	2026-04-04 11:33:24.256176	2026-04-04 11:33:24.256176	\N
115	20	家電	2026-04-05 13:39:14.037006	2026-04-05 13:39:14.037006	\N
116	20	食品	2026-04-05 13:39:14.052355	2026-04-05 13:39:14.052355	\N
117	20	交通	2026-04-05 13:39:14.058499	2026-04-05 13:39:14.058499	\N
118	20	くすり	2026-04-05 13:39:14.065576	2026-04-05 13:39:14.065576	\N
119	20	日用品	2026-04-05 13:39:14.159674	2026-04-05 13:39:14.159674	\N
120	20	その他	2026-04-05 13:39:14.188117	2026-04-05 13:39:14.188117	\N
121	21	家電	2026-04-07 06:50:03.685919	2026-04-07 06:50:03.685919	\N
122	21	食品	2026-04-07 06:50:03.695517	2026-04-07 06:50:03.695517	\N
123	21	交通	2026-04-07 06:50:03.704441	2026-04-07 06:50:03.704441	\N
124	21	くすり	2026-04-07 06:50:03.734367	2026-04-07 06:50:03.734367	\N
125	21	日用品	2026-04-07 06:50:03.754612	2026-04-07 06:50:03.754612	\N
126	21	その他	2026-04-07 06:50:03.761245	2026-04-07 06:50:03.761245	\N
127	22	家電	2026-04-13 03:42:58.948319	2026-04-13 03:42:58.948319	\N
128	22	食品	2026-04-13 03:42:58.953761	2026-04-13 03:42:58.953761	\N
129	22	交通	2026-04-13 03:42:59.042082	2026-04-13 03:42:59.042082	\N
130	22	くすり	2026-04-13 03:42:59.048438	2026-04-13 03:42:59.048438	\N
131	22	日用品	2026-04-13 03:42:59.053382	2026-04-13 03:42:59.053382	\N
132	22	その他	2026-04-13 03:42:59.061221	2026-04-13 03:42:59.061221	\N
136	23	食品	2026-04-16 10:27:25.566868	2026-04-16 10:27:25.566868	1073741824
137	23	交通	2026-04-16 10:27:25.646147	2026-04-16 10:27:25.646147	1610612736
138	23	くすり	2026-04-16 10:27:25.747006	2026-04-16 10:27:25.747006	1879048192
139	23	日用品	2026-04-16 10:27:25.85259	2026-04-16 10:27:25.85259	2013265920
140	23	その他	2026-04-16 10:27:25.959231	2026-04-16 10:27:25.959231	2080374784
135	23	家電	2026-04-16 10:27:25.546135	2026-04-16 10:34:47.16606	-536870912
141	23	レシピ	2026-04-16 10:28:30.155324	2026-04-16 10:34:50.033008	-1342177280
134	1	種	2026-04-15 23:50:03.396144	2026-04-16 11:37:28.24519	153391691
5	1	日用品	2026-03-25 13:10:28.929499	2026-04-16 11:37:31.881085	230087536
4	1	くすり	2026-03-25 13:10:28.843485	2026-04-16 11:37:33.238931	191739614
142	24	家電	2026-04-16 11:37:41.36401	2026-04-16 11:37:41.36401	0
143	24	食品	2026-04-16 11:37:41.401065	2026-04-16 11:37:41.401065	1073741824
144	24	交通	2026-04-16 11:37:41.443587	2026-04-16 11:37:41.443587	1610612736
145	24	くすり	2026-04-16 11:37:41.453654	2026-04-16 11:37:41.453654	1879048192
146	24	日用品	2026-04-16 11:37:41.470112	2026-04-16 11:37:41.470112	2013265920
147	24	その他	2026-04-16 11:37:41.538751	2026-04-16 11:37:41.538751	2080374784
2	1	食品	2026-03-25 13:10:28.828393	2026-04-18 03:22:04.449158	172565653
148	25	家電	2026-04-23 09:41:07.918881	2026-04-23 09:41:07.918881	0
149	25	食品	2026-04-23 09:41:08.003388	2026-04-23 09:41:08.003388	1073741824
150	25	交通	2026-04-23 09:41:08.017645	2026-04-23 09:41:08.017645	1610612736
151	25	くすり	2026-04-23 09:41:08.023559	2026-04-23 09:41:08.023559	1879048192
152	25	日用品	2026-04-23 09:41:08.097198	2026-04-23 09:41:08.097198	2013265920
153	25	その他	2026-04-23 09:41:08.113533	2026-04-23 09:41:08.113533	2080374784
154	26	家電	2026-04-23 14:33:13.694616	2026-04-23 14:33:13.694616	0
155	26	食品	2026-04-23 14:33:13.74269	2026-04-23 14:33:13.74269	1073741824
156	26	交通	2026-04-23 14:33:13.75185	2026-04-23 14:33:13.75185	1610612736
157	26	くすり	2026-04-23 14:33:13.765006	2026-04-23 14:33:13.765006	1879048192
158	26	日用品	2026-04-23 14:33:13.794083	2026-04-23 14:33:13.794083	2013265920
159	26	その他	2026-04-23 14:33:13.79889	2026-04-23 14:33:13.79889	2080374784
160	15	Rあ	2026-04-24 02:11:46.633263	2026-04-24 02:12:12.852473	0
161	15	レシピ	2026-04-24 07:00:20.250534	2026-04-24 07:00:20.250534	-1
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.favorites (id, user_id, item_id, created_at, updated_at) FROM stdin;
3	1	34	2026-04-18 01:15:48.504909	2026-04-18 01:15:48.504909
4	1	30	2026-04-18 01:15:49.86576	2026-04-18 01:15:49.86576
5	1	31	2026-04-18 01:15:51.232235	2026-04-18 01:15:51.232235
6	1	29	2026-04-18 01:15:52.883032	2026-04-18 01:15:52.883032
\.


--
-- Data for Name: item_images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_images (id, item_id, image_url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.items (id, user_id, category_id, name, memo, created_at, updated_at) FROM stdin;
31	1	134	クレソン	2026.10	2026-04-11 12:01:17.348371	2026-04-16 00:45:56.689006
14	1	2	10倍がゆの作り方	みやからもらった	2026-03-29 09:55:23.623586	2026-03-29 09:55:27.065425
30	1	134	ブロッコリースプラウト	2026.9まで	2026-04-11 02:37:23.245169	2026-04-16 00:46:28.788391
15	1	5	鍋の使い方	便利鍋の使い方。	2026-03-29 09:56:33.222481	2026-03-29 09:56:38.62205
16	1	5	ベビーつめやすり		2026-03-29 09:58:28.721126	2026-03-29 09:58:35.121589
34	1	134	ベビーリーフ		2026-04-16 09:21:31.844679	2026-04-16 09:21:43.24026
35	23	141	チャイレシピ		2026-04-16 10:28:04.644098	2026-04-16 10:28:47.494653
18	11	4	ロートジープロd	イタチさんの万華鏡写輪眼デザインの目薬。	2026-03-31 15:04:30.068876	2026-03-31 15:04:44.986316
7	3	\N	ねこ		2026-03-26 16:13:56.899869	2026-03-26 17:00:16.046702
36	24	2	パフェ	2026/04/16	2026-04-16 11:38:31.356435	2026-04-16 11:38:35.442369
20	11	2	サプリ	ドラスト	2026-04-01 07:05:56.262053	2026-04-01 07:07:13.600799
19	13	\N	駐車場		2026-04-01 02:09:33.973124	2026-04-01 02:09:39.087985
17	10	\N	カラーコードアイデア		2026-03-31 13:08:56.776653	2026-04-01 07:42:19.409509
21	14	\N	トライブナイン		2026-04-01 11:28:53.750087	2026-04-01 11:28:57.559567
22	15	\N	Rails7	神戸で購入	2026-04-01 12:06:06.772605	2026-04-01 12:06:11.355545
25	11	\N	コードの	みゃー	2026-04-02 13:13:59.492197	2026-04-02 13:14:03.117028
24	16	2	チャーハン	草加市	2026-04-02 03:50:02.56353	2026-04-02 03:50:08.009875
29	1	\N	aoi		2026-04-08 05:14:14.041296	2026-04-08 05:14:28.679347
32	22	\N	テントの取説	テント	2026-04-13 03:44:03.048487	2026-04-13 03:44:41.167628
26	21	\N	テスト	test	2026-04-07 06:55:10.235247	2026-04-07 06:55:18.341006
27	21	2	テスト2	testt2	2026-04-07 06:56:54.443138	2026-04-07 06:56:59.633191
13	1	5	離乳食食器の耐熱温度	東京都のポイントでGET\r\n𝕘𝕖𝕝𝕒𝕥𝕠 𝕡𝕚𝕢𝕦𝕖でかわいい。	2026-03-29 09:54:09.832039	2026-03-29 09:54:16.911675
28	21	4	test3	a	2026-04-07 06:57:28.547048	2026-04-07 07:02:21.984133
23	15	4	7		2026-04-01 12:08:19.066398	2026-04-24 07:00:54.217711
33	22	5	モニターの購入検討商品		2026-04-13 03:48:33.946861	2026-04-13 03:48:33.96227
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20260316072335
20260319155159
20260319155209
20260319155236
20260319155249
20260320155718
20260321042711
20260321143222
20260321144651
20260415140907
20260415145602
20260416062607
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, avatar_url, provider, uid, created_at, updated_at, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at) FROM stdin;
7	はらぺこメガネ	tadona179@sendapp.uk	\N	\N	\N	2026-03-30 02:37:50.519449	2026-03-30 02:37:50.519449	$2a$12$kWkSG2vLgSF8NJyDgLmr6.q2y3pdD0vYWw/kLtZQGYst7DX0Q6Fxm	\N	\N	\N
2	test	test3@test	\N	\N	\N	2026-03-26 13:38:11.778299	2026-03-26 13:38:11.778299	$2a$12$bYh41T/82A1e1bsluzBP8eZAHoHRKWGlCOA32drAuxrFsw9lMeoiG	\N	\N	\N
8	Kaoru	2@gmail.com	\N	\N	\N	2026-03-31 03:47:11.358387	2026-03-31 03:47:11.358387	$2a$12$2CDn6o62CQFSjvN0mTZHgO1w9t8WWhLXmVqvu9R0x.2brDGmTKhca	\N	\N	\N
9	やまさかな	taiyo.yamazaki.35b@gmail.com	\N	\N	\N	2026-03-31 13:03:57.271147	2026-03-31 13:03:57.271147	$2a$12$l.djQnbVZFO0mCIXMctyKu/HSQsBHZ0bZNLUfYkS03ZbMCOS/fVuG	\N	\N	\N
3	パケ太郎	test@test	\N	\N	\N	2026-03-26 16:10:38.210751	2026-03-27 06:07:48.53	$2a$12$tuNA7LzM0.e.vT.iWMT18OimvQ0wadfKpgh8QMu1YyGb6Xlboy9ae	\N	\N	\N
12	machiko	noi6ry@gmail.com	\N	\N	\N	2026-04-01 01:32:29.176399	2026-04-01 01:32:29.176399	$2a$12$E9mEVva4.FDxLm/SkuFr1.dtS1kmH0z1R9.NzLNpPbOJvDbFpS.C.	\N	\N	\N
13	おかりな	lcttt.pc@gmail.com	\N	\N	\N	2026-04-01 02:07:28.579352	2026-04-01 02:07:28.579352	$2a$12$yNRiGkDyPepTjyJUAb1QA..ChrsZTf8fNpQsoPA2jb.7qq9KM1c6W	\N	\N	\N
4	pake子	test2@test	\N	\N	\N	2026-03-28 13:40:23.126983	2026-03-28 13:50:58.75995	$2a$12$QS6nbr1rBd/g9CtIMaOkt.T5mrONlWthkroarY6reFh7ymMATlwRe	\N	\N	\N
10	かぼ	svnndqy@gmail.com	\N	\N	\N	2026-03-31 13:07:21.870462	2026-04-01 07:33:02.609028	$2a$12$cXRC31j9FdeG4IPcvaHMLe/JnqyeuCtDYJXKMD5fznjVQOQc5OcG2	05938d2b6ddfc95f9554584c7466be0b8fd27521208f42cc14a544bea41f61b3	2026-04-01 07:33:02.607977	\N
14	パケ太郎	a@a	\N	\N	\N	2026-04-01 11:24:28.675413	2026-04-01 11:24:28.675413	$2a$12$yJg/ST0naixs12Ez8J4PJusZfNpUHY.ASw84RphfCLk6XAwC3RtKm	\N	\N	\N
15	かずき	ka10fukuda28@icloud.com	\N	\N	\N	2026-04-01 11:27:19.768517	2026-04-01 11:27:19.768517	$2a$12$jVXOr0HI8ZrYqcNOe3zsve8yobNoYUBSGo3rjaIaxaSjJhKK4ea5W	\N	\N	\N
16	ジョージ	emiriahahaha@gmail.com	\N	\N	\N	2026-04-02 03:48:50.673424	2026-04-02 03:48:50.673424	$2a$12$U.XPQt12hPsrM7vsR4qWHuUUxQ3Po8BGrn6bXYz1QlvJVEk/J/emu	\N	\N	\N
5	にしな。	karubona.ra247@gmail.com	\N	\N	\N	2026-03-29 01:53:07.402941	2026-03-29 02:00:52.878857	$2a$12$oczCL/WtikWNzu7eoxLhLe37C1zPu/2WdxhfFhwNsNLA9JuYzK66W	\N	\N	\N
6	くろちゃん	ddki313kr2@gmail.com	\N	\N	\N	2026-03-29 09:38:20.96075	2026-03-29 09:38:20.96075	$2a$12$bphttJ94VPxb5nFzzDXpwuPWUHb5ZOvmHef7jFpNK6j92wUCV7V66	\N	\N	\N
11	Elu	eriloach0339vialattea@gmail.com	\N	\N	\N	2026-03-31 14:31:53.470428	2026-04-02 13:13:24.422998	$2a$12$lzzKoROHj7REXEWmQHPEk.jA35bfgWfzEBBMpxtYO8cAtLyuYySam	\N	\N	2026-04-02 13:13:24.383206
17	まつ	aaa@example.com	\N	\N	\N	2026-04-02 13:45:42.039861	2026-04-02 13:45:42.039861	$2a$12$ICZcTIHSoHMY60bu9y1ikOvTKninXZDoL6mku7Bx..ZSVMORzjpQy	\N	\N	\N
18	ヨシ	yoshi@example.com	\N	\N	\N	2026-04-02 15:15:55.68444	2026-04-02 15:15:55.68444	$2a$12$sNm4aWpPshr41kGkkqSrsOrAwxBM5eeVg0Vh0/MHaDTewBaSf/73O	\N	\N	\N
19	大平尭宜	gohira06@gmail.com	\N	\N	\N	2026-04-04 11:33:23.998883	2026-04-04 11:33:23.998883	$2a$12$M35mmdM6Q232GFVvqIeMd.ESlt7o25Zy1zwgxl.oVUYgv//HHPeTS	\N	\N	\N
20	zaki	hiroshi151506@gmail.com	\N	\N	\N	2026-04-05 13:39:13.967368	2026-04-05 13:39:13.967368	$2a$12$EZ.lQaW6M4nLhsu7PnvM/ukMS98N8t3UOIb3vMaQw.i58iHx9um3y	\N	\N	\N
21	めたっぴ	paperdju2@gmail.com	\N	\N	\N	2026-04-07 06:50:03.676381	2026-04-07 06:54:38.456985	$2a$12$KQLeFVAtutTaOJL5qsZPyOp3W12S5As.thLX/3bovhn7ks/VBAyh.	\N	\N	2026-04-07 06:54:38.455441
22	たんとぽ	sthkm1111@gmail.com	\N	\N	\N	2026-04-13 03:42:58.877126	2026-04-13 03:42:58.877126	$2a$12$pf/DnqZD.s4afHm2zWqxl.Xvd..vIHQ0s/0iwTDabjZvZy48Pw.OC	\N	\N	\N
23	マー	gopherobin@gmail.com	\N	\N	\N	2026-04-16 10:27:25.355154	2026-04-16 10:27:25.355154	$2a$12$DT.Uu7HczqxCdEOC6qPzaumQVTC1KsBWo3NlklHZleJ5hFleM9o.y	\N	\N	\N
24	ae	shirley.an.1962@gmail.com	\N	\N	\N	2026-04-16 11:37:41.257403	2026-04-16 11:37:41.257403	$2a$12$MSmEolvYrJbpCYn1sjftleA5AJUivyeMese3GBUlNLUJnAR968WaC	\N	\N	\N
25	Rio	rio@example.com	\N	\N	\N	2026-04-23 09:41:07.855377	2026-04-23 09:41:07.855377	$2a$12$ccWs4RufwyT8os1LOXXpLec7Dw87DBPGCyfeXMLnCOALhQtaTwxTW	\N	\N	\N
26	Shiro	y8048601@gmail.com	\N	\N	\N	2026-04-23 14:33:13.650178	2026-04-23 14:33:13.650178	$2a$12$8Ix8WlgeFPtShT2dodwXQecHqRvbA3RZ0IE7TNCqqFBl6j4G1qtJS	\N	\N	\N
1	なつのじ	natsunatsu72@gmail.com	\N	\N	\N	2026-03-25 13:10:28.639808	2026-04-23 23:11:41.406584	$2a$12$mOLFoLKRwiSgg2q/I038VuYp6XuVEhzrzUoDxqP.Y0LD4KfbhzpQ.	\N	\N	2026-04-23 23:11:41.406204
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 56, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 56, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 161, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.favorites_id_seq', 6, true);


--
-- Name: item_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_images_id_seq', 1, false);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.items_id_seq', 37, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 26, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: item_images item_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_images
    ADD CONSTRAINT item_images_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_categories_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_user_id ON public.categories USING btree (user_id);


--
-- Name: index_categories_on_user_id_and_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_categories_on_user_id_and_name ON public.categories USING btree (user_id, name);


--
-- Name: index_favorites_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_favorites_on_item_id ON public.favorites USING btree (item_id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_item_images_on_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_item_images_on_item_id ON public.item_images USING btree (item_id);


--
-- Name: index_items_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_category_id ON public.items USING btree (category_id);


--
-- Name: index_items_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_items_on_user_id ON public.items USING btree (user_id);


--
-- Name: index_items_on_user_id_and_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_items_on_user_id_and_name ON public.items USING btree (user_id, name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: item_images fk_rails_18c95d5ce3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_images
    ADD CONSTRAINT fk_rails_18c95d5ce3 FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: favorites fk_rails_30ac764a96; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_30ac764a96 FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- Name: items fk_rails_89fb86dc8b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_89fb86dc8b FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: categories fk_rails_b8e2f7adfc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_rails_b8e2f7adfc FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: favorites fk_rails_d15744e438; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d15744e438 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: items fk_rails_d4b6334db2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT fk_rails_d4b6334db2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict ghRkHg4pigAVd0FCwL0I9DIyAm84Ex6iivHuPA0CPBmNkzIUfyK1euvnCCrn1wS

