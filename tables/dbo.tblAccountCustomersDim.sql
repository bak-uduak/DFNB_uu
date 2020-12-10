/*****************************************************************************************************************
NAME:    LoadData
PURPOSE: ETL process for Example data
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/02/2019   UUDUAK  1. Built this table for LDS BC IT240
1.1     10/27/2019   UUDUAK  1. Added fact table load for LDS BC IT243
1.2     05/06/2020   UUDUAK  1. Added Team Name
1.3     05/11/2020   UUDUAK  1. Added dynamic column for Team Name
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

/****** Object:  Table [dbo].[tblAccountCustomersDim]    Script Date: 11/26/2020 1:32:55 PM ******/
DROP TABLE [dbo].[tblAccountCustomersDim]
GO

/****** Object:  Table [dbo].[tblAccountCustomersDim]    Script Date: 11/26/2020 1:32:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountCustomersDim](
	[acct_cust_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblAccountCustomersDim] PRIMARY KEY CLUSTERED 
(
	[acct_cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


