USE [Assignment]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/29/2024 10:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[did] [varchar](10) NOT NULL,
	[dname] [nvarchar](150) NOT NULL,
	[tid] [int] NOT NULL,
	[taddress] [nvarchar](100) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 9/29/2024 10:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[tid] [int] NOT NULL,
	[tname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([did], [dname], [tid], [taddress]) VALUES (N'HO001', N'HeadOffice1', 2, N'Tòa Nhà ABC, Số 15 Đường Hoàng Diệu, Quận Ba Đình, Hà Nội.')
INSERT [dbo].[Department] ([did], [dname], [tid], [taddress]) VALUES (N'HO002', N'HeadOffice2', 2, N'Tầng 5, Tòa Nhà FPT, Số 89 Đường Duy Tân, Quận Cầu Giấy, Hà Nội.')
INSERT [dbo].[Department] ([did], [dname], [tid], [taddress]) VALUES (N'HO003', N'HeadOffice3', 2, N'Số 78 Đường Bà Triệu, Quận Hoàn Kiếm, Hà Nội.')
INSERT [dbo].[Department] ([did], [dname], [tid], [taddress]) VALUES (N'WS001', N'Factory1', 1, N' Khu Công Nghiệp Thăng Long, Xã Võng La, Huyện Đông Anh, Hà Nội.')
INSERT [dbo].[Department] ([did], [dname], [tid], [taddress]) VALUES (N'WS002', N'Factory2', 1, N'Lô 9, KCN Nội Bài, Huyện Sóc Sơn, Hà Nội.')
INSERT [dbo].[Department] ([did], [dname], [tid], [taddress]) VALUES (N'WS003', N'Factory3', 1, N'Cụm Công Nghiệp Ninh Hiệp, Xã Ninh Hiệp, Huyện Gia Lâm, Hà Nội.')
GO
INSERT [dbo].[Type] ([tid], [tname]) VALUES (1, N'WS')
INSERT [dbo].[Type] ([tid], [tname]) VALUES (2, N'HO')
GO
