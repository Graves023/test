--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: course_orders_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.course_orders_status_enum AS ENUM (
    'new',
    'process',
    'contactLater',
    'waitingForPayment',
    'prepaid',
    'lastPayment',
    'success',
    'failed',
    'canceled'
);


ALTER TYPE public.course_orders_status_enum OWNER TO postgres;

--
-- Name: courses_category_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.courses_category_enum AS ENUM (
    'individual',
    'collective',
    'online'
);


ALTER TYPE public.courses_category_enum OWNER TO postgres;

--
-- Name: courses_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.courses_type_enum AS ENUM (
    'categoryB',
    'catamaranB'
);


ALTER TYPE public.courses_type_enum OWNER TO postgres;

--
-- Name: crews_gender_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.crews_gender_enum AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.crews_gender_enum OWNER TO postgres;

--
-- Name: files_related_related_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.files_related_related_type_enum AS ENUM (
    'client:document.passport',
    'client:document.skipper'
);


ALTER TYPE public.files_related_related_type_enum OWNER TO postgres;

--
-- Name: manager_commissions_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.manager_commissions_status_enum AS ENUM (
    'new',
    'process',
    'error',
    'updated',
    'paying',
    'closed',
    'canceled'
);


ALTER TYPE public.manager_commissions_status_enum OWNER TO postgres;

--
-- Name: order_notifications_group_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_notifications_group_enum AS ENUM (
    'payment',
    'self',
    'client',
    'captain'
);


ALTER TYPE public.order_notifications_group_enum OWNER TO postgres;

--
-- Name: order_notifications_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_notifications_type_enum AS ENUM (
    'warning',
    'notification',
    'error',
    'success',
    'info',
    'critical'
);


ALTER TYPE public.order_notifications_type_enum OWNER TO postgres;

--
-- Name: order_services_condition_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_services_condition_enum AS ENUM (
    'onBoard',
    'onBooking'
);


ALTER TYPE public.order_services_condition_enum OWNER TO postgres;

--
-- Name: order_services_currency_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_services_currency_enum AS ENUM (
    'eur',
    'usd',
    'local'
);


ALTER TYPE public.order_services_currency_enum OWNER TO postgres;

--
-- Name: order_services_method_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_services_method_enum AS ENUM (
    'bank',
    'cash',
    'cards',
    'paypal'
);


ALTER TYPE public.order_services_method_enum OWNER TO postgres;

--
-- Name: orders_api_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.orders_api_type_enum AS ENUM (
    'nausys',
    'bookingManager',
    'own'
);


ALTER TYPE public.orders_api_type_enum OWNER TO postgres;

--
-- Name: orders_personal_discount_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.orders_personal_discount_type_enum AS ENUM (
    'addValue',
    'subValue',
    'addPercent',
    'subPercent'
);


ALTER TYPE public.orders_personal_discount_type_enum OWNER TO postgres;

--
-- Name: orders_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.orders_status_enum AS ENUM (
    'new',
    'process',
    'contactLater',
    'waitingForPayment',
    'prepaid',
    'lastPayment',
    'success',
    'failed',
    'canceled'
);


ALTER TYPE public.orders_status_enum OWNER TO postgres;

--
-- Name: payments_method_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payments_method_enum AS ENUM (
    'bank',
    'cash',
    'cards',
    'paypal'
);


ALTER TYPE public.payments_method_enum OWNER TO postgres;

--
-- Name: payments_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payments_type_enum AS ENUM (
    'incoming',
    'outgoing'
);


ALTER TYPE public.payments_type_enum OWNER TO postgres;

--
-- Name: users_gender_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.users_gender_enum AS ENUM (
    'male',
    'female'
);


ALTER TYPE public.users_gender_enum OWNER TO postgres;

--
-- Name: users_language_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.users_language_enum AS ENUM (
    'ru',
    'cz',
    'hr',
    'en',
    'ua',
    'de'
);


ALTER TYPE public.users_language_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    company_bank_name character varying NOT NULL,
    footer_first_line character varying NOT NULL,
    footer_second_line character varying NOT NULL,
    contract_head character varying NOT NULL,
    "position" character varying NOT NULL,
    position_name character varying NOT NULL,
    position_p character varying NOT NULL,
    position_name_p character varying NOT NULL,
    company_info character varying NOT NULL,
    company_bank_info character varying NOT NULL,
    locale character varying NOT NULL
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: contact_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_forms (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL,
    subject character varying NOT NULL,
    message character varying NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE public.contact_forms OWNER TO postgres;

--
-- Name: contact_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_forms_id_seq OWNER TO postgres;

--
-- Name: contact_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_forms_id_seq OWNED BY public.contact_forms.id;


--
-- Name: course_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_orders (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    manager_id integer DEFAULT 2 NOT NULL,
    skipper_id integer DEFAULT 2 NOT NULL,
    company_id integer DEFAULT 4 NOT NULL,
    user_id integer DEFAULT 1 NOT NULL,
    course_id integer NOT NULL,
    course_plan character varying DEFAULT 'standard'::character varying NOT NULL,
    status public.course_orders_status_enum DEFAULT 'new'::public.course_orders_status_enum NOT NULL,
    start_date timestamp without time zone,
    course_closed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.course_orders OWNER TO postgres;

--
-- Name: course_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_orders_id_seq OWNER TO postgres;

--
-- Name: course_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_orders_id_seq OWNED BY public.course_orders.id;


--
-- Name: course_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_plans (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    plan character varying NOT NULL,
    price double precision NOT NULL,
    sale_price double precision NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.course_plans OWNER TO postgres;

--
-- Name: course_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_plans_id_seq OWNER TO postgres;

--
-- Name: course_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_plans_id_seq OWNED BY public.course_plans.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    start_date timestamp without time zone NOT NULL,
    price double precision NOT NULL,
    sale_price double precision NOT NULL,
    type public.courses_type_enum DEFAULT 'categoryB'::public.courses_type_enum NOT NULL,
    days integer DEFAULT 5 NOT NULL,
    people integer DEFAULT 5 NOT NULL,
    closed boolean DEFAULT false NOT NULL,
    category public.courses_category_enum DEFAULT 'collective'::public.courses_category_enum NOT NULL,
    order_id integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: crews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.crews (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying DEFAULT 'no data'::character varying NOT NULL,
    surname character varying DEFAULT 'no data'::character varying NOT NULL,
    email character varying DEFAULT 'no data'::character varying NOT NULL,
    phone character varying DEFAULT 'no data'::character varying NOT NULL,
    gender public.crews_gender_enum DEFAULT 'male'::public.crews_gender_enum NOT NULL,
    birth_place character varying,
    birth_country character varying,
    birth_date timestamp without time zone,
    living_country character varying,
    living_place character varying,
    citizenship character varying,
    comment character varying,
    skipper boolean DEFAULT false NOT NULL,
    passport_number character varying,
    skipper_license character varying
);


ALTER TABLE public.crews OWNER TO postgres;

--
-- Name: crews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.crews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crews_id_seq OWNER TO postgres;

--
-- Name: crews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.crews_id_seq OWNED BY public.crews.id;


--
-- Name: discount_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_countries (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    discount integer NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_to timestamp without time zone NOT NULL,
    comment character varying NOT NULL,
    country_name character varying NOT NULL
);


ALTER TABLE public.discount_countries OWNER TO postgres;

--
-- Name: discount_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_countries_id_seq OWNER TO postgres;

--
-- Name: discount_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_countries_id_seq OWNED BY public.discount_countries.id;


--
-- Name: discount_yachts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_yachts (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    api_type character varying NOT NULL,
    yacht_sid character varying NOT NULL,
    new_price integer NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_to timestamp without time zone NOT NULL,
    comment character varying NOT NULL
);


ALTER TABLE public.discount_yachts OWNER TO postgres;

--
-- Name: discount_yachts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_yachts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_yachts_id_seq OWNER TO postgres;

--
-- Name: discount_yachts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_yachts_id_seq OWNED BY public.discount_yachts.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    hash character varying NOT NULL,
    ext character varying NOT NULL,
    size integer NOT NULL,
    mimetype character varying NOT NULL,
    original_name character varying NOT NULL,
    path character varying NOT NULL,
    destination character varying NOT NULL,
    file_name character varying NOT NULL
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related (
    file_id integer NOT NULL,
    related_id integer NOT NULL,
    field character varying NOT NULL,
    related_type public.files_related_related_type_enum NOT NULL
);


ALTER TABLE public.files_related OWNER TO postgres;

--
-- Name: manager_commissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager_commissions (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    text character varying,
    status public.manager_commissions_status_enum DEFAULT 'new'::public.manager_commissions_status_enum NOT NULL,
    summary double precision NOT NULL,
    comment character varying,
    order_id integer,
    manager_id integer
);


ALTER TABLE public.manager_commissions OWNER TO postgres;

--
-- Name: manager_commissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.manager_commissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manager_commissions_id_seq OWNER TO postgres;

--
-- Name: manager_commissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.manager_commissions_id_seq OWNED BY public.manager_commissions.id;


--
-- Name: managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.managers (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    phone character varying NOT NULL,
    email character varying NOT NULL,
    working_hours character varying DEFAULT '09.00-17.00'::character varying NOT NULL,
    top_manager boolean DEFAULT false NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    owner boolean DEFAULT false NOT NULL,
    password character varying DEFAULT '123456'::character varying NOT NULL,
    regional_manager boolean DEFAULT false NOT NULL,
    regions jsonb NOT NULL
);


ALTER TABLE public.managers OWNER TO postgres;

--
-- Name: managers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.managers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.managers_id_seq OWNER TO postgres;

--
-- Name: managers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.managers_id_seq OWNED BY public.managers.id;


--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    api_type character varying NOT NULL,
    option_id character varying NOT NULL,
    yacht_id integer NOT NULL,
    yacht_sid character varying NOT NULL,
    date_from timestamp without time zone NOT NULL,
    date_to timestamp without time zone NOT NULL,
    price double precision NOT NULL,
    start_price double precision NOT NULL,
    base_price double precision NOT NULL,
    commissions double precision NOT NULL,
    commission_remainder double precision NOT NULL,
    expiration_date timestamp without time zone NOT NULL,
    competitor_expiration_date timestamp without time zone NOT NULL,
    manager_id integer DEFAULT 1 NOT NULL,
    order_id integer
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_id_seq OWNER TO postgres;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- Name: order_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_notifications (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    "group" public.order_notifications_group_enum DEFAULT 'self'::public.order_notifications_group_enum NOT NULL,
    type public.order_notifications_type_enum DEFAULT 'info'::public.order_notifications_type_enum NOT NULL,
    text character varying NOT NULL,
    order_id integer NOT NULL,
    manager_id integer
);


ALTER TABLE public.order_notifications OWNER TO postgres;

--
-- Name: order_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_notifications_id_seq OWNER TO postgres;

--
-- Name: order_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_notifications_id_seq OWNED BY public.order_notifications.id;


--
-- Name: order_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_services (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL,
    measure character varying,
    description character varying,
    condition public.order_services_condition_enum DEFAULT 'onBoard'::public.order_services_condition_enum NOT NULL,
    order_id integer NOT NULL,
    currency public.order_services_currency_enum[] DEFAULT '{eur}'::public.order_services_currency_enum[] NOT NULL,
    method public.order_services_method_enum[] DEFAULT '{bank}'::public.order_services_method_enum[] NOT NULL
);


ALTER TABLE public.order_services OWNER TO postgres;

--
-- Name: order_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_services_id_seq OWNER TO postgres;

--
-- Name: order_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_services_id_seq OWNED BY public.order_services.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    api_type public.orders_api_type_enum DEFAULT 'bookingManager'::public.orders_api_type_enum NOT NULL,
    order_number integer NOT NULL,
    status public.orders_status_enum DEFAULT 'new'::public.orders_status_enum NOT NULL,
    start_base_id character varying,
    date_from timestamp without time zone NOT NULL,
    date_to timestamp without time zone NOT NULL,
    price double precision NOT NULL,
    start_price double precision NOT NULL,
    discount_percentage double precision NOT NULL,
    personal_discount_active boolean DEFAULT false NOT NULL,
    personal_discount double precision,
    personal_discount_type public.orders_personal_discount_type_enum,
    personal_discount_comment character varying,
    crew_list_block boolean DEFAULT false NOT NULL,
    order_closed boolean DEFAULT false NOT NULL,
    yacht_id character varying NOT NULL,
    reservation_id character varying,
    profit_booking_confirmation character varying,
    profit_extra double precision,
    correction_comment character varying,
    correction_value double precision,
    manager_extra_comment character varying,
    manager_extra_value double precision,
    profit_extra_date timestamp without time zone,
    charter_price double precision,
    discard_discounts boolean DEFAULT false NOT NULL,
    manager_id integer DEFAULT 1 NOT NULL,
    skipper_id integer,
    company_id integer DEFAULT 1 NOT NULL,
    user_id integer,
    course_id integer,
    payer_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_cadets_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_cadets_users (
    users_id integer NOT NULL,
    orders_id integer NOT NULL
);


ALTER TABLE public.orders_cadets_users OWNER TO postgres;

--
-- Name: orders_crews_crews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_crews_crews (
    orders_id integer NOT NULL,
    crews_id integer NOT NULL
);


ALTER TABLE public.orders_crews_crews OWNER TO postgres;

--
-- Name: orders_guests_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_guests_users (
    users_id integer NOT NULL,
    orders_id integer NOT NULL
);


ALTER TABLE public.orders_guests_users OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_order_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_number_seq OWNER TO postgres;

--
-- Name: orders_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;


--
-- Name: payers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payers (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    legal boolean,
    name character varying,
    surname character varying,
    phone character varying,
    email character varying,
    company_name character varying,
    "position" character varying,
    bank_account character varying,
    vat_code character varying,
    country character varying,
    city character varying,
    address character varying,
    cin character varying,
    document character varying,
    attorney boolean DEFAULT false NOT NULL,
    user_id integer
);


ALTER TABLE public.payers OWNER TO postgres;

--
-- Name: payers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payers_id_seq OWNER TO postgres;

--
-- Name: payers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payers_id_seq OWNED BY public.payers.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    type public.payments_type_enum DEFAULT 'incoming'::public.payments_type_enum NOT NULL,
    method public.payments_method_enum DEFAULT 'bank'::public.payments_method_enum NOT NULL,
    value double precision NOT NULL,
    date timestamp without time zone NOT NULL,
    title character varying,
    manager_comment character varying,
    client_comment character varying,
    order_id integer,
    course_order_id integer
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: proposals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proposals (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    title character varying DEFAULT 'no data'::character varying NOT NULL,
    description character varying DEFAULT 'no data'::character varying NOT NULL,
    offers jsonb NOT NULL,
    manager_id integer NOT NULL
);


ALTER TABLE public.proposals OWNER TO postgres;

--
-- Name: proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proposals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proposals_id_seq OWNER TO postgres;

--
-- Name: proposals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proposals_id_seq OWNED BY public.proposals.id;


--
-- Name: skippers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skippers (
    id integer NOT NULL,
    object_id character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying DEFAULT 'no name'::character varying NOT NULL,
    email character varying DEFAULT 'no email'::character varying NOT NULL,
    phone character varying DEFAULT 'no phone'::character varying NOT NULL,
    carrier character varying DEFAULT 'no carrier'::character varying NOT NULL,
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    fb character varying
);


ALTER TABLE public.skippers OWNER TO postgres;

--
-- Name: skippers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skippers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skippers_id_seq OWNER TO postgres;

--
-- Name: skippers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skippers_id_seq OWNED BY public.skippers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    object_id character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    username character varying NOT NULL,
    email character varying NOT NULL,
    confirmed boolean DEFAULT false NOT NULL,
    blocked boolean DEFAULT false NOT NULL,
    phone character varying NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    gender public.users_gender_enum DEFAULT 'male'::public.users_gender_enum NOT NULL,
    birth_place character varying,
    birth_date timestamp without time zone,
    birth_country character varying,
    citizenship character varying,
    living_country character varying,
    living_place character varying,
    passport_number character varying,
    comment character varying,
    skipper boolean DEFAULT false NOT NULL,
    skipper_license character varying,
    language public.users_language_enum DEFAULT 'en'::public.users_language_enum NOT NULL,
    manager_id integer DEFAULT 1 NOT NULL,
    manager_account_id integer,
    skipper_account_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: contact_forms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_forms ALTER COLUMN id SET DEFAULT nextval('public.contact_forms_id_seq'::regclass);


--
-- Name: course_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_orders ALTER COLUMN id SET DEFAULT nextval('public.course_orders_id_seq'::regclass);


--
-- Name: course_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_plans ALTER COLUMN id SET DEFAULT nextval('public.course_plans_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: crews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews ALTER COLUMN id SET DEFAULT nextval('public.crews_id_seq'::regclass);


--
-- Name: discount_countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_countries ALTER COLUMN id SET DEFAULT nextval('public.discount_countries_id_seq'::regclass);


--
-- Name: discount_yachts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_yachts ALTER COLUMN id SET DEFAULT nextval('public.discount_yachts_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: manager_commissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager_commissions ALTER COLUMN id SET DEFAULT nextval('public.manager_commissions_id_seq'::regclass);


--
-- Name: managers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers ALTER COLUMN id SET DEFAULT nextval('public.managers_id_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- Name: order_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_notifications ALTER COLUMN id SET DEFAULT nextval('public.order_notifications_id_seq'::regclass);


--
-- Name: order_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_services ALTER COLUMN id SET DEFAULT nextval('public.order_services_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders order_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);


--
-- Name: payers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payers ALTER COLUMN id SET DEFAULT nextval('public.payers_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: proposals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposals ALTER COLUMN id SET DEFAULT nextval('public.proposals_id_seq'::regclass);


--
-- Name: skippers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skippers ALTER COLUMN id SET DEFAULT nextval('public.skippers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: contact_forms PK_0c2efff892d436c32af4dd5ac0f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_forms
    ADD CONSTRAINT "PK_0c2efff892d436c32af4dd5ac0f" PRIMARY KEY (id);


--
-- Name: files_related PK_1065f048a48e00632cb7f5ca7b9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related
    ADD CONSTRAINT "PK_1065f048a48e00632cb7f5ca7b9" PRIMARY KEY (file_id);


--
-- Name: discount_countries PK_125c656a6797042d86b0fe3972b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_countries
    ADD CONSTRAINT "PK_125c656a6797042d86b0fe3972b" PRIMARY KEY (id);


--
-- Name: payments PK_197ab7af18c93fbb0c9b28b4a59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT "PK_197ab7af18c93fbb0c9b28b4a59" PRIMARY KEY (id);


--
-- Name: course_orders PK_2ad71a3fd0bab5e7b82cd76c690; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_orders
    ADD CONSTRAINT "PK_2ad71a3fd0bab5e7b82cd76c690" PRIMARY KEY (id);


--
-- Name: manager_commissions PK_3512b4137cfe85264502b729cf7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager_commissions
    ADD CONSTRAINT "PK_3512b4137cfe85264502b729cf7" PRIMARY KEY (id);


--
-- Name: courses PK_3f70a487cc718ad8eda4e6d58c9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "PK_3f70a487cc718ad8eda4e6d58c9" PRIMARY KEY (id);


--
-- Name: crews PK_4316f43ffc0d2bbb0c4c767ba5c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.crews
    ADD CONSTRAINT "PK_4316f43ffc0d2bbb0c4c767ba5c" PRIMARY KEY (id);


--
-- Name: orders_crews_crews PK_636d809700a13d163a9d230cd99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_crews_crews
    ADD CONSTRAINT "PK_636d809700a13d163a9d230cd99" PRIMARY KEY (orders_id, crews_id);


--
-- Name: files PK_6c16b9093a142e0e7613b04a3d9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT "PK_6c16b9093a142e0e7613b04a3d9" PRIMARY KEY (id);


--
-- Name: orders PK_710e2d4957aa5878dfe94e4ac2f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "PK_710e2d4957aa5878dfe94e4ac2f" PRIMARY KEY (id);


--
-- Name: order_services PK_74f048f792fe40516ac248ce060; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_services
    ADD CONSTRAINT "PK_74f048f792fe40516ac248ce060" PRIMARY KEY (id);


--
-- Name: order_notifications PK_85e9427cbcf1634c68846e12ec7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_notifications
    ADD CONSTRAINT "PK_85e9427cbcf1634c68846e12ec7" PRIMARY KEY (id);


--
-- Name: orders_cadets_users PK_93a97291f84f0cee459258776d6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_cadets_users
    ADD CONSTRAINT "PK_93a97291f84f0cee459258776d6" PRIMARY KEY (users_id, orders_id);


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: discount_yachts PK_c202ce2435a9b4efa3d7f8151ba; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_yachts
    ADD CONSTRAINT "PK_c202ce2435a9b4efa3d7f8151ba" PRIMARY KEY (id);


--
-- Name: orders_guests_users PK_ced721a794b71b0b4f7b614e0d8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_guests_users
    ADD CONSTRAINT "PK_ced721a794b71b0b4f7b614e0d8" PRIMARY KEY (users_id, orders_id);


--
-- Name: options PK_d232045bdb5c14d932fba18d957; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT "PK_d232045bdb5c14d932fba18d957" PRIMARY KEY (id);


--
-- Name: companies PK_d4bc3e82a314fa9e29f652c2c22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT "PK_d4bc3e82a314fa9e29f652c2c22" PRIMARY KEY (id);


--
-- Name: skippers PK_d9e70420c459bd77fce6af28526; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skippers
    ADD CONSTRAINT "PK_d9e70420c459bd77fce6af28526" PRIMARY KEY (id);


--
-- Name: proposals PK_db524c8db8e126a38a2f16d8cac; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT "PK_db524c8db8e126a38a2f16d8cac" PRIMARY KEY (id);


--
-- Name: managers PK_e70b8cc457276d9b4d82342a8ff; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT "PK_e70b8cc457276d9b4d82342a8ff" PRIMARY KEY (id);


--
-- Name: course_plans PK_f56d71bb8a12de915ead316a305; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_plans
    ADD CONSTRAINT "PK_f56d71bb8a12de915ead316a305" PRIMARY KEY (id);


--
-- Name: payers PK_fba4083480bbf3cbcfa96de5073; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payers
    ADD CONSTRAINT "PK_fba4083480bbf3cbcfa96de5073" PRIMARY KEY (id);


--
-- Name: users REL_319f0e7ba3cc389c942eaf2eee; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "REL_319f0e7ba3cc389c942eaf2eee" UNIQUE (manager_account_id);


--
-- Name: users REL_7539adcf71a8644a38e6ac3529; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "REL_7539adcf71a8644a38e6ac3529" UNIQUE (skipper_account_id);


--
-- Name: orders REL_8f64e2f0728bad0f6c6aa6413b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "REL_8f64e2f0728bad0f6c6aa6413b" UNIQUE (course_id);


--
-- Name: files_related UQ_1065f048a48e00632cb7f5ca7b9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related
    ADD CONSTRAINT "UQ_1065f048a48e00632cb7f5ca7b9" UNIQUE (file_id);


--
-- Name: courses UQ_4dab71328bf0f1e81263edbcf77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "UQ_4dab71328bf0f1e81263edbcf77" UNIQUE (order_id);


--
-- Name: IDX_00fc3d6adda55d2b3d536e4a20; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_00fc3d6adda55d2b3d536e4a20" ON public.orders_crews_crews USING btree (crews_id);


--
-- Name: IDX_148a202ae61f2e25bc1879d522; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_148a202ae61f2e25bc1879d522" ON public.orders_crews_crews USING btree (orders_id);


--
-- Name: IDX_14e2dc4d753d19a89245a098eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_14e2dc4d753d19a89245a098eb" ON public.orders_cadets_users USING btree (users_id);


--
-- Name: IDX_7c79627301c85b512be0fe8dff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_7c79627301c85b512be0fe8dff" ON public.orders_guests_users USING btree (users_id);


--
-- Name: IDX_8acf573039dbc57bf531e6c82b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_8acf573039dbc57bf531e6c82b" ON public.orders_guests_users USING btree (orders_id);


--
-- Name: IDX_c1d7c759bc3bde0c36295f07c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_c1d7c759bc3bde0c36295f07c0" ON public.orders_cadets_users USING btree (orders_id);


--
-- Name: orders_crews_crews FK_00fc3d6adda55d2b3d536e4a203; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_crews_crews
    ADD CONSTRAINT "FK_00fc3d6adda55d2b3d536e4a203" FOREIGN KEY (crews_id) REFERENCES public.crews(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders FK_0235d34eaba78694dbd2f94bc80; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_0235d34eaba78694dbd2f94bc80" FOREIGN KEY (skipper_id) REFERENCES public.skippers(id);


--
-- Name: files_related FK_1065f048a48e00632cb7f5ca7b9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related
    ADD CONSTRAINT "FK_1065f048a48e00632cb7f5ca7b9" FOREIGN KEY (file_id) REFERENCES public.files(id);


--
-- Name: orders_crews_crews FK_148a202ae61f2e25bc1879d522d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_crews_crews
    ADD CONSTRAINT "FK_148a202ae61f2e25bc1879d522d" FOREIGN KEY (orders_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders_cadets_users FK_14e2dc4d753d19a89245a098eb7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_cadets_users
    ADD CONSTRAINT "FK_14e2dc4d753d19a89245a098eb7" FOREIGN KEY (users_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: proposals FK_15a3268327a823a4b20ea1c7810; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT "FK_15a3268327a823a4b20ea1c7810" FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: order_services FK_27d6c03c732a0db157792b8ece9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_services
    ADD CONSTRAINT "FK_27d6c03c732a0db157792b8ece9" FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: users FK_319f0e7ba3cc389c942eaf2eee1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_319f0e7ba3cc389c942eaf2eee1" FOREIGN KEY (manager_account_id) REFERENCES public.managers(id);


--
-- Name: courses FK_4dab71328bf0f1e81263edbcf77; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT "FK_4dab71328bf0f1e81263edbcf77" FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: manager_commissions FK_54242c7e9eb113c4e858fc03499; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager_commissions
    ADD CONSTRAINT "FK_54242c7e9eb113c4e858fc03499" FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: orders FK_58bf36f7394276625b781d66099; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_58bf36f7394276625b781d66099" FOREIGN KEY (payer_id) REFERENCES public.payers(id);


--
-- Name: course_plans FK_5b79194c44765c9fbfdc9c42fc8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_plans
    ADD CONSTRAINT "FK_5b79194c44765c9fbfdc9c42fc8" FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: course_orders FK_6633d32328181cb6773eda1c3ba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_orders
    ADD CONSTRAINT "FK_6633d32328181cb6773eda1c3ba" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users FK_7539adcf71a8644a38e6ac35297; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_7539adcf71a8644a38e6ac35297" FOREIGN KEY (skipper_account_id) REFERENCES public.skippers(id);


--
-- Name: course_orders FK_7c4b4bf94a1d6b4f0a8f41c1340; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_orders
    ADD CONSTRAINT "FK_7c4b4bf94a1d6b4f0a8f41c1340" FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: orders_guests_users FK_7c79627301c85b512be0fe8dffc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_guests_users
    ADD CONSTRAINT "FK_7c79627301c85b512be0fe8dffc" FOREIGN KEY (users_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: course_orders FK_7f12be129d168e172f8e38d9bed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_orders
    ADD CONSTRAINT "FK_7f12be129d168e172f8e38d9bed" FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: options FK_84da03df3546fb3e20cc3dfc54f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT "FK_84da03df3546fb3e20cc3dfc54f" FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: orders_guests_users FK_8acf573039dbc57bf531e6c82b2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_guests_users
    ADD CONSTRAINT "FK_8acf573039dbc57bf531e6c82b2" FOREIGN KEY (orders_id) REFERENCES public.orders(id);


--
-- Name: orders FK_8f64e2f0728bad0f6c6aa6413b2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_8f64e2f0728bad0f6c6aa6413b2" FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: payments FK_a7d324967967f7450c22b6a1e33; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT "FK_a7d324967967f7450c22b6a1e33" FOREIGN KEY (course_order_id) REFERENCES public.course_orders(id);


--
-- Name: orders FK_a922b820eeef29ac1c6800e826a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_a922b820eeef29ac1c6800e826a" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payments FK_b2f7b823a21562eeca20e72b006; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT "FK_b2f7b823a21562eeca20e72b006" FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: payers FK_b5fc53d061a9b8cf6530e516689; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payers
    ADD CONSTRAINT "FK_b5fc53d061a9b8cf6530e516689" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders_cadets_users FK_c1d7c759bc3bde0c36295f07c07; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_cadets_users
    ADD CONSTRAINT "FK_c1d7c759bc3bde0c36295f07c07" FOREIGN KEY (orders_id) REFERENCES public.orders(id);


--
-- Name: orders FK_c23c7d2f3f13590a845802393d5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_c23c7d2f3f13590a845802393d5" FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: options FK_d2c73d9caf45c68022763e20de9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT "FK_d2c73d9caf45c68022763e20de9" FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: course_orders FK_d8a8e4344d9517dd58b3fbab132; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_orders
    ADD CONSTRAINT "FK_d8a8e4344d9517dd58b3fbab132" FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: order_notifications FK_e3b588e22abc79e42113386ab04; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_notifications
    ADD CONSTRAINT "FK_e3b588e22abc79e42113386ab04" FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_notifications FK_e7f13eaf4e08beb300d240fbebb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_notifications
    ADD CONSTRAINT "FK_e7f13eaf4e08beb300d240fbebb" FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: orders FK_f5d519a61e918f7efb299de31a0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_f5d519a61e918f7efb299de31a0" FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- Name: users FK_fba2d8e029689aa8fea98e53c91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_fba2d8e029689aa8fea98e53c91" FOREIGN KEY (manager_id) REFERENCES public.managers(id);


--
-- Name: course_orders FK_ff31a801481102c5a0d24c40e07; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_orders
    ADD CONSTRAINT "FK_ff31a801481102c5a0d24c40e07" FOREIGN KEY (skipper_id) REFERENCES public.skippers(id);


--
-- PostgreSQL database dump complete
--

