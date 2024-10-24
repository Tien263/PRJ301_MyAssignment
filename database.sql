USE [DEMO2]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[aid] [int] NOT NULL,
	[sdid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[anpha] [int] NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[did] [int] IDENTITY(1,1) NOT NULL,
	[dname] [nvarchar](100) NOT NULL,
	[tid] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[eid] [int] IDENTITY(1,1) NOT NULL,
	[ename] [nvarchar](150) NOT NULL,
	[salary_band] [decimal](18, 2) NULL,
	[did] [int] NOT NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[createdBy] [varchar](100) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](150) NOT NULL,
	[url] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[plid] [int] NOT NULL,
	[plname] [nvarchar](100) NOT NULL,
	[start] [date] NOT NULL,
	[end] [date] NOT NULL,
	[did] [int] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[plid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanCampaiqn]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanCampaiqn](
	[pcid] [int] NOT NULL,
	[plid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_PlanCampaiqn] PRIMARY KEY CLUSTERED 
(
	[pcid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [nvarchar](100) NOT NULL,
	[Time] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] IDENTITY(1,1) NOT NULL,
	[rname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule_Detail]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule_Detail](
	[sdid] [int] NOT NULL,
	[scid] [int] NOT NULL,
	[eid] [int] NOT NULL,
	[quatity] [int] NOT NULL,
 CONSTRAINT [PK_Schedule_Detail] PRIMARY KEY CLUSTERED 
(
	[sdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleCompaiqn]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleCompaiqn](
	[scid] [int] NOT NULL,
	[pcid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[shift] [varchar](50) NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_ScheduleCompaiqn] PRIMARY KEY CLUSTERED 
(
	[scid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[tid] [int] NOT NULL,
	[tname] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10/10/2024 9:00:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[username] [varchar](100) NOT NULL,
	[rid] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([did], [dname], [tid]) VALUES (1, N'Production Workshop No. 1', 2)
INSERT [dbo].[Department] ([did], [dname], [tid]) VALUES (2, N'Production Workshop No. 2', 2)
INSERT [dbo].[Department] ([did], [dname], [tid]) VALUES (3, N'Production Workshop No. 3', 2)
INSERT [dbo].[Department] ([did], [dname], [tid]) VALUES (4, N'Production Workshop No. 4', 2)
INSERT [dbo].[Department] ([did], [dname], [tid]) VALUES (5, N'Production Workshop No. 5', 2)
INSERT [dbo].[Department] ([did], [dname], [tid]) VALUES (6, N'Production Workshop No. 6', 2)
INSERT [dbo].[Department] ([did], [dname], [tid]) VALUES (7, N'Production Planning', 1)
INSERT [dbo].[Department] ([did], [dname], [tid]) VALUES (8, N'Production Execution', 1)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (2, N'Nguyễn Văn An', NULL, 1, 1, N'Hà Nội', CAST(N'1987-04-23' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (3, N'Trần Thị Bích', NULL, 3, 0, N'Hồ Chí Minh', CAST(N'1995-11-16' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (4, N'Lê Văn Cường', NULL, 2, 1, N'Đà Nẵng', CAST(N'1990-10-05' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (5, N'Phạm Thị Diệu', NULL, 4, 0, N'Hải Phòng', CAST(N'2000-03-29' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (6, N'Hoàng Văn Dũng', NULL, 5, 1, N'Kiên Giang', CAST(N'1985-09-07' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (7, N'Đinh Thị Hà', NULL, 1, 0, N'An Giang', CAST(N'1993-12-25' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (8, N'Vũ Văn Khánh', NULL, 7, 1, N'Ninh Bình', CAST(N'1977-05-14' AS Date), N'admin1')
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (9, N'Bùi Thị Lan', NULL, 4, 0, N'Vĩnh Phúc', CAST(N'1999-11-09' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (10, N'Đoàn Văn Minh', NULL, 5, 1, N'Phú Thọ
', CAST(N'1971-08-30' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (11, N'Phan Thị Oanh', NULL, 2, 0, N'Quảng Nam', CAST(N'1988-06-02' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (12, N'Ngô Văn Phú', NULL, 1, 1, N'Lâm Đồng', CAST(N'1975-03-18' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (13, N'Trịnh Thị Quỳnh', NULL, 6, 0, N'Thái Bình', CAST(N'2001-01-21' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (14, N'Lý Văn Sơn', NULL, 1, 1, N'Hà Nội', CAST(N'1996-05-26' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (15, N'Phạm Thị Trang', NULL, 4, 0, N'Vĩnh Phúc', CAST(N'1984-09-14' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (16, N'Nguyễn Văn Tùng', NULL, 2, 1, N'Hải Phòng', CAST(N'1992-12-08' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (17, N'Trần Thị Uyên', NULL, 6, 0, N'Thái Bình', CAST(N'1979-10-23' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (18, N'Lê Văn Vinh', NULL, 5, 1, N'Ninh Bình', CAST(N'1998-04-11' AS Date), NULL)
INSERT [dbo].[Employee] ([eid], [ename], [salary_band], [did], [gender], [address], [dob], [createdBy]) VALUES (19, N'Phan Thị Xuân', NULL, 8, 0, N'An Giang', CAST(N'1980-07-05' AS Date), N'admin2')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'Create Employee', N'/employee/create')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Update Employee', N'/employee/update')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'Delete Employee', N'/employee/delete')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'List all Employees', N'/employee/list')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (5, N'Search Employees', N'/employee/search')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (6, N'View Employee', N'/employee/detail')
SET IDENTITY_INSERT [dbo].[Feature] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([pid], [pname], [Time]) VALUES (1, N'Giỏ', 2)
INSERT [dbo].[Product] ([pid], [pname], [Time]) VALUES (2, N'Thúng', 1)
INSERT [dbo].[Product] ([pid], [pname], [Time]) VALUES (3, N'Mẹt', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([rid], [rname]) VALUES (1, N'Head of HRD')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (2, N'Recruitment Officer')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (3, N'Profile Officer')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (4, N'Tracking Performance')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (5, N'Payroll Management')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (6, N'Reporting')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (7, N'Production Planning')
INSERT [dbo].[Role] ([rid], [rname]) VALUES (8, N'Worker Allocation')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 1)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 2)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 3)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 4)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 5)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (1, 6)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 1)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (2, 6)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (3, 2)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (3, 3)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (3, 4)
INSERT [dbo].[RoleFeature] ([rid], [fid]) VALUES (3, 5)
GO
INSERT [dbo].[Type] ([tid], [tname]) VALUES (1, N'Head Office')
INSERT [dbo].[Type] ([tid], [tname]) VALUES (2, N'Workshop')
GO
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin1', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin10', N'123', 0)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin11', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin2', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin3', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin4', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin5', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin6', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin7', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin8', N'123', 1)
INSERT [dbo].[User] ([username], [password], [is_active]) VALUES (N'admin9', N'123', 1)
GO
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'admin1', 1)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'admin2', 2)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'admin3', 3)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'admin4', 4)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'admin5', 5)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'admin6', 6)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'admin7', 7)
INSERT [dbo].[UserRole] ([username], [rid]) VALUES (N'admin8', 8)
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Schedule_Detail] FOREIGN KEY([sdid])
REFERENCES [dbo].[Schedule_Detail] ([sdid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Schedule_Detail]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Type] FOREIGN KEY([tid])
REFERENCES [dbo].[Type] ([tid])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Type]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([createdBy])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Department] FOREIGN KEY([did])
REFERENCES [dbo].[Department] ([did])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Department]
GO
ALTER TABLE [dbo].[PlanCampaiqn]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampaiqn_Plan] FOREIGN KEY([plid])
REFERENCES [dbo].[Plan] ([plid])
GO
ALTER TABLE [dbo].[PlanCampaiqn] CHECK CONSTRAINT [FK_PlanCampaiqn_Plan]
GO
ALTER TABLE [dbo].[PlanCampaiqn]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampaiqn_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[PlanCampaiqn] CHECK CONSTRAINT [FK_PlanCampaiqn_Product]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Feature]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
ALTER TABLE [dbo].[Schedule_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Detail_Employee] FOREIGN KEY([eid])
REFERENCES [dbo].[Employee] ([eid])
GO
ALTER TABLE [dbo].[Schedule_Detail] CHECK CONSTRAINT [FK_Schedule_Detail_Employee]
GO
ALTER TABLE [dbo].[Schedule_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Detail_ScheduleCompaiqn] FOREIGN KEY([scid])
REFERENCES [dbo].[ScheduleCompaiqn] ([scid])
GO
ALTER TABLE [dbo].[Schedule_Detail] CHECK CONSTRAINT [FK_Schedule_Detail_ScheduleCompaiqn]
GO
ALTER TABLE [dbo].[ScheduleCompaiqn]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleCompaiqn_PlanCampaiqn] FOREIGN KEY([pcid])
REFERENCES [dbo].[PlanCampaiqn] ([pcid])
GO
ALTER TABLE [dbo].[ScheduleCompaiqn] CHECK CONSTRAINT [FK_ScheduleCompaiqn_PlanCampaiqn]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([username])
REFERENCES [dbo].[User] ([username])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
