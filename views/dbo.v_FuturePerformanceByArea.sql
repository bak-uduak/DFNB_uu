/*****************************************************************************************************************
NAME:    dbo.v_FuturePerformanceByArea
PURPOSE: Create the dbo.v_FuturePerformanceByArea view
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

/****** Object:  View [dbo].[v_FuturePerformanceByArea]    Script Date: 12/19/2020 11:06:23 PM ******/
DROP VIEW [dbo].[v_FuturePerformanceByArea]
GO

/****** Object:  View [dbo].[v_FuturePerformanceByArea]    Script Date: 12/19/2020 11:06:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_FuturePerformanceByArea] AS (
SELECT b.area_id AS area_id, 
       YEAR(a.open_date) AS year_date, 
       SUM(a.loan_amt) AS total_loan_amt
FROM dbo.tblAccountsDim AS a
     JOIN dbo.tblBranchDim AS b ON a.branch_id = b.branch_id
WHERE YEAR(a.open_date) IN(2017, 2018, 2019)
GROUP BY b.area_id, 
         YEAR(a.open_date));
GO


