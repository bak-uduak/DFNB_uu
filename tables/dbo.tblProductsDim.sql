USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblProductsDim]    Script Date: 11/26/2020 10:30:48 AM ******/
DROP TABLE [dbo].[tblProductsDim]
GO

/****** Object:  Table [dbo].[tblProductsDim]    Script Date: 11/26/2020 10:30:48 AM ******/
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


