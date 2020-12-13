/*****************************************************************************************************************
NAME:    dbo.v_CustomersBranchTransactions		  
PURPOSE: Create the dbo.v_CustomersBranchTransactions view
					
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     12/02/2020   UUDO       1. Built this table for LDS BC IT240
RUNTIME: 
Approx. 1 min
NOTES:
These are the varioius Extract, Transform, and Load steps needed for the Example Data
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/


USE [DFNB2]
GO

/****** Object:  View [dbo].[v_CustomersBranchTransactions]    Script Date: 12/13/2020 11:41:52 AM ******/
DROP VIEW [dbo].[v_CustomersBranchTransactions]
GO

/****** Object:  View [dbo].[v_CustomersBranchTransactions]    Script Date: 12/13/2020 11:41:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_CustomersBranchTransactions] AS 
SELECT TOP (50) c.first_name, 
       c.last_name, 
       --c.cust_since_date, 
       c.gender, 
       MAX(f.tran_amt) AS max_tran_amt, 
       b.branch_desc, 
       t.tran_type_desc
FROM dbo.tblCustomersDim AS c
     JOIN dbo.tblBranchDim AS b ON b.branch_id = c.branch_id
     JOIN dbo.tblTransactionFacts AS f ON f.branch_id = b.branch_id
     JOIN dbo.tblTransactionsTypeDim AS t ON t.tran_type_id = f.tran_type_id
GROUP BY c.first_name, 
       c.last_name, 
       --c.cust_since_date,
       c.gender,
	   --f.tran_amt,
	   b.branch_desc, 
       t.tran_type_desc
HAVING MAX(f.tran_amt) > '1000000';
GO


