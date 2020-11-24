use mydb;
SELECT 
    *
FROM
    t3_CUSTOMER,
    t3_VEHICLE
WHERE
    t3_CUSTOMER.t3_Cust_Id IN (SELECT 
            t3_Cust_Id
        FROM
            t3_INCIDENT_REPORT
        WHERE
            t3_Cust_Id IN (SELECT 
                    t3_Cust_Id
                FROM
                    t3_CLAIM
                WHERE
                    t3_Claim_Status = 'Pending'))
        AND t3_CUSTOMER.t3_Cust_Id = t3_VEHICLE.t3_Cust_Id; 

