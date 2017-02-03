DROP table merchants CASCADE;
DROP table tag CASCADE;
DROP table transactions;

CREATE TABLE merchants(
id INT4 primary key,
name VARCHAR(255)
);

CREATE TABLE tag(
id INT4 primary key,
category VARCHAR(255)
);

CREATE TABLE transactions(
id INT4 primary key,
merchant_id SERIAL4 REFERENCES merchants(id) ON DELETE CASCADE,
tag_id SERIAL4 REFERENCES tag(id) ON DELETE CASCADE,
value DECIMAL(5,2)
);