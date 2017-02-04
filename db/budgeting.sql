DROP table merchants CASCADE;
DROP table tags CASCADE;
DROP table transactions;

CREATE TABLE merchants(
id SERIAL4 primary key,
name VARCHAR(255) not null
);

CREATE TABLE tags(
id SERIAL4 primary key,
name VARCHAR(255) not null
);

CREATE TABLE transactions(
id SERIAL4 primary key,
merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE not null,
tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE not null,
value DECIMAL(5,2) not null
);