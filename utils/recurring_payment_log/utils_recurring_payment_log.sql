create or replace PACKAGE UTILS_RECURRING_PAYMENT_LOG IS

    PROCEDURE GET_RECURRING_LOG_BY_RECURRING_ID(P_RECURRING_ID RECURRING_PAYMENT_LOG.RECURRING_ID%TYPE);

    PROCEDURE GET_RECURRING_LOG_BY_UPDATED_DATE(P_UPDATED_DATE DATE);

    PROCEDURE GET_RECURRING_LOG_BY_UPDATED_DATE_RANGE(P_FROM_UPDATED_DATE DATE, P_TO_UPDATED_DATE DATE);

    PROCEDURE DISPLAY_RECURRING_PAYMENT_LOG;

END UTILS_RECURRING_PAYMENT_LOG;
/