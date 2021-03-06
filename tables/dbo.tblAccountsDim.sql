USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblAccountsDim]    Script Date: 12/1/2020 7:50:12 AM ******/
DROP TABLE [dbo].[tblAccountsDim]
GO

/****** Object:  Table [dbo].[tblAccountsDim]    Script Date: 12/1/2020 7:50:12 AM ******/
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


