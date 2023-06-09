set serveroutput on size 30000;

CREATE OR REPLACE PACKAGE BANK_PACKAGE AS 
   -- INSERT A TRANSACTION
   PROCEDURE BANKINSERT(
        P_BANK_NAME IN BANK.BANK_NAME%TYPE,
        P_BANK_CONTACT_FIRST_NAME IN BANK.BANK_CONTACT_FIRST_NAME%TYPE,
        P_BANK_CONTACT_LAST_NAME IN BANK.BANK_CONTACT_LAST_NAME%TYPE,
        P_BANK_CUSTOMER_SUPPORT_EMAIL IN BANK.BANK_CUSTOMER_SUPPORT_EMAIL%TYPE,
        P_BANK_CUSTOMER_SUPPORT_NUMBER IN BANK.BANK_CUSTOMER_SUPPORT_NUMBER%TYPE);
    
    -- UPDATE A TRANSACTION
    PROCEDURE BANKUPDATE(
        P_BANK_ID IN BANK.BANK_ID%TYPE,
        P_BANK_NAME IN BANK.BANK_NAME%TYPE DEFAULT NULL,
        P_BANK_CONTACT_FIRST_NAME IN BANK.BANK_CONTACT_FIRST_NAME%TYPE DEFAULT NULL,
        P_BANK_CONTACT_LAST_NAME IN BANK.BANK_CONTACT_LAST_NAME%TYPE DEFAULT NULL,
        P_BANK_CUSTOMER_SUPPORT_EMAIL IN BANK.BANK_CUSTOMER_SUPPORT_EMAIL%TYPE DEFAULT NULL,
        P_BANK_CUSTOMER_SUPPORT_NUMBER IN BANK.BANK_CUSTOMER_SUPPORT_NUMBER%TYPE DEFAULT NULL);
    
END BANK_PACKAGE;
/

CREATE OR REPLACE PACKAGE BODY BANK_PACKAGE AS 
    PROCEDURE BANKINSERT(
        P_BANK_NAME IN BANK.BANK_NAME%TYPE,
        P_BANK_CONTACT_FIRST_NAME IN BANK.BANK_CONTACT_FIRST_NAME%TYPE,
        P_BANK_CONTACT_LAST_NAME IN BANK.BANK_CONTACT_LAST_NAME%TYPE,
        P_BANK_CUSTOMER_SUPPORT_EMAIL IN BANK.BANK_CUSTOMER_SUPPORT_EMAIL%TYPE,
        P_BANK_CUSTOMER_SUPPORT_NUMBER IN BANK.BANK_CUSTOMER_SUPPORT_NUMBER%TYPE)
    IS
        EMAIL_COUNT INT;
        Fail EXCEPTION;
    BEGIN
    -- Verifying BANK_CUSTOMER_SUPPORT_EMAIL IS UNIQUE
        BEGIN
            SELECT COUNT(*) INTO EMAIL_COUNT
            FROM BANK
            WHERE BANK_CUSTOMER_SUPPORT_EMAIL = P_BANK_CUSTOMER_SUPPORT_EMAIL;
            IF EMAIL_COUNT > 0 
            THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! BANK ALREADY EXIST');
                RAISE Fail;
            END IF;
        END;
        --Insert the BANK
        BEGIN 
            insert into bank (bank_id, bank_name, bank_contact_first_name, bank_contact_last_name, bank_customer_support_email, bank_customer_support_number)
            values (bank_id_seq.nextval, P_BANK_NAME, P_BANK_CONTACT_FIRST_NAME, P_BANK_CONTACT_LAST_NAME, P_BANK_CUSTOMER_SUPPORT_EMAIL, P_BANK_CUSTOMER_SUPPORT_NUMBER);
        EXCEPTION 
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! Insertion Failed');
                RAISE Fail;
        END;
    EXCEPTION
        WHEN OTHERS THEN 
            NULL;
    END BANKINSERT;
    
    PROCEDURE BANKUPDATE(
        P_BANK_ID IN BANK.BANK_ID%TYPE,
        P_BANK_NAME IN BANK.BANK_NAME%TYPE DEFAULT NULL,
        P_BANK_CONTACT_FIRST_NAME IN BANK.BANK_CONTACT_FIRST_NAME%TYPE DEFAULT NULL,
        P_BANK_CONTACT_LAST_NAME IN BANK.BANK_CONTACT_LAST_NAME%TYPE DEFAULT NULL,
        P_BANK_CUSTOMER_SUPPORT_EMAIL IN BANK.BANK_CUSTOMER_SUPPORT_EMAIL%TYPE DEFAULT NULL,
        P_BANK_CUSTOMER_SUPPORT_NUMBER IN BANK.BANK_CUSTOMER_SUPPORT_NUMBER%TYPE DEFAULT NULL)
    IS
        P_BANK_OLD BANK%ROWTYPE;
        EMAIL_COUNT INT;
        F_BANK_NAME BANK.BANK_NAME%TYPE;
        F_BANK_CONTACT_FIRST_NAME BANK.BANK_CONTACT_FIRST_NAME%TYPE;
        F_BANK_CONTACT_LAST_NAME BANK.BANK_CONTACT_LAST_NAME%TYPE;
        F_BANK_CUSTOMER_SUPPORT_EMAIL BANK.BANK_CUSTOMER_SUPPORT_EMAIL%TYPE;
        F_BANK_CUSTOMER_SUPPORT_NUMBER BANK.BANK_CUSTOMER_SUPPORT_NUMBER%TYPE;
        Fail EXCEPTION;
    BEGIN
    -- Verifying THE BANK EXIST
        BEGIN
            SELECT * INTO P_BANK_OLD 
            FROM BANK
            WHERE BANK_ID = P_BANK_ID;
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! BANK NOT FOUND');
        END;   
    -- Verifying NEW EMAIL IS NOT IN DATABASE
        BEGIN
            SELECT COUNT(*) INTO EMAIL_COUNT
            FROM BANK
            WHERE BANK_CUSTOMER_SUPPORT_EMAIL = P_BANK_CUSTOMER_SUPPORT_EMAIL AND BANK_ID != P_BANK_ID;
            IF EMAIL_COUNT > 0 
            THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! EMAIL PROVIDED ALREADY EXIST IN DATABSE, UPDATE FAILED');
                RAISE Fail;
            END IF;  
        END;
        
    -- UPDATE ALL NULL INPUT TO OLD VALUES
        IF (P_BANK_NAME IS NULL)
            THEN F_BANK_NAME := P_BANK_OLD.BANK_NAME;
        ELSE  F_BANK_NAME := P_BANK_NAME;
        END IF;
        IF (P_BANK_CONTACT_FIRST_NAME IS NULL)
            THEN F_BANK_CONTACT_FIRST_NAME := P_BANK_OLD.BANK_CONTACT_FIRST_NAME;
        ELSE F_BANK_CONTACT_FIRST_NAME := P_BANK_CONTACT_FIRST_NAME;
        END IF;
        IF (P_BANK_CONTACT_LAST_NAME IS NULL)
            THEN F_BANK_CONTACT_LAST_NAME := P_BANK_OLD.BANK_CONTACT_LAST_NAME;
        ELSE F_BANK_CONTACT_LAST_NAME := P_BANK_CONTACT_LAST_NAME;
        END IF;
        IF (P_BANK_CUSTOMER_SUPPORT_EMAIL IS NULL)
            THEN F_BANK_CUSTOMER_SUPPORT_EMAIL := P_BANK_OLD.BANK_CUSTOMER_SUPPORT_EMAIL;
        ELSE F_BANK_CUSTOMER_SUPPORT_EMAIL := P_BANK_CUSTOMER_SUPPORT_EMAIL;    
        END IF;
        IF (P_BANK_CUSTOMER_SUPPORT_NUMBER IS NULL)
            THEN F_BANK_CUSTOMER_SUPPORT_NUMBER := P_BANK_OLD.BANK_CUSTOMER_SUPPORT_NUMBER;
        ELSE F_BANK_CUSTOMER_SUPPORT_NUMBER := P_BANK_CUSTOMER_SUPPORT_NUMBER;    
        END IF;
    -- UPDATING THE BANK
        BEGIN 
            UPDATE BANK 
            SET BANK_NAME = F_BANK_NAME, BANK_CONTACT_FIRST_NAME = F_BANK_CONTACT_FIRST_NAME, BANK_CONTACT_LAST_NAME = F_BANK_CONTACT_LAST_NAME, BANK_CUSTOMER_SUPPORT_EMAIL = F_BANK_CUSTOMER_SUPPORT_EMAIL, BANK_CUSTOMER_SUPPORT_NUMBER = F_BANK_CUSTOMER_SUPPORT_NUMBER
            WHERE BANK_ID = P_BANK_ID;
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('ERROR ! UPDATION Failed');
                RAISE Fail;
        END;
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END BANKUPDATE;
END BANK_PACKAGE;
/

GRANT EXECUTE ON BANK_PACKAGE to PROD;
COMMIT;