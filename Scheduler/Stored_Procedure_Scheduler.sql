CREATE OR REPLACE PROCEDURE deactivate_token_on_token_validation_date
AS 
date_a VARCHAR(20);
BEGIN
    SELECT 
    to_char( to_date(CURRENT_DATE, 'DD-MM-YYYY'), 'DD') || '-' || 
    to_char(to_date(CURRENT_DATE, 'DD-MM-YYYY'),'MON') || '-' || 
    to_char(to_date(CURRENT_DATE, 'DD-MM-YYYY'),'YY')
    INTO date_a
    FROM DUAL;

    UPDATE
    sender_receiver_payment_token
    SET
    token_status = 'INACTIVE'
    WHERE
    to_char(token_validation_end_date) = date_a;
END;


BEGIN
DBMS_SCHEDULER.CREATE_JOB (
         job_name           => 'SCHEDULER_DEACTIVATE_TOKEN_ON_TOKEN_VALIDATION_DATE',
         job_type           => 'STORED_PROCEDURE',
         job_action         => 'DEACTIVATE_TOKEN_ON_TOKEN_VALIDATION_DATE',
         start_date         => current_timestamp,
         repeat_interval    => 'FREQ=DAILY;',
         enabled            => true);
END;