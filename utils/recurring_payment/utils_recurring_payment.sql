create or replace PACKAGE UTILS_RECURRING_PAYMENT
IS
    TYPE RECURRING_PAYMENT_RECORD_TYPE IS RECORD
    (
        R_RECURRING_ID	RECURRING_PAYMENT.RECURRING_ID%TYPE,
 	    R_FROM_ACCOUNT_ID	RECURRING_PAYMENT.FROM_ACCOUNT_ID%TYPE,
 	    R_TO_ACCOUNT_ID     RECURRING_PAYMENT.TO_ACCOUNT_ID%TYPE,
 	    R_AMOUNT	RECURRING_PAYMENT.AMOUNT%TYPE,
 	    R_INTERVAL_DAYS	RECURRING_PAYMENT.INTERVAL_DAYS%TYPE,
 	    R_NEXT_PAYMENT_DATE	RECURRING_PAYMENT.NEXT_PAYMENT_DATE%TYPE,
 	    R_STATUS	RECURRING_PAYMENT.STATUS%TYPE,
 	    R_CREATED_AT	RECURRING_PAYMENT.CREATED_AT%TYPE,
 	    R_END_DATE  RECURRING_PAYMENT.END_DATE%TYPE
    );

    TYPE RECURRING_PAYMENT_COLLECTION_TYPE IS TABLE OF RECURRING_PAYMENT_RECORD_TYPE
    INDEX BY VARCHAR2(40);

    V_RECURRING_PAYMENT_COLLECTION RECURRING_PAYMENT_COLLECTION_TYPE;

    CURSOR RECURRING_PAYMENT_CURSOR IS SELECT * FROM RECURRING_PAYMENT;

    PROCEDURE  RECURRING_PAYMENT_LOADER;

    PROCEDURE GET_STATUS_BY_RECURRING_ID(P_RECURRING_ID RECURRING_PAYMENT.RECURRING_ID%TYPE);

    PROCEDURE GET_RECURRING_PAYMENTS_BY_DATE(P_NEXT_PAYMENT_DATE RECURRING_PAYMENT.NEXT_PAYMENT_DATE%TYPE);

    PROCEDURE GET_ALL_COMPLETED_RECURRING_PAYMENT;

    PROCEDURE GET_ALL_INCOMPLETE_RECURRING_PAYMENT;
    
    PROCEDURE DISPLAY_RECURRING_PAYMENTS;

    PROCEDURE UPDATE_RECURRING_PAYMENT_AMOUNT
    (
        P_RECURRING_ID RECURRING_PAYMENT.RECURRING_ID%TYPE,
        P_NEW_AMOUNT RECURRING_PAYMENT.AMOUNT%TYPE
    );  

    PROCEDURE UPDATE_RECURRING_PAYMENT_END_DATE
    (
        P_RECURRING_ID RECURRING_PAYMENT.RECURRING_ID%TYPE,
        P_NEW_END_DATE RECURRING_PAYMENT.END_DATE%TYPE
    );

    PROCEDURE UPDATE_RECURRING_PAYMENT_INTERVAL_DAYS
    (
        P_RECURRING_ID RECURRING_PAYMENT.RECURRING_ID%TYPE,
        P_NEW_INTERVAL_DAYS RECURRING_PAYMENT.INTERVAL_DAYS%TYPE
    );
END UTILS_RECURRING_PAYMENT;
/