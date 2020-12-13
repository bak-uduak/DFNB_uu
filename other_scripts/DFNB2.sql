/*****************************************************************************************************************
NAME:    LoadData
PURPOSE: ETL process for Example data
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/02/2019   UUDO       1. Built this table for LDS BC IT240
1.1     10/27/2019   UUDO       1. Added fact table load for LDS BC IT243
1.2     05/06/2020   UUDO       1. Added Team Name
1.3     05/11/2020   UUDO       1. Added dynamic column for Team Name
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

/****** Object:  Table [dbo].[tblAccountCustomersDim]    Script Date: 12/1/2020 12:05:49 PM ******/
DROP TABLE [dbo].[tblAccountCustomersDim]
GO

/****** Object:  Table [dbo].[tblAccountCustomersDim]    Script Date: 12/1/2020 12:05:49 PM ******/
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


/****** Object:  Table [dbo].[tblAccountFacts]    Script Date: 12/1/2020 12:07:56 PM ******/
DROP TABLE [dbo].[tblAccountFacts]
GO

/****** Object:  Table [dbo].[tblAccountFacts]    Script Date: 12/1/2020 12:07:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountFacts](
	[acct_facts_id] [int] IDENTITY(1,1) NOT NULL,
	[acct_id] [int] NOT NULL,
	[as_of_date] [date] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
 CONSTRAINT [PK_tblAccountFacts] PRIMARY KEY CLUSTERED 
(
	[acct_facts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[tblAccountsDim]    Script Date: 12/1/2020 12:08:45 PM ******/
DROP TABLE [dbo].[tblAccountsDim]
GO

/****** Object:  Table [dbo].[tblAccountsDim]    Script Date: 12/1/2020 12:08:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccountsDim](
	[acct_id] [int] NOT NULL,
	[prod_id] [smallint] NOT NULL,
	[pri_cust_id] [smallint] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
 CONSTRAINT [PK_tblAccountsDim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 12/1/2020 12:10:00 PM ******/
DROP TABLE [dbo].[tblAddressDim]
GO

/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 12/1/2020 12:10:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAddressDim](
	[cust_add_id] [int] NOT NULL,
	[cust_add_lat] [decimal](16, 12) NOT NULL,
	[cust_add_lon] [decimal](16, 12) NOT NULL,
	[cust_add_type] [char](1) NOT NULL,
 CONSTRAINT [PK_tblAddressDim] PRIMARY KEY CLUSTERED 
(
	[cust_add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblAreaDim]    Script Date: 12/1/2020 12:11:04 PM ******/
DROP TABLE [dbo].[tblAreaDim]
GO

/****** Object:  Table [dbo].[tblAreaDim]    Script Date: 12/1/2020 12:11:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAreaDim](
	[area_id] [int] NOT NULL,
	[area_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblAreaDim] PRIMARY KEY CLUSTERED 
(
	[area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 12/1/2020 12:15:24 PM ******/
DROP TABLE [dbo].[tblBranchDim]
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 12/1/2020 12:15:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBranchDim](
	[branch_id] [smallint] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_desc] [varchar](100) NOT NULL,
	[region_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
	[branch_add_id] [int] NOT NULL,
 CONSTRAINT [PK_tblBranchDim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCustomersAccountRoleDim]    Script Date: 12/1/2020 12:16:09 PM ******/
DROP TABLE [dbo].[tblCustomersAccountRoleDim]
GO

/****** Object:  Table [dbo].[tblCustomersAccountRoleDim]    Script Date: 12/1/2020 12:16:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCustomersAccountRoleDim](
	[acct_cust_role_id] [smallint] NOT NULL,
	[acct_cust_role_name] [varchar](100) NULL,
 CONSTRAINT [PK_tblCustomersAccountRoleDim] PRIMARY KEY CLUSTERED 
(
	[acct_cust_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblCustomersDim]    Script Date: 12/1/2020 12:16:48 PM ******/
DROP TABLE [dbo].[tblCustomersDim]
GO

/****** Object:  Table [dbo].[tblCustomersDim]    Script Date: 12/1/2020 12:16:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCustomersDim](
	[cust_id] [smallint] NOT NULL,
	[pri_branch_id] [smallint] NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[cust_since_date] [date] NOT NULL,
	[birth_date] [date] NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[cust_add_id] [int] NULL,
	[cust_rel_id] [int] NULL,
 CONSTRAINT [PK_tblCustomersDim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblProductsDim]    Script Date: 12/1/2020 12:17:53 PM ******/
DROP TABLE [dbo].[tblProductsDim]
GO

/****** Object:  Table [dbo].[tblProductsDim]    Script Date: 12/1/2020 12:17:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblProductsDim](
	[prod_id] [smallint] NOT NULL,
	[prod_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProductsDim] PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 12/1/2020 12:18:20 PM ******/
DROP TABLE [dbo].[tblRegionDim]
GO

/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 12/1/2020 12:18:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblRegionDim](
	[region_id] [int] NOT NULL,
	[region_name] [nchar](50) NULL,
 CONSTRAINT [PK_tblRegionDim] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [DFNB2]
GO

ALTER TABLE [dbo].[tblTransactionFacts] DROP CONSTRAINT [FK_tblTransactionFacts_tblTransactionsTypeDim]
GO

ALTER TABLE [dbo].[tblTransactionFacts] DROP CONSTRAINT [FK_tblTransactionFacts_tblBranchDim]
GO

/****** Object:  Table [dbo].[tblTransactionFacts]    Script Date: 12/12/2020 9:51:53 AM ******/
DROP TABLE [dbo].[tblTransactionFacts]
GO

/****** Object:  Table [dbo].[tblTransactionFacts]    Script Date: 12/12/2020 9:51:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTransactionFacts](
	[tran_facts_id] [int] IDENTITY(1,1) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[acct_id] [int] NOT NULL,
	[tran_date] [date] NOT NULL,
	[tran_time] [time](7) NOT NULL,
	[tran_type_id] [smallint] NOT NULL,
	[tran_amt] [int] NOT NULL,
	[tran_fee_amt] [decimal](15, 3) NOT NULL,
 CONSTRAINT [PK__tblTrans__C0382323F44A6630] PRIMARY KEY CLUSTERED 
(
	[tran_facts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblTransactionFacts]  WITH CHECK ADD  CONSTRAINT [FK_tblTransactionFacts_tblBranchDim] FOREIGN KEY([branch_id])
REFERENCES [dbo].[tblBranchDim] ([branch_id])
GO

ALTER TABLE [dbo].[tblTransactionFacts] CHECK CONSTRAINT [FK_tblTransactionFacts_tblBranchDim]
GO

ALTER TABLE [dbo].[tblTransactionFacts]  WITH CHECK ADD  CONSTRAINT [FK_tblTransactionFacts_tblTransactionsTypeDim] FOREIGN KEY([tran_type_id])
REFERENCES [dbo].[tblTransactionsTypeDim] ([tran_type_id])
GO

ALTER TABLE [dbo].[tblTransactionFacts] CHECK CONSTRAINT [FK_tblTransactionFacts_tblTransactionsTypeDim]
GO

USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblTransactionsTypeDim]    Script Date: 12/12/2020 9:52:52 AM ******/
DROP TABLE [dbo].[tblTransactionsTypeDim]
GO

/****** Object:  Table [dbo].[tblTransactionsTypeDim]    Script Date: 12/12/2020 9:52:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTransactionsTypeDim](
	[tran_type_id] [smallint] NOT NULL,
	[tran_type_code] [varchar](5) NOT NULL,
	[tran_type_desc] [varchar](100) NOT NULL,
	[tran_fee_prct] [decimal](4, 3) NOT NULL,
	[cur_cust_req_ind] [varchar](1) NOT NULL,
 CONSTRAINT [PK_tblTransactionsTypeDim] PRIMARY KEY CLUSTERED 
(
	[tran_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




