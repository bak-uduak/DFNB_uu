/*****************************************************************************************************************
NAME:    dbo.v_TotalLoanAmountByBranch
PURPOSE: Create the dbo.v_TotalLoanAmountByBranch view
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

/****** Object:  View [dbo].[v_TotalLoanAmountByBranch]    Script Date: 12/2/2020 9:08:21 AM ******/
DROP VIEW [dbo].[v_TotalLoanAmountByBranch]
GO

/****** Object:  View [dbo].[v_TotalLoanAmountByBranch]    Script Date: 12/2/2020 9:08:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Loan Amounts
CREATE VIEW [dbo].[v_TotalLoanAmountByBranch] as 
SELECT brd.branch_id, 
       brd.branch_desc, 
       acd.pri_cust_id,
	   Count(loan_amt) AS 'count_loan_number',
       SUM(loan_amt) AS 'total_loan_amt'
FROM dbo.tblAccountsDim AS acd
     JOIN dbo.tblBranchDim AS brd ON brd.branch_id = brd.branch_id
GROUP BY brd.branch_id, 
         brd.branch_desc, 
         acd.pri_cust_id;
		 --'total_loan_amt' asc;

		
GO


