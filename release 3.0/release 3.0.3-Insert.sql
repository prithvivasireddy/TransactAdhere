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



