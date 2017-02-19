This is a CRUD created using Spring and Hibernate.

CREATE TABLE products
(
    id serial NOT NULL,
    product_name character varying(50) NOT NULL,
    calories integer NOT NULL,
    description character varying,
    PRIMARY KEY (id)
)