
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/15/2022 00:25:20
-- Generated from EDMX file: C:\Users\s1924\source\repos\anphuongvu\TestDoAnWeb\TestDoAnWeb\Models\DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [QLThiTracNghiem];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[DeThi_CauHoi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DeThi_CauHoi];
GO
IF OBJECT_ID(N'[dbo].[HocSinh_DeThi]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HocSinh_DeThi];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CauHois'
CREATE TABLE [dbo].[CauHois] (
    [MaCauHoi] int IDENTITY(1,1) NOT NULL,
    [MaGiaoVien] int  NULL,
    [NoiDung] nvarchar(max)  NULL,
    [DapAnA] nvarchar(100)  NULL,
    [DapAnB] nvarchar(100)  NULL,
    [DapAnC] nvarchar(100)  NULL,
    [DapAnD] nvarchar(100)  NULL,
    [CauTraLoiDung] nvarchar(1)  NULL
);
GO

-- Creating table 'DeThis'
CREATE TABLE [dbo].[DeThis] (
    [MaDeThi] int IDENTITY(1,1) NOT NULL,
    [MaMonThi] int  NULL,
    [TenMonThi] nvarchar(100)  NULL,
    [NgayThi] datetime  NULL,
    [SoCauHoi] int  NULL
);
GO

-- Creating table 'DeThi_CauHoi'
CREATE TABLE [dbo].[DeThi_CauHoi] (
    [MaDeThi] int  NOT NULL,
    [MaCauHoi] int  NOT NULL
);
GO

-- Creating table 'DiemThis'
CREATE TABLE [dbo].[DiemThis] (
    [MaDiemThi] int  NOT NULL,
    [MaHocSinh] int  NULL,
    [DiemThi1] float  NULL,
    [MaMonThi] int  NULL
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
    [MaLopHoc] int  NULL,
    [MaTaiKhoan] int  NULL,
    [HoTen] nvarchar(max)  NULL,
    [NgaySinh] datetime  NULL,
    [QueQuan] nvarchar(100)  NULL
);
GO

-- Creating table 'HocSinh_DeThi'
CREATE TABLE [dbo].[HocSinh_DeThi] (
    [MaHocSinh] int  NOT NULL,
    [MaDeThi] int  NULL
);
GO

-- Creating table 'LopHocs'
CREATE TABLE [dbo].[LopHocs] (
    [MaLopHoc] int  NOT NULL,
    [MaGiaoVien] int  NULL,
    [TenLop] nvarchar(50)  NULL
);
GO

-- Creating table 'MonThis'
CREATE TABLE [dbo].[MonThis] (
    [MaMonThi] int IDENTITY(1,1) NOT NULL,
    [TenKiThi] nvarchar(50)  NULL,
    [NgayThi] datetime  NULL,
    [TenMonThi] nvarchar(50)  NULL,
    [TenKhoaHoc] nvarchar(50)  NULL
);
GO

-- Creating table 'PhanQuyens'
CREATE TABLE [dbo].[PhanQuyens] (
    [MaPhanQuyen] int IDENTITY(1,1) NOT NULL,
    [TenPhanQuyen] nvarchar(100)  NULL
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

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MaCauHoi] in table 'CauHois'
ALTER TABLE [dbo].[CauHois]
ADD CONSTRAINT [PK_CauHois]
    PRIMARY KEY CLUSTERED ([MaCauHoi] ASC);
GO

-- Creating primary key on [MaDeThi] in table 'DeThis'
ALTER TABLE [dbo].[DeThis]
ADD CONSTRAINT [PK_DeThis]
    PRIMARY KEY CLUSTERED ([MaDeThi] ASC);
GO

-- Creating primary key on [MaDeThi] in table 'DeThi_CauHoi'
ALTER TABLE [dbo].[DeThi_CauHoi]
ADD CONSTRAINT [PK_DeThi_CauHoi]
    PRIMARY KEY CLUSTERED ([MaDeThi] ASC);
GO

-- Creating primary key on [MaDiemThi] in table 'DiemThis'
ALTER TABLE [dbo].[DiemThis]
ADD CONSTRAINT [PK_DiemThis]
    PRIMARY KEY CLUSTERED ([MaDiemThi] ASC);
GO

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

-- Creating primary key on [MaHocSinh] in table 'HocSinh_DeThi'
ALTER TABLE [dbo].[HocSinh_DeThi]
ADD CONSTRAINT [PK_HocSinh_DeThi]
    PRIMARY KEY CLUSTERED ([MaHocSinh] ASC);
GO

-- Creating primary key on [MaLopHoc] in table 'LopHocs'
ALTER TABLE [dbo].[LopHocs]
ADD CONSTRAINT [PK_LopHocs]
    PRIMARY KEY CLUSTERED ([MaLopHoc] ASC);
GO

-- Creating primary key on [MaMonThi] in table 'MonThis'
ALTER TABLE [dbo].[MonThis]
ADD CONSTRAINT [PK_MonThis]
    PRIMARY KEY CLUSTERED ([MaMonThi] ASC);
GO

-- Creating primary key on [MaPhanQuyen] in table 'PhanQuyens'
ALTER TABLE [dbo].[PhanQuyens]
ADD CONSTRAINT [PK_PhanQuyens]
    PRIMARY KEY CLUSTERED ([MaPhanQuyen] ASC);
GO

-- Creating primary key on [MaTaiKhoan] in table 'TaiKhoans'
ALTER TABLE [dbo].[TaiKhoans]
ADD CONSTRAINT [PK_TaiKhoans]
    PRIMARY KEY CLUSTERED ([MaTaiKhoan] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- Creating foreign key on [MaCauHoi] in table 'DeThi_CauHoi'
ALTER TABLE [dbo].[DeThi_CauHoi]
ADD CONSTRAINT [FK_DeThi_CauHoi_CauHoi]
    FOREIGN KEY ([MaCauHoi])
    REFERENCES [dbo].[CauHois]
        ([MaCauHoi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DeThi_CauHoi_CauHoi'
CREATE INDEX [IX_FK_DeThi_CauHoi_CauHoi]
ON [dbo].[DeThi_CauHoi]
    ([MaCauHoi]);
GO

-- Creating foreign key on [MaCauHoi] in table 'DeThi_CauHoi'
ALTER TABLE [dbo].[DeThi_CauHoi]
ADD CONSTRAINT [FK_DeThi_CauHoi_DeThi]
    FOREIGN KEY ([MaCauHoi])
    REFERENCES [dbo].[DeThis]
        ([MaDeThi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DeThi_CauHoi_DeThi'
CREATE INDEX [IX_FK_DeThi_CauHoi_DeThi]
ON [dbo].[DeThi_CauHoi]
    ([MaCauHoi]);
GO

-- Creating foreign key on [MaMonThi] in table 'DeThis'
ALTER TABLE [dbo].[DeThis]
ADD CONSTRAINT [FK_DeThi_MonThi]
    FOREIGN KEY ([MaMonThi])
    REFERENCES [dbo].[MonThis]
        ([MaMonThi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DeThi_MonThi'
CREATE INDEX [IX_FK_DeThi_MonThi]
ON [dbo].[DeThis]
    ([MaMonThi]);
GO

-- Creating foreign key on [MaDeThi] in table 'HocSinh_DeThi'
ALTER TABLE [dbo].[HocSinh_DeThi]
ADD CONSTRAINT [FK_HocSinh_DeThi_DeThi]
    FOREIGN KEY ([MaDeThi])
    REFERENCES [dbo].[DeThis]
        ([MaDeThi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HocSinh_DeThi_DeThi'
CREATE INDEX [IX_FK_HocSinh_DeThi_DeThi]
ON [dbo].[HocSinh_DeThi]
    ([MaDeThi]);
GO

-- Creating foreign key on [MaHocSinh] in table 'DiemThis'
ALTER TABLE [dbo].[DiemThis]
ADD CONSTRAINT [FK_DiemThi_HocSinh]
    FOREIGN KEY ([MaHocSinh])
    REFERENCES [dbo].[HocSinhs]
        ([MaHocSinh])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DiemThi_HocSinh'
CREATE INDEX [IX_FK_DiemThi_HocSinh]
ON [dbo].[DiemThis]
    ([MaHocSinh]);
GO

-- Creating foreign key on [MaMonThi] in table 'DiemThis'
ALTER TABLE [dbo].[DiemThis]
ADD CONSTRAINT [FK_DiemThi_MonThi]
    FOREIGN KEY ([MaMonThi])
    REFERENCES [dbo].[MonThis]
        ([MaMonThi])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DiemThi_MonThi'
CREATE INDEX [IX_FK_DiemThi_MonThi]
ON [dbo].[DiemThis]
    ([MaMonThi]);
GO

-- Creating foreign key on [MaGiaoVien] in table 'LopHocs'
ALTER TABLE [dbo].[LopHocs]
ADD CONSTRAINT [FK_LopHoc_GiaoVien]
    FOREIGN KEY ([MaGiaoVien])
    REFERENCES [dbo].[GiaoViens]
        ([MaGiaoVien])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LopHoc_GiaoVien'
CREATE INDEX [IX_FK_LopHoc_GiaoVien]
ON [dbo].[LopHocs]
    ([MaGiaoVien]);
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

-- Creating foreign key on [MaDeThi] in table 'HocSinh_DeThi'
ALTER TABLE [dbo].[HocSinh_DeThi]
ADD CONSTRAINT [FK_HocSinh_DeThi_HocSinh]
    FOREIGN KEY ([MaDeThi])
    REFERENCES [dbo].[HocSinhs]
        ([MaHocSinh])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HocSinh_DeThi_HocSinh'
CREATE INDEX [IX_FK_HocSinh_DeThi_HocSinh]
ON [dbo].[HocSinh_DeThi]
    ([MaDeThi]);
GO

-- Creating foreign key on [MaLopHoc] in table 'HocSinhs'
ALTER TABLE [dbo].[HocSinhs]
ADD CONSTRAINT [FK_HocSinh_LopHoc]
    FOREIGN KEY ([MaLopHoc])
    REFERENCES [dbo].[LopHocs]
        ([MaLopHoc])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HocSinh_LopHoc'
CREATE INDEX [IX_FK_HocSinh_LopHoc]
ON [dbo].[HocSinhs]
    ([MaLopHoc]);
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------