use mydb;
SELECT DISTINCT
    *
FROM
    t3_CUSTOMER
WHERE
    t3_Cust_id IN (SELECT 
            t1.t3_Cust_Id
        FROM
            t3_VEHICLE AS t1
                INNER JOIN
            t3_INCIDENT_REPORT AS t2 ON t1.t3_Cust_Id = t2.t3_Cust_Id
                LEFT JOIN
            t3_PREMIUM_PAYMENT AS t3 ON t2.t3_Cust_Id = t3.t3_Cust_Id
        GROUP BY t1.t3_Cust_Id
        HAVING COUNT(t1.t3_Vehicle_Id) > 1);