

/*****************************************************************************************************************
NAME:    LoadData
PURPOSE: ETL process for Example data
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/02/2019   UUDO       1. Built this table for LDS BC IT240
1.1     10/27/2019   UUDO       1. Added fact table load for LDS BC IT243
1.2     05/06/2020   UUDO       1. Added Team Name
1.3     05/11/2020   UUDO       1. Added dynamic column for Team Name
RUNTIME: 
Approx. 1 min
NOTES:
These are the varioius Extract, Transform, and Load steps needed for the Example Data
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

USE DFNB2;

-- (1) Load dbo.tblAccoountCustomersDim

TRUNCATE TABLE dbo.tblAccountCustomersDim;
INSERT INTO dbo.tblAccountCustomersDim
       SELECT DISTINCT 
              acct_id, 
              cust_id, 
              acct_cust_role_id
       FROM stg_p1;

--(2) Load dbo.tblAccountFacts

TRUNCATE TABLE dbo.tblAccountFacts;
INSERT INTO dbo.tblAccountFacts
       SELECT DISTINCT 
              acct_facts_id, 
              acct_id, 
              as_of_date, 
              cur_bal
       FROM dbo.stg_p1;

--(3) Load dbo.tblAccountsDim
TRUNCATE TABLE dbo.tblAccountsDim;
INSERT INTO dbo.tblAccountsDim
       SELECT DISTINCT 
              acct_id, 
              prod_id, 
              pri_cust_id, 
              branch_id, 
              loan_amt, 
              open_date, 
              close_date, 
              open_close_code
       FROM dbo.stg_1;

--(4) Load dbo.tblAddressDim
TRUNCATE TABLE dbo.tblAddressDim;
INSERT INTO dbo.tblAddressDim
       SELECT DISTINCT 
              cust_add_id, 
              cust_add_lat, 
              cust_add_lon, 
              cust_add_type
       FROM dbo.stg_p1;

--(5) Load dbo.tbl
TRUNCATE TABLE dbo.tblAreaDim;
INSERT INTO dbo.tblAreaDim
       SELECT DISTINCT 
              acct_area_id AS area_id
       FROM dbo.stg_p1;

--(6) Load dbo.tbl

TRUNCATE TABLE dbo.tblBranchDim;
INSERT INTO dbo.tblBranchDim
       SELECT DISTINCT 
              branch_id, 
              branch_desc, 
              branch_add_id, 
              branch_code, 
              area_id, 
              region_id
       FROM dbo.stg_p1;

--(7) Load dbo.tblCustomersAccountRoleDim
TRUNCATE TABLE dbo.tblCustomersAccountRoleDim;
INSERT INTO dbo.tblCustomersAccountRoleDim
       SELECT DISTINCT 
              acct_cust_role_id, 
              acct_cust_role_name
       FROM [DFNB2].[dbo].[stg_p1];

--(8) Load dbo.tblCustomersDim

TRUNCATE TABLE dbo.tblCustomersDim;
INSERT INTO dbo.tblCustomersDim
       SELECT DISTINCT 
              cust_id, 
              pri_branch_id, 
              first_name, 
              dbo.stg_p1.last_name, 
              dbo.stg_p1.cust_since_date, 
              birth_date, 
              dbo.stg_p1.gender, 
              cust_add_id, 
              cust_rel_id
       FROM dbo.stg_p1;

--(9) Load dbo.tblProductsDim

TRUNCATE TABLE dbo.tblProductsDim;
INSERT INTO dbo.tblProductsDim(prod_id)
       SELECT DISTINCT 
              prod_id
       FROM dbo.stg_p1;

--(10) Load dbo.tblRegionDim

TRUNCATE TABLE dbo.tblRegionDim;
INSERT INTO dbo.tblRegionDim
       SELECT DISTINCT 
              acct_region_id AS region_id
       FROM dbo.stg_p1;