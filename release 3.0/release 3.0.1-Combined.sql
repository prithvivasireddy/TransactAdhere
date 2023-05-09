SET SERVEROUTPUT on;

DECLARE
    
    customer_table_count number;
    customer_address_table_count number;
    business_detail_table_count number;
    bank_table_count number;
    customer_bank_account_table_count number;
    sender_receiver_payment_token_table_count number;
    transaction_table_count number;
    
    customer_id_seq_count number;
    bank_id_seq_count number;
    bank_account_number_seq_count number;
    token_id_seq_count number;
    transaction_id_seq_count number;
    
BEGIN

    select count(*)
    into customer_table_count from user_tables
    where table_name = 'CUSTOMER';
    
    select count(*)
    into customer_address_table_count from user_tables
    where table_name = 'CUSTOMER_ADDRESS';
    
    select count(*)
    into business_detail_table_count from user_tables
    where table_name = 'BUSINESS_DETAIL';
    
    select count(*)
    into bank_table_count from user_tables
    where table_name = 'BANK';
    
    select count(*)
    into customer_bank_account_table_count from user_tables
    where table_name = 'CUSTOMER_BANK_ACCOUNT';
    
    select count(*)
    into sender_receiver_payment_token_table_count from user_tables
    where table_name = 'SENDER_RECEIVER_PAYMENT_TOKEN';
    
    select count(*)
    into transaction_table_count from user_tables
    where table_name = 'TRANSACTION';
    
    select count(*)
    into customer_id_seq_count from user_sequences
    where sequence_name = 'CUSTOMER_ID_SEQ';
    
    select count(*)
    into bank_id_seq_count from user_sequences
    where sequence_name = 'BANK_ID_SEQ';
    
    select count(*)
    into bank_account_number_seq_count from user_sequences
    where sequence_name = 'BANK_ACCOUNT_NUMBER_SEQ';
    
    select count(*)
    into token_id_seq_count from user_sequences
    where sequence_name = 'TOKEN_ID_SEQ';
    
    select count(*)
    into transaction_id_seq_count from user_sequences
    where sequence_name = 'TRANSACTION_ID_SEQ';


    IF(transaction_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE TRANSACTION'; END IF;
    IF(sender_receiver_payment_token_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE SENDER_RECEIVER_PAYMENT_TOKEN'; END IF;
    IF(customer_bank_account_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER_BANK_ACCOUNT'; END IF;
    IF(bank_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE BANK'; END IF;
    IF(business_detail_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE BUSINESS_DETAIL'; END IF;
    IF(customer_address_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER_ADDRESS'; END IF;
    IF(customer_table_count > 0) THEN EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER'; END IF;

    IF(customer_id_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE CUSTOMER_ID_SEQ'; END IF;
    IF(bank_id_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE BANK_ID_SEQ'; END IF;
    IF(bank_account_number_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE BANK_ACCOUNT_NUMBER_SEQ'; END IF;
    IF(token_id_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE TOKEN_ID_SEQ'; END IF;
    IF(transaction_id_seq_count > 0) THEN EXECUTE IMMEDIATE 'DROP SEQUENCE TRANSACTION_ID_SEQ'; END IF;

END;
/

CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR2(30) NOT NULL,
    LAST_NAME VARCHAR2(30) NOT NULL,
    DATE_OF_BIRTH DATE NOT NULL,
    SSN INT NOT NULL,
    EMAIL VARCHAR2(255) NOT NULL UNIQUE,
    TYPE_OF_USER CHAR(10) NOT NULL,
    STATUS CHAR(10) NOT NULL,
    PHONE_NO INT UNIQUE NOT NULL
);

CREATE TABLE CUSTOMER_ADDRESS (
    CUSTOMER_ID NOT NULL REFERENCES CUSTOMER ON DELETE CASCADE,
    APPARTMENT VARCHAR2(10) NOT NULL,
    STREET VARCHAR2(30) NOT NULL,
    CITY VARCHAR2(20) NOT NULL,
    STATE VARCHAR2(20) NOT NULL,
    ZIPCODE VARCHAR2(10) NOT NULL
);

CREATE TABLE BUSINESS_DETAIL (
    CUSTOMER_ID NOT NULL REFERENCES CUSTOMER ON DELETE CASCADE,
    BUSINESS_NAME VARCHAR2(50) NOT NULL,
    BUSINESS_REGISTRATION_NUMBER VARCHAR2(20) UNIQUE NOT NULL
);

CREATE TABLE BANK (
    BANK_ID INT PRIMARY KEY,
    BANK_NAME VARCHAR2(50) NOT NULL,
    BANK_CONTACT_FIRST_NAME VARCHAR2(30) NOT NULL,
    BANK_CONTACT_LAST_NAME VARCHAR2(30) NOT NULL,
    BANK_CUSTOMER_SUPPORT_EMAIL VARCHAR2(255) NOT NULL UNIQUE,
    BANK_CUSTOMER_SUPPORT_NUMBER INT UNIQUE NOT NULL
);


CREATE TABLE CUSTOMER_BANK_ACCOUNT (
    BANK_ACCOUNT_NUMBER INT PRIMARY KEY,
    CUSTOMER_ID NOT NULL REFERENCES CUSTOMER ON DELETE CASCADE,
    BANK_ID NOT NULL REFERENCES BANK ON DELETE CASCADE,
    ACCOUNT_CREATION_DATE DATE NOT NULL,
    ACCOUNT_STATUS CHAR(10) NOT NULL
);

CREATE TABLE SENDER_RECEIVER_PAYMENT_TOKEN (
    TOKEN_ID INT PRIMARY KEY,
    SENDER_BANK_ACCOUNT_NUMBER NOT NULL REFERENCES CUSTOMER_BANK_ACCOUNT ON DELETE CASCADE,
    RECEIVER_BANK_ACCOUNT_NUMBER NOT NULL REFERENCES CUSTOMER_BANK_ACCOUNT ON DELETE CASCADE,
    TOKEN_CREATION_DATE DATE NOT NULL,
    TOKEN_STATUS CHAR(10) NOT NULL,
    TOKEN_VALIDATION_END_DATE DATE NOT NULL
);


CREATE TABLE TRANSACTION (
    TRANSACTION_ID INT PRIMARY KEY,
    SENDER_RECEIVER_PAYMENT_TOKEN_ID NOT NULL REFERENCES SENDER_RECEIVER_PAYMENT_TOKEN ON DELETE CASCADE,
    BUSINESS_TRANSACTION_ID VARCHAR2(50) NOT NULL UNIQUE,
    TRANSACTION_DATE DATE NOT NULL,
    TRANSACTION_AMOUNT INT NOT NULL,
    TRANSACTION_STATUS CHAR(10) NOT NULL,
    TRANSACTION_DESCRIPTION VARCHAR2(100)
);

CREATE SEQUENCE CUSTOMER_ID_SEQ
ORDER;

CREATE SEQUENCE BANK_ID_SEQ
ORDER;

CREATE SEQUENCE BANK_ACCOUNT_NUMBER_SEQ
START WITH     1000
ORDER;

CREATE SEQUENCE TOKEN_ID_SEQ
START WITH     1000
ORDER;

CREATE SEQUENCE TRANSACTION_ID_SEQ
START WITH     1000
ORDER;




INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'JOHN','SMITH','20-FEB-1969', 88762673, 'JOHN.SMITH@NEU.EDU', 'INDIVIDUAL', 'ACTIVE', 637373737);



INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'TOM','JONES','12-MAR-1988', 21212189, 'TOM.JONES@NEU.EDU', 'INDIVIDUAL', 'INACTIVE', 876537818);



INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'JAMES','WILLIAMSON','07-FEB-1996', 767366362, 'JAMES.WILLIAMSON@NEU.EDU', 'INDIVIDUAL', 'ACTIVE', 783728732);



INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'TRESSY','DSOUZA','06-JUN-1990', 8988221212, 'TRESSY.DSOUZA@NEU.EDU', 'INDIVIDUAL', 'INACTIVE', 653535262);



INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'TIMMOTHY','JACKSON','23-JUN-1982', 8995486632, 'TIMOTHY.JACKSON@NEU.EDU', 'INDIVIDUAL', 'ACTIVE', 653515897);


INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'JOHNSON','SMITH','20-FEB-1969', 88762673, 'JOHNSON.SMITH@NEU.EDU', 'BUSINESS', 'INACTIVE', 637373738);



INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'TOMSON','JONES','12-MAR-1988', 21212189, 'TOMSON.JONES@NEU.EDU', 'BUSINESS', 'ACTIVE', 876537819);



INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'JAMESON','WILLIAMSON','07-FEB-1996', 767366362, 'JAMESON.WILLIAMSON@NEU.EDU', 'BUSINESS', 'INACTIVE', 783728733);



INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'TRESSYSON','DSOUZA','06-JUN-1990', 8988221212, 'TRESSYSON.DSOUZA@NEU.EDU', 'BUSINESS', 'ACTIVE', 653535263);



INSERT INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, SSN, EMAIL, TYPE_OF_USER, STATUS, PHONE_NO)
VALUES (CUSTOMER_ID_SEQ.NEXTVAL, 'TIMMOTHYSON','JACKSON','23-JUN-1982', 8995486632, 'TIMOTHYSON.JACKSON@NEU.EDU', 'BUSINESS', 'INACTIVE', 653515898);



--
insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (1, 2, '24 Brook Street', 'Boston', 'MA', 02445);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (2, 4, '1126 Boylston Street', 'Boston', 'MA', 02845);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (3, 7, '89 Peter Avenue', 'New York', 'NY', 02957);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (4, 2, '67 Commonwealth Avenue', 'Los Angeles', 'CA', 02365);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (5, 15, '15 Malibu Street', 'Los Angeles', 'CA', 025314);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (6, 2, '25 Brook Street', 'Boston', 'MA', 02445);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (7, 4, '1127 Boylston Street', 'Boston', 'MA', 02845);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (8, 7, '90 Peter Avenue', 'New York', 'NY', 02957);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (9, 2, '68 Commonwealth Avenue', 'Los Angeles', 'CA', 02365);



insert into customer_address (customer_id, appartment, street, city, state, zipcode)
values (10, 15, '20 Malibu Street', 'Los Angeles', 'CA', 025314);
--





insert into business_detail (CUSTOMER_ID, BUSINESS_NAME, BUSINESS_REGISTRATION_NUMBER)
values (6, 'TARGET', 546);

insert into business_detail (CUSTOMER_ID, BUSINESS_NAME, BUSINESS_REGISTRATION_NUMBER)
values (7, 'AMAZON', 547);

insert into business_detail (CUSTOMER_ID, BUSINESS_NAME, BUSINESS_REGISTRATION_NUMBER)
values (8, 'WHOLEFOOD', 548);

insert into business_detail (CUSTOMER_ID, BUSINESS_NAME, BUSINESS_REGISTRATION_NUMBER)
values (9, 'PRICERITE', 549);

insert into business_detail (CUSTOMER_ID, BUSINESS_NAME, BUSINESS_REGISTRATION_NUMBER)
values (10, 'COSCO', 550);







insert into bank (bank_id, bank_name, bank_contact_first_name, bank_contact_last_name, bank_customer_support_email, bank_customer_support_number)
values (bank_id_seq.nextval, 'Santander Bank', 'Jack', 'Smith', 'support@santander.com', 8756732415);



insert into bank (bank_id, bank_name, bank_contact_first_name, bank_contact_last_name, bank_customer_support_email, bank_customer_support_number)
values (bank_id_seq.nextval, 'Chase Bank', 'Anita', 'Deb', 'support@chase.com', 8574536789);



insert into bank (bank_id, bank_name, bank_contact_first_name, bank_contact_last_name, bank_customer_support_email, bank_customer_support_number)
values (bank_id_seq.nextval, 'Bank of America', 'Dhawal', 'Gandi', 'support@bofa.com', 6176258907);



insert into bank (bank_id, bank_name, bank_contact_first_name, bank_contact_last_name, bank_customer_support_email, bank_customer_support_number)
values (bank_id_seq.nextval, 'National Bank', 'Prithvi', 'Negi', 'support@nationalbank.com', 8675642908);




insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 1, 2, '16-FEB-2015', 'ACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 2, 3, '05-JUN-2012', 'INACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 3, 4, '03-MAR-2013', 'ACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 4, 1, '13-DEC-2017', 'INACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 5, 2, '28-AUG-2015', 'ACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 6, 2, '16-FEB-2015', 'INACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 7, 3, '05-JUN-2012', 'ACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 8, 4, '03-MAR-2013', 'INACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 9, 1, '13-DEC-2017', 'ACTIVE');



insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
values (BANK_ACCOUNT_NUMBER_SEQ.nextval, 10, 2, '28-AUG-2015', 'INACTIVE');









insert into sender_receiver_payment_token (token_id, sender_bank_account_number, receiver_bank_account_number, token_creation_date, token_status, token_validation_end_date)
values (token_id_seq.nextval, 1000, 1002, '18-JAN-2019', 'ACTIVE', '18-JAN-2020');



insert into sender_receiver_payment_token (token_id, sender_bank_account_number, receiver_bank_account_number, token_creation_date, token_status, token_validation_end_date)
values (token_id_seq.nextval, 1000, 1004, '25-APR-2011', 'ACTIVE', '25-APR-2011');



insert into sender_receiver_payment_token (token_id, sender_bank_account_number, receiver_bank_account_number, token_creation_date, token_status, token_validation_end_date)
values (token_id_seq.nextval, 1002, 1006, '21-SEP-2016', 'ACTIVE', '21-SEP-2017');



insert into sender_receiver_payment_token (token_id, sender_bank_account_number, receiver_bank_account_number, token_creation_date, token_status, token_validation_end_date)
values (token_id_seq.nextval, 1006, 1008, '18-JAN-2019', 'ACTIVE', '18-JAN-2020');



insert into sender_receiver_payment_token (token_id, sender_bank_account_number, receiver_bank_account_number, token_creation_date, token_status, token_validation_end_date)
values (token_id_seq.nextval, 1003, 1000, '25-APR-2011', 'INACTIVE', '25-APR-2011');



insert into sender_receiver_payment_token (token_id, sender_bank_account_number, receiver_bank_account_number, token_creation_date, token_status, token_validation_end_date)
values (token_id_seq.nextval, 1008, 1000, '21-SEP-2016', 'ACTIVE', '21-SEP-2017');


insert into sender_receiver_payment_token (token_id, sender_bank_account_number, receiver_bank_account_number, token_creation_date, token_status, token_validation_end_date)
values (token_id_seq.nextval, 1002, 1008, '18-JAN-2019', 'ACTIVE', '18-JAN-2020');








insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1000, 'AA78DH87', '30-MAY-2019', 100000, 'COMPLETED', 'Rent payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1000, 'HW89KK09', '11-JUL-2011', 19800, 'COMPLETED', 'Gas payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1002, 'SE09OK98', '10-MAY-2017', 1000, 'EXPIRED', 'Phone EMI');

insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1002, 'AA78DDSAH87', '30-MAY-2019', 100000, 'EXPIRED', 'Rent payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1005, 'HW89KKQW09', '11-JUL-2011', 19800, 'EXPIRED', 'Gas payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1005, 'SE09OKEWQ98', '10-MAY-2017', 1000, 'EXPIRED', 'Phone EMI');

insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1005, 'AA78DSADH87', '30-MAY-2019', 100000, 'EXPIRED', 'Rent payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1003, 'HW8DAS9KK09', '11-JUL-2011', 19800, 'EXPIRED', 'Gas payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1003, 'SE09ASDOK98', '10-MAY-2017', 1000, 'EXPIRED', 'Phone EMI');

insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1003, 'AA78ASDDH87', '30-MAY-2019', 100000, 'EXPIRED', 'Rent payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1001, 'HW89KKSAD09', '11-JUL-2011', 19800, 'EXPIRED', 'Gas payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1001, 'SE09OSADK98', '10-MAY-2017', 1000, 'EXPIRED', 'Phone EMI');


insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1001, 'AA78DHASD87', '30-MAY-2019', 100000, 'EXPIRED', 'Rent payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1002, 'HW89KSADK09', '11-JUL-2011', 19800, 'EXPIRED', 'Gas payment');



insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1002, 'SE09OSADSAK98', '10-MAY-2017', 1000, 'EXPIRED', 'Phone EMI');


insert into transaction (transaction_id, sender_receiver_payment_token_id, business_transaction_id, transaction_date, transaction_amount, transaction_status, transaction_description)
values (transaction_id_seq.nextval, 1002, 'AA78DASDH87', '30-MAY-2019', 100000, 'EXPIRED', 'Rent payment');



--Number of bank accounts created in a month for a specific bank
SELECT B.BANK_NAME, TO_CHAR(CBA.ACCOUNT_CREATION_DATE, 'MONTH') ACCOUNT_CREATION_MONTH, COUNT(CBA.BANK_ACCOUNT_NUMBER) AS NO_OF_BANK_ACCOUNT
FROM CUSTOMER_BANK_ACCOUNT CBA JOIN BANK B ON CBA.BANK_ID = B.BANK_ID
GROUP BY B.BANK_NAME, TO_CHAR(CBA.ACCOUNT_CREATION_DATE, 'MONTH');

--Total money sent from and received for a bank account
WITH MONEY_SENT_FROM_BANK_ACCOUNT AS
( 
    SELECT CBA.BANK_ACCOUNT_NUMBER AS ACCOUNT_NUMBER, SUM(T.TRANSACTION_AMOUNT) AS SENT_AMOUNT 
    FROM CUSTOMER_BANK_ACCOUNT CBA, TRANSACTION T, SENDER_RECEIVER_PAYMENT_TOKEN SRPT
    WHERE CBA.BANK_ACCOUNT_NUMBER = SRPT.SENDER_BANK_ACCOUNT_NUMBER AND SRPT.TOKEN_ID = T.SENDER_RECEIVER_PAYMENT_TOKEN_ID GROUP BY CBA.BANK_ACCOUNT_NUMBER
),
MONEY_RECEIVED_FROM_BANK_ACCOUNT AS
(
    SELECT CBA.BANK_ACCOUNT_NUMBER AS ACCOUNT_NUMBER, SUM(T.TRANSACTION_AMOUNT) AS RECEIVED_AMOUNT 
    FROM CUSTOMER_BANK_ACCOUNT CBA, TRANSACTION T, SENDER_RECEIVER_PAYMENT_TOKEN SRPT
    WHERE CBA.BANK_ACCOUNT_NUMBER = SRPT.RECEIVER_BANK_ACCOUNT_NUMBER AND SRPT.TOKEN_ID = T.SENDER_RECEIVER_PAYMENT_TOKEN_ID GROUP BY CBA.BANK_ACCOUNT_NUMBER
)
SELECT CBA.BANK_ACCOUNT_NUMBER, MSFBA.SENT_AMOUNT AS MONEY_SENT, MRFBA.RECEIVED_AMOUNT AS MONEY_RECEIVED
FROM CUSTOMER_BANK_ACCOUNT CBA, MONEY_SENT_FROM_BANK_ACCOUNT MSFBA, MONEY_RECEIVED_FROM_BANK_ACCOUNT MRFBA
WHERE CBA.BANK_ACCOUNT_NUMBER = MSFBA.ACCOUNT_NUMBER AND CBA.BANK_ACCOUNT_NUMBER = MRFBA.ACCOUNT_NUMBER;
        
--State wise list of customers with active and inactive accounts
SELECT C.CUSTOMER_ID, C.FIRST_NAME || ' ' || C.LAST_NAME AS CUSTOMER_NAME, CA.STATE, C.STATUS 
FROM CUSTOMER C JOIN CUSTOMER_ADDRESS CA ON C.CUSTOMER_ID = CA.CUSTOMER_ID
ORDER BY CA.STATE, C.STATUS; 

--Number of transactions that were done business to business, business to individual, individual to business, individual to individual
WITH SENDER_TYPE_MAPPING AS
(
    SELECT T.TRANSACTION_ID AS TRANSID, C.TYPE_OF_USER AS SENDER_TYPE 
    FROM CUSTOMER C, CUSTOMER_BANK_ACCOUNT CBA, SENDER_RECEIVER_PAYMENT_TOKEN SRPT, TRANSACTION T
    WHERE T.SENDER_RECEIVER_PAYMENT_TOKEN_ID = SRPT.TOKEN_ID AND SRPT.SENDER_BANK_ACCOUNT_NUMBER = CBA.BANK_ACCOUNT_NUMBER AND CBA.CUSTOMER_ID = C.CUSTOMER_ID
),
    RECEIVER_TYPE_MAPPING AS
(
    SELECT T.TRANSACTION_ID AS TRANSID, C.TYPE_OF_USER AS RECEIVER_TYPE 
    FROM CUSTOMER C, CUSTOMER_BANK_ACCOUNT CBA, SENDER_RECEIVER_PAYMENT_TOKEN SRPT, TRANSACTION T
    WHERE T.SENDER_RECEIVER_PAYMENT_TOKEN_ID = SRPT.TOKEN_ID AND SRPT.RECEIVER_BANK_ACCOUNT_NUMBER = CBA.BANK_ACCOUNT_NUMBER AND CBA.CUSTOMER_ID = C.CUSTOMER_ID
),
    TRANASCTION_TYPE_MAPPING AS
(
    SELECT STM.TRANSID AS TRANSID, CASE WHEN STM.SENDER_TYPE = 'INDIVIDUAL' AND RTM.RECEIVER_TYPE = 'INDIVIDUAL' THEN 'INDIVIDUAL TO INDIVIDUAL'
                                        WHEN STM.SENDER_TYPE = 'INDIVIDUAL' AND RTM.RECEIVER_TYPE = 'BUSINESS' THEN 'INDIVIDUAL TO BUSINESS'
                                        WHEN STM.SENDER_TYPE = 'BUSINESS' AND RTM.RECEIVER_TYPE = 'INDIVIDUAL' THEN 'BUSINESS TO INDIVIDUAL'
                                        WHEN STM.SENDER_TYPE = 'BUSINESS' AND RTM.RECEIVER_TYPE = 'BUSINESS' THEN 'BUSINESS TO BUSINESS'
                                   END AS TRASNACTION_TYPE
    FROM SENDER_TYPE_MAPPING STM, RECEIVER_TYPE_MAPPING RTM 
    WHERE STM.TRANSID = RTM.TRANSID
)
SELECT TTM.TRASNACTION_TYPE, COUNT(TTM.TRANSID) FROM TRANASCTION_TYPE_MAPPING TTM GROUP BY TTM.TRASNACTION_TYPE;


--[Internal view] Masking token ID, account number for customer support representative
SELECT  '*****' || SUBSTR(TO_CHAR(SRPT.TOKEN_ID),-4,4) AS TOKEN_ID, 
        '*****' || SUBSTR(TO_CHAR(SRPT.SENDER_BANK_ACCOUNT_NUMBER),-4,4) AS SENDER_BANK_ACCOUNT_NUMBER, 
        SC.FIRST_NAME || ' ' || SC.LAST_NAME AS SENDER_NAME, 
        '*****' || SUBSTR(TO_CHAR(SRPT.RECEIVER_BANK_ACCOUNT_NUMBER),-4,4) AS RECEIVER_BANK_ACCOUNT_NUMBER, 
        RC.FIRST_NAME || ' ' || RC.LAST_NAME AS RECEIVER_NAME, 
        SRPT.TOKEN_STATUS AS TOKEN_STATUS
FROM SENDER_RECEIVER_PAYMENT_TOKEN SRPT
    JOIN CUSTOMER_BANK_ACCOUNT SCBA ON SRPT.SENDER_BANK_ACCOUNT_NUMBER = SCBA.BANK_ACCOUNT_NUMBER
    JOIN CUSTOMER SC ON SCBA.CUSTOMER_ID = SC.CUSTOMER_ID
    JOIN CUSTOMER_BANK_ACCOUNT RCBA ON SRPT.RECEIVER_BANK_ACCOUNT_NUMBER = RCBA.BANK_ACCOUNT_NUMBER
    JOIN CUSTOMER RC ON RCBA.CUSTOMER_ID = RC.CUSTOMER_ID;