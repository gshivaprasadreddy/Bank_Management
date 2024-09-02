create or replace PACKAGE SCHEDULED_TRANSFER_PKG
IS
    FUNCTION CHECK_NULLS_ADD_SCHEDULED_TRANSFER
        (
            P_FROM_ACCOUNT_ID_	ACCOUNT.ACCOUNT_ID%TYPE,
         	P_TO_ACCOUNT_ID_	ACCOUNT.ACCOUNT_ID%TYPE,
         	P_AMOUNT_	ACCOUNT.BALANCE%TYPE,
         	P_SCHEDULED_DATE_	SCHEDULED_TRANSFER.SCHEDULED_DATE%TYPE
        )
        RETURN BOOLEAN;
    PROCEDURE ADD_SCHEDULED_TRANSFER
        (
            P_FROM_ACCOUNT_ID	ACCOUNT.ACCOUNT_ID%TYPE,
         	P_TO_ACCOUNT_ID	ACCOUNT.ACCOUNT_ID%TYPE,
         	P_AMOUNT	ACCOUNT.BALANCE%TYPE,
         	P_SCHEDULED_DATE SCHEDULED_TRANSFER.SCHEDULED_DATE%TYPE
        );
END SCHEDULED_TRANSFER_PKG;
/