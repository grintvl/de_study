CREATE TABLE IF NOT EXISTS public.extrad (
    extrad_id SERIAL PRIMARY KEY,
    readTick bigint  NOT NULL REFERENCES public.readers(readTick),
    book_id bigint  NOT NULL REFERENCES public.books(book_id),
    start_date date,
    end_date date,
    return_book char(1)
);

CREATE TABLE IF NOT EXISTS public.readers (
    readTick SERIAL PRIMARY KEY,
    FIO_r varchar (250),
    addresss varchar (250),
    phone_number varchar (25),
    email varchar (100)
);

CREATE TABLE IF NOT EXISTS public.books (
    book_id SERIAL PRIMARY KEY,
    book_title varchar (250),
    total_book integer,
    author_id NOT NULL REFERENCES public.author_book(author_id),
    year_pub date,
    pages integer,
    price numeric(10,2),
    publish_id NOT NULL REFERENCES public.publisher(publish_id)
);

CREATE TABLE IF NOT EXISTS public.author_book (
    author_id SERIAL PRIMARY KEY,
    FIO_author varchar (250)
);

CREATE TABLE IF NOT EXISTS public.publisher (
    publish_id SERIAL PRIMARY KEY,
    pub_title varchar (250),
    city varchar (150)
);