
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/21/2022 21:23:35
-- Generated from EDMX file: C:\Users\thaou\OneDrive\Máy tính\CNPMNC\TestDoAnWeb\TestDoAnWeb\Models\Model1.edmx
-- --------------------------------------------------
DROP DATABASE [QLThiTracNghiemOnl]
GO

CREATE DATABASE [QLThiTracNghiemOnl]
SET QUOTED_IDENTIFIER OFF;
GO
USE [QLThiTracNghiemOnl];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BaiLam_CauHoi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BaiLam] DROP CONSTRAINT [FK_BaiLam_CauHoi];
GO
IF OBJECT_ID(N'[dbo].[FK_BaiLam_HocSinh]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BaiLam] DROP CONSTRAINT [FK_BaiLam_HocSinh];
GO
IF OBJECT_ID(N'[dbo].[FK_BaiLam_LuaChon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BaiLam] DROP CONSTRAINT [FK_BaiLam_LuaChon];
GO
IF OBJECT_ID(N'[dbo].[FK_CauHoi_DeThi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CauHoi] DROP CONSTRAINT [FK_CauHoi_DeThi];
GO
IF OBJECT_ID(N'[dbo].[FK_CauHoi_GiaoVien]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CauHoi] DROP CONSTRAINT [FK_CauHoi_GiaoVien];
GO
IF OBJECT_ID(N'[dbo].[FK_CauHoi_LuaChon_CauHoi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CauHoi_LuaChon] DROP CONSTRAINT [FK_CauHoi_LuaChon_CauHoi];
GO
IF OBJECT_ID(N'[dbo].[FK_CauHoi_LuaChon_LuaChon]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CauHoi_LuaChon] DROP CONSTRAINT [FK_CauHoi_LuaChon_LuaChon];
GO
IF OBJECT_ID(N'[dbo].[FK_DeThi_KhoaHoc]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DeThi] DROP CONSTRAINT [FK_DeThi_KhoaHoc];
GO
IF OBJECT_ID(N'[dbo].[FK_HocSinh_KhoaHoc]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HocSinh] DROP CONSTRAINT [FK_HocSinh_KhoaHoc];
GO
IF OBJECT_ID(N'[dbo].[FK_HocSinh_KhoaHoc1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HocSinh_KhoaHoc] DROP CONSTRAINT [FK_HocSinh_KhoaHoc1];
GO
IF OBJECT_ID(N'[dbo].[FK_HocSinh_KhoaHoc2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HocSinh_KhoaHoc] DROP CONSTRAINT [FK_HocSinh_KhoaHoc2];
GO
IF OBJECT_ID(N'[dbo].[FK_KhoaHoc_DeThi]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[KhoaHoc] DROP CONSTRAINT [FK_KhoaHoc_DeThi];
GO
IF OBJECT_ID(N'[dbo].[FK_TaiKhoan_GiaoVien]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TaiKhoan] DROP CONSTRAINT [FK_TaiKhoan_GiaoVien];
GO
IF OBJECT_ID(N'[dbo].[FK_TaiKhoan_HocSinh]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TaiKhoan] DROP CONSTRAINT [FK_TaiKhoan_HocSinh];
GO
IF OBJECT_ID(N'[dbo].[FK_TaiKhoan_PhanQuyen]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TaiKhoan] DROP CONSTRAINT [FK_TaiKhoan_PhanQuyen];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BaiLam]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BaiLam];
GO
IF OBJECT_ID(N'[dbo].[CauHoi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CauHoi];
GO
IF OBJECT_ID(N'[dbo].[CauHoi_LuaChon]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CauHoi_LuaChon];
GO
IF OBJECT_ID(N'[dbo].[DeThi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DeThi];
GO
IF OBJECT_ID(N'[dbo].[GiaoVien]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GiaoVien];
GO
IF OBJECT_ID(N'[dbo].[HocSinh]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HocSinh];
GO
IF OBJECT_ID(N'[dbo].[HocSinh_KhoaHoc]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HocSinh_KhoaHoc];
GO
IF OBJECT_ID(N'[dbo].[KhoaHoc]', 'U') IS NOT NULL
    DROP TABLE [dbo].[KhoaHoc];
GO
IF OBJECT_ID(N'[dbo].[LuaChon]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LuaChon];
GO
IF OBJECT_ID(N'[dbo].[PhanQuyen]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhanQuyen];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[TaiKhoan]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TaiKhoan];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BaiLams'
CREATE TABLE [dbo].[BaiLams] (
    [MaHocSinh] int  NOT NULL,
    [MaCauHoi] int  NOT NULL,
    [MaLuaChon] int  NULL
);
GO

-- Creating table 'CauHois'
CREATE TABLE [dbo].[CauHois] (
    [MaCauHoi] int IDENTITY(1,1) NOT NULL,
    [MaDeThi] int  NULL,
    [NoiDung] nvarchar(max)  NULL,
    [MaGiaoVien] int  NULL
);
GO

-- Creating table 'CauHoi_LuaChon'
CREATE TABLE [dbo].[CauHoi_LuaChon] (
    [MaCauHoi] int NOT NULL,
    [MaLuaChon] int  NOT NULL,
    [CauTraLoi] bit  NOT NULL
);
GO

-- Creating table 'DeThis'
CREATE TABLE [dbo].[DeThis] (
    [MaDeThi] int IDENTITY(1,1) NOT NULL,
    [TenMonThi] nvarchar(100)  NULL,
    [NgayThi] datetime  NOT NULL,
    [SoCauHoi] int  NULL,
    [MaKhoaHoc] int  NULL,
    [ThoiHanDeThi] datetime  NOT NULL,
    [ThoiGianLamBai] int  NOT NULL
);
GO

-- Creating table 'GiaoViens'
CREATE TABLE [dbo].[GiaoViens] (
    [MaGiaoVien] int IDENTITY(1,1) NOT NULL,
    [MaTaiKhoan] int  NULL,
    [HoTen] nvarchar(max)  NULL
);
GO

-- Creating table 'HocSinhs'
CREATE TABLE [dbo].[HocSinhs] (
    [MaHocSinh] int IDENTITY(1,1) NOT NULL,
    [MaTaiKhoan] int  NULL,
    [HoTen] nvarchar(max)  NULL,
    [NgaySinh] datetime  NULL,
    [QueQuan] nvarchar(100)  NULL,
    [MaKhoaHoc] int  NULL
);
GO

-- Creating table 'HocSinh_KhoaHoc'
CREATE TABLE [dbo].[HocSinh_KhoaHoc] (
    [MaHocSinh] int  NOT NULL,
    [MaKhoaHoc] int  NOT NULL,
    [Diem] float  NULL
);
GO

-- Creating table 'KhoaHocs'
CREATE TABLE [dbo].[KhoaHocs] (
    [MaKhoaHoc] int IDENTITY(1,1) NOT NULL,
    [MaDeThi] int  NULL,
    [TenKhoaHoc] nvarchar(100)  NULL
);
GO

-- Creating table 'LuaChons'
CREATE TABLE [dbo].[LuaChons] (
    [MaLuaChon] int IDENTITY(1,1) NOT NULL,
    [NoiDung] nchar(10)  NULL
);
GO

-- Creating table 'PhanQuyens'
CREATE TABLE [dbo].[PhanQuyens] (
    [MaPhanQuyen] int IDENTITY(1,1) NOT NULL,
    [TenPhanQuyen] nvarchar(100)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'TaiKhoans'
CREATE TABLE [dbo].[TaiKhoans] (
    [MaTaiKhoan] int IDENTITY(1,1) NOT NULL,
    [MaPhanQuyen] int  NULL,
    [MaHocSinh] int  NULL,
    [MaGiaoVien] int  NULL,
    [Username] nvarchar(100)  NULL,
    [Password] nvarchar(100)  NULL,
    [NgayTaoTaiKhoan] datetime  NULL
);
GO
-- Create table 'DeThis_Chitiets'
CREATE TABLE [dbo].[DeThis_Chitiets](
    [Id] int IDENTITY (1,1) NOT NULL,
    [IdDeThi] int NULL,
    [IdCauHoi] int NULL
)
drop table [dbo].[DeThis_Chitiets]
CREATE TABLE [dbo].[DeThis_Chitiets](
    [Id] int IDENTITY (1,1) NOT NULL,
    [IdDeThi] int NOT NULL,
    [IdCauHoi] int NOT NULL
)

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MaHocSinh], [MaCauHoi] in table 'BaiLams'
ALTER TABLE [dbo].[BaiLams]
ADD CONSTRAINT [PK_BaiLams]
    PRIMARY KEY CLUSTERED ([MaHocSinh], [MaCauHoi] ASC);
GO

-- Creating primary key on [MaCauHoi] in table 'CauHois'
ALTER TABLE [dbo].[CauHois]
ADD CONSTRAINT [PK_CauHois]
    PRIMARY KEY CLUSTERED ([MaCauHoi] ASC);
GO

-- Creating primary key on [MaCauHoi] in table 'CauHoi_LuaChon'
ALTER TABLE [dbo].[CauHoi_LuaChon]
ADD CONSTRAINT [PK_CauHoi_LuaChon]
    PRIMARY KEY CLUSTERED ([MaCauHoi], [MaLuaChon] ASC);
GO

-- Creating primary key on [MaDeThi] in table 'DeThis'
ALTER TABLE [dbo].[DeThis]
ADD CONSTRAINT [PK_DeThis]
    PRIMARY KEY CLUSTERED ([MaDeThi] ASC);
GO
--Alter colums MaCauHoi in DeThis
ALTER TABLE [dbo].[DeThis]
ADD MaCauHoi int;
Go 
-- Creating primary key on [MaGiaoVien] in table 'GiaoViens'
ALTER TABLE [dbo].[GiaoViens]
ADD CONSTRAINT [PK_GiaoViens]
    PRIMARY KEY CLUSTERED ([MaGiaoVien] ASC);
GO

-- Creating primary key on [MaHocSinh] in table 'HocSinhs'
ALTER TABLE [dbo].[HocSinhs]
ADD CONSTRAINT [PK_HocSinhs]
    PRIMARY KEY CLUSTERED ([MaHocSinh] ASC);
GO

-- Creating primary key on [MaHocSinh], [MaKhoaHoc] in table 'HocSinh_KhoaHoc'
ALTER TABLE [dbo].[HocSinh_KhoaHoc]
ADD CONSTRAINT [PK_HocSinh_KhoaHoc]
    PRIMARY KEY CLUSTERED ([MaHocSinh], [MaKhoaHoc] ASC);
GO

-- Creating primary key on [MaKhoaHoc] in table 'KhoaHocs'
ALTER TABLE [dbo].[KhoaHocs]
ADD CONSTRAINT [PK_KhoaHocs]
    PRIMARY KEY CLUSTERED ([MaKhoaHoc] ASC);
GO

-- Creating primary key on [MaLuaChon] in table 'LuaChons'
ALTER TABLE [dbo].[LuaChons]
ADD CONSTRAINT [PK_LuaChons]
    PRIMARY KEY CLUSTERED ([MaLuaChon] ASC);
GO

-- Creating primary key on [MaPhanQuyen] in table 'PhanQuyens'
ALTER TABLE [dbo].[PhanQuyens]
ADD CONSTRAINT [PK_PhanQuyens]
    PRIMARY KEY CLUSTERED ([MaPhanQuyen] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [MaTaiKhoan] in table 'TaiKhoans'
ALTER TABLE [dbo].[TaiKhoans]
ADD CONSTRAINT [PK_TaiKhoans]
    PRIMARY KEY CLUSTERED ([MaTaiKhoan] ASC);
GO
-- Creating primary key on [IdDeThi], [IdCauHoi] in table 'DeThis_Chitiets'
ALTER TABLE [dbo].[Dethis_Chitiets]
ADD CONSTRAINT [PK_DeThis_Chitiets]
    PRIMARY KEY CLUSTERED ([IdDeThi], [IdCauHoi] ASC);
GO
-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MaCauHoi] in table 'BaiLams'
ALTER TABLE [dbo].[BaiLams]
ADD CONSTRAINT [FK_BaiLam_CauHoi]
    FOREIGN KEY ([MaCauHoi])
    REFERENCES [dbo].[CauHois]
        ([MaCauHoi])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BaiLam_CauHoi'
CREATE INDEX [IX_FK_BaiLam_CauHoi]
ON [dbo].[BaiLams]
    ([MaCauHoi]);
GO

-- Creating foreign key on [MaHocSinh] in table 'BaiLams'
ALTER TABLE [dbo].[BaiLams]
ADD CONSTRAINT [FK_BaiLam_HocSinh]
    FOREIGN KEY ([MaHocSinh])
    REFERENCES [dbo].[HocSinhs]
        ([MaHocSinh])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MaLuaChon] in table 'BaiLams'
ALTER TABLE [dbo].[BaiLams]
ADD CONSTRAINT [FK_BaiLam_LuaChon]
    FOREIGN KEY ([MaLuaChon])
    REFERENCES [dbo].[LuaChons]
        ([MaLuaChon])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BaiLam_LuaChon'
CREATE INDEX [IX_FK_BaiLam_LuaChon]
ON [dbo].[BaiLams]
    ([MaLuaChon]);
GO

-- Creating foreign key on [MaDeThi] in table 'CauHois'
ALTER TABLE [dbo].[CauHois]
ADD CONSTRAINT [FK_CauHoi_DeThi]
    FOREIGN KEY ([MaDeThi])
    REFERENCES [dbo].[DeThis]
        ([MaDeThi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CauHoi_DeThi'
CREATE INDEX [IX_FK_CauHoi_DeThi]
ON [dbo].[CauHois]
    ([MaDeThi]);
GO

-- Creating foreign key on [MaGiaoVien] in table 'CauHois'
ALTER TABLE [dbo].[CauHois]
ADD CONSTRAINT [FK_CauHoi_GiaoVien]
    FOREIGN KEY ([MaGiaoVien])
    REFERENCES [dbo].[GiaoViens]
        ([MaGiaoVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CauHoi_GiaoVien'
CREATE INDEX [IX_FK_CauHoi_GiaoVien]
ON [dbo].[CauHois]
    ([MaGiaoVien]);
GO

-- Creating foreign key on [MaCauHoi] in table 'CauHoi_LuaChon'
ALTER TABLE [dbo].[CauHoi_LuaChon]
ADD CONSTRAINT [FK_CauHoi_LuaChon_CauHoi]
    FOREIGN KEY ([MaCauHoi])
    REFERENCES [dbo].[CauHois]
        ([MaCauHoi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MaLuaChon] in table 'CauHoi_LuaChon'
ALTER TABLE [dbo].[CauHoi_LuaChon]
ADD CONSTRAINT [FK_CauHoi_LuaChon_LuaChon]
    FOREIGN KEY ([MaLuaChon])
    REFERENCES [dbo].[LuaChons]
        ([MaLuaChon])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CauHoi_LuaChon_LuaChon'
CREATE INDEX [IX_FK_CauHoi_LuaChon_LuaChon]
ON [dbo].[CauHoi_LuaChon]
    ([MaLuaChon]);
GO

-- Creating foreign key on [MaKhoaHoc] in table 'DeThis'
ALTER TABLE [dbo].[DeThis]
ADD CONSTRAINT [FK_DeThi_KhoaHoc]
    FOREIGN KEY ([MaKhoaHoc])
    REFERENCES [dbo].[KhoaHocs]
        ([MaKhoaHoc])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
--Creating foreign key on [MaCauHoi] in table 'DeThis'
ALTER TABLE [dbo].[DeThis]
ADD CONSTRAINT [FK_DeThi_CauHoi]
    FOREIGN KEY ([MaCauHoi])
    REFERENCES [dbo].[CauHois]
        ([MaCauHoi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_DeThi_CauHoi'
CREATE INDEX [IX_FK_DeThi_CauHoi]
ON [dbo].[DeThis]
    ([MaCauHoi]);
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_DeThi_KhoaHoc'
CREATE INDEX [IX_FK_DeThi_KhoaHoc]
ON [dbo].[DeThis]
    ([MaKhoaHoc]);
GO

-- Creating foreign key on [MaDeThi] in table 'KhoaHocs'
--ALTER TABLE [dbo].[KhoaHocs]
--ADD CONSTRAINT [FK_KhoaHoc_DeThi]
--    FOREIGN KEY ([MaDeThi])
--    REFERENCES [dbo].[DeThis]
--        ([MaDeThi])
--    ON DELETE NO ACTION ON UPDATE NO ACTION;
--GO

--ALTER TABLE [dbo].[KhoaHocs]
--DROP CONSTRAINT [FK_KhoaHoc_DeThi]
--GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KhoaHoc_DeThi'
CREATE INDEX [IX_FK_KhoaHoc_DeThi]
ON [dbo].[KhoaHocs]
    ([MaDeThi]);
GO

-- Creating foreign key on [MaGiaoVien] in table 'TaiKhoans'
ALTER TABLE [dbo].[TaiKhoans]
ADD CONSTRAINT [FK_TaiKhoan_GiaoVien]
    FOREIGN KEY ([MaGiaoVien])
    REFERENCES [dbo].[GiaoViens]
        ([MaGiaoVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TaiKhoan_GiaoVien'
CREATE INDEX [IX_FK_TaiKhoan_GiaoVien]
ON [dbo].[TaiKhoans]
    ([MaGiaoVien]);
GO

-- Creating foreign key on [MaKhoaHoc] in table 'HocSinhs'
ALTER TABLE [dbo].[HocSinhs]
ADD CONSTRAINT [FK_HocSinh_KhoaHoc]
    FOREIGN KEY ([MaKhoaHoc])
    REFERENCES [dbo].[KhoaHocs]
        ([MaKhoaHoc])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HocSinh_KhoaHoc'
CREATE INDEX [IX_FK_HocSinh_KhoaHoc]
ON [dbo].[HocSinhs]
    ([MaKhoaHoc]);
GO

-- Creating foreign key on [MaHocSinh] in table 'HocSinh_KhoaHoc'
ALTER TABLE [dbo].[HocSinh_KhoaHoc]
ADD CONSTRAINT [FK_HocSinh_KhoaHoc1]
    FOREIGN KEY ([MaHocSinh])
    REFERENCES [dbo].[HocSinhs]
        ([MaHocSinh])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MaHocSinh] in table 'TaiKhoans'
ALTER TABLE [dbo].[TaiKhoans]
ADD CONSTRAINT [FK_TaiKhoan_HocSinh]
    FOREIGN KEY ([MaHocSinh])
    REFERENCES [dbo].[HocSinhs]
        ([MaHocSinh])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TaiKhoan_HocSinh'
CREATE INDEX [IX_FK_TaiKhoan_HocSinh]
ON [dbo].[TaiKhoans]
    ([MaHocSinh]);
GO

-- Creating foreign key on [MaKhoaHoc] in table 'HocSinh_KhoaHoc'
ALTER TABLE [dbo].[HocSinh_KhoaHoc]
ADD CONSTRAINT [FK_HocSinh_KhoaHoc2]
    FOREIGN KEY ([MaKhoaHoc])
    REFERENCES [dbo].[KhoaHocs]
        ([MaKhoaHoc])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HocSinh_KhoaHoc2'
CREATE INDEX [IX_FK_HocSinh_KhoaHoc2]
ON [dbo].[HocSinh_KhoaHoc]
    ([MaKhoaHoc]);
GO

-- Creating foreign key on [MaPhanQuyen] in table 'TaiKhoans'
ALTER TABLE [dbo].[TaiKhoans]
ADD CONSTRAINT [FK_TaiKhoan_PhanQuyen]
    FOREIGN KEY ([MaPhanQuyen])
    REFERENCES [dbo].[PhanQuyens]
        ([MaPhanQuyen])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TaiKhoan_PhanQuyen'
CREATE INDEX [IX_FK_TaiKhoan_PhanQuyen]
ON [dbo].[TaiKhoans]
    ([MaPhanQuyen]);
GO
-- Creating foreign key on [IdDeThi] in table 'DeThis_Chitiets'
ALTER TABLE [dbo].[Dethis_Chitiets]
ADD CONSTRAINT [FK_Dethis_Chitiets]
    FOREIGN KEY ([IdDethi])
    REFERENCES [dbo].[DeThis] 
        ([MaDeThi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating foreign key on [IdCauHoi] in table 'DeThis_Chitiets'
ALTER TABLE [dbo].[Dethis_Chitiets]
ADD CONSTRAINT [FK_Dethis_Chitiets1]
    FOREIGN KEY ([IdCauHoi])
    REFERENCES [dbo].[CauHois] 
        ([MaCauHoi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
-- Creating non-clustered index for FOREIGN KEY 'FK_DeThis_Chitiets1'
CREATE INDEX [IX_FK_DeThis_Chitiets1]
ON [dbo].[DeThis_Chitiets]
    ([IdCauHoi]);
GO
-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------