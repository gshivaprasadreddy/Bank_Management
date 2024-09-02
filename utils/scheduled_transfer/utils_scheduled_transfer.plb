create or replace PACKAGE BODY UTILS_SCHEDULED_TRANSFER IS

    PROCEDURE SCHEDULED_TRANSFER_LOADER IS
    BEGIN
        FOR I_SCHEDULED_TRANSFER IN SCHEDULED_TRANSFER_CURSOR LOOP
            V_SCHEDULED_TRANSFER_COLLECTION(I_SCHEDULED_TRANSFER.TRANSFER_ID) := SCHEDULED_TRANSFER_RECORD_TYPE(
                                                                                    I_SCHEDULED_TRANSFER.TRANSFER_ID,
                                                                                    I_SCHEDULED_TRANSFER.FROM_ACCOUNT_ID,
                                                                                    I_SCHEDULED_TRANSFER.TO_ACCOUNT_ID,
                                                                                    I_SCHEDULED_TRANSFER.AMOUNT,
                                                                                    I_SCHEDULED_TRANSFER.SCHEDULED_DATE,
                                                                                    I_SCHEDULED_TRANSFER.CREATED_AT,
                                                                                    I_SCHEDULED_TRANSFER.STATUS);
        END LOOP;
    END SCHEDULED_TRANSFER_LOADER;

    PROCEDURE GET_TRANSFER_DETAILS_BY_TRANSFER_ID(P_TRANSFER_ID SCHEDULED_TRANSFER.TRANSFER_ID%TYPE) IS
        V_KEY VARCHAR2(40);
        V_FOUND BOOLEAN := FALSE;
    BEGIN
        SCHEDULED_TRANSFER_LOADER;
        DBMS_OUTPUT.PUT_LINE(
            RPAD('TRANSFER_ID:', 20) || 
            RPAD('FROM_ACCOUNT_ID:', 20) || 
            RPAD('TO_ACCOUNT_ID:', 20) || 
            RPAD('AMOUNT:', 20) || 
            RPAD('SCHEDULED_DATE:', 20) || 
            RPAD('CREATED_AT:', 20) || 
            RPAD('STATUS:', 20)
        );
        DBMS_OUTPUT.PUT_LINE(RPAD('-',140,'-'));
        V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.FIRST;
        WHILE V_KEY IS NOT NULL LOOP
            IF V_KEY = P_TRANSFER_ID THEN
                V_FOUND := TRUE;
                DBMS_OUTPUT.PUT_LINE(
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TRANSFER_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_FROM_ACCOUNT_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TO_ACCOUNT_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_AMOUNT, 20) ||
                    RPAD(TO_CHAR(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_SCHEDULED_DATE, 'DD-MM-YYYY'), 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_CREATED_AT, 15) ||
                    LPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_STATUS,10)
                );
            END IF;
            V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.NEXT(V_KEY);
        END LOOP;
        IF NOT V_FOUND THEN
            RAISE_APPLICATION_ERROR(-20410, 'TRANSFER ID DOES NOT EXIST');
        END IF;
    END GET_TRANSFER_DETAILS_BY_TRANSFER_ID;

    PROCEDURE GET_TRANSFER_DETAILS_BY_DATE(P_SCHEDULED_DATE SCHEDULED_TRANSFER.SCHEDULED_DATE%TYPE) IS
        V_KEY VARCHAR2(40);
        V_FOUND BOOLEAN := FALSE;
    BEGIN
        SCHEDULED_TRANSFER_LOADER;
        DBMS_OUTPUT.PUT_LINE(
            RPAD('TRANSFER_ID:', 20) || 
            RPAD('FROM_ACCOUNT_ID:', 20) || 
            RPAD('TO_ACCOUNT_ID:', 20) || 
            RPAD('AMOUNT:', 20) || 
            RPAD('SCHEDULED_DATE:', 20) || 
            RPAD('CREATED_AT:', 20) || 
            RPAD('STATUS:', 20)
        );
        DBMS_OUTPUT.PUT_LINE(RPAD('-',140,'-'));
        V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.FIRST;
        WHILE V_KEY IS NOT NULL LOOP
            IF V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_SCHEDULED_DATE = P_SCHEDULED_DATE THEN
                V_FOUND := TRUE;
                DBMS_OUTPUT.PUT_LINE(
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TRANSFER_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_FROM_ACCOUNT_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TO_ACCOUNT_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_AMOUNT, 20) ||
                    RPAD(TO_CHAR(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_SCHEDULED_DATE, 'DD-MM-YYYY'), 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_CREATED_AT, 15) ||
                    LPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_STATUS,10)
                );
            END IF;
            V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.NEXT(V_KEY);
        END LOOP;
        IF NOT V_FOUND THEN
            RAISE_APPLICATION_ERROR(-20411, 'NO SCHEDULED TRANSFER ON THIS DATE');
        END IF;
    END GET_TRANSFER_DETAILS_BY_DATE;

    PROCEDURE GET_ALL_COMPLETED_TRANSFERS IS
        V_KEY VARCHAR2(40);
        V_FOUND BOOLEAN := FALSE;
    BEGIN
        SCHEDULED_TRANSFER_LOADER;
        DBMS_OUTPUT.PUT_LINE(
            RPAD('TRANSFER_ID:', 20) || 
            RPAD('FROM_ACCOUNT_ID:', 20) || 
            RPAD('TO_ACCOUNT_ID:', 20) || 
            RPAD('AMOUNT:', 20) || 
            RPAD('SCHEDULED_DATE:', 20) || 
            RPAD('CREATED_AT:', 20) || 
            RPAD('STATUS:', 20)
        );
        DBMS_OUTPUT.PUT_LINE(RPAD('-',140,'-'));
        V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.FIRST;
        WHILE V_KEY IS NOT NULL LOOP
            IF V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_STATUS = 'Y' THEN
                V_FOUND := TRUE;
                DBMS_OUTPUT.PUT_LINE(
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TRANSFER_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_FROM_ACCOUNT_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TO_ACCOUNT_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_AMOUNT, 20) ||
                    RPAD(TO_CHAR(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_SCHEDULED_DATE, 'DD-MM-YYYY'), 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_CREATED_AT, 15) ||
                    LPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_STATUS,10)
                );
            END IF;
            V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.NEXT(V_KEY);
        END LOOP;
        IF NOT V_FOUND THEN
            RAISE_APPLICATION_ERROR(-20412, 'NO COMPLETED TRANSFERS FOUND');
        END IF;
    END GET_ALL_COMPLETED_TRANSFERS;

    PROCEDURE GET_ALL_IN_COMPLETED_TRANSFERS IS
        V_KEY VARCHAR2(40);
        V_FOUND BOOLEAN := FALSE;
    BEGIN
        SCHEDULED_TRANSFER_LOADER;
        DBMS_OUTPUT.PUT_LINE(
            RPAD('TRANSFER_ID:', 20) || 
            RPAD('FROM_ACCOUNT_ID:', 20) || 
            RPAD('TO_ACCOUNT_ID:', 20) || 
            RPAD('AMOUNT:', 20) || 
            RPAD('SCHEDULED_DATE:', 20) || 
            RPAD('CREATED_AT:', 20) || 
            RPAD('STATUS:', 20)
        );
        DBMS_OUTPUT.PUT_LINE(RPAD('-',140,'-'));
        V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.FIRST;
        WHILE V_KEY IS NOT NULL LOOP
            IF V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_STATUS = 'N' THEN
                V_FOUND := TRUE;
                DBMS_OUTPUT.PUT_LINE(
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TRANSFER_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_FROM_ACCOUNT_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TO_ACCOUNT_ID, 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_AMOUNT, 20) ||
                    RPAD(TO_CHAR(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_SCHEDULED_DATE, 'DD-MM-YYYY'), 20) ||
                    RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_CREATED_AT, 15) ||
                    LPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_STATUS,10)
                );
            END IF;
            V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.NEXT(V_KEY);
        END LOOP;
        IF NOT V_FOUND THEN
            RAISE_APPLICATION_ERROR(-20413, 'NO INCOMPLETE TRANSFERS FOUND');
        END IF;
    END GET_ALL_IN_COMPLETED_TRANSFERS;

    PROCEDURE GET_TRANSFER_STATUS_BY_TRANSFER_ID(P_TRANSFER_ID SCHEDULED_TRANSFER.TRANSFER_ID%TYPE) IS
        V_STATUS VARCHAR2(40);
    BEGIN
        BEGIN
            SELECT STATUS INTO V_STATUS FROM SCHEDULED_TRANSFER WHERE TRANSFER_ID = P_TRANSFER_ID;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20414, 'TRANSFER ID DOES NOT EXIST');
        END;
        DBMS_OUTPUT.PUT_LINE('THE STATUS OF THE TRANSFER_ID ' || RPAD(P_TRANSFER_ID, 20) || ' IS ' || q'(')'|| RPAD(V_STATUS, 20)|| q'(')');
    END GET_TRANSFER_STATUS_BY_TRANSFER_ID;

    PROCEDURE DISPLAY_SCHEDULED_TRANSFER IS
        V_KEY VARCHAR2(40);
    BEGIN
        SCHEDULED_TRANSFER_LOADER;
        DBMS_OUTPUT.PUT_LINE(
            RPAD('TRANSFER_ID:', 20) || 
            RPAD('FROM_ACCOUNT_ID:', 20) || 
            RPAD('TO_ACCOUNT_ID:', 20) || 
            RPAD('AMOUNT:', 20) || 
            RPAD('SCHEDULED_DATE:', 20) || 
            RPAD('CREATED_AT:', 20) || 
            RPAD('STATUS:', 20)
        );
        DBMS_OUTPUT.PUT_LINE(RPAD('-',140,'-'));
        V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.FIRST;
        WHILE V_KEY IS NOT NULL LOOP
            DBMS_OUTPUT.PUT_LINE(
                RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TRANSFER_ID, 20) ||
                RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_FROM_ACCOUNT_ID, 20) ||
                RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_TO_ACCOUNT_ID, 20) ||
                RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_AMOUNT, 20) ||
                RPAD(TO_CHAR(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_SCHEDULED_DATE, 'DD-MM-YYYY'), 20) ||
                RPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_CREATED_AT, 25) ||
                LPAD(V_SCHEDULED_TRANSFER_COLLECTION(V_KEY).R_STATUS,10)
            );
            V_KEY := V_SCHEDULED_TRANSFER_COLLECTION.NEXT(V_KEY);
        END LOOP;
    END DISPLAY_SCHEDULED_TRANSFER;

    PROCEDURE UPDATE_AMOUNT_TRANSFER_ID(
        P_TRANSFER_ID SCHEDULED_TRANSFER.TRANSFER_ID%TYPE, 
        P_AMOUNT SCHEDULED_TRANSFER.AMOUNT%TYPE) 
    IS
        V_TRANSFER_ID_STATUS SCHEDULED_TRANSFER.STATUS%TYPE;
        V_TRANSFER_ID SCHEDULED_TRANSFER.TRANSFER_ID%TYPE;
        V_AMOUNT SCHEDULED_TRANSFER.AMOUNT%TYPE;
    BEGIN
        BEGIN
            SELECT TRANSFER_ID INTO V_TRANSFER_ID FROM SCHEDULED_TRANSFER WHERE TRANSFER_ID = P_TRANSFER_ID;
            SELECT AMOUNT INTO V_AMOUNT FROM SCHEDULED_TRANSFER WHERE TRANSFER_ID = P_TRANSFER_ID;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20415, 'TRANSFER ID IS NOT FOUND');
        END;
        
        SELECT STATUS INTO V_TRANSFER_ID_STATUS FROM SCHEDULED_TRANSFER WHERE TRANSFER_ID = P_TRANSFER_ID;

        IF V_TRANSFER_ID_STATUS = 'Y' THEN
            RAISE_APPLICATION_ERROR(-20416,'TRANSFER IS ALREADY COMPLETED, YOU CAN NOT UPDATE NOW');
        END IF;

        IF V_AMOUNT = P_AMOUNT THEN
            RAISE_APPLICATION_ERROR(-20417, 'SAME AMOUNT CANNOT BE UPDATED');
        END IF;
        
        UPDATE SCHEDULED_TRANSFER SET AMOUNT = P_AMOUNT WHERE TRANSFER_ID = P_TRANSFER_ID;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20418, 'TRANSFER ID IS NOT FOUND');
        ELSE
            DBMS_OUTPUT.PUT_LINE('AMOUNT IS UPDATED SUCCESSFULLY');
        END IF;
    END UPDATE_AMOUNT_TRANSFER_ID;

    PROCEDURE UPDATE_SCHEDULED_DATE_BY_TRANSFER_ID
        (P_TRANSFER_ID SCHEDULED_TRANSFER.TRANSFER_ID%TYPE,
         P_SCHEDULED_DATE SCHEDULED_TRANSFER.SCHEDULED_DATE%TYPE) 
    IS
        V_TRANSFER_ID_STATUS SCHEDULED_TRANSFER.STATUS%TYPE;
        V_TRANSFER_ID SCHEDULED_TRANSFER.TRANSFER_ID%TYPE;
        V_SCHEDULED_DATE SCHEDULED_TRANSFER.SCHEDULED_DATE%TYPE;
    BEGIN
        BEGIN
            SELECT TRANSFER_ID INTO V_TRANSFER_ID FROM SCHEDULED_TRANSFER WHERE TRANSFER_ID = P_TRANSFER_ID;
            SELECT SCHEDULED_DATE INTO V_SCHEDULED_DATE FROM SCHEDULED_TRANSFER WHERE TRANSFER_ID = P_TRANSFER_ID;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                RAISE_APPLICATION_ERROR(-20419, 'TRANSFER ID IS NOT FOUND');
        END;
        
        SELECT STATUS INTO V_TRANSFER_ID_STATUS FROM SCHEDULED_TRANSFER WHERE TRANSFER_ID = P_TRANSFER_ID;

        IF V_TRANSFER_ID_STATUS = 'Y' THEN
            RAISE_APPLICATION_ERROR(-20416,'TRANSFER IS ALREADY COMPLETED, YOU CAN NOT UPDATE NOW');
        END IF;

        IF V_SCHEDULED_DATE = P_SCHEDULED_DATE THEN
            RAISE_APPLICATION_ERROR(-20420, 'SAME DATE CANNOT BE UPDATED');
        END IF;

        IF P_SCHEDULED_DATE >= SYSDATE THEN
            UPDATE SCHEDULED_TRANSFER SET SCHEDULED_DATE = P_SCHEDULED_DATE WHERE TRANSFER_ID = P_TRANSFER_ID;
        END IF;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20421, 'SCHEDULED DATE IS NOT UPDATED');
        ELSE
            DBMS_OUTPUT.PUT_LINE('SCHEDULED DATE IS UPDATED SUCCESSFULLY');
        END IF;
    END UPDATE_SCHEDULED_DATE_BY_TRANSFER_ID;

END UTILS_SCHEDULED_TRANSFER;
/