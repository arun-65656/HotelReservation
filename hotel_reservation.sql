SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS hotel_reservation DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE hotel_reservation;

DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers (
  customerid int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  phone varchar(100) NOT NULL,
  password varchar(100) NOT NULL,
  Role varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (customerid)
);
 
 

DROP TABLE IF EXISTS hotelreservationdetail;
CREATE TABLE IF NOT EXISTS hotelreservationdetail (
  ReservationId int(11) NOT NULL AUTO_INCREMENT,
  HotelId int(11) NOT NULL,
  CheckIn date DEFAULT curdate(),
  CheckOut date DEFAULT curdate(),
  Amount decimal(10,2) DEFAULT 0.00,
  billstatus varchar(50) DEFAULT 'NOT PAID',
  CustomerId int(11) DEFAULT NULL,
  PRIMARY KEY (ReservationId),
  KEY fk1 (HotelId)
);
 

DROP TABLE IF EXISTS hotels;
CREATE TABLE IF NOT EXISTS hotels (
  HotelId int(11) NOT NULL AUTO_INCREMENT,
  HotelsId int(11) NOT NULL,
  HotelName varchar(100) NOT NULL,
  RoomTyoe varchar(100) NOT NULL,
  Amount decimal(10,2) DEFAULT 0.00,
  Images varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  DISTANCE varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  Benifits varchar(700) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (HotelId)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

INSERT INTO `hotels` (`HotelId`, `HotelsId`, `HotelName`, `RoomTyoe`, `Amount`, `Images`, `DISTANCE`, `Benifits`) VALUES
(1, 1, 'OYO 92129 Hotel S K Palace', 'Double Room', '15.00', '/Image/1.jpg', '11.8 km from centre', 'OYO 92129 Hotel S K Palace features air-conditioned rooms with cable TV in the Central Suburbs district of Mumbai.'),
(2, 1, 'OYO 92129 Hotel S K Palace', 'Deluxe Triple Room', '25.00', '/Image/1.jpg', '11.8 km from centre', 'OYO 92129 Hotel S K Palace features air-conditioned rooms with cable TV in the Central Suburbs district of Mumbai.'),
(3, 1, 'OYO 92129 Hotel S K Palace', 'Standard Double Room', '16.00', '/Image/1.jpg', '11.8 km from centre', 'OYO 92129 Hotel S K Palace features air-conditioned rooms with cable TV in the Central Suburbs district of Mumbai.'),
(4, 1, 'OYO 92129 Hotel S K Palace', 'Deluxe Room', '22.00', '/Image/1.jpg', '11.8 km from centre', 'OYO 92129 Hotel S K Palace features air-conditioned rooms with cable TV in the Central Suburbs district of Mumbai.'),
(5, 1, 'OYO 92129 Hotel S K Palace', 'Classic Triple Room', '17.00', '/Image/1.jpg', '11.8 km from centre', 'OYO 92129 Hotel S K Palace features air-conditioned rooms with cable TV in the Central Suburbs district of Mumbai.'),
(6, 1, 'OYO 92129 Hotel S K Palace', 'Small Twin Room', '13.00', '/Image/1.jpg', '11.8 km from centre', 'OYO 92129 Hotel S K Palace features air-conditioned rooms with cable TV in the Central Suburbs district of Mumbai.'),
(7, 1, 'OYO 92129 Hotel S K Palace', 'Standard Double or Twin Room', '15.50', '/Image/1.jpg', '11.8 km from centre', 'OYO 92129 Hotel S K Palace features air-conditioned rooms with cable TV in the Central Suburbs district of Mumbai.'),
(8, 2, 'Hotel Palm Beach Pride', 'Double Room', '16.00', '/Image/2.jpg', '22.8 km from centre', 'Well situated in the CBD Belapur district of Mumbai, Hotel Palm Beach Pride is set 26 km from Phoenix Market City Mall, 29 km from Dadar Railway Station and 30 km from Indian Institute of Technology,...'),
(9, 2, 'Hotel Palm Beach Pride', 'Deluxe Triple Room', '16.50', '/Image/2.jpg', '22.8 km from centre', 'Well situated in the CBD Belapur district of Mumbai, Hotel Palm Beach Pride is set 26 km from Phoenix Market City Mall, 29 km from Dadar Railway Station and 30 km from Indian Institute of Technology,...'),
(10, 2, 'Hotel Palm Beach Pride', 'Standard Double Room', '17.00', '/Image/2.jpg', '22.8 km from centre', 'Well situated in the CBD Belapur district of Mumbai, Hotel Palm Beach Pride is set 26 km from Phoenix Market City Mall, 29 km from Dadar Railway Station and 30 km from Indian Institute of Technology,...'),
(11, 2, 'Hotel Palm Beach Pride', 'Deluxe Room', '20.00', '/Image/2.jpg', '22.8 km from centre', 'Well situated in the CBD Belapur district of Mumbai, Hotel Palm Beach Pride is set 26 km from Phoenix Market City Mall, 29 km from Dadar Railway Station and 30 km from Indian Institute of Technology,...'),
(12, 2, 'Hotel Palm Beach Pride', 'Classic Triple Room', '15.00', '/Image/2.jpg', '22.8 km from centre', 'Well situated in the CBD Belapur district of Mumbai, Hotel Palm Beach Pride is set 26 km from Phoenix Market City Mall, 29 km from Dadar Railway Station and 30 km from Indian Institute of Technology,...'),
(13, 2, 'Hotel Palm Beach Pride', 'Small Twin Room', '15.50', '/Image/2.jpg', '22.8 km from centre', 'Well situated in the CBD Belapur district of Mumbai, Hotel Palm Beach Pride is set 26 km from Phoenix Market City Mall, 29 km from Dadar Railway Station and 30 km from Indian Institute of Technology,...'),
(14, 2, 'Hotel Palm Beach Pride', 'Standard Double or Twin Room', '20.00', '/Image/2.jpg', '22.8 km from centre', 'Well situated in the CBD Belapur district of Mumbai, Hotel Palm Beach Pride is set 26 km from Phoenix Market City Mall, 29 km from Dadar Railway Station and 30 km from Indian Institute of Technology,...'),
(15, 3, 'Ramee Guestline Hotel Dadar', 'Double Room', '16.00', '/Image/3.jpg', '6 km from centre', 'Located in Dadar, Ramee Guestline Hotel offers 4-star accommodation in Mumbai’s commercial centre. Its modern facilities include a rooftop swimming pool, 3 dining options and free parking.'),
(16, 3, 'Ramee Guestline Hotel Dadar', 'Deluxe Triple Room', '14.50', '/Image/3.jpg', '6 km from centre', 'Located in Dadar, Ramee Guestline Hotel offers 4-star accommodation in Mumbai’s commercial centre. Its modern facilities include a rooftop swimming pool, 3 dining options and free parking.'),
(17, 3, 'Ramee Guestline Hotel Dadar', 'Standard Double Room', '15.50', '/Image/3.jpg', '6 km from centre', 'Located in Dadar, Ramee Guestline Hotel offers 4-star accommodation in Mumbai’s commercial centre. Its modern facilities include a rooftop swimming pool, 3 dining options and free parking.'),
(18, 3, 'Ramee Guestline Hotel Dadar', 'Deluxe Room', '15.00', '/Image/3.jpg', '6 km from centre', 'Located in Dadar, Ramee Guestline Hotel offers 4-star accommodation in Mumbai’s commercial centre. Its modern facilities include a rooftop swimming pool, 3 dining options and free parking.'),
(19, 3, 'Ramee Guestline Hotel Dadar', 'Classic Triple Room', '12.00', '/Image/3.jpg', '6 km from centre', 'Located in Dadar, Ramee Guestline Hotel offers 4-star accommodation in Mumbai’s commercial centre. Its modern facilities include a rooftop swimming pool, 3 dining options and free parking.'),
(20, 3, 'Ramee Guestline Hotel Dadar', 'Small Twin Room', '20.00', '/Image/3.jpg', '6 km from centre', 'Located in Dadar, Ramee Guestline Hotel offers 4-star accommodation in Mumbai’s commercial centre. Its modern facilities include a rooftop swimming pool, 3 dining options and free parking.'),
(21, 3, 'Ramee Guestline Hotel Dadar', 'Standard Double or Twin Room', '12.50', '/Image/3.jpg', '6 km from centre', 'Located in Dadar, Ramee Guestline Hotel offers 4-star accommodation in Mumbai’s commercial centre. Its modern facilities include a rooftop swimming pool, 3 dining options and free parking.'),
(22, 4, 'Hotel Orritel West', 'Double Room', '15.46', '/Image/4.jpg', '19 km from centre', 'Boasting a bar, garden and views of garden, Hotel Orritel West is set in Mumbai, 2.9 km from Juhu Beach.'),
(23, 4, 'Hotel Orritel West', 'Deluxe Triple Room', '15.60', '/Image/4.jpg', '19 km from centre', 'Boasting a bar, garden and views of garden, Hotel Orritel West is set in Mumbai, 2.9 km from Juhu Beach.'),
(24, 4, 'Hotel Orritel West', 'Standard Double Room', '12.45', '/Image/4.jpg', '19 km from centre', 'Boasting a bar, garden and views of garden, Hotel Orritel West is set in Mumbai, 2.9 km from Juhu Beach.'),
(25, 4, 'Hotel Orritel West', 'Deluxe Room', '15.00', '/Image/4.jpg', '19 km from centre', 'Boasting a bar, garden and views of garden, Hotel Orritel West is set in Mumbai, 2.9 km from Juhu Beach.'),
(26, 4, 'Hotel Orritel West', 'Classic Triple Room', '25.00', '/Image/4.jpg', '19 km from centre', 'Boasting a bar, garden and views of garden, Hotel Orritel West is set in Mumbai, 2.9 km from Juhu Beach.'),
(27, 4, 'Hotel Orritel West', 'Small Twin Room', '12.50', '/Image/4.jpg', '19 km from centre', 'Boasting a bar, garden and views of garden, Hotel Orritel West is set in Mumbai, 2.9 km from Juhu Beach.'),
(28, 4, 'Hotel Orritel West', 'Standard Double or Twin Room', '20.00', '/Image/4.jpg', '19 km from centre', 'Boasting a bar, garden and views of garden, Hotel Orritel West is set in Mumbai, 2.9 km from Juhu Beach.'),
(29, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Double Room', '14.50', '/Image/5.jpg', '2.7 km from beach', 'With city views, Mumbai House Luxury Apartments Santacruz East, Mumbai is situated in Mumbai and has a restaurant and room service. Free WiFi is available throughout the property.'),
(30, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Deluxe Triple Room', '16.50', '/Image/5.jpg', '2.7 km from beach', 'With city views, Mumbai House Luxury Apartments Santacruz East, Mumbai is situated in Mumbai and has a restaurant and room service. Free WiFi is available throughout the property.'),
(31, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Standard Double Room', '14.50', '/Image/5.jpg', '2.7 km from beach', 'With city views, Mumbai House Luxury Apartments Santacruz East, Mumbai is situated in Mumbai and has a restaurant and room service. Free WiFi is available throughout the property.'),
(32, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Deluxe Room', '15.00', '/Image/5.jpg', '2.7 km from beach', 'With city views, Mumbai House Luxury Apartments Santacruz East, Mumbai is situated in Mumbai and has a restaurant and room service. Free WiFi is available throughout the property.'),
(33, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Classic Triple Room', '14.50', '/Image/5.jpg', '2.7 km from beach', 'With city views, Mumbai House Luxury Apartments Santacruz East, Mumbai is situated in Mumbai and has a restaurant and room service. Free WiFi is available throughout the property.'),
(34, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Small Twin Room', '16.50', '/Image/5.jpg', '2.7 km from beach', 'With city views, Mumbai House Luxury Apartments Santacruz East, Mumbai is situated in Mumbai and has a restaurant and room service. Free WiFi is available throughout the property.'),
(35, 5, 'Mumbai House Luxury Apartments Santacruz East, Mumbai', 'Standard Double or Twin Room', '18.00', '/Image/5.jpg', '2.7 km from beach', 'With city views, Mumbai House Luxury Apartments Santacruz East, Mumbai is situated in Mumbai and has a restaurant and room service. Free WiFi is available throughout the property.'),
(36, 6, 'HOTEL ADARSH BAUG', 'Double Room', '12.50', '/Image/6.jpg', '2.2 km from centre', 'Boasting a terrace and views of city, HOTEL ADARSH BAUG is set in Mumbai, 2 km from Girgaum Chowpatty Beach.'),
(37, 6, 'HOTEL ADARSH BAUG', 'Deluxe Triple Room', '16.50', '/Image/6.jpg', '2.2 km from centre', 'Boasting a terrace and views of city, HOTEL ADARSH BAUG is set in Mumbai, 2 km from Girgaum Chowpatty Beach.'),
(38, 6, 'HOTEL ADARSH BAUG', 'Standard Double Room', '17.00', '/Image/6.jpg', '2.2 km from centre', 'Boasting a terrace and views of city, HOTEL ADARSH BAUG is set in Mumbai, 2 km from Girgaum Chowpatty Beach.'),
(39, 6, 'HOTEL ADARSH BAUG', 'Deluxe Room', '16.50', '/Image/6.jpg', '2.2 km from centre', 'Boasting a terrace and views of city, HOTEL ADARSH BAUG is set in Mumbai, 2 km from Girgaum Chowpatty Beach.'),
(40, 6, 'HOTEL ADARSH BAUG', 'Classic Triple Room', '12.50', '/Image/6.jpg', '2.2 km from centre', 'Boasting a terrace and views of city, HOTEL ADARSH BAUG is set in Mumbai, 2 km from Girgaum Chowpatty Beach.'),
(41, 6, 'HOTEL ADARSH BAUG', 'Small Twin Room', '15.00', '/Image/6.jpg', '2.2 km from centre', 'Boasting a terrace and views of city, HOTEL ADARSH BAUG is set in Mumbai, 2 km from Girgaum Chowpatty Beach.'),
(42, 6, 'HOTEL ADARSH BAUG', 'Standard Double or Twin Room', '20.00', '/Image/6.jpg', '2.2 km from centre', 'Boasting a terrace and views of city, HOTEL ADARSH BAUG is set in Mumbai, 2 km from Girgaum Chowpatty Beach.'),
(43, 7, 'Hotel Leafio Marigold-Near Airport', 'Double Room', '15.60', '/Image/7.jpg', '16.9 km from centre', 'Providing free WiFi, Hotel Leafio Marigold-Near Airport is located in Mumbai, within 5 km of Phoenix Market City Mall. Located around 6 km from Powai Lake, the hotel is also 7 km away from ISKCON.'),
(44, 7, 'Hotel Leafio Marigold-Near Airport', 'Deluxe Triple Room', '18.00', '/Image/7.jpg', '16.9 km from centre', 'Providing free WiFi, Hotel Leafio Marigold-Near Airport is located in Mumbai, within 5 km of Phoenix Market City Mall. Located around 6 km from Powai Lake, the hotel is also 7 km away from ISKCON.'),
(45, 7, 'Hotel Leafio Marigold-Near Airport', 'Standard Double Room', '16.50', '/Image/7.jpg', '16.9 km from centre', 'Providing free WiFi, Hotel Leafio Marigold-Near Airport is located in Mumbai, within 5 km of Phoenix Market City Mall. Located around 6 km from Powai Lake, the hotel is also 7 km away from ISKCON.'),
(46, 7, 'Hotel Leafio Marigold-Near Airport', 'Deluxe Room', '12.50', '/Image/7.jpg', '16.9 km from centre', 'Providing free WiFi, Hotel Leafio Marigold-Near Airport is located in Mumbai, within 5 km of Phoenix Market City Mall. Located around 6 km from Powai Lake, the hotel is also 7 km away from ISKCON.'),
(47, 7, 'Hotel Leafio Marigold-Near Airport', 'Classic Triple Room', '12.30', '/Image/7.jpg', '16.9 km from centre', 'Providing free WiFi, Hotel Leafio Marigold-Near Airport is located in Mumbai, within 5 km of Phoenix Market City Mall. Located around 6 km from Powai Lake, the hotel is also 7 km away from ISKCON.'),
(48, 7, 'Hotel Leafio Marigold-Near Airport', 'Small Twin Room', '12.30', '/Image/7.jpg', '16.9 km from centre', 'Providing free WiFi, Hotel Leafio Marigold-Near Airport is located in Mumbai, within 5 km of Phoenix Market City Mall. Located around 6 km from Powai Lake, the hotel is also 7 km away from ISKCON.'),
(49, 7, 'Hotel Leafio Marigold-Near Airport', 'Standard Double or Twin Room', '20.00', '/Image/7.jpg', '16.9 km from centre', 'Providing free WiFi, Hotel Leafio Marigold-Near Airport is located in Mumbai, within 5 km of Phoenix Market City Mall. Located around 6 km from Powai Lake, the hotel is also 7 km away from ISKCON.'),
(50, 8, 'WishTree Apartment kalina Bkc', 'Double Room', '16.00', '/Image/8.jpg', '12.5 km from centre', 'Providing garden views, WishTree Apartment kalina Bkc in Mumbai provides accommodation, a restaurant, a shared lounge and a garden.'),
(51, 8, 'WishTree Apartment kalina Bkc', 'Deluxe Triple Room', '15.00', '/Image/8.jpg', '12.5 km from centre', 'Providing garden views, WishTree Apartment kalina Bkc in Mumbai provides accommodation, a restaurant, a shared lounge and a garden.'),
(52, 8, 'WishTree Apartment kalina Bkc', 'Standard Double Room', '12.30', '/Image/8.jpg', '12.5 km from centre', 'Providing garden views, WishTree Apartment kalina Bkc in Mumbai provides accommodation, a restaurant, a shared lounge and a garden.'),
(53, 8, 'WishTree Apartment kalina Bkc', 'Deluxe Room', '12.30', '/Image/8.jpg', '12.5 km from centre', 'Providing garden views, WishTree Apartment kalina Bkc in Mumbai provides accommodation, a restaurant, a shared lounge and a garden.'),
(54, 8, 'WishTree Apartment kalina Bkc', 'Classic Triple Room', '16.50', '/Image/8.jpg', '12.5 km from centre', 'Providing garden views, WishTree Apartment kalina Bkc in Mumbai provides accommodation, a restaurant, a shared lounge and a garden.'),
(55, 8, 'WishTree Apartment kalina Bkc', 'Small Twin Room', '18.40', '/Image/8.jpg', '12.5 km from centre', 'Providing garden views, WishTree Apartment kalina Bkc in Mumbai provides accommodation, a restaurant, a shared lounge and a garden.'),
(56, 8, 'WishTree Apartment kalina Bkc', 'Standard Double or Twin Room', '15.20', '/Image/8.jpg', '12.5 km from centre', 'Providing garden views, WishTree Apartment kalina Bkc in Mumbai provides accommodation, a restaurant, a shared lounge and a garden.'),
(57, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Double Room', '16.50', '/Image/9.jpg', '3.8 km from centre', 'Situated in Mumbai’s business district, InterContinental Marine Drive boasts unparallel views of the Arabian Sea.'),
(58, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Deluxe Triple Room', '12.00', '/Image/9.jpg', '3.8 km from centre', 'Situated in Mumbai’s business district, InterContinental Marine Drive boasts unparallel views of the Arabian Sea.'),
(59, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Standard Double Room', '14.50', '/Image/9.jpg', '3.8 km from centre', 'Situated in Mumbai’s business district, InterContinental Marine Drive boasts unparallel views of the Arabian Sea.'),
(60, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Deluxe Room', '16.50', '/Image/9.jpg', '3.8 km from centre', 'Situated in Mumbai’s business district, InterContinental Marine Drive boasts unparallel views of the Arabian Sea.'),
(61, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Classic Triple Room', '14.50', '/Image/9.jpg', '3.8 km from centre', 'Situated in Mumbai’s business district, InterContinental Marine Drive boasts unparallel views of the Arabian Sea.'),
(62, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Small Twin Room', '16.50', '/Image/9.jpg', '3.8 km from centre', 'Situated in Mumbai’s business district, InterContinental Marine Drive boasts unparallel views of the Arabian Sea.'),
(63, 9, 'InterContinental Marine Drive Mumbai, an IHG Hotel', 'Standard Double or Twin Room', '16.50', '/Image/9.jpg', '3.8 km from centre', 'Situated in Mumbai’s business district, InterContinental Marine Drive boasts unparallel views of the Arabian Sea.'),
(64, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Double Room', '15.00', '/Image/10.jpg', '3.9 km from centre', 'Located in Parel Mumbai, a Grandeur, 5-star ITC Grand Central, A Luxury Collection Hotel in Mumbai features exquisite rooms and suites with city views.'),
(65, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Deluxe Triple Room', '15.20', '/Image/10.jpg', '3.9 km from centre', 'Located in Parel Mumbai, a Grandeur, 5-star ITC Grand Central, A Luxury Collection Hotel in Mumbai features exquisite rooms and suites with city views.'),
(66, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Standard Double Room', '15.80', '/Image/10.jpg', '3.9 km from centre', 'Located in Parel Mumbai, a Grandeur, 5-star ITC Grand Central, A Luxury Collection Hotel in Mumbai features exquisite rooms and suites with city views.'),
(67, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Deluxe Room', '16.50', '/Image/10.jpg', '3.9 km from centre', 'Located in Parel Mumbai, a Grandeur, 5-star ITC Grand Central, A Luxury Collection Hotel in Mumbai features exquisite rooms and suites with city views.'),
(68, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Classic Triple Room', '20.00', '/Image/10.jpg', '3.9 km from centre', 'Located in Parel Mumbai, a Grandeur, 5-star ITC Grand Central, A Luxury Collection Hotel in Mumbai features exquisite rooms and suites with city views.'),
(69, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Small Twin Room', '15.00', '/Image/10.jpg', '3.9 km from centre', 'Located in Parel Mumbai, a Grandeur, 5-star ITC Grand Central, A Luxury Collection Hotel in Mumbai features exquisite rooms and suites with city views.'),
(70, 10, 'ITC Grand Central, a Luxury Collection Hotel, Mumbai', 'Standard Double or Twin Room', '25.00', '/Image/10.jpg', '3.9 km from centre', 'Located in Parel Mumbai, a Grandeur, 5-star ITC Grand Central, A Luxury Collection Hotel in Mumbai features exquisite rooms and suites with city views.');
COMMIT;
