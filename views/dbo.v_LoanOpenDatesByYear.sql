/*****************************************************************************************************************
NAME:    dbo.v_LoanOpenDatesByYear
PURPOSE: Create the dbo.v_CountTotalAccount view
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
/****** Object:  View [dbo].[v_LoanOpenDatesByYear]    Script Date: 12/9/2020 10:29:51 AM ******/
DROP VIEW [dbo].[v_LoanOpenDatesByYear]
GO

/****** Object:  View [dbo].[v_LoanOpenDatesByYear]    Script Date: 12/9/2020 10:29:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_LoanOpenDatesByYear] AS 
SELECT acd.acct_id, 
       YEAR(acd.open_date) AS open_date_year, 
       SUM(acd.loan_amt) AS _total_loan_amt
FROM dbo.tblAccountsDim AS acd
WHERE acd.open_date = '2018' 
GROUP BY YEAR(acd.open_date), 
         acd.loan_amt,
         acd.acct_id
GO


