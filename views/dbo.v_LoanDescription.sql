/*****************************************************************************************************************
NAME:    dbo.v_LoanDescription
PURPOSE: Create the dbo.v_LoanDescription view
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

/****** Object:  View [dbo].[v_LoanDescription]    Script Date: 12/9/2020 10:33:23 AM ******/
DROP VIEW [dbo].[v_LoanDescription]
GO

/****** Object:  View [dbo].[v_LoanDescription]    Script Date: 12/9/2020 10:33:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_LoanDescription] AS 
SELECT acd.branch_id, COUNT(1) AS total, 
       acd.loan_amt, 
       bd.branch_desc, 
       SUM(acd.loan_amt) AS 'branch_laons'
FROM dbo.tblBranchDim AS bd
     JOIN dbo.tblAccountsDim AS acd ON acd.branch_id = bd.branch_id
WHERE 'loan_amt' >= '5000000.0000' AND 
		bd.branch_desc = 'Franklin' OR 
		bd.branch_desc = 'Springfield'
GROUP BY acd.branch_id, 
         acd.loan_amt, 
         bd.branch_desc
GO


