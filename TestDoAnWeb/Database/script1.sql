USE [master]
GO
/****** Object:  Database [QLThiTracNghiemOnl]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE DATABASE [QLThiTracNghiemOnl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLThiTracNghiemOnl', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLThiTracNghiemOnl.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLThiTracNghiemOnl_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QLThiTracNghiemOnl_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLThiTracNghiemOnl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET  MULTI_USER 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET QUERY_STORE = OFF
GO
USE [QLThiTracNghiemOnl]
GO
/****** Object:  Table [dbo].[BaiLams]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiLams](
	[MaHocSinh] [int] NOT NULL,
	[MaCauHoi] [int] NOT NULL,
	[MaLuaChon] [int] NULL,
 CONSTRAINT [PK_BaiLams] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi_LuaChon]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi_LuaChon](
	[MaCauHoi] [int] NOT NULL,
	[MaLuaChon] [int] NOT NULL,
	[CauTraLoi] [bit] NOT NULL,
 CONSTRAINT [PK_CauHoi_LuaChon] PRIMARY KEY CLUSTERED 
(
	[MaCauHoi] ASC,
	[MaLuaChon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHois]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHois](
	[MaCauHoi] [int] IDENTITY(1,1) NOT NULL,
	[MaDeThi] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[MaGiaoVien] [int] NULL,
 CONSTRAINT [PK_CauHois] PRIMARY KEY CLUSTERED 
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeThis]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeThis](
	[MaDeThi] [int] IDENTITY(1,1) NOT NULL,
	[TenMonThi] [nvarchar](100) NULL,
	[NgayThi] [datetime] NOT NULL,
	[SoCauHoi] [int] NULL,
	[MaKhoaHoc] [int] NULL,
	[ThoiHanDeThi] [datetime] NOT NULL,
	[ThoiGianLamBai] [int] NOT NULL,
 CONSTRAINT [PK_DeThis] PRIMARY KEY CLUSTERED 
(
	[MaDeThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoViens]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoViens](
	[MaGiaoVien] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[HoTen] [nvarchar](max) NULL,
 CONSTRAINT [PK_GiaoViens] PRIMARY KEY CLUSTERED 
(
	[MaGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocSinh_KhoaHoc]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocSinh_KhoaHoc](
	[MaHocSinh] [int] NOT NULL,
	[MaKhoaHoc] [int] NOT NULL,
	[Diem] [float] NULL,
 CONSTRAINT [PK_HocSinh_KhoaHoc] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC,
	[MaKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocSinhs]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocSinhs](
	[MaHocSinh] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NULL,
	[HoTen] [nvarchar](max) NULL,
	[NgaySinh] [datetime] NULL,
	[QueQuan] [nvarchar](100) NULL,
	[MaKhoaHoc] [int] NULL,
 CONSTRAINT [PK_HocSinhs] PRIMARY KEY CLUSTERED 
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoaHocs]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHocs](
	[MaKhoaHoc] [int] IDENTITY(1,1) NOT NULL,
	[MaDeThi] [int] NULL,
	[TenKhoaHoc] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhoaHocs] PRIMARY KEY CLUSTERED 
(
	[MaKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuaChons]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuaChons](
	[MaLuaChon] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](MAX) NULL,
 CONSTRAINT [PK_LuaChons] PRIMARY KEY CLUSTERED 
(
	[MaLuaChon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyens]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyens](
	[MaPhanQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenPhanQuyen] [nvarchar](100) NULL,
 CONSTRAINT [PK_PhanQuyens] PRIMARY KEY CLUSTERED 
(
	[MaPhanQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [nvarchar](128) NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
 CONSTRAINT [PK_sysdiagrams] PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoans]    Script Date: 4/22/2022 1:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoans](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[MaPhanQuyen] [int] NULL,
	[MaHocSinh] [int] NULL,
	[MaGiaoVien] [int] NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[NgayTaoTaiKhoan] [datetime] NULL,
 CONSTRAINT [PK_TaiKhoans] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (1, 1, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (1, 2, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (1, 3, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (1, 4, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (2, 1, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (2, 2, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (2, 3, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (2, 4, 0)
SET IDENTITY_INSERT [dbo].[CauHois] ON 

INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (1, 1, N'Câu hỏi 1', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (2, 1, N'Câu hỏi 2', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (3, 1, N'Câu hỏi 3', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (4, 1, N'Câu hỏi 4', 1)
SET IDENTITY_INSERT [dbo].[CauHois] OFF
SET IDENTITY_INSERT [dbo].[DeThis] ON 

INSERT [dbo].[DeThis] ([MaDeThi], [TenMonThi], [NgayThi], [SoCauHoi], [MaKhoaHoc], [ThoiHanDeThi], [ThoiGianLamBai]) VALUES (1, N'Tiếng anh 1', CAST(N'2022-12-02T00:00:00.000' AS DateTime), 4, 1, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 120)
SET IDENTITY_INSERT [dbo].[DeThis] OFF
SET IDENTITY_INSERT [dbo].[GiaoViens] ON 

INSERT [dbo].[GiaoViens] ([MaGiaoVien], [MaTaiKhoan], [HoTen]) VALUES (1, 132, N'Lê Văn An')
SET IDENTITY_INSERT [dbo].[GiaoViens] OFF
SET IDENTITY_INSERT [dbo].[KhoaHocs] ON 

INSERT [dbo].[KhoaHocs] ([MaKhoaHoc], [MaDeThi], [TenKhoaHoc]) VALUES (1, 1, N'Tieng Anh')
INSERT [dbo].[KhoaHocs] ([MaKhoaHoc], [MaDeThi], [TenKhoaHoc]) VALUES (2, 2, N'Toán')
SET IDENTITY_INSERT [dbo].[KhoaHocs] OFF
SET IDENTITY_INSERT [dbo].[LuaChons] ON 

INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (1, N'Lựa chọn C')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (2, N'Lựa chọn A')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (3, N'Lựa chọn B')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (4, N'Lựa chọn D')
SET IDENTITY_INSERT [dbo].[LuaChons] OFF
/****** Object:  Index [IX_FK_BaiLam_CauHoi]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BaiLam_CauHoi] ON [dbo].[BaiLams]
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_BaiLam_LuaChon]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_BaiLam_LuaChon] ON [dbo].[BaiLams]
(
	[MaLuaChon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CauHoi_LuaChon_LuaChon]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CauHoi_LuaChon_LuaChon] ON [dbo].[CauHoi_LuaChon]
(
	[MaLuaChon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CauHoi_DeThi]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CauHoi_DeThi] ON [dbo].[CauHois]
(
	[MaDeThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_CauHoi_GiaoVien]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_CauHoi_GiaoVien] ON [dbo].[CauHois]
(
	[MaGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DeThi_KhoaHoc]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DeThi_KhoaHoc] ON [dbo].[DeThis]
(
	[MaKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_HocSinh_KhoaHoc2]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_HocSinh_KhoaHoc2] ON [dbo].[HocSinh_KhoaHoc]
(
	[MaKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_HocSinh_KhoaHoc]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_HocSinh_KhoaHoc] ON [dbo].[HocSinhs]
(
	[MaKhoaHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_KhoaHoc_DeThi]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_KhoaHoc_DeThi] ON [dbo].[KhoaHocs]
(
	[MaDeThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TaiKhoan_GiaoVien]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_TaiKhoan_GiaoVien] ON [dbo].[TaiKhoans]
(
	[MaGiaoVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TaiKhoan_HocSinh]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_TaiKhoan_HocSinh] ON [dbo].[TaiKhoans]
(
	[MaHocSinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TaiKhoan_PhanQuyen]    Script Date: 4/22/2022 1:23:10 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_TaiKhoan_PhanQuyen] ON [dbo].[TaiKhoans]
(
	[MaPhanQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaiLams]  WITH CHECK ADD  CONSTRAINT [FK_BaiLam_CauHoi] FOREIGN KEY([MaCauHoi])
REFERENCES [dbo].[CauHois] ([MaCauHoi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BaiLams] CHECK CONSTRAINT [FK_BaiLam_CauHoi]
GO
ALTER TABLE [dbo].[BaiLams]  WITH CHECK ADD  CONSTRAINT [FK_BaiLam_HocSinh] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinhs] ([MaHocSinh])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BaiLams] CHECK CONSTRAINT [FK_BaiLam_HocSinh]
GO
ALTER TABLE [dbo].[BaiLams]  WITH CHECK ADD  CONSTRAINT [FK_BaiLam_LuaChon] FOREIGN KEY([MaLuaChon])
REFERENCES [dbo].[LuaChons] ([MaLuaChon])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BaiLams] CHECK CONSTRAINT [FK_BaiLam_LuaChon]
GO
ALTER TABLE [dbo].[CauHoi_LuaChon]  WITH CHECK ADD  CONSTRAINT [FK_CauHoi_LuaChon_CauHoi] FOREIGN KEY([MaCauHoi])
REFERENCES [dbo].[CauHois] ([MaCauHoi])
GO
ALTER TABLE [dbo].[CauHoi_LuaChon] CHECK CONSTRAINT [FK_CauHoi_LuaChon_CauHoi]
GO
ALTER TABLE [dbo].[CauHoi_LuaChon]  WITH CHECK ADD  CONSTRAINT [FK_CauHoi_LuaChon_LuaChon] FOREIGN KEY([MaLuaChon])
REFERENCES [dbo].[LuaChons] ([MaLuaChon])
GO
ALTER TABLE [dbo].[CauHoi_LuaChon] CHECK CONSTRAINT [FK_CauHoi_LuaChon_LuaChon]
GO
ALTER TABLE [dbo].[CauHois]  WITH CHECK ADD  CONSTRAINT [FK_CauHoi_DeThi] FOREIGN KEY([MaDeThi])
REFERENCES [dbo].[DeThis] ([MaDeThi])
GO
ALTER TABLE [dbo].[CauHois] CHECK CONSTRAINT [FK_CauHoi_DeThi]
GO
ALTER TABLE [dbo].[CauHois]  WITH CHECK ADD  CONSTRAINT [FK_CauHoi_GiaoVien] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GiaoViens] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[CauHois] CHECK CONSTRAINT [FK_CauHoi_GiaoVien]
GO
ALTER TABLE [dbo].[DeThis]  WITH CHECK ADD  CONSTRAINT [FK_DeThi_KhoaHoc] FOREIGN KEY([MaKhoaHoc])
REFERENCES [dbo].[KhoaHocs] ([MaKhoaHoc])
GO
ALTER TABLE [dbo].[DeThis] CHECK CONSTRAINT [FK_DeThi_KhoaHoc]
GO
ALTER TABLE [dbo].[HocSinh_KhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_KhoaHoc1] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinhs] ([MaHocSinh])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocSinh_KhoaHoc] CHECK CONSTRAINT [FK_HocSinh_KhoaHoc1]
GO
ALTER TABLE [dbo].[HocSinh_KhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_KhoaHoc2] FOREIGN KEY([MaKhoaHoc])
REFERENCES [dbo].[KhoaHocs] ([MaKhoaHoc])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocSinh_KhoaHoc] CHECK CONSTRAINT [FK_HocSinh_KhoaHoc2]
GO
ALTER TABLE [dbo].[HocSinhs]  WITH CHECK ADD  CONSTRAINT [FK_HocSinh_KhoaHoc] FOREIGN KEY([MaKhoaHoc])
REFERENCES [dbo].[KhoaHocs] ([MaKhoaHoc])
GO
ALTER TABLE [dbo].[HocSinhs] CHECK CONSTRAINT [FK_HocSinh_KhoaHoc]
GO
ALTER TABLE [dbo].[TaiKhoans]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_GiaoVien] FOREIGN KEY([MaGiaoVien])
REFERENCES [dbo].[GiaoViens] ([MaGiaoVien])
GO
ALTER TABLE [dbo].[TaiKhoans] CHECK CONSTRAINT [FK_TaiKhoan_GiaoVien]
GO
ALTER TABLE [dbo].[TaiKhoans]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_HocSinh] FOREIGN KEY([MaHocSinh])
REFERENCES [dbo].[HocSinhs] ([MaHocSinh])
GO
ALTER TABLE [dbo].[TaiKhoans] CHECK CONSTRAINT [FK_TaiKhoan_HocSinh]
GO
ALTER TABLE [dbo].[TaiKhoans]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_PhanQuyen] FOREIGN KEY([MaPhanQuyen])
REFERENCES [dbo].[PhanQuyens] ([MaPhanQuyen])
GO
ALTER TABLE [dbo].[TaiKhoans] CHECK CONSTRAINT [FK_TaiKhoan_PhanQuyen]
GO
USE [master]
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET  READ_WRITE 
GO
