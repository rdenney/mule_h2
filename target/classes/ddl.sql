CREATE TABLE IF NOT EXISTS accounts (
  id int  PRIMARY KEY AUTO_INCREMENT,
  first_name  VARCHAR(40) NOT NULL,
  middle_name VARCHAR(40) NULL,
  last_name  VARCHAR(40) NOT NULL,
  email VARCHAR(80) NULL,
  phone VARCHAR(16) NULL,
  updated DATETIME NOT NULL 
)
AS SELECT
	 id,
     first_name,
     middle_name,
     last_name,
     email,
     phone,
     updated
   FROM CSVREAD('classpath:accounts.csv');
 
 CREATE TABLE IF NOT EXISTS addresses (
  id int  PRIMARY KEY AUTO_INCREMENT,
  account_id INT NOT NULL REFERENCES accounts(id),
  address  VARCHAR(40) NOT NULL,
  city VARCHAR(40) NOT NULL,
  state  VARCHAR(40) NOT NULL,
  postal INT NOT NULL,
  is_primary char NOT NULL
)
AS SELECT
	 id,
     account_id,
     address,
     city,
     state,
     postal,
     is_primary
   FROM CSVREAD('classpath:addresses.csv');