CREATE DATABASE IF NOT EXISTS hotel_reservation;
USE hotel_reservation;

DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers (
  customerid int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  phone varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  PRIMARY KEY (customerid)
);