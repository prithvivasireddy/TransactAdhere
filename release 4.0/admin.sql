purge recyclebin;
SET SERVEROUTPUT on;

DECLARE

BEGIN
  EXECUTE IMMEDIATE 'DROP USER DATABASE_ADMIN_USER CASCADE';
  
  EXCEPTION
   WHEN OTHERS THEN
   IF NOT (SQLCODE = -01918)
   THEN RAISE;
   END IF;
END;
/
CREATE USER DATABASE_ADMIN_USER IDENTIFIED BY "DATABASE@admin123";
ALTER user DATABASE_ADMIN_USER quota unlimited on data;

GRANT
CREATE ROLE,
CREATE USER, 
DROP USER, 
EXECUTE ANY TYPE, 
EXECUTE ANY PROCEDURE, 
ALTER ANY PROCEDURE, 
CREATE ANY TABLE, 
UNLIMITED TABLESPACE,
CREATE TABLESPACE,
ALTER TABLESPACE,
DROP ANY TRIGGER, 
CREATE ANY PROCEDURE, 
ALTER ANY INDEX, 
CREATE ANY INDEX, 
CREATE TABLE, 
CREATE SESSION, 
DROP ANY TYPE, 
CREATE ANY TRIGGER, 
CREATE SEQUENCE, 
DROP ANY INDEX, 
SELECT ANY TABLE, 
DROP ANY TABLE, 
CREATE ANY TYPE, 
ALTER ANY TRIGGER, 
ALTER ANY SEQUENCE, 
CREATE ANY SEQUENCE, 
UPDATE ANY TABLE, 
CREATE TRIGGER, 
DROP ANY PROCEDURE, 
DROP ANY SEQUENCE,
DELETE ANY TABLE, 
INSERT ANY TABLE, 
ALTER ANY TABLE, 
READ ANY TABLE, 
DEBUG CONNECT SESSION, 
MERGE ANY VIEW, 
ALTER ANY TYPE, 
CREATE PROCEDURE, 
SELECT ANY SEQUENCE, 
DROP ANY VIEW, 
CREATE ANY VIEW,
ALTER ANY ROLE,
GRANT ANY ROLE,
DROP ANY ROLE,
SELECT ANY DICTIONARY,
CONNECT,
RESOURCE
to DATABASE_ADMIN_USER WITH ADMIN OPTION;