USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 12/1/2020 10:56:11 AM ******/
DROP TABLE [dbo].[tblBranchDim]
GO

/****** Object:  Table [dbo].[tblBranchDim]    Script Date: 12/1/2020 10:56:11 AM ******/
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


