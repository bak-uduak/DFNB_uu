USE [DFNB2];
GO

/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 11/23/2020 5:18:07 PM ******/

DROP TABLE [dbo].[tblAddressDim];
GO

/****** Object:  Table [dbo].[tblAddressDim]    Script Date: 11/23/2020 5:18:07 PM ******/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE TABLE [dbo].[tblAddressDim]
([add_id]   [INT] NOT NULL, 
 [add_type] [VARCHAR](1) NOT NULL, 
 [add_lon]  [DECIMAL](16, 12) NOT NULL, 
 [add_lat]  [DECIMAL](16, 12) NOT NULL, 
 CONSTRAINT [PK_tblAddressDim] PRIMARY KEY CLUSTERED([add_id] ASC)
 WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)
ON [PRIMARY];
GO
SELECT *
FROM dbo.tblAddressDim TAD;