set serveroutput on size 30000;

CREATE OR REPLACE PACKAGE BANK_ACCOUNT_PACKAGE AS 
   -- INSERT A TRANSACTION
   PROCEDURE ACCOUNTINSERT(
        P_CUSTOMER_ID IN CUSTOMER_BANK_ACCOUNT.CUSTOMER_ID%TYPE,
        P_BANK_ID IN CUSTOMER_BANK_ACCOUNT.BANK_ID%TYPE,
        P_ACCOUNT_STATUS IN CUSTOMER_BANK_ACCOUNT.ACCOUNT_STATUS%TYPE);
    
    -- UPDATE A TRANSACTION
    PROCEDURE ACCOUNTUPDATE(
        P_BANK_ACCOUNT_NUMBER IN CUSTOMER_BANK_ACCOUNT.BANK_ACCOUNT_NUMBER%TYPE,
        P_ACCOUNT_STATUS IN CUSTOMER_BANK_ACCOUNT.ACCOUNT_STATUS%TYPE);
    
END BANK_ACCOUNT_PACKAGE;
/

CREATE OR REPLACE PACKAGE BODY BANK_ACCOUNT_PACKAGE AS 
    PROCEDURE ACCOUNTINSERT(
        P_CUSTOMER_ID IN CUSTOMER_BANK_ACCOUNT.CUSTOMER_ID%TYPE,
        P_BANK_ID IN CUSTOMER_BANK_ACCOUNT.BANK_ID%TYPE,
        P_ACCOUNT_STATUS IN CUSTOMER_BANK_ACCOUNT.ACCOUNT_STATUS%TYPE)
    IS
        P_CUSTOMER_STATUS CHAR(10);
        BANK_COUNT CHAR(10);
        ACCOUNT_COUNT INT;
        Fail EXCEPTION;
    BEGIN
    -- Verifying CUSTOMER AND BANK EXIST
        BEGIN
            SELECT STATUS INTO P_CUSTOMER_STATUS
            FROM CUSTOMER
            WHERE CUSTOMER_ID = P_CUSTOMER_ID;
        EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('ERROR ! CUSTOMER DOES NOT EXIST');
            RAISE FAIL;
        END;
        BEGIN
            SELECT COUNT(*) INTO BANK_COUNT
            FROM BANK
            WHERE BANK_ID = P_BANK_ID;
            
            IF BANK_COUNT < 1 
            THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! BANK DOES NOT EXIST');
                RAISE Fail;
            END IF;
        END;
    -- Verify that account already does not exist
        BEGIN
            SELECT COUNT(*) INTO ACCOUNT_COUNT
            FROM CUSTOMER_BANK_ACCOUNT
            WHERE CUSTOMER_ID = P_CUSTOMER_ID AND BANK_ID = P_BANK_ID;
            
            IF ACCOUNT_COUNT > 0 
            THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! ACCOUNT ALREADY EXIST BETWEEN CUSTOMER AND BANK ACCOUNT');
                RAISE Fail;
            END IF;
        END;
    -- Verifying CUSTOMER STATUS ACTIVE
        BEGIN
            IF P_CUSTOMER_STATUS = 'INACTIVE'
            THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! CUSTOMER is Inactive');
                RAISE Fail;
            END IF;  
        END;

        --Insert the transaction
        BEGIN 
            insert into customer_bank_account (bank_account_number, customer_id, bank_id, account_creation_date, account_status)
            values (BANK_ACCOUNT_NUMBER_SEQ.nextval, P_CUSTOMER_ID, P_BANK_ID, sysdate, P_ACCOUNT_STATUS);
        EXCEPTION 
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! Insertion Failed');
                RAISE Fail;
        END;
    EXCEPTION
        WHEN OTHERS THEN 
            NULL;
    END ACCOUNTINSERT;
    
    PROCEDURE ACCOUNTUPDATE(
        P_BANK_ACCOUNT_NUMBER IN CUSTOMER_BANK_ACCOUNT.BANK_ACCOUNT_NUMBER%TYPE,
        P_ACCOUNT_STATUS IN CUSTOMER_BANK_ACCOUNT.ACCOUNT_STATUS%TYPE)
    IS
        P_ACCOUNT_STATUS_OLD CHAR(10);
        Fail EXCEPTION;
    BEGIN
    -- Verifying THE ACCOUNT EXIST
        BEGIN
            SELECT ACCOUNT_STATUS INTO P_ACCOUNT_STATUS_OLD 
            FROM CUSTOMER_BANK_ACCOUNT
            WHERE BANK_ACCOUNT_NUMBER = P_BANK_ACCOUNT_NUMBER;
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! BANK_ACCOUNT_NUMBER NOT FOUND');
        END;
    -- Verifying THE UPDATE IS from VALID TRANSACTION STATE and in VALID TRANSACTION STATE
        BEGIN
            IF NOT ((P_ACCOUNT_STATUS_OLD = 'INACTIVE' AND P_ACCOUNT_STATUS = 'ACTIVE') OR (P_ACCOUNT_STATUS_OLD = 'ACTIVE' AND P_ACCOUNT_STATUS = 'INACTIVE'))
            THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! ACCOUNT IS NOT IN VALID STATE OR NEW STATE IS NOT VALID TO MAKE THE UPDATE');
                RAISE Fail;
            END IF;  
        END;
    -- UPDATING THE TRANSACTION
        BEGIN 
            UPDATE CUSTOMER_BANK_ACCOUNT 
            SET ACCOUNT_STATUS = P_ACCOUNT_STATUS
            WHERE BANK_ACCOUNT_NUMBER = P_BANK_ACCOUNT_NUMBER;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! UPDATION Failed');
                RAISE Fail;
        END;
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END ACCOUNTUPDATE;
END BANK_ACCOUNT_PACKAGE;