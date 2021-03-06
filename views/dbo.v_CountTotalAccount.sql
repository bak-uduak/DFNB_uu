/*****************************************************************************************************************
NAME:    dbo.v_CountTotalAccount
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

/****** Object:  View [dbo].[v_CountTotalAccount]    Script Date: 12/2/2020 8:10:38 AM ******/
DROP VIEW [dbo].[v_CountTotalAccount]
GO

/****** Object:  View [dbo].[v_CountTotalAccount]    Script Date: 12/2/2020 8:10:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW  [dbo].[v_CountTotalAccount] as 
SELECT dbo.tblAccountsDim.branch_id, 
       dbo.tblBranchDim.branch_desc, 
       COUNT(acct_id) AS 'count_total_acct'
FROM dbo.tblAccountsDim
     JOIN dbo.tblBranchDim ON dbo.tblBranchDim.branch_id = dbo.tblBranchDim.branch_id
WHERE year(dbo.tblAccountsDim.open_date) > 2017
GROUP BY dbo.tblAccountsDim.branch_id, 
         dbo.tblBranchDim.branch_desc
GO


