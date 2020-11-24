use mydb;
SELECT 
    t1.*
FROM
    t3_VEHICLE AS t1,
    t3_PREMIUM_PAYMENT AS t2
WHERE
    t2.t3_Premium_Payment_Amount > t1.t3_Vehicle_Number
        AND t1.t3_Cust_Id = t2.t3_Cust_Id; 