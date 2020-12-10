/*****************************************************************************************************************
NAME:    dbo.v_AccountCurrentBalance
PURPOSE: Create the dbo.v_AccountCurrentBalance view
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

/****** Object:  View [dbo].[v_AccountCurrentBalance]    Script Date: 12/2/2020 11:58:50 AM ******/
DROP VIEW [dbo].[v_AccountCurrentBalance]
GO

/****** Object:  View [dbo].[v_AccountCurrentBalance]    Script Date: 12/2/2020 11:58:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_AccountCurrentBalance] as
SELECT af.acct_id, 
       af.as_of_date,  
       MAX(af.cur_bal) AS max_bal
FROM dbo.tblAccountFacts AS af
GROUP BY af.acct_id,
		af.as_of_date;
GO


