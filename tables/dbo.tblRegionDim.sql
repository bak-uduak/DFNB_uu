USE [DFNB2]
GO

/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 12/1/2020 12:02:49 PM ******/
DROP TABLE [dbo].[tblRegionDim]
GO

/****** Object:  Table [dbo].[tblRegionDim]    Script Date: 12/1/2020 12:02:49 PM ******/
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


