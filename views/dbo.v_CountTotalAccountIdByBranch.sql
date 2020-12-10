/*****************************************************************************************************************
NAME:    dbo.v_CountTotalAccountIdByBranch
PURPOSE: Create the dbo.v_CountTotalAccountIdByBranch view
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

/****** Object:  View [dbo].[v_CountTotalAccountIdByBranch]    Script Date: 12/9/2020 11:02:27 AM ******/
DROP VIEW [dbo].[v_CountTotalAccountIdByBranch]
GO

/****** Object:  View [dbo].[v_CountTotalAccountIdByBranch]    Script Date: 12/9/2020 11:02:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW  [dbo].[v_CountTotalAccountIdByBranch] as 
SELECT bd.branch_desc, 
       acd.open_date, 
       COUNT(acd.branch_id) AS 'count_branch'
FROM dbo.tblAccountsDim AS acd
     JOIN dbo.tblBranchDim AS bd ON acd.branch_id = bd.branch_id
WHERE YEAR(acd.open_date) = '2019'
      AND bd.branch_desc = 'Clinton'
      OR bd.branch_desc = 'Greenville'
	  AND acd.open_date > '2018-12-31'
GROUP BY bd.branch_desc, 
         acd.open_date
GO


