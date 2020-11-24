use mydb;

SELECT 
    *
FROM
    t3_INSURANCE_COMPANY
WHERE
    t3_Company_Name IN (SELECT 
            t3_Company_Name
        FROM
            t3_OFFICE
        GROUP BY t3_Company_Name
        HAVING COUNT(DISTINCT (t3_Address)) > 1)
        AND t3_Company_Name IN (SELECT 
            t3_DEPARTMENT.t3_Company_Name
        FROM
            t3_PRODUCT
                INNER JOIN
            t3_DEPARTMENT ON t3_DEPARTMENT.t3_Company_Name = t3_PRODUCT.t3_Company_Name
        GROUP BY t3_DEPARTMENT.t3_Company_Name
        HAVING COUNT(DISTINCT (t3_Product_Type)) > COUNT(DISTINCT (t3_Department_Name)));