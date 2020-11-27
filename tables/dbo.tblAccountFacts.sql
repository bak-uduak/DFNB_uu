USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblAccountFacts]    Script Date: 11/27/2020 1:10:47 PM ******/
DROP TABLE [dbo].[tblAccountFacts]
GO

/****** Object:  Table [dbo].[tblAccountFacts]    Script Date: 11/27/2020 1:10:47 PM ******/
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


