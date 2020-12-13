/*****************************************************************************************************************
NAME:    dbo.v_TransactionProfitByBranch 
PURPOSE: Create the dbo.v_TransactionProfitByBranch view
					
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

/****** Object:  View [dbo].[v_TransactionProfitByBranch]    Script Date: 12/12/2020 3:08:23 PM ******/
DROP VIEW [dbo].[v_TransactionProfitByBranch]
GO

/****** Object:  View [dbo].[v_TransactionProfitByBranch]    Script Date: 12/12/2020 3:08:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Transaction Profitability

--SELECT * FROM dbo.tblTransactionFacts
--SELECT * FROM dbo.tblTransactionsTypeDim
CREATE VIEW [dbo].[v_TransactionProfitByBranch] AS 
SELECT (f.tran_amt * f.tran_fee_amt/100) AS profit,         
       t.tran_type_desc, 
       b.branch_id, 
       b.branch_desc 
FROM dbo.tblTransactionstypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON t.tran_type_id = f.tran_type_id
     JOIN dbo.tblBranchDim AS b ON f.branch_id = b.branch_id
WHERE (f.tran_amt * f.tran_fee_amt/100) > 1
GROUP BY t.tran_type_desc,
		 b.branch_id,
		 f.tran_fee_amt,
		 b.branch_desc,
		 f.tran_amt
--ORDER BY b.branch_id;
GO


