/*****************************************************************************************************************
NAME:    dbo.v_MaxTransactionAMountByBranch
PURPOSE: Create the dbo.v_MaxTransactionAMountByBranch view
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

/****** Object:  View [dbo].[v_MaxTransactionAMountByBranch]    Script Date: 12/12/2020 8:37:07 AM ******/
DROP VIEW [dbo].[v_MaxTransactionAMountByBranch]
GO

/****** Object:  View [dbo].[v_MaxTransactionAMountByBranch]    Script Date: 12/12/2020 8:37:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_MaxTransactionAMountByBranch] AS 
SELECT --t.tran_type_id, 
       --t.tran_type_code, 
       t.tran_type_desc, 
       --t.tran_fee_prct, 
       MAX(f.tran_amt) AS t_amt, 
       COUNT(f.tran_fee_amt) AS t_fee_amt, 
       b.branch_desc
FROM dbo.tblTransactionsTypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON f.tran_type_id = t.tran_type_id
     JOIN dbo.tblBranchDim AS b ON b.branch_id = f.branch_id
WHERE f.tran_fee_amt > '1000'
      AND f.tran_amt > '500000'
GROUP BY t.tran_type_id, 
         t.tran_type_code, 
         t.tran_type_desc,
		 b.branch_desc,
         t.tran_fee_prct;
GO


