-- create the share object to which we will then add data to be shared. 
CREATE DATABASE C7_R1;

-- creation of a table which will hold the transaction data.
CREATE TABLE TRANSACTIONS
(
  TXN_ID STRING,
  TXN_DATE DATE,
  CUSTOMER_ID STRING,
  QUANTITY DECIMAL(20),
  PRICE DECIMAL(30,2),
  COUNTRY_CD STRING
);

--populate this table with thousand rows of dummy data 
INSERT INTO TRANSACTIONS
SELECT
    UUID_STRING() AS TXN_ID
    ,DATEADD(DAY,UNIFORM(1, 500, RANDOM()) * -1, '2020-10-15') AS TXN_DATE
    ,UUID_STRING() AS CUSTOMER_ID
    ,UNIFORM(1, 10, RANDOM()) AS QUANTITY
    ,UNIFORM(1, 200, RANDOM()) AS PRICE
    ,RANDSTR(2,RANDOM()) AS COUNTRY_CD
FROM TABLE(GENERATOR(ROWCOUNT => 1000));