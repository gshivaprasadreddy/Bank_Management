create or replace PACKAGE UTILS_BANK
IS
    TYPE BANK_RECORD_TYPE IS RECORD
    (
        R_BANK_NAME	BANK.BANK_NAME%TYPE,
     	R_IFSC_CODE	BANK.IFSC_CODE%TYPE,
     	R_BRANCH_NAME	BANK.BRANCH_NAME%TYPE,
     	R_BUILDING_NUMBER	BANK.BUILDING_NUMBER%TYPE,
     	P_STREET	BANK.STREET%TYPE,
     	R_CITY	BANK.CITY%TYPE,
     	R_PINCODE BANK.PINCODE%TYPE,
     	R_DISTRICT	BANK.DISTRICT%TYPE,
     	R_STATE	BANK.STATE%TYPE,
     	R_COUNTRY	 BANK.COUNTRY%TYPE
    );

    TYPE BANK_COLLECTION_TYPE IS TABLE OF 
    BANK_RECORD_TYPE INDEX BY VARCHAR2(11);
    V_BANK_COLLECTION BANK_COLLECTION_TYPE;

    CURSOR BANK_CURSOR IS
        SELECT * FROM BANK;

    PROCEDURE LOADER_BANK;
    PROCEDURE GET_DETAILS_BY_IFSC_CODE(P_IFSC_CODE BANK.IFSC_CODE%TYPE);
    
END UTILS_BANK;
/