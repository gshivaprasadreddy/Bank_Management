create or replace PACKAGE UTILS_EXCHANGE_CURRENCY 
IS
    TYPE EXCHANGE_CURRENCY_RECORD_TYPE IS RECORD
    (
        R_COUNTRY EXCHANGE_CURRENCY.COUNTRY%TYPE,
        R_CURRENCY_CODE EXCHANGE_CURRENCY.CURRENCY_CODE%TYPE,
        R_EXCHANGE_RATE EXCHANGE_CURRENCY.EXCHANGE_RATE%TYPE
    );

    TYPE EXCHANGE_CURRENCY_COLLECTION_TYPE IS TABLE OF 
    EXCHANGE_CURRENCY_RECORD_TYPE INDEX BY VARCHAR2(40);
    V_EXCHANGE_CURRENCY_COLLECTION EXCHANGE_CURRENCY_COLLECTION_TYPE;

    CURSOR EXCHANGE_CURRENCY_CURSOR IS
        SELECT * FROM EXCHANGE_CURRENCY;

    PROCEDURE LOADER_EXCHANGE_CURRENCY;

    PROCEDURE GET_DETAILS_BY_COUNTRY(P_COUNTRY EXCHANGE_CURRENCY.COUNTRY%TYPE);

    PROCEDURE GET_DETAILS_BY_CURRENCY_CODE(P_CURRENCY_CODE EXCHANGE_CURRENCY.CURRENCY_CODE%TYPE);

    PROCEDURE GET_EXCHANGE_RATE_BY_CURRENCY_CODE(P_CURRENCY_CODE EXCHANGE_CURRENCY.CURRENCY_CODE%TYPE);

    PROCEDURE GET_EXCHANGE_RATE_BY_COUNTRY(P_COUNTRY EXCHANGE_CURRENCY.COUNTRY%TYPE);

    PROCEDURE DISPLAY_EXCHANGE_CURRENCY;

    PROCEDURE CURRENCY_CONVERTER
        (
            P_FROM_CURRENCY_CODE EXCHANGE_CURRENCY.CURRENCY_CODE%TYPE,
            P_TO_CURRENCY_CODE EXCHANGE_CURRENCY.CURRENCY_CODE%TYPE,
            P_FROM_CURRENCY_VALUE ACCOUNT.BALANCE%TYPE
        );

END UTILS_EXCHANGE_CURRENCY;
/