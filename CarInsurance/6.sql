use mydb;
SELECT DISTINCT
    t1.*
FROM
    t3_CUSTOMER AS t1,
    t3_COVERAGE AS t2,
    t3_CLAIM_SETTLEMENT AS t3,
    t3_CLAIM AS t4
WHERE
    t4.t3_Claim_Amount < t2.t3_Coverage_Amount
        AND t4.t3_Claim_Amount > (t3.t3_Claim_Settlement_Id + t3.t3_Vehicle_Id + t3.t3_Claim_Id + t3.t3_Cust_Id)
        AND t1.t3_Cust_Id = t4.t3_Cust_Id;