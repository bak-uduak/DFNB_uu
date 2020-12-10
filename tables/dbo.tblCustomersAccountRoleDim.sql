USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblCustomersAccountRoleDim]    Script Date: 12/1/2020 11:31:38 AM ******/
DROP TABLE [dbo].[tblCustomersAccountRoleDim]
GO

/****** Object:  Table [dbo].[tblCustomersAccountRoleDim]    Script Date: 12/1/2020 11:31:38 AM ******/
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


