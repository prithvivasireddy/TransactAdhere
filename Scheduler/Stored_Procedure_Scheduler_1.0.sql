CREATE OR REPLACE PACKAGE token_validation_package
IS
PROCEDURE deactivate_token_on_token_validation_date;
END token_validation_package;

CREATE OR REPLACE PACKAGE BODY token_validation_package
IS
PROCEDURE deactivate_token_on_token_validation_date
AS 
date_a date;
BEGIN
    SELECT 
    to_date(to_char( to_date(CURRENT_DATE, 'DD-MM-YYYY'), 'DD') || '-' || 
    to_char(to_date(CURRENT_DATE, 'DD-MM-YYYY'),'MON') || '-' || 
    to_char(to_date(CURRENT_DATE, 'DD-MM-YYYY'),'YY'))
    INTO date_a
    FROM DUAL;

    UPDATE
    sender_receiver_payment_token
    SET
    token_status = 'INACTIVE'
    WHERE
    token_validation_end_date <= date_a;
END deactivate_token_on_token_validation_date;
END token_validation_package;



BEGIN
DBMS_SCHEDULER.CREATE_JOB (
         job_name           => 'PACKAGE_SCHEDULER_DEACTIVATE_TOKEN_ON_TOKEN_VALIDATION_DATE',
         job_type           => 'STORED_PROCEDURE',
         job_action         => 'token_validation_package.DEACTIVATE_TOKEN_ON_TOKEN_VALIDATION_DATE',
         start_date         => current_timestamp,
         repeat_interval    => 'FREQ=DAILY;',
         enabled            => true);
END;

