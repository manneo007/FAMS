PGDMP
         &            	    m            fams    8.3.7    8.3.7 h    J           0    0    ENCODING    ENCODING    SET client_encoding = 'UTF8';
                       false            K           0    0 
   STDSTRINGS 
   STDSTRINGS )   SET standard_conforming_strings = 'off';
                       false                        2615    2200    public    SCHEMA    CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            L           0    0    SCHEMA public    COMMENT 6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            M           0    0    public    ACL �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6            �           1259    25590    acos    TABLE   CREATE TABLE acos (
    id integer NOT NULL,
    parent_id integer,
    model character varying(255) DEFAULT NULL::character varying,
    foreign_key integer,
    alias character varying(255) DEFAULT NULL::character varying,
    lft integer,
    rght integer
);
    DROP TABLE public.acos;
       public         root    false    1800    1801    6            �           1259    25653    acos_id_seq    SEQUENCE m   CREATE SEQUENCE acos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 "   DROP SEQUENCE public.acos_id_seq;
       public       root    false    6    1506            N           0    0    acos_id_seq    SEQUENCE OWNED BY -   ALTER SEQUENCE acos_id_seq OWNED BY acos.id;
            public       root    false    1520            O           0    0    acos_id_seq    SEQUENCE SET 3   SELECT pg_catalog.setval('acos_id_seq', 1, false);
            public       root    false    1520            �           1259    25598    aros    TABLE   CREATE TABLE aros (
    id integer NOT NULL,
    parent_id integer,
    model character varying(255) DEFAULT NULL::character varying,
    foreign_key integer,
    alias character varying(255) DEFAULT NULL::character varying,
    lft integer,
    rght integer
);
    DROP TABLE public.aros;
       public         root    false    1803    1804    6            �           1259    25606 	   aros_acos    TABLE �  CREATE TABLE aros_acos (
    id integer NOT NULL,
    aro_id integer NOT NULL,
    aco_id integer NOT NULL,
    _create character varying(2) DEFAULT '0'::character varying NOT NULL,
    _read character varying(2) DEFAULT '0'::character varying NOT NULL,
    _update character varying(2) DEFAULT '0'::character varying NOT NULL,
    _delete character varying(2) DEFAULT '0'::character varying NOT NULL
);
    DROP TABLE public.aros_acos;
       public         root    false    1806    1807    1808    1809    6            �           1259    25655    aros_acos_id_seq    SEQUENCE r   CREATE SEQUENCE aros_acos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 '   DROP SEQUENCE public.aros_acos_id_seq;
       public       root    false    1508    6            P           0    0    aros_acos_id_seq    SEQUENCE OWNED BY 7   ALTER SEQUENCE aros_acos_id_seq OWNED BY aros_acos.id;
            public       root    false    1521            Q           0    0    aros_acos_id_seq    SEQUENCE SET 8   SELECT pg_catalog.setval('aros_acos_id_seq', 1, false);
            public       root    false    1521            �           1259    25657    aros_id_seq    SEQUENCE m   CREATE SEQUENCE aros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 "   DROP SEQUENCE public.aros_id_seq;
       public       root    false    1507    6            R           0    0    aros_id_seq    SEQUENCE OWNED BY -   ALTER SEQUENCE aros_id_seq OWNED BY aros.id;
            public       root    false    1522            S           0    0    aros_id_seq    SEQUENCE SET 3   SELECT pg_catalog.setval('aros_id_seq', 1, false);
            public       root    false    1522            �           1259    25613    asset_categories    TABLE �   CREATE TABLE asset_categories (
    id integer NOT NULL,
    category_code character varying(5),
    name character varying(20),
    description character varying(150),
    record_status character(1)
);
 $   DROP TABLE public.asset_categories;
       public         root    false    6            �           1259    25659    asset_categories_id_seq    SEQUENCE h   CREATE SEQUENCE asset_categories_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 .   DROP SEQUENCE public.asset_categories_id_seq;
       public       root    false    6    1509            T           0    0    asset_categories_id_seq    SEQUENCE OWNED BY E   ALTER SEQUENCE asset_categories_id_seq OWNED BY asset_categories.id;
            public       root    false    1523            U           0    0    asset_categories_id_seq    SEQUENCE SET >   SELECT pg_catalog.setval('asset_categories_id_seq', 1, true);
            public       root    false    1523            �           1259    25616    asset_complaints    TABLE ;   CREATE TABLE asset_complaints (
    id integer NOT NULL
);
 $   DROP TABLE public.asset_complaints;
       public         root    false    6            �           1259    25661    asset_complaints_id_seq    SEQUENCE y   CREATE SEQUENCE asset_complaints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 .   DROP SEQUENCE public.asset_complaints_id_seq;
       public       root    false    1510    6            V           0    0    asset_complaints_id_seq    SEQUENCE OWNED BY E   ALTER SEQUENCE asset_complaints_id_seq OWNED BY asset_complaints.id;
            public       root    false    1524            W           0    0    asset_complaints_id_seq    SEQUENCE SET ?   SELECT pg_catalog.setval('asset_complaints_id_seq', 1, false);
            public       root    false    1524            �           1259    25619    asset_requests    TABLE 9   CREATE TABLE asset_requests (
    id integer NOT NULL
);
 "   DROP TABLE public.asset_requests;
       public         root    false    6            �           1259    25663    asset_requests_id_seq    SEQUENCE w   CREATE SEQUENCE asset_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.asset_requests_id_seq;
       public       root    false    1511    6            X           0    0    asset_requests_id_seq    SEQUENCE OWNED BY A   ALTER SEQUENCE asset_requests_id_seq OWNED BY asset_requests.id;
            public       root    false    1525            Y           0    0    asset_requests_id_seq    SEQUENCE SET =   SELECT pg_catalog.setval('asset_requests_id_seq', 1, false);
            public       root    false    1525            �           1259    25622    assets    TABLE #  CREATE TABLE assets (
    id bigint NOT NULL,
    asset_code character varying(10),
    short_name character varying(100),
    description character varying(200),
    supplier_id integer,
    purchase_price numeric,
    purchase_date date,
    lifespan integer,
    salvage_value numeric
);
    DROP TABLE public.assets;
       public         root    false    6            �           1259    25665    assets_id_seq    SEQUENCE o   CREATE SEQUENCE assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 $   DROP SEQUENCE public.assets_id_seq;
       public       root    false    6    1512            Z           0    0    assets_id_seq    SEQUENCE OWNED BY 1   ALTER SEQUENCE assets_id_seq OWNED BY assets.id;
            public       root    false    1526            [           0    0    assets_id_seq    SEQUENCE SET 5   SELECT pg_catalog.setval('assets_id_seq', 1, false);
            public       root    false    1526            �           1259    25628    branches    TABLE �   CREATE TABLE branches (
    id integer NOT NULL,
    branch_code character varying(5) NOT NULL,
    description character varying(50) NOT NULL,
    record_status character(1)
);
    DROP TABLE public.branches;
       public         root    false    6            �           1259    25667    branches_id_seq    SEQUENCE `   CREATE SEQUENCE branches_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 &   DROP SEQUENCE public.branches_id_seq;
       public       root    false    6    1513            \           0    0    branches_id_seq    SEQUENCE OWNED BY 5   ALTER SEQUENCE branches_id_seq OWNED BY branches.id;
            public       root    false    1527            ]           0    0    branches_id_seq    SEQUENCE SET 6   SELECT pg_catalog.setval('branches_id_seq', 9, true);
            public       root    false    1527            �           1259    25631 	   divisions    TABLE �   CREATE TABLE divisions (
    id integer NOT NULL,
    division_code character varying(5) NOT NULL,
    description character varying(50),
    record_status character(1)
);
    DROP TABLE public.divisions;
       public         root    false    6            �           1259    25669    divisions_id_seq    SEQUENCE a   CREATE SEQUENCE divisions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 '   DROP SEQUENCE public.divisions_id_seq;
       public       root    false    6    1514            ^           0    0    divisions_id_seq    SEQUENCE OWNED BY 7   ALTER SEQUENCE divisions_id_seq OWNED BY divisions.id;
            public       root    false    1528            _           0    0    divisions_id_seq    SEQUENCE SET 8   SELECT pg_catalog.setval('divisions_id_seq', 10, true);
            public       root    false    1528            �           1259    25634 	   employees    TABLE �  CREATE TABLE employees (
    id integer NOT NULL,
    employee_id character varying(5) NOT NULL,
    full_name character varying(200) NOT NULL,
    name_with_initials character varying(50) NOT NULL,
    date_of_birth date DEFAULT now(),
    gender character(1),
    email character varying(50),
    address character varying(300),
    contact_number character varying(20),
    branch_id integer,
    division_id integer,
    photo character varying(50),
    record_status character(1)
);
    DROP TABLE public.employees;
       public         root    false    1817    6            �           1259    25671    employees_id_seq    SEQUENCE a   CREATE SEQUENCE employees_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public       root    false    6    1515            `           0    0    employees_id_seq    SEQUENCE OWNED BY 7   ALTER SEQUENCE employees_id_seq OWNED BY employees.id;
            public       root    false    1529            a           0    0    employees_id_seq    SEQUENCE SET 8   SELECT pg_catalog.setval('employees_id_seq', 15, true);
            public       root    false    1529            �           1259    25641 	   locations    TABLE �   CREATE TABLE locations (
    id integer NOT NULL,
    location_code character varying(5),
    description character varying(150),
    branch_id integer,
    record_status character(1)
);
    DROP TABLE public.locations;
       public         root    false    6            �           1259    25673    locations_id_seq    SEQUENCE a   CREATE SEQUENCE locations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 '   DROP SEQUENCE public.locations_id_seq;
       public       root    false    6    1516            b           0    0    locations_id_seq    SEQUENCE OWNED BY 7   ALTER SEQUENCE locations_id_seq OWNED BY locations.id;
            public       root    false    1530            c           0    0    locations_id_seq    SEQUENCE SET 7   SELECT pg_catalog.setval('locations_id_seq', 4, true);
            public       root    false    1530            �           1259    25644 	   suppliers    TABLE   CREATE TABLE suppliers (
    id integer NOT NULL,
    supplier_code character varying(5),
    description character varying(150),
    address character varying(200),
    contact_number character varying(20),
    email character varying(50),
    record_status character(1)
);
    DROP TABLE public.suppliers;
       public         root    false    6            �           1259    25675    suppliers_id_seq    SEQUENCE a   CREATE SEQUENCE suppliers_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 '   DROP SEQUENCE public.suppliers_id_seq;
       public       root    false    6    1517            d           0    0    suppliers_id_seq    SEQUENCE OWNED BY 7   ALTER SEQUENCE suppliers_id_seq OWNED BY suppliers.id;
            public       root    false    1531            e           0    0    suppliers_id_seq    SEQUENCE SET 7   SELECT pg_catalog.setval('suppliers_id_seq', 1, true);
            public       root    false    1531            �           1259    25647    system_menus    TABLE �   CREATE TABLE system_menus (
    id integer NOT NULL,
    parent_id smallint,
    title character varying(25),
    description character varying(50),
    program_name character varying(50),
    "order" smallint
);
     DROP TABLE public.system_menus;
       public         root    false    6            �           1259    25677    system_menu_id_seq    SEQUENCE c   CREATE SEQUENCE system_menu_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 )   DROP SEQUENCE public.system_menu_id_seq;
       public       root    false    6    1518            f           0    0    system_menu_id_seq    SEQUENCE OWNED BY <   ALTER SEQUENCE system_menu_id_seq OWNED BY system_menus.id;
            public       root    false    1532            g           0    0    system_menu_id_seq    SEQUENCE SET :   SELECT pg_catalog.setval('system_menu_id_seq', 19, true);
            public       root    false    1532            �           1259    25650    users    TABLE w   CREATE TABLE users (
    id bigint NOT NULL,
    username character varying(50),
    password character varying(50)
);
    DROP TABLE public.users;
       public         root    false    6            �           1259    25679    users_id_seq    SEQUENCE ]   CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       root    false    1519    6            h           0    0    users_id_seq    SEQUENCE OWNED BY /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       root    false    1533            i           0    0    users_id_seq    SEQUENCE SET 3   SELECT pg_catalog.setval('users_id_seq', 1, true);
            public       root    false    1533            
           2604    25681    id    DEFAULT O   ALTER TABLE acos ALTER COLUMN id SET DEFAULT nextval('acos_id_seq'::regclass);
 6   ALTER TABLE public.acos ALTER COLUMN id DROP DEFAULT;
       public       root    false    1520    1506                       2604    25682    id    DEFAULT O   ALTER TABLE aros ALTER COLUMN id SET DEFAULT nextval('aros_id_seq'::regclass);
 6   ALTER TABLE public.aros ALTER COLUMN id DROP DEFAULT;
       public       root    false    1522    1507                       2604    25683    id    DEFAULT Y   ALTER TABLE aros_acos ALTER COLUMN id SET DEFAULT nextval('aros_acos_id_seq'::regclass);
 ;   ALTER TABLE public.aros_acos ALTER COLUMN id DROP DEFAULT;
       public       root    false    1521    1508                       2604    25684    id    DEFAULT g   ALTER TABLE asset_categories ALTER COLUMN id SET DEFAULT nextval('asset_categories_id_seq'::regclass);
 B   ALTER TABLE public.asset_categories ALTER COLUMN id DROP DEFAULT;
       public       root    false    1523    1509                       2604    25685    id    DEFAULT g   ALTER TABLE asset_complaints ALTER COLUMN id SET DEFAULT nextval('asset_complaints_id_seq'::regclass);
 B   ALTER TABLE public.asset_complaints ALTER COLUMN id DROP DEFAULT;
       public       root    false    1524    1510                       2604    25686    id    DEFAULT c   ALTER TABLE asset_requests ALTER COLUMN id SET DEFAULT nextval('asset_requests_id_seq'::regclass);
 @   ALTER TABLE public.asset_requests ALTER COLUMN id DROP DEFAULT;
       public       root    false    1525    1511                       2604    25687    id    DEFAULT S   ALTER TABLE assets ALTER COLUMN id SET DEFAULT nextval('assets_id_seq'::regclass);
 8   ALTER TABLE public.assets ALTER COLUMN id DROP DEFAULT;
       public       root    false    1526    1512                       2604    25688    id    DEFAULT W   ALTER TABLE branches ALTER COLUMN id SET DEFAULT nextval('branches_id_seq'::regclass);
 :   ALTER TABLE public.branches ALTER COLUMN id DROP DEFAULT;
       public       root    false    1527    1513                       2604    25689    id    DEFAULT Y   ALTER TABLE divisions ALTER COLUMN id SET DEFAULT nextval('divisions_id_seq'::regclass);
 ;   ALTER TABLE public.divisions ALTER COLUMN id DROP DEFAULT;
       public       root    false    1528    1514                       2604    25690    id    DEFAULT Y   ALTER TABLE employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public       root    false    1529    1515                       2604    25691    id    DEFAULT Y   ALTER TABLE locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public       root    false    1530    1516                       2604    25692    id    DEFAULT Y   ALTER TABLE suppliers ALTER COLUMN id SET DEFAULT nextval('suppliers_id_seq'::regclass);
 ;   ALTER TABLE public.suppliers ALTER COLUMN id DROP DEFAULT;
       public       root    false    1531    1517                       2604    25693    id    DEFAULT ^   ALTER TABLE system_menus ALTER COLUMN id SET DEFAULT nextval('system_menu_id_seq'::regclass);
 >   ALTER TABLE public.system_menus ALTER COLUMN id DROP DEFAULT;
       public       root    false    1532    1518                       2604    25694    id    DEFAULT Q   ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       root    false    1533    1519            <          0    25590    acos 
   TABLE DATA           L   COPY acos (id, parent_id, model, foreign_key, alias, lft, rght) FROM stdin;
    public       root    false    1506   &i       =          0    25598    aros 
   TABLE DATA           L   COPY aros (id, parent_id, model, foreign_key, alias, lft, rght) FROM stdin;
    public       root    false    1507   Ci       >          0    25606 	   aros_acos 
   TABLE DATA           R   COPY aros_acos (id, aro_id, aco_id, _create, _read, _update, _delete) FROM stdin;
    public       root    false    1508   `i       ?          0    25613    asset_categories 
   TABLE DATA           X   COPY asset_categories (id, category_code, name, description, record_status) FROM stdin;
    public       root    false    1509   }i       @          0    25616    asset_complaints 
   TABLE DATA           '   COPY asset_complaints (id) FROM stdin;
    public       root    false    1510   �i       A          0    25619    asset_requests 
   TABLE DATA           %   COPY asset_requests (id) FROM stdin;
    public       root    false    1511   �i       B          0    25622    assets 
   TABLE DATA           �   COPY assets (id, asset_code, short_name, description, supplier_id, purchase_price, purchase_date, lifespan, salvage_value) FROM stdin;
    public       root    false    1512   j       C          0    25628    branches 
   TABLE DATA           H   COPY branches (id, branch_code, description, record_status) FROM stdin;
    public       root    false    1513   9j       D          0    25631 	   divisions 
   TABLE DATA           K   COPY divisions (id, division_code, description, record_status) FROM stdin;
    public       root    false    1514   �j       E          0    25634 	   employees 
   TABLE DATA           �   COPY employees (id, employee_id, full_name, name_with_initials, date_of_birth, gender, email, address, contact_number, branch_id, division_id, photo, record_status) FROM stdin;
    public       root    false    1515   k       F          0    25641 	   locations 
   TABLE DATA           V   COPY locations (id, location_code, description, branch_id, record_status) FROM stdin;
    public       root    false    1516   Vn       G          0    25644 	   suppliers 
   TABLE DATA           k   COPY suppliers (id, supplier_code, description, address, contact_number, email, record_status) FROM stdin;
    public       root    false    1517   �n       H          0    25647    system_menus 
   TABLE DATA           Y   COPY system_menus (id, parent_id, title, description, program_name, "order") FROM stdin;
    public       root    false    1518   'o       I          0    25650    users 
   TABLE DATA           0   COPY users (id, username, password) FROM stdin;
    public       root    false    1519   �p                   2606    25696 	   acos_pkey 
   CONSTRAINT E   ALTER TABLE ONLY acos
    ADD CONSTRAINT acos_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.acos DROP CONSTRAINT acos_pkey;
       public         root    false    1506    1506            %           2606    25698    aros_acos_pkey 
   CONSTRAINT O   ALTER TABLE ONLY aros_acos
    ADD CONSTRAINT aros_acos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.aros_acos DROP CONSTRAINT aros_acos_pkey;
       public         root    false    1508    1508            "           2606    25700 	   aros_pkey 
   CONSTRAINT E   ALTER TABLE ONLY aros
    ADD CONSTRAINT aros_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.aros DROP CONSTRAINT aros_pkey;
       public         root    false    1507    1507            '           2606    25702    asset_categories_pkey 
   CONSTRAINT ]   ALTER TABLE ONLY asset_categories
    ADD CONSTRAINT asset_categories_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.asset_categories DROP CONSTRAINT asset_categories_pkey;
       public         root    false    1509    1509            )           2606    25704    asset_complaints_pkey 
   CONSTRAINT ]   ALTER TABLE ONLY asset_complaints
    ADD CONSTRAINT asset_complaints_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.asset_complaints DROP CONSTRAINT asset_complaints_pkey;
       public         root    false    1510    1510            +           2606    25706    asset_requests_pkey 
   CONSTRAINT Y   ALTER TABLE ONLY asset_requests
    ADD CONSTRAINT asset_requests_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.asset_requests DROP CONSTRAINT asset_requests_pkey;
       public         root    false    1511    1511            -           2606    25708    assets_pkey 
   CONSTRAINT I   ALTER TABLE ONLY assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.assets DROP CONSTRAINT assets_pkey;
       public         root    false    1512    1512            /           2606    25710    branches_pkey 
   CONSTRAINT M   ALTER TABLE ONLY branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.branches DROP CONSTRAINT branches_pkey;
       public         root    false    1513    1513            1           2606    25712    divisions_pkey 
   CONSTRAINT O   ALTER TABLE ONLY divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.divisions DROP CONSTRAINT divisions_pkey;
       public         root    false    1514    1514            3           2606    25714    employees_pkey 
   CONSTRAINT O   ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public         root    false    1515    1515            5           2606    25716    locations_pkey 
   CONSTRAINT O   ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public         root    false    1516    1516            7           2606    25718    suppliers_pkey 
   CONSTRAINT O   ALTER TABLE ONLY suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public         root    false    1517    1517            9           2606    25720    system_menu_pkey 
   CONSTRAINT T   ALTER TABLE ONLY system_menus
    ADD CONSTRAINT system_menu_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.system_menus DROP CONSTRAINT system_menu_pkey;
       public         root    false    1518    1518            ;           2606    25722 
   users_pkey 
   CONSTRAINT G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         root    false    1519    1519            #           1259    25723    aro_aco_key    INDEX K   CREATE UNIQUE INDEX aro_aco_key ON aros_acos USING btree (aro_id, aco_id);
    DROP INDEX public.aro_aco_key;
       public         root    false    1508    1508            <      x������ � �      =      x������ � �      >      x������ � �      ?   U   x�3�t�v��tI-�.�/Pp��-(-I-*���˩TH�
'Ä�R2�sJSRSJ�RR�J22��KR��*9�b���� v��      @      x������ � �      A      x������ � �      B      x������ � �      C   U   x�3�q�.�SpO�/JO�Q-I��t�2�t�u�t����M��Q.�T�I��NJs�xGr��gW%�����1z\\\ �n�      D   d   x�3�����(�M�SJ-�/-JNU�M�KLO�M�+Qp�,�,����t�2��u�D���8�]�8�S�RR�Rs���f���Μ�����y%�@�=... G� �      E   4  x��U�n�@|^�b? ����-$V���Ҩ/y9`o�[Q���]'�Q�*�ň��9g�̱�>K�9�jG�[�5tP�6�X��,e	KD�#�G��A�+{MUJ]��Ԟ�����%�_��e��/����l"���l���
~Utl6�2��%BK��!�*�j�,k��uV7�l��Z���jƄt\��(���7���;�h �Un2��%\���K����wv�
�\�(<&2}]f�b��ܱ�9z�5EƿԔN��\SAնN�������4���.�|ǰ�e��Iϩ��Kl�|����o9.���]{3���V�XU4���m#{�"��$0�[�C�ۆ�,۳�8�&]���~Im���+
z�2����g��*p�Cd��YlI�7t�*:��)�<b�+4������NU���ݮC�'K��j~!�?�!���W����0��fԑo��
��]_�7����Z�D7�A8o$(�t���']�m3�8N!\�lB_5=yV_ָ7e��Tr}a���|u^���OݏP< �3��$�ޡe����w�rUu��9�a��G�L!���K����>Qt� �&�wu	��&|��F,�Y!�GU�6S�:��qr��{ov�l<,����\M�XF���%��ؗ�O���W�qѻݳtq�OJ��7�s���~�d�?G�H��R�Ğ(v�m�s܈�:���t��EL�C�G^��<{_mu���$#TL�q�-A,(z?���T��^�\lKtӡ�h&��X�~��;�ĠKk�:�"�Q�3�d�A�'GӂK0�w/�(�k��s�[*�{(,4�ۓ��'�d�      F   R   x�3��wsv��OK�LNUp,JM�4�t�2���s���)�K�P����p�p1pr�ps����pP�W� �j      G   _   x��;
�0 �9=EO ����*��K���JL��{�a^XB���mHI�x���e�3R����jGTE�;1#��eU7m��'��d|�`���� �      H   �  x�}R�N�0<�_�/h�-���= �\+E&]�%c���l��u�6;�Y�y�\)��3��FS�v�P6Nh!S��x��p�t����9ʹV�h);2��`N���{-u`#���g�Y����T��3���a�MU��3M���
M��$�*���FD�;�(3"p�Uh��Ե`�N�����y�$=�����G��O3�f���Rc��
#����BJr�[�B9;&����	�F�|4`C�P�����e���j��3Nnԫ��IuQ��1�|��	jmܯ�?�L��h��v+˰�q�k��,�Au�n[�����'[�;����|
����ڢ��{���fAي�I��U���NWc�'/{�(���������?�g��[akm���C`2��RJ �ݎP      I   @   x�3��NM-*���02O5OL376JJ6H505J31IN�4442�0NL331477I2������ ��J     