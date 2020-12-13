/*****************************************************************************************************************
NAME:    dbo.v_TransactionFrequency
PURPOSE: Create the dbo.v_TransactionFrequency view
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

/****** Object:  View [dbo].[v_TransactionFrequency]    Script Date: 12/12/2020 11:35:28 AM ******/
DROP VIEW [dbo].[v_TransactionFrequency]
GO

/****** Object:  View [dbo].[v_TransactionFrequency]    Script Date: 12/12/2020 11:35:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Transaction frequency
--SELECT * FROM dbo.tblTransactionsTypeDim 
--SELECT * FROM dbo.tblTransactionFacts
CREATE VIEW [dbo].[v_TransactionFrequency] AS 
SELECT f.branch_id,
	   t.tran_type_desc,  
       COUNT(f.tran_time) AS tran_time, 
       f.tran_date 
FROM dbo.tblTransactionsTypeDim AS t
     JOIN dbo.tblTransactionFacts AS f ON f.tran_type_id = t.tran_type_id
 WHERE f.tran_date > '2017-12-31'
GROUP BY  t.tran_type_desc,
		  f.tran_date,
		  f.branch_id
--ORDER BY f.branch_id,
	    -- tran_date;

--dbo.tblTransactionFacts tblTransactionsTypeDim
GO


