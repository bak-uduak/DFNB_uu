USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblCustomersDim]    Script Date: 12/1/2020 11:42:35 AM ******/
DROP TABLE [dbo].[tblCustomersDim]
GO

/****** Object:  Table [dbo].[tblCustomersDim]    Script Date: 12/1/2020 11:42:35 AM ******/
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


