--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-11 10:42:01

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
-- TOC entry 217 (class 1259 OID 16570)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16569)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16576)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16575)
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16582)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp without time zone,
    number character varying(255),
    price real NOT NULL,
    status integer,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16581)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16554)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL,
    role character varying(50) NOT NULL
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16553)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.person ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16588)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    date_time_of_created timestamp without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16597)
-- Name: product_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);


ALTER TABLE public.product_cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16596)
-- Name: product_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16587)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3364 (class 0 OID 16570)
-- Dependencies: 217
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'Цветы');
INSERT INTO public.category (id, name) VALUES (2, 'Букеты');
INSERT INTO public.category (id, name) VALUES (3, 'Корзины');


--
-- TOC entry 3366 (class 0 OID 16576)
-- Dependencies: 219
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, file_name, product_id) VALUES (1, '44de87d0-2af5-4fb3-8fb5-bef68d029043.rosesGigants.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (2, '3babeafd-a730-496a-8108-efe19bf5f380.rosesGigants2.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (3, '612eb7b9-f644-46b7-9f5f-d668714c3198.rosesGigants3.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (4, '79881bc6-1d73-4c9a-8e07-10c3bee4e548.rosesGigants4.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (5, 'c261d18c-76ef-4bac-8c42-b54a70a742f6.rosesGigants5.jpg', 1);
INSERT INTO public.image (id, file_name, product_id) VALUES (6, 'c7e674af-e0f3-40cd-830b-e691cee37a7f.RosesPion1.jpeg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (7, '659d8a8f-f8e6-4309-ad29-ad1c653dbe10.RosesPion2.jpeg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (8, '41880c4d-8cec-4520-b3b6-4778730e9d30.RosesPion3.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (9, '39ae503b-dbe0-4e82-ab35-27b7eb786b27.RosesPion4.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (10, 'cf36ca69-1307-4a4f-b84a-65ad2231cd80.RosesPion5.jpg', 3);
INSERT INTO public.image (id, file_name, product_id) VALUES (11, '292774eb-2bfd-4f2c-aa72-8b6d73441425.hriz1.jpeg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (12, '14999796-4bde-4dfc-810d-9753ef17a5b9.hriz2.png', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (13, '7f5af444-72f5-4a38-b48c-39edc5f6b00a.hriz3.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (14, '17b65ef5-49aa-428d-8e15-343c7d63ace9.hriz4.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (15, '2d059ae0-d2c4-4ff9-b6fb-25cfafba3734.hriz5.jpg', 4);
INSERT INTO public.image (id, file_name, product_id) VALUES (16, '9968d88c-4e3b-4b6a-8c54-caa531ac6a66.buketRos1.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (17, 'b9e3f2c8-752f-4a37-8c70-7660a135bee3.buketRos2.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (18, '1d309931-40c6-40aa-a253-6d8a8888fa20.buketRos3.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (19, 'fdc3e46b-ef14-4490-9511-248c491650af.buketRos4.jpg', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (20, '4470f791-a027-4dc6-9d2c-5685c1f01082.buketRos5.png', 5);
INSERT INTO public.image (id, file_name, product_id) VALUES (21, '4a46edc8-61ef-4dfe-9755-eb148fdcc12f.buketOrch1.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (22, 'ab2bc8b3-8d3b-45c1-95bf-7219b2624456.buketOrch2.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (23, 'cb4b587b-a3c1-4dd3-a797-4bd911bb4e66.buketOrch3.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (24, 'cc16baf2-b2cb-454b-8c42-7b3fb8ea61a5.buketOrch4.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (25, '30a1144b-ff97-4c4c-b7ec-5411df4ae3bb.buketOrch5.jpg', 6);
INSERT INTO public.image (id, file_name, product_id) VALUES (26, '5f276726-1ac7-4577-8598-c140c7f96332.buketHr1.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (27, '2215ea89-36ce-4157-9365-c47b7ad0daf8.buketHr2.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (28, '767b2af0-46f9-4c16-9e42-caa107532969.buketHr3.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (29, '4ea0c84e-59ac-4bf4-92ae-0736aaac88d1.buketHr4.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (30, '6b28fdb9-a8c3-4a66-b39f-ab891af3af57.buketHr5.jpg', 7);
INSERT INTO public.image (id, file_name, product_id) VALUES (31, 'e1ced80b-56d5-4a55-9910-8fb1adaa5eca.korzinaGerber1.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (32, 'b1b987f3-981d-44e6-b32e-632b94510563.korzinaGerber2.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (33, 'b5e49124-d8cb-478d-9a0e-044901b14593.korzinaGerber3png.png', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (34, 'ca64a56d-af9e-4248-912e-b88d2cc3edc3.korzinaGerber4.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (35, 'f20a47d6-05cf-45fa-aa17-21ed99fc662c.korzinaGerber5.jpg', 8);
INSERT INTO public.image (id, file_name, product_id) VALUES (36, '15cc70de-84ce-4593-8602-4ea753aa0fdf.korzinaIris1.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (37, '535d1f58-1eee-4cb7-8198-314e26c050ce.korzinaIris2.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (38, '50ea02dd-c7c7-42bd-8dae-90fa3dc6b666.korzinaIris3.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (39, '357789a2-a49b-4599-bade-56e7c2542b4b.korzinaIris4.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (40, 'a1e5e9d8-dabc-4394-9991-eaadbb0182b2.korzinaIris5.jpg', 9);
INSERT INTO public.image (id, file_name, product_id) VALUES (41, 'c1e5c582-8010-464c-bc32-6fbfbc7ba3c8.korzinaRos1.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (42, '24297d13-ac25-404d-843b-36db32952213.korzinaRos2.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (43, '450ee7e8-3755-4de2-a6be-07ce88d19835.korzinaRos3.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (44, '0bd667ed-bd5f-4326-b271-fc9d5582e9ac.korzinaRos4.jpg', 10);
INSERT INTO public.image (id, file_name, product_id) VALUES (45, 'ff710d01-e20d-446c-8f62-4dd276fe39e7.korzinaRos5.jpg', 10);


--
-- TOC entry 3368 (class 0 OID 16582)
-- Dependencies: 221
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (10, 1, '2022-12-11 02:44:31.84616', 'f6cdd77d-a867-4064-8fb0-df51f6c910b4', 6500, 1, 1, 5);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (11, 1, '2022-12-11 02:44:31.879903', 'f6cdd77d-a867-4064-8fb0-df51f6c910b4', 2500, 1, 1, 9);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (12, 1, '2022-12-11 02:44:31.887903', 'f6cdd77d-a867-4064-8fb0-df51f6c910b4', 3500, 1, 1, 8);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (13, 1, '2022-12-11 02:47:08.77521', '5acfb838-781c-455a-8d07-35c47ff9e8c9', 300, 1, 3, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (14, 1, '2022-12-11 02:47:08.805561', '5acfb838-781c-455a-8d07-35c47ff9e8c9', 5000, 1, 3, 6);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (15, 1, '2022-12-11 02:49:08.280454', '4a060671-bd64-4b2a-9cc5-97567c6c3740', 300, 1, 4, 4);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (4, 1, '2022-12-09 20:01:43.018725', '1888103d-7d97-4479-ad0e-9fafcdcc967d', 500, 2, 1, 1);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (5, 1, '2022-12-11 01:48:30.044194', 'd97997ec-bf6c-499b-ac0b-3acd5acb25ba', 450, 2, 1, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (6, 1, '2022-12-11 02:30:00.159696', '9ee2f106-e1f5-49ee-abe5-9c6c6902f1b8', 450, 3, 1, 3);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (7, 1, '2022-12-11 02:30:00.216265', '9ee2f106-e1f5-49ee-abe5-9c6c6902f1b8', 2500, 3, 1, 9);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (8, 1, '2022-12-11 02:30:00.224259', '9ee2f106-e1f5-49ee-abe5-9c6c6902f1b8', 2500, 3, 1, 9);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (9, 1, '2022-12-11 02:30:00.233253', '9ee2f106-e1f5-49ee-abe5-9c6c6902f1b8', 3500, 3, 1, 8);
INSERT INTO public.orders (id, count, date_time, number, price, status, person_id, product_id) VALUES (16, 1, '2022-12-11 03:58:02.293566', 'f6318ff8-d266-48f1-94af-86c86943cecb', 450, 1, 3, 3);


--
-- TOC entry 3362 (class 0 OID 16554)
-- Dependencies: 215
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.person (id, login, password, role) VALUES (2, 'admin', '$2a$10$pv7Jhz3NA2I4Q07gbyVFq.Z7LmIyx8D80kfPOl9ha06D3Yuf9zGYO', 'ROLE_ADMIN');
INSERT INTO public.person (id, login, password, role) VALUES (1, 'anuta', '$2a$10$9TVvQfI7QdvDkOlUnn5YNe0S/0.pYtVUS1ZYerbrI2RVsUhlhwHL6', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (3, 'user1', '$2a$10$iceykvVmXsqcZGe54L9Keub6RjRWDxnthjOFZZ6ytwRGXQpha6r2K', 'ROLE_USER');
INSERT INTO public.person (id, login, password, role) VALUES (4, 'ivan1', '$2a$10$7aluFJ5aMgVDQh2zF2SQZ.1sMzISQ/HWQ4vl/9wJaPecZEv8Odvd6', 'ROLE_USER');


--
-- TOC entry 3370 (class 0 OID 16588)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (1, NULL, 'Наверняка Вы уже не раз читали о розах-гигантах, а может быть, даже видели их воочию. Если так, то согласитесь – это поистине королевский подарок неземной красоты, который не оставит равнодушной ни одну девушку.

В нашем магазине Вы можете заказать потрясающе красивые алые розы 150-170 см для особого случая. 

Давно хотели подарить любимой розы-гиганты? Сейчас – самый подходящий момент! Прежде чем оформить заказ, обратите внимание на некоторые важные детали:

Не каждая девушка хранит дома подходящую вазу для роз 130-150 см. Позаботьтесь о том, чтобы Ваш сюрприз не омрачила никакая мелочь – подыщите подходящую высокую вазу заранее, преподнесите ее в подарок вместе с букетом. Кроме того, мы уверены, что Ваша любимая воспользуется ей еще не раз – Вы обязательно захотите подарить ей такой букет снова!', 500, 'Цветторг', 'Розы "Гигант"', '"Закупки по низким ценам" Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (3, '2022-12-08 14:18:44.378262', 'Выбирая цветы на подарок, многие останавливаются на розах. И правильно, ведь это самый роскошный, благородный, символический и элегантный цветок. Если вам надоели классические розы со скромными бутонами и длинными стеблями, обратите внимание на пионовидные. Этот необычный гибрид покоряет с первого взгляда своей красотой и великолепием!

Что же за цветы такие – пионовидные розы?
Пионовидные розы были созданы селекционером Д. Остином, который вдохновился французскими традиционными розами на выставке и решил разнообразить их расцветку. Чтобы добиться желаемого эффекта, он скрестил галльский гибрид с флорибундой, и получил красивые цветки, похожие на пионы. Именно из-за внешней схожести новая роза стала называться «пионовидной».

Что означают пионовидные розы на языке цветов?
Пионовидные розы считаются символом романтики и верности. Их полные бутоны отображают переполненную чувствами душу. Эти цветы принято дарить в знак симпатии, уважения, любви и привязанности.', 450, 'Цветторг', 'Пионовидные розы', '"Закупки по низким ценам" Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (4, '2022-12-08 18:22:20.047863', 'Хризантемы – универсальные цветы
Эти растения имеют интересную историю, которая исчисляется тремя тысячелетиями. Точное место происхождения цветов так и не установлено. Большинство ученых считают, что они зародились на Востоке. История хризантемы связана с многочисленными легендами. Одна из них говорит о том, как злой дракон попытался похитить у людей солнце. Вцепившись в светило, он очень сильно обжегся и начал в гневе рвать его на части. Солнечные искры, упавшие на землю, превратились в различные виды хризантем.

В Японии этот цветок является не только предвестником осени, но и символом нации. Даже в основе государственного герба лежит изображение шестнадцатилепесткового растения этого вида. Длительное время оно считалось в Японии священным, и только членам императорской семьи разрешалось носить одежду, на которой были изображены композиции из хризантем.', 300, 'Цветторг', 'Хризантема', '"Закупки по низким ценам" Коледино', 1);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (6, '2022-12-08 18:50:19.12877', 'Настолько тонкое сочетание цветов оценит любая девушка. Вы произведете на нее неизгладимое впечатление. Орхидеи - цветы любви, изысканности и чувственности. В данном букете 35 потрясающе-красивых орхидей, цвет любой на выбор', 5000, 'Цветторг', 'Букет орхидей', '"Закупки по низким ценам" Коледино', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (7, '2022-12-08 18:54:14.658443', 'Настолько необычный букет встречается редко. Это сочетание невинности самого цветка хризантема в страстном красном цвете. Это признание в любви и нежности одновременно. В данном букете 55 цветков.', 6000, 'Цветторг', 'Букет красных хризантем', '"Закупки по низким ценам" Коледино', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (5, NULL, 'Подарив такой прекрасный букет, Вы произведете невероятное впечатление! Количество цветов в букете - 31. Длина роз - 110см.', 6500, 'Цветторг', 'Букет белых роз', 'Закупки по низким ценам Коледино', 2);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (9, '2022-12-08 19:01:31.393304', 'Такой представительный букет подойдет в качестве подарка как женщине, так и мужчине. Глубокий ультрамариновый цвет подчеркивает мудрость и приносит спокойствие. В корзине 21 цветок.', 2500, 'Цветторг', 'Корзина синих ирисов', '"Закупки по низким ценам" Коледино', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (8, NULL, 'Этот яркий, солнечный букет поднимет настроение в любую погоду! Количество цветов в корзине-35', 3500, 'Цветторг', 'Корзина гербер', '"Закупки по низким ценам" Коледино', 3);
INSERT INTO public.product (id, date_time_of_created, description, price, seller, title, warehouse, category_id) VALUES (10, '2022-12-08 19:05:06.620347', 'Такой невероятно-красивый букет никого не оставит равнодушным. 35 потрясающих роз в корзине.', 7000, 'Цветторг', 'Корзина красных роз', '"Закупки по низким ценам" Коледино', 3);


--
-- TOC entry 3372 (class 0 OID 16597)
-- Dependencies: 225
-- Data for Name: product_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 3, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 218
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_id_seq', 45, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 220
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 16, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 214
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_id_seq', 4, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 224
-- Name: product_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_cart_id_seq', 16, true);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 10, true);


--
-- TOC entry 3202 (class 2606 OID 16574)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16580)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16586)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 16560)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16601)
-- Name: product_cart product_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 16595)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16603)
-- Name: product uk_qka6vxqdy1dprtqnx9trdd47c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);


--
-- TOC entry 3214 (class 2606 OID 16609)
-- Name: orders fk1b0m4muwx1t377w9if3w6wwqn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3216 (class 2606 OID 16619)
-- Name: product fk1mtsbur82frn64de7balymq9s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3215 (class 2606 OID 16614)
-- Name: orders fk787ibr3guwp6xobrpbofnv7le; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3213 (class 2606 OID 16604)
-- Name: image fkgpextbyee3uk9u6o2381m7ft1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3217 (class 2606 OID 16629)
-- Name: product_cart fkhpnrxdy3jhujameyod08ilvvw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- TOC entry 3218 (class 2606 OID 16624)
-- Name: product_cart fksgnkc1ko2i1o9yr2p63ysq3rn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);


-- Completed on 2022-12-11 10:42:02

--
-- PostgreSQL database dump complete
--

