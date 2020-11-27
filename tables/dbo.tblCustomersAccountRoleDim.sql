USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblCustomersAccountRoleDim]    Script Date: 11/26/2020 2:18:05 PM ******/
DROP TABLE [dbo].[tblCustomersAccountRoleDim]
GO

/****** Object:  Table [dbo].[tblCustomersAccountRoleDim]    Script Date: 11/26/2020 2:18:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCustomersAccountRoleDim](
	[cust_acct_role_id] [smallint] NOT NULL,
	[cust_acct_role_name] [varchar](100) NULL,
 CONSTRAINT [PK_tblCustomersAccountRoleDim] PRIMARY KEY CLUSTERED 
(
	[cust_acct_role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


