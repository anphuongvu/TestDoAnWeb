USE [QLThiTracNghiemOnl]
GO
ALTER TABLE [dbo].[DeThis_Chitiets] DROP CONSTRAINT [FK_Dethis_Chitiets1]
GO
ALTER TABLE [dbo].[DeThis_Chitiets] DROP CONSTRAINT [FK_Dethis_Chitiets]
GO
ALTER TABLE [dbo].[DeThis] DROP CONSTRAINT [FK_DeThi_CauHoi]
GO
/****** Object:  Index [IX_FK_DeThis_Chitiets1]    Script Date: 11/06/2022 1:34:39 CH ******/
DROP INDEX [IX_FK_DeThis_Chitiets1] ON [dbo].[DeThis_Chitiets]
GO
/****** Object:  Index [IX_FK_DeThi_CauHoi]    Script Date: 11/06/2022 1:34:39 CH ******/
DROP INDEX [IX_FK_DeThi_CauHoi] ON [dbo].[DeThis]
GO
/****** Object:  Table [dbo].[TaiKhoans]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaiKhoans]') AND type in (N'U'))
DROP TABLE [dbo].[TaiKhoans]
GO
/****** Object:  Table [dbo].[PhanQuyens]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhanQuyens]') AND type in (N'U'))
DROP TABLE [dbo].[PhanQuyens]
GO
/****** Object:  Table [dbo].[LuaChons]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LuaChons]') AND type in (N'U'))
DROP TABLE [dbo].[LuaChons]
GO
/****** Object:  Table [dbo].[KhoaHocs]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KhoaHocs]') AND type in (N'U'))
DROP TABLE [dbo].[KhoaHocs]
GO
/****** Object:  Table [dbo].[HocSinhs]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HocSinhs]') AND type in (N'U'))
DROP TABLE [dbo].[HocSinhs]
GO
/****** Object:  Table [dbo].[HocSinh_KhoaHoc]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HocSinh_KhoaHoc]') AND type in (N'U'))
DROP TABLE [dbo].[HocSinh_KhoaHoc]
GO
/****** Object:  Table [dbo].[GiaoViens]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GiaoViens]') AND type in (N'U'))
DROP TABLE [dbo].[GiaoViens]
GO
/****** Object:  Table [dbo].[DeThis_Chitiets]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeThis_Chitiets]') AND type in (N'U'))
DROP TABLE [dbo].[DeThis_Chitiets]
GO
/****** Object:  Table [dbo].[DeThis]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeThis]') AND type in (N'U'))
DROP TABLE [dbo].[DeThis]
GO
/****** Object:  Table [dbo].[CauHois]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CauHois]') AND type in (N'U'))
DROP TABLE [dbo].[CauHois]
GO
/****** Object:  Table [dbo].[CauHoi_LuaChon]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CauHoi_LuaChon]') AND type in (N'U'))
DROP TABLE [dbo].[CauHoi_LuaChon]
GO
/****** Object:  Table [dbo].[BaiLams]    Script Date: 11/06/2022 1:34:39 CH ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BaiLams]') AND type in (N'U'))
DROP TABLE [dbo].[BaiLams]
GO
USE [master]
GO
/****** Object:  Database [QLThiTracNghiemOnl]    Script Date: 11/06/2022 1:34:39 CH ******/
DROP DATABASE [QLThiTracNghiemOnl]
GO
/****** Object:  Database [QLThiTracNghiemOnl]    Script Date: 11/06/2022 1:34:39 CH ******/
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
ALTER DATABASE [QLThiTracNghiemOnl] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET QUERY_STORE = OFF
GO
USE [QLThiTracNghiemOnl]
GO
/****** Object:  Table [dbo].[BaiLams]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi_LuaChon]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHois]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeThis]    Script Date: 11/06/2022 1:34:39 CH ******/
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
	[MaCauHoi] [int] NULL,
 CONSTRAINT [PK_DeThis] PRIMARY KEY CLUSTERED 
(
	[MaDeThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeThis_Chitiets]    Script Date: 11/06/2022 1:34:39 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeThis_Chitiets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeThi] [int] NOT NULL,
	[IdCauHoi] [int] NOT NULL,
 CONSTRAINT [PK_DeThis_Chitiets] PRIMARY KEY CLUSTERED 
(
	[IdDeThi] ASC,
	[IdCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoViens]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocSinh_KhoaHoc]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocSinhs]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoaHocs]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuaChons]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyens]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoans]    Script Date: 11/06/2022 1:34:39 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (1, 1, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (1, 2, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (1, 3, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (1, 4, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (2, 1, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (2, 2, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (2, 3, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (2, 4, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (3, 1, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (3, 2, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (3, 3, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (3, 4, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (4, 1, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (4, 2, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (4, 3, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (4, 4, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (5, 1, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (5, 2, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (5, 3, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (5, 4, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (6, 1, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (6, 2, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (6, 3, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (6, 4, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (7, 3, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (8, 4, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (9, 5, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (9, 6, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (9, 7, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (9, 8, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (10, 2, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (10, 9, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (10, 10, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (10, 11, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (10, 12, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (11, 1, 1)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (21, 2, 0)
INSERT [dbo].[CauHoi_LuaChon] ([MaCauHoi], [MaLuaChon], [CauTraLoi]) VALUES (21, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[CauHois] ON 

INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (1, 1, N'Câu hỏi 1', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (2, 1, N'Câu hỏi 2', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (3, 1, N'Câu hỏi 3', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (4, 1, N'Câu hỏi 4', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (5, 4, N'Câu hỏi 1', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (6, 4, N'Câu hỏi 2', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (7, 4, N'Câu hỏi 3', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (8, 4, N'Câu hỏi 4', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (9, 8, N'Phiên bản mới nhất của Bootstrap là gì?', 2)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (10, 8, N'Trong Bootstrap, để kéo thẻ div kéo dài toàn bộ trình duyệt theo bề ngang, ta dùng class?', 2)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (11, 7, N'ABCDEF', 2)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (12, NULL, N'afasfaf', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (13, NULL, N'asffaf', 2)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (14, 1, N'asfsafaff', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (15, 1, N'agshfgjhgfadfggdsadfd', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (16, 1, N'dgaffa', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (17, NULL, N'afsdgsfasa', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (18, NULL, N'asdasf', 2)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (19, NULL, N'pplllfa', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (20, NULL, N'dsfdsfs', 1)
INSERT [dbo].[CauHois] ([MaCauHoi], [MaDeThi], [NoiDung], [MaGiaoVien]) VALUES (21, NULL, N'ầdsfsa', 1)
SET IDENTITY_INSERT [dbo].[CauHois] OFF
GO
SET IDENTITY_INSERT [dbo].[DeThis] ON 

INSERT [dbo].[DeThis] ([MaDeThi], [TenMonThi], [NgayThi], [SoCauHoi], [MaKhoaHoc], [ThoiHanDeThi], [ThoiGianLamBai], [MaCauHoi]) VALUES (1, N'Tiếng anh 1', CAST(N'2022-12-02T00:00:00.000' AS DateTime), 4, 1, CAST(N'2022-12-02T00:00:00.000' AS DateTime), 120, NULL)
INSERT [dbo].[DeThis] ([MaDeThi], [TenMonThi], [NgayThi], [SoCauHoi], [MaKhoaHoc], [ThoiHanDeThi], [ThoiGianLamBai], [MaCauHoi]) VALUES (4, N'Toán', CAST(N'2022-05-04T00:00:00.000' AS DateTime), 4, 2, CAST(N'2022-05-04T00:00:00.000' AS DateTime), 10, NULL)
INSERT [dbo].[DeThis] ([MaDeThi], [TenMonThi], [NgayThi], [SoCauHoi], [MaKhoaHoc], [ThoiHanDeThi], [ThoiGianLamBai], [MaCauHoi]) VALUES (8, N'Lập trình web với ASP.NET', CAST(N'2022-05-04T00:00:00.000' AS DateTime), 2, 4, CAST(N'2022-05-04T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[DeThis] ([MaDeThi], [TenMonThi], [NgayThi], [SoCauHoi], [MaKhoaHoc], [ThoiHanDeThi], [ThoiGianLamBai], [MaCauHoi]) VALUES (9, N'ABCDEF', CAST(N'2022-05-12T00:00:00.000' AS DateTime), NULL, 1, CAST(N'2022-05-26T00:00:00.000' AS DateTime), 10, NULL)
INSERT [dbo].[DeThis] ([MaDeThi], [TenMonThi], [NgayThi], [SoCauHoi], [MaKhoaHoc], [ThoiHanDeThi], [ThoiGianLamBai], [MaCauHoi]) VALUES (10, N'gsufafha', CAST(N'2022-04-22T00:00:00.000' AS DateTime), NULL, 1, CAST(N'2022-12-10T00:00:00.000' AS DateTime), 10, NULL)
INSERT [dbo].[DeThis] ([MaDeThi], [TenMonThi], [NgayThi], [SoCauHoi], [MaKhoaHoc], [ThoiHanDeThi], [ThoiGianLamBai], [MaCauHoi]) VALUES (11, N'sadff', CAST(N'2022-05-21T00:00:00.000' AS DateTime), NULL, 1, CAST(N'2022-05-26T00:00:00.000' AS DateTime), 10, NULL)
INSERT [dbo].[DeThis] ([MaDeThi], [TenMonThi], [NgayThi], [SoCauHoi], [MaKhoaHoc], [ThoiHanDeThi], [ThoiGianLamBai], [MaCauHoi]) VALUES (12, N'sdada', CAST(N'2022-05-12T00:00:00.000' AS DateTime), NULL, 1, CAST(N'2022-12-10T00:00:00.000' AS DateTime), 12, NULL)
SET IDENTITY_INSERT [dbo].[DeThis] OFF
GO
SET IDENTITY_INSERT [dbo].[DeThis_Chitiets] ON 

INSERT [dbo].[DeThis_Chitiets] ([Id], [IdDeThi], [IdCauHoi]) VALUES (2, 1, 1)
INSERT [dbo].[DeThis_Chitiets] ([Id], [IdDeThi], [IdCauHoi]) VALUES (4, 4, 1)
INSERT [dbo].[DeThis_Chitiets] ([Id], [IdDeThi], [IdCauHoi]) VALUES (3, 8, 1)
INSERT [dbo].[DeThis_Chitiets] ([Id], [IdDeThi], [IdCauHoi]) VALUES (1, 8, 11)
INSERT [dbo].[DeThis_Chitiets] ([Id], [IdDeThi], [IdCauHoi]) VALUES (5, 9, 1)
INSERT [dbo].[DeThis_Chitiets] ([Id], [IdDeThi], [IdCauHoi]) VALUES (6, 10, 1)
INSERT [dbo].[DeThis_Chitiets] ([Id], [IdDeThi], [IdCauHoi]) VALUES (7, 11, 1)
INSERT [dbo].[DeThis_Chitiets] ([Id], [IdDeThi], [IdCauHoi]) VALUES (8, 12, 1)
SET IDENTITY_INSERT [dbo].[DeThis_Chitiets] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaoViens] ON 

INSERT [dbo].[GiaoViens] ([MaGiaoVien], [MaTaiKhoan], [HoTen]) VALUES (1, 132, N'Lê Văn An')
INSERT [dbo].[GiaoViens] ([MaGiaoVien], [MaTaiKhoan], [HoTen]) VALUES (2, 456, N'An Vũ')
SET IDENTITY_INSERT [dbo].[GiaoViens] OFF
GO
SET IDENTITY_INSERT [dbo].[HocSinhs] ON 

INSERT [dbo].[HocSinhs] ([MaHocSinh], [MaTaiKhoan], [HoTen], [NgaySinh], [QueQuan], [MaKhoaHoc]) VALUES (1, NULL, N'An Vũ', CAST(N'2001-09-06T00:00:00.000' AS DateTime), N'Hải Phòng', NULL)
SET IDENTITY_INSERT [dbo].[HocSinhs] OFF
GO
SET IDENTITY_INSERT [dbo].[KhoaHocs] ON 

INSERT [dbo].[KhoaHocs] ([MaKhoaHoc], [MaDeThi], [TenKhoaHoc]) VALUES (1, 1, N'Tieng Anh')
INSERT [dbo].[KhoaHocs] ([MaKhoaHoc], [MaDeThi], [TenKhoaHoc]) VALUES (2, 2, N'Toán')
INSERT [dbo].[KhoaHocs] ([MaKhoaHoc], [MaDeThi], [TenKhoaHoc]) VALUES (3, 3, N'Ngữ văn')
INSERT [dbo].[KhoaHocs] ([MaKhoaHoc], [MaDeThi], [TenKhoaHoc]) VALUES (4, 4, N'Lập trình web với ASP.NET')
SET IDENTITY_INSERT [dbo].[KhoaHocs] OFF
GO
SET IDENTITY_INSERT [dbo].[LuaChons] ON 

INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (1, N'Lựa chọn C')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (2, N'Lựa chọn A')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (3, N'Lựa chọn B')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (4, N'Lựa chọn D')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (5, N'2         ')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (6, N'3         ')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (7, N'4         ')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (8, N'5         ')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (9, N'container ')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (10, N'section   ')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (11, N'header    ')
INSERT [dbo].[LuaChons] ([MaLuaChon], [NoiDung]) VALUES (12, N'Khác      ')
SET IDENTITY_INSERT [dbo].[LuaChons] OFF
GO
SET IDENTITY_INSERT [dbo].[PhanQuyens] ON 

INSERT [dbo].[PhanQuyens] ([MaPhanQuyen], [TenPhanQuyen]) VALUES (2, N'Admin')
INSERT [dbo].[PhanQuyens] ([MaPhanQuyen], [TenPhanQuyen]) VALUES (3, N'GV')
INSERT [dbo].[PhanQuyens] ([MaPhanQuyen], [TenPhanQuyen]) VALUES (4, N'HS')
SET IDENTITY_INSERT [dbo].[PhanQuyens] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoans] ON 

INSERT [dbo].[TaiKhoans] ([MaTaiKhoan], [MaPhanQuyen], [MaHocSinh], [MaGiaoVien], [Username], [Password], [NgayTaoTaiKhoan]) VALUES (1, 1, 1, 1, N'admin', N'123456', CAST(N'2022-05-03T00:00:00.000' AS DateTime))
INSERT [dbo].[TaiKhoans] ([MaTaiKhoan], [MaPhanQuyen], [MaHocSinh], [MaGiaoVien], [Username], [Password], [NgayTaoTaiKhoan]) VALUES (2, NULL, NULL, NULL, N'gv', N'123456', CAST(N'2022-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[TaiKhoans] ([MaTaiKhoan], [MaPhanQuyen], [MaHocSinh], [MaGiaoVien], [Username], [Password], [NgayTaoTaiKhoan]) VALUES (3, NULL, NULL, NULL, N'hs', N'123456', CAST(N'2022-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[TaiKhoans] ([MaTaiKhoan], [MaPhanQuyen], [MaHocSinh], [MaGiaoVien], [Username], [Password], [NgayTaoTaiKhoan]) VALUES (4, NULL, NULL, NULL, N'anu', N'123456', CAST(N'2022-05-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaiKhoans] OFF
GO
/****** Object:  Index [IX_FK_DeThi_CauHoi]    Script Date: 11/06/2022 1:34:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_FK_DeThi_CauHoi] ON [dbo].[DeThis]
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DeThis_Chitiets1]    Script Date: 11/06/2022 1:34:39 CH ******/
CREATE NONCLUSTERED INDEX [IX_FK_DeThis_Chitiets1] ON [dbo].[DeThis_Chitiets]
(
	[IdCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeThis]  WITH CHECK ADD  CONSTRAINT [FK_DeThi_CauHoi] FOREIGN KEY([MaCauHoi])
REFERENCES [dbo].[CauHois] ([MaCauHoi])
GO
ALTER TABLE [dbo].[DeThis] CHECK CONSTRAINT [FK_DeThi_CauHoi]
GO
ALTER TABLE [dbo].[DeThis_Chitiets]  WITH CHECK ADD  CONSTRAINT [FK_Dethis_Chitiets] FOREIGN KEY([IdDeThi])
REFERENCES [dbo].[DeThis] ([MaDeThi])
GO
ALTER TABLE [dbo].[DeThis_Chitiets] CHECK CONSTRAINT [FK_Dethis_Chitiets]
GO
ALTER TABLE [dbo].[DeThis_Chitiets]  WITH CHECK ADD  CONSTRAINT [FK_Dethis_Chitiets1] FOREIGN KEY([IdCauHoi])
REFERENCES [dbo].[CauHois] ([MaCauHoi])
GO
ALTER TABLE [dbo].[DeThis_Chitiets] CHECK CONSTRAINT [FK_Dethis_Chitiets1]
GO
USE [master]
GO
ALTER DATABASE [QLThiTracNghiemOnl] SET  READ_WRITE 
GO
