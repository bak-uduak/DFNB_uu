/*****************************************************************************************************************
NAME:    dbo.v_transactionTypeByBranch
		  
PURPOSE: Create the dbo.v_transactionTypeByBranch view
					
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

/****** Object:  View [dbo].[v_transactionTypeByBranch]    Script Date: 12/12/2020 12:01:19 PM ******/
DROP VIEW [dbo].[v_transactionTypeByBranch]
GO

/****** Object:  View [dbo].[v_transactionTypeByBranch]    Script Date: 12/12/2020 12:01:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_transactionTypeByBranch] AS 
SELECT t.tran_type_id, 
       COUNT(t.tran_type_desc) AS count_tran_type,
	   t.tran_type_desc,
       b.branch_desc
FROM dbo.tbltransactionsTypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON t.tran_type_id = f.tran_type_id
     JOIN dbo.tblBranchDim AS b ON b.branch_id = f.branch_id
GROUP BY t.tran_type_id,
		 t.tran_type_desc,
		 b.branch_desc;
GO


