create database customers;

CREATE TABLE Cart (
    cart_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    product_name VARCHAR(255),
    quantity INT,
    price INT
);

CREATE TABLE Contact (
    username VARCHAR(100),
    messagetitle VARCHAR(255),
    messagedescription TEXT
);

CREATE TABLE OrderDetail (
    order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100),
    productName VARCHAR(255),
    total INT,
    payment_method VARCHAR(100),
    transaction_id VARCHAR(100),
    status VARCHAR(20),
    address VARCHAR(255),
    orderdate DATE,
    deliverydate DATE
);

CREATE TABLE Product (
    productid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(500),
    description VARCHAR(500),
    price INT,
    stock INT,
    active VARCHAR(10),
    filename VARCHAR(100),
    data LONGBLOB
);

CREATE TABLE Users (
    s1no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100),
    email VARCHAR(100),
    username VARCHAR(100),
    password VARCHAR(100),
    mobileNumber BIGINT,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    isAdmin VARCHAR(100)
);

