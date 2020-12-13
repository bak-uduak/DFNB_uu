/*****************************************************************************************************************
NAME:    dbo.v_TransactionAmountAndFees
PURPOSE: Create the dbo.v_TransactionAmountAndFees view
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

/****** Object:  View [dbo].[v_TransactionAmountAndFees]    Script Date: 12/12/2020 11:55:54 PM ******/
DROP VIEW [dbo].[v_TransactionAmountAndFees]
GO

/****** Object:  View [dbo].[v_TransactionAmountAndFees]    Script Date: 12/12/2020 11:55:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_TransactionAmountAndFees] AS 
SELECT --t.tran_type_code, 
       t.tran_type_desc, 
       SUM(f.tran_amt *t.tran_fee_prct/100) AS fee_ratio, 
       SUM(f.tran_amt) AS tran_amt, 
       f.tran_fee_amt,
	   f.branch_id
FROM dbo.tblTransactionsTypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON t.tran_type_id = f.tran_type_id
GROUP BY --t.tran_type_code,
		 f.tran_fee_amt,
		 f.branch_id,
         t.tran_type_desc
HAVING SUM(f.tran_amt *t.tran_fee_prct/100) > 1
GO


