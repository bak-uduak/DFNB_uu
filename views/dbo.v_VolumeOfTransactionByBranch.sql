/*****************************************************************************************************************
NAME:    dbo.v_VolumeOfTransactionByBranch
PURPOSE: Create the dbo.v_VolumeOfTransactionByBranch view
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

/****** Object:  View [dbo].[v_VolumeOfTransactionByBranch]    Script Date: 12/12/2020 9:43:32 AM ******/
DROP VIEW [dbo].[v_VolumeOfTransactionByBranch]
GO

/****** Object:  View [dbo].[v_VolumeOfTransactionByBranch]    Script Date: 12/12/2020 9:43:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_VolumeOfTransactionByBranch] AS 
SELECT MAX(a.loan_amt) AS laon_amt, 
       a.open_date, 
       COUNT(a.pri_cust_id) AS pri_cust, 
       b.branch_desc,
	   COUNT(t.tran_amt) AS tran_amt
FROM dbo.tblAccountsDim AS a
     JOIN dbo.tblBranchDim AS b ON a.branch_id = b.branch_id
     JOIN dbo.tbltransactionFacts AS t ON t.branch_id = b.branch_id
WHERE a.open_date = '2018-12-31'
      OR a.open_date = '2019-05-31'
GROUP BY a.open_date, 
         b.branch_desc;
GO


