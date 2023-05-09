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
