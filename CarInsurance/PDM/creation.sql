CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;
CREATE TABLE IF NOT EXISTS t3_INCIDENT
(
t3_Incident_Id VARCHAR(20) NOT NULL ,
t3_Incident_Type VARCHAR(50) NULL ,
t3_Incident_Date DATE NOT NULL ,
t3_Description VARCHAR(1000) NULL ,
CONSTRAINT XPKINCIDENT_17 PRIMARY KEY (t3_Incident_Id)
);
CREATE UNIQUE INDEX XPKINCIDENT_17 ON t3_INCIDENT (t3_Incident_Id ASC);

CREATE TABLE IF NOT EXISTS t3_CUSTOMER
(
t3_Cust_Id VARCHAR(15) NOT NULL ,
t3_Cust_FName VARCHAR(15) NOT NULL ,
t3_Cust_LName VARCHAR(15) NOT NULL ,
t3_Cust_DOB DATE NOT NULL ,
t3_Cust_Gender CHAR(2) NOT NULL ,
t3_Cust_Address VARCHAR(35) NOT NULL ,
t3_Cust_MOB_Number BIGINT NOT NULL ,
t3_Cust_Email VARCHAR(25) NULL ,
t3_Cust_Passport_Number  VARCHAR(20) NULL ,
t3_Cust_Marital_Status CHAR(12) NULL ,
t3_Cust_PPS_Number INTEGER NULL ,
CONSTRAINT XPKCUSTOMER PRIMARY KEY (t3_Cust_Id)
);

CREATE UNIQUE INDEX XPKCUSTOMER_1 ON t3_CUSTOMER (t3_Cust_Id ASC);


CREATE TABLE IF NOT EXISTS t3_INCIDENT_REPORT
(
Incident_Report_Id VARCHAR(20) NOT NULL ,
t3_Incident_Type CHAR(50) NULL , 
t3_Incident_Inspector VARCHAR(20) NULL , 
t3_Incident_Cost INTEGER NULL ,
t3_Incident_Report_Description VARCHAR(1000) NULL ,
t3_Incident_Id VARCHAR(20) NOT NULL , 
t3_Cust_Id VARCHAR(20) NOT NULL , 
CONSTRAINT XPKINCIDENT_REPORT_18 PRIMARY KEY
(Incident_Report_Id,t3_Incident_Id,t3_Cust_Id), 
CONSTRAINT R_83 FOREIGN KEY (t3_Incident_Id) REFERENCES t3_INCIDENT (t3_Incident_Id) ON DELETE CASCADE ON UPDATE CASCADE, 
CONSTRAINT R_86 FOREIGN KEY (t3_Cust_Id) REFERENCES t3_CUSTOMER (t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKINCIDENT_REPORT_18 ON t3_INCIDENT_REPORT (Incident_Report_Id ASC,t3_Incident_Id ASC,t3_Cust_Id ASC);


CREATE TABLE IF NOT EXISTS t3_INSURANCE_COMPANY
(
t3_Company_Name VARCHAR(70) NOT NULL ,
t3_Company_Address VARCHAR(400) NULL ,
t3_Company_Contact_Number bigint NULL ,
t3_Company_Fax bigint NULL ,
t3_Company_Email VARCHAR(50) NULL ,
t3_Company_Website VARCHAR(50) NULL ,
t3_Company_Location VARCHAR(50) NULL,
t3_Company_Department_Name VARCHAR(50) NULL ,
t3_Company_Office_Name VARCHAR(50) NULL ,
CONSTRAINT XPKINSURANCE_COMPANY_15 PRIMARY KEY
(t3_Company_Name)
);
CREATE UNIQUE INDEX XPKINSURANCE_COMPANY_15 ON t3_INSURANCE_COMPANY
(t3_Company_Name ASC);
-- Table 5
CREATE TABLE IF NOT EXISTS t3_DEPARTMENT
(
t3_Department_Name VARCHAR(50) NOT NULL ,
t3_Department_ID VARCHAR(50) NOT NULL ,
t3_Department_Staff VARCHAR(50) NULL ,
t3_Company_Name VARCHAR(100) NOT NULL ,
CONSTRAINT XPKDEPARTMENT PRIMARY KEY (t3_Department_Name,t3_Department_ID,t3_Company_Name),
CONSTRAINT R_56 FOREIGN KEY (t3_Company_Name)
REFERENCES t3_INSURANCE_COMPANY (t3_Company_Name) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKDEPARTMENT ON t3_DEPARTMENT
(t3_Department_Name ASC,t3_Department_ID ASC,t3_Company_Name ASC);


CREATE TABLE t3_VEHICLE_SERVICE
(
t3_Department_Name VARCHAR(100) NOT NULL ,
t3_Vehicle_Service_Company_Name VARCHAR(10) NOT NULL ,
t3_Vehicle_Service_Address VARCHAR(200) NULL ,
t3_Vehicle_Service_Contact VARCHAR(200) NULL ,
t3_Vehicle_Service_Incharge VARCHAR(200) NULL ,
t3_Vehicle_Service_Type VARCHAR(200) NULL ,
t3_Department_ID VARCHAR(200) NOT NULL ,
t3_Company_Name VARCHAR(200) NOT NULL ,
CONSTRAINT XPKVEHICLE_SERVICE PRIMARY KEY
(t3_Vehicle_Service_Company_Name,t3_Department_Name),
CONSTRAINT R_50 FOREIGN KEY (t3_Department_Name, t3_Department_ID,
t3_Company_Name) REFERENCES t3_DEPARTMENT (t3_Department_Name,
t3_Department_ID, t3_Company_Name) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKVEHICLE_SERVICE ON t3_VEHICLE_SERVICE
(t3_Vehicle_Service_Company_Name ASC,t3_Department_Name ASC);


CREATE TABLE t3_VEHICLE
(
t3_Vehicle_Id VARCHAR(20) NOT NULL ,
t3_Policy_Id VARCHAR(20) NULL ,
t3_Vehicle_Registration_Number VARCHAR(20) NOT NULL ,
t3_Vehicle_Value bigint NULL ,
t3_Vehicle_Type VARCHAR(20) NOT NULL ,
t3_Vehicle_Size INTEGER NULL ,
t3_Vehicle_Number_Of_Seat INTEGER NULL ,
t3_Vehicle_Manufacturer VARCHAR(20) NULL ,
t3_Vehicle_Engine_Number INTEGER NULL ,
t3_Vehicle_Chasis_Number INTEGER NULL ,
t3_Vehicle_Number INTEGER NULL ,
t3_Vehicle_Model_Number VARCHAR(20) NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKVEHICLE_6 PRIMARY KEY (t3_Vehicle_Id,t3_Cust_Id),
CONSTRAINT R_92 FOREIGN KEY (t3_Cust_Id) REFERENCES t3_CUSTOMER 
(t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKVEHICLE_6 ON t3_VEHICLE (t3_Vehicle_Id ASC,t3_Cust_Id ASC);


CREATE TABLE t3_PREMIUM_PAYMENT
(
t3_Premium_Payment_Id VARCHAR(20) NOT NULL ,
t3_Policy_Number VARCHAR(20) NOT NULL ,
t3_Premium_Payment_Amount INTEGER NOT NULL ,
t3_Premium_Payment_Schedule DATE NOT NULL ,
t3_Receipt_Id VARCHAR(20) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKPREMIUM_PAYMENT_5 PRIMARY KEY
(t3_Premium_Payment_Id,t3_Cust_Id),
CONSTRAINT R_85 FOREIGN KEY (t3_Cust_Id) REFERENCES t3_CUSTOMER
(t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKPREMIUM_PAYMENT_5 ON
t3_PREMIUM_PAYMENT
(t3_Premium_Payment_Id ASC,t3_Cust_Id ASC);


CREATE TABLE IF NOT EXISTS t3_RECEIPT
(
t3_Receipt_Id VARCHAR(20) NOT NULL ,
t3_Time DATE NOT NULL ,
t3_Cost INTEGER NOT NULL ,
t3_Premium_Payment_Id VARCHAR(20) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKRECEIPT_21 PRIMARY KEY (t3_Receipt_Id,t3_Premium_Payment_Id,t3_Cust_Id),
CONSTRAINT R_84 FOREIGN KEY (t3_Premium_Payment_Id, t3_Cust_Id)
REFERENCES t3_PREMIUM_PAYMENT (t3_Premium_Payment_Id, t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKRECEIPT_21 ON t3_RECEIPT (t3_Receipt_Id ASC,t3_Premium_Payment_Id ASC,t3_Cust_Id ASC);

 
CREATE TABLE IF NOT EXISTS t3_APPLICATION
(
t3_Application_Id VARCHAR(20) NOT NULL ,
t3_Vehicle_Id VARCHAR(20) NOT NULL ,
t3_Application_Status CHAR(8) NOT NULL ,
t3_Coverage VARCHAR(50) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKAPPLICATION_2 PRIMARY KEY (t3_Application_Id,t3_Cust_Id),
CONSTRAINT R_93 FOREIGN KEY (t3_Cust_Id) REFERENCES t3_CUSTOMER
(t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKAPPLICATION_2 ON t3_APPLICATION
(t3_Application_Id ASC,t3_Cust_Id ASC);


CREATE TABLE IF NOT EXISTS t3_INSURANCE_POLICY
(
t3_Agreement_id VARCHAR(20) NOT NULL ,
t3_Department_Name VARCHAR(20) NULL ,
t3_Policy_Number VARCHAR(20) NULL ,
t3_Start_Date DATE NULL ,
t3_Expiry_Date DATE NULL ,
t3_Term_Condition_Description VARCHAR(400) NULL ,
t3_Application_Id VARCHAR(20) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKINSURANCE_POLICY_4 PRIMARY KEY (t3_Agreement_id,t3_Application_Id,t3_Cust_Id),
CONSTRAINT R_95 FOREIGN KEY (t3_Application_Id, t3_Cust_Id) REFERENCES t3_APPLICATION (t3_Application_Id, t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKINSURANCE_POLICY_4 ON t3_INSURANCE_POLICY
(t3_Agreement_id ASC,t3_Application_Id ASC,t3_Cust_Id ASC);


CREATE TABLE t3_POLICY_RENEWABLE
(
t3_Policy_Renewable_Id VARCHAR(20) NOT NULL ,
t3_Date_Of_Renewal DATE NOT NULL ,
t3_Type_Of_Renewal CHAR(15) NOT NULL ,
t3_Agreement_id VARCHAR(20) NOT NULL ,
t3_Application_Id VARCHAR(20) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKPOLICY_RENEWABLE_16 PRIMARY KEY
(t3_Policy_Renewable_Id,t3_Agreement_id,t3_Application_Id,t3_Cust_Id),
CONSTRAINT R_101 FOREIGN KEY (t3_Agreement_id, t3_Application_Id, t3_Cust_Id)
REFERENCES t3_INSURANCE_POLICY (t3_Agreement_id, t3_Application_Id, t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKPOLICY_RENEWABLE_16 ON
t3_POLICY_RENEWABLE
(t3_Policy_Renewable_Id ASC,t3_Agreement_id ASC,t3_Application_Id
ASC,t3_Cust_Id ASC);


CREATE TABLE IF NOT EXISTS t3_MEMBERSHIP
(
t3_Membership_Id VARCHAR(20) NOT NULL ,
t3_Membership_Type CHAR(15) NOT NULL ,
t3_Organisation_Contact VARCHAR(20) NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKMEMBERSHIP_12 PRIMARY KEY
(t3_Membership_Id,t3_Cust_Id),
CONSTRAINT R_91 FOREIGN KEY (t3_Cust_Id) REFERENCES t3_CUSTOMER
(t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKMEMBERSHIP_12 ON t3_MEMBERSHIP
(t3_Membership_Id ASC,t3_Cust_Id ASC);


CREATE TABLE IF NOT EXISTS t3_QUOTE
(
t3_Quote_Id VARCHAR(20) NOT NULL ,
t3_Issue_Date DATE NOT NULL ,
t3_Valid_From_Date DATE NOT NULL ,
t3_Valid_Till_Date DATE NOT NULL ,
t3_Description VARCHAR(100) NULL ,
t3_Product_Id VARCHAR(20) NOT NULL ,
t3_Coverage_Level VARCHAR(20) NOT NULL ,
t3_Application_Id VARCHAR(20) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKQUOTE_3 PRIMARY KEY
(t3_Quote_Id,t3_Application_Id,t3_Cust_Id),
CONSTRAINT R_94 FOREIGN KEY (t3_Application_Id, t3_Cust_Id) REFERENCES
t3_APPLICATION (t3_Application_Id, t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKQUOTE_3 ON t3_QUOTE
(t3_Quote_Id ASC,t3_Application_Id ASC,t3_Cust_Id ASC);


CREATE TABLE IF NOT EXISTS t3_STAFF
(
t3_Staff_Id VARCHAR(200) NOT NULL ,
t3_Staff_Fname VARCHAR(100) NULL , 
t3_Staff_LName VARCHAR(100) NULL , 
t3_Staff_Address VARCHAR(200) NULL , 
t3_Staff_Contact BIGINT NULL , 
t3_Staff_Gender CHAR(2) NULL , 
t3_Staff_Marital_Status CHAR(8) NULL , 
t3_Staff_Nationality CHAR(15) NULL , 
t3_Staff_Qualification VARCHAR(20) NULL , 
t3_Staff_Allowance bigint NULL , 
t3_Staff_PPS_Number bigint NULL , 
t3_Company_Name VARCHAR(400) NOT NULL , 
CONSTRAINT XPKSTAFF_9 PRIMARY KEY (t3_Staff_Id,t3_Company_Name), 
CONSTRAINT R_105 FOREIGN KEY (t3_Company_Name) REFERENCES
t3_INSURANCE_COMPANY (t3_Company_Name) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKSTAFF_9 ON t3_STAFF (t3_Staff_Id ASC,t3_Company_Name ASC);


CREATE TABLE t3_NOK
(
t3_Nok_Id VARCHAR(20) NOT NULL ,
t3_Nok_Name VARCHAR(20) NULL ,
t3_Nok_Address VARCHAR(200) NULL ,
t3_Nok_Phone_Number BIGINT NULL ,
t3_Nok_Gender CHAR(10) NULL ,
t3_Nok_Marital_Status CHAR(8) NULL ,
t3_Agreement_id VARCHAR(20) NOT NULL ,
t3_Application_Id VARCHAR(20) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKNOK_14 PRIMARY KEY
(t3_Nok_Id,t3_Agreement_id,t3_Application_Id,t3_Cust_Id),
CONSTRAINT R_99 FOREIGN KEY (t3_Agreement_id, t3_Application_Id, t3_Cust_Id)
REFERENCES t3_INSURANCE_POLICY (t3_Agreement_id, t3_Application_Id, t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKNOK_14 ON t3_NOK (t3_Nok_Id ASC,t3_Agreement_id ASC,t3_Application_Id ASC);


CREATE TABLE IF NOT EXISTS t3_PRODUCT 
( 
t3_Product_Number VARCHAR(200) NOT NULL ,
t3_Product_Price INTEGER NULL ,
t3_Product_Type CHAR(40) NULL , 
t3_Company_Name VARCHAR(200) NOT NULL , 
CONSTRAINT XPKPRODUCT_20 PRIMARY KEY (t3_Product_Number,t3_Company_Name), 
CONSTRAINT R_107 FOREIGN KEY (t3_Company_Name) REFERENCES t3_INSURANCE_COMPANY (t3_Company_Name) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKPRODUCT_20 ON t3_PRODUCT (t3_Product_Number ASC,t3_Company_Name ASC);


CREATE TABLE IF NOT EXISTS t3_OFFICE
(
t3_Office_Name VARCHAR(200) NOT NULL ,
t3_Office_Leader VARCHAR(200) NOT NULL , 
t3_Contact_Information VARCHAR(200) NOT NULL , 
t3_Address VARCHAR(200) NOT NULL ,
t3_Admin_Cost INTEGER NULL , 
t3_Staff VARCHAR(50) NULL ,
t3_Department_Name VARCHAR(200) NOT NULL ,
t3_Department_ID VARCHAR(200) NOT NULL, 
t3_Company_Name VARCHAR(200) NOT NULL , 
CONSTRAINT XPKOFFICE_11 PRIMARY KEY(t3_Office_Name,t3_Department_Name,t3_Company_Name),
CONSTRAINT R_104 FOREIGN KEY (t3_Department_Name,t3_Department_ID,t3_Company_Name) REFERENCES t3_DEPARTMENT (t3_Department_Name,t3_Department_ID,t3_Company_Name) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKOFFICE_11 ON t3_OFFICE (t3_Office_Name ASC,t3_Department_Name ASC,t3_Company_Name ASC);


CREATE TABLE IF NOT EXISTS t3_COVERAGE 
( 
t3_Coverage_Id VARCHAR(20) NOT NULL , 
t3_Coverage_Amount INTEGER NOT NULL , 
t3_Coverage_Type CHAR(30) NOT NULL , 
t3_Coverage_Level CHAR(30) NOT NULL , 
t3_Product_Id VARCHAR(30) NOT NULL , 
t3_Coverage_Description VARCHAR(400) NULL , 
t3_Coverage_Terms VARCHAR(50) NULL , 
t3_Company_Name VARCHAR(400) NOT NULL , 
CONSTRAINT XPKCOVERAGE_19  PRIMARY KEY
(t3_Coverage_Id,t3_Company_Name),
CONSTRAINT R_102 FOREIGN KEY (t3_Company_Name) REFERENCES
t3_INSURANCE_COMPANY (t3_Company_Name) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKCOVERAGE_19 ON t3_COVERAGE
(t3_Coverage_Id ASC,t3_Company_Name ASC);


CREATE TABLE IF NOT EXISTS t3_INSURANCE_POLICY_COVERAGE 
( 
t3_Agreement_id VARCHAR(20) NOT NULL , 
t3_Application_Id VARCHAR(20) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL , 
t3_Coverage_Id VARCHAR(20) NOT NULL , 
t3_Company_Name VARCHAR(200) NOT NULL , 
CONSTRAINT XPKINSURANCE_POLICY_4_COVERAGE PRIMARY KEY 
(t3_Agreement_id,t3_Application_Id,t3_Cust_Id,t3_Coverage_Id,t3_Company_Name), 
CONSTRAINT R_97 FOREIGN KEY (t3_Agreement_id, t3_Application_Id, t3_Cust_Id) 
REFERENCES t3_INSURANCE_POLICY (t3_Agreement_id, t3_Application_Id, t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT R_98 FOREIGN KEY (t3_Coverage_Id, t3_Company_Name) 
REFERENCES t3_COVERAGE (t3_Coverage_Id, t3_Company_Name) ON DELETE CASCADE ON UPDATE CASCADE
); 
CREATE UNIQUE INDEX XPKINSURANCE_POLICY_4_COVERAGE ON 
t3_INSURANCE_POLICY_COVERAGE 
(t3_Agreement_id ASC,t3_Application_Id ASC,t3_Cust_Id ASC,t3_Coverage_Id 
ASC,t3_Company_Name ASC);


CREATE TABLE IF NOT EXISTS t3_CLAIM 
(
t3_Claim_Id VARCHAR(20) NOT NULL , 
t3_Agreement_id VARCHAR(20) NOT NULL , 
t3_Claim_Amount INTEGER NOT NULL , 
t3_Incident_Id VARCHAR(20) NOT NULL , 
t3_Damage_Type VARCHAR(20) NOT NULL , 
t3_Date_Of_Claim DATE NOT NULL ,
t3_Claim_Status CHAR(10) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKCLAIM_7 PRIMARY KEY (t3_Claim_Id,t3_Cust_Id),
CONSTRAINT R_88 FOREIGN KEY (t3_Cust_Id) REFERENCES t3_CUSTOMER
(t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKCLAIM_7 ON t3_CLAIM
(t3_Claim_Id ASC,t3_Cust_Id ASC);


CREATE TABLE IF NOT EXISTS t3_CLAIM_SETTLEMENT
(
t3_Claim_Settlement_Id VARCHAR(20) NOT NULL ,
t3_Vehicle_Id VARCHAR(20) NOT NULL ,
t3_Date_Settled DATE NOT NULL ,
t3_Amount_Paid INTEGER NOT NULL ,
t3_Coverage_Id VARCHAR(20) NOT NULL ,
t3_Claim_Id VARCHAR(20) NOT NULL ,
t3_Cust_Id VARCHAR(20) NOT NULL ,
CONSTRAINT XPKCLAIM_SETTLEMENT_8 PRIMARY KEY
(t3_Claim_Settlement_Id,t3_Claim_Id,t3_Cust_Id),
CONSTRAINT R_90 FOREIGN KEY (t3_Claim_Id, t3_Cust_Id) REFERENCES t3_CLAIM
(t3_Claim_Id, t3_Cust_Id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE UNIQUE INDEX XPKCLAIM_SETTLEMENT_8 ON
t3_CLAIM_SETTLEMENT
(t3_Claim_Settlement_Id ASC,t3_Claim_Id ASC,t3_Cust_Id ASC);
