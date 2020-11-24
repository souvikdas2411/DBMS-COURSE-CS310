use mydb;
SELECT 
    *
FROM
    t3_CUSTOMER
WHERE
    t3_Cust_id IN (SELECT 
            t3_Cust_Id
        FROM
            t3_PREMIUM_PAYMENT
        WHERE
            t3_Premium_Payment_Amount > (SELECT 
                    SUM(t3_Cust_Id)
                FROM
                    t3_CUSTOMER));
