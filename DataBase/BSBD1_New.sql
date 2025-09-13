
USE master;
GO
-- Tạo cơ sở dữ liệu BSBD1_New
CREATE DATABASE [BSBD1_New]
CONTAINMENT = NONE
ON PRIMARY 
( 
    NAME = N'BSBD1_New_Data', 
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BSBD1_New_Data.mdf', 
    SIZE = 8192KB, 
    MAXSIZE = UNLIMITED, 
    FILEGROWTH = 1024KB 
)
LOG ON 
( 
    NAME = N'BSBD1_New_Log', 
    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BSBD1_New_Log.ldf', 
    SIZE = 8192KB, 
    MAXSIZE = 2048GB, 
    FILEGROWTH = 10% 
)
WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF;
GO

-- Chuyển sang cơ sở dữ liệu BSBD1_New
USE BSBD1_New;
GO

-- Thiết lập các thuộc tính cơ sở dữ liệu
ALTER DATABASE [BSBD1_New] SET COMPATIBILITY_LEVEL = 120;
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
BEGIN
    EXEC [BSBD1_New].[dbo].[sp_fulltext_database] @action = 'enable';
END
GO
ALTER DATABASE [BSBD1_New] SET ANSI_NULL_DEFAULT OFF;
ALTER DATABASE [BSBD1_New] SET ANSI_NULLS OFF;
ALTER DATABASE [BSBD1_New] SET ANSI_PADDING OFF;
ALTER DATABASE [BSBD1_New] SET ANSI_WARNINGS OFF;
ALTER DATABASE [BSBD1_New] SET ARITHABORT OFF;
ALTER DATABASE [BSBD1_New] SET AUTO_CLOSE ON;
ALTER DATABASE [BSBD1_New] SET AUTO_SHRINK OFF;
ALTER DATABASE [BSBD1_New] SET AUTO_UPDATE_STATISTICS ON;
ALTER DATABASE [BSBD1_New] SET CURSOR_CLOSE_ON_COMMIT OFF;
ALTER DATABASE [BSBD1_New] SET CURSOR_DEFAULT GLOBAL;
ALTER DATABASE [BSBD1_New] SET CONCAT_NULL_YIELDS_NULL OFF;
ALTER DATABASE [BSBD1_New] SET NUMERIC_ROUNDABORT OFF;
ALTER DATABASE [BSBD1_New] SET QUOTED_IDENTIFIER OFF;
ALTER DATABASE [BSBD1_New] SET RECURSIVE_TRIGGERS OFF;
ALTER DATABASE [BSBD1_New] SET ENABLE_BROKER;
ALTER DATABASE [BSBD1_New] SET AUTO_UPDATE_STATISTICS_ASYNC OFF;
ALTER DATABASE [BSBD1_New] SET DATE_CORRELATION_OPTIMIZATION OFF;
ALTER DATABASE [BSBD1_New] SET TRUSTWORTHY OFF;
ALTER DATABASE [BSBD1_New] SET ALLOW_SNAPSHOT_ISOLATION OFF;
ALTER DATABASE [BSBD1_New] SET PARAMETERIZATION SIMPLE;
ALTER DATABASE [BSBD1_New] SET READ_COMMITTED_SNAPSHOT OFF;
ALTER DATABASE [BSBD1_New] SET HONOR_BROKER_PRIORITY OFF;
ALTER DATABASE [BSBD1_New] SET RECOVERY SIMPLE;
ALTER DATABASE [BSBD1_New] SET MULTI_USER;
ALTER DATABASE [BSBD1_New] SET PAGE_VERIFY CHECKSUM;
ALTER DATABASE [BSBD1_New] SET DB_CHAINING OFF;
ALTER DATABASE [BSBD1_New] SET FILESTREAM (NON_TRANSACTED_ACCESS = OFF);
ALTER DATABASE [BSBD1_New] SET TARGET_RECOVERY_TIME = 0 SECONDS;
ALTER DATABASE [BSBD1_New] SET DELAYED_DURABILITY = DISABLED;
ALTER DATABASE [BSBD1_New] SET ACCELERATED_DATABASE_RECOVERY = OFF;
ALTER DATABASE [BSBD1_New] SET QUERY_STORE = OFF;
ALTER DATABASE [BSBD1_New] SET READ_WRITE;
GO

-- Xóa các ràng buộc khóa ngoại nếu tồn tại
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Sach_New_NhaXuatBan_New')
    ALTER TABLE [dbo].[Sach_New] DROP CONSTRAINT FK_Sach_New_NhaXuatBan_New;
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Sach_New_TacGia_New')
    ALTER TABLE [dbo].[Sach_New] DROP CONSTRAINT FK_Sach_New_TacGia_New;
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Sach_New_TheLoai_New')
    ALTER TABLE [dbo].[Sach_New] DROP CONSTRAINT FK_Sach_New_TheLoai_New;
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_ChiTietDDH_New_Sach_New')
    ALTER TABLE [dbo].[ChiTietDDH_New] DROP CONSTRAINT FK_ChiTietDDH_New_Sach_New;
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_ChiTietDDH_New_DonDatHang_New')
    ALTER TABLE [dbo].[ChiTietDDH_New] DROP CONSTRAINT FK_ChiTietDDH_New_DonDatHang_New;
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_DonDatHang_New_KhachHang_New')
    ALTER TABLE [dbo].[DonDatHang_New] DROP CONSTRAINT FK_DonDatHang_New_KhachHang_New;
GO

-- Xóa các bảng nếu tồn tại
DROP TABLE IF EXISTS [dbo].[Sach_New];
DROP TABLE IF EXISTS [dbo].[ChiTietDDH_New];
DROP TABLE IF EXISTS [dbo].[DonDatHang_New];
DROP TABLE IF EXISTS [dbo].[KhachHang_New];
DROP TABLE IF EXISTS [dbo].[LienHe_New];
DROP TABLE IF EXISTS [dbo].[NhaXuatBan_New];
DROP TABLE IF EXISTS [dbo].[TacGia_New];
DROP TABLE IF EXISTS [dbo].[TheLoai_New];
DROP TABLE IF EXISTS [dbo].[Admin_New];
GO

-- Tạo các bảng
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

-- Bảng Admin_New
CREATE TABLE [dbo].[Admin_New](
    [IDAdmin] [int] IDENTITY(1,1) NOT NULL,
    [TaiKhoan] [varchar](50) NULL,
    [MatKhau] [varchar](50) NULL,
    [HoTen] [nvarchar](50) NULL,
    [TrangThai] [bit] NULL,
    PRIMARY KEY CLUSTERED ([IDAdmin] ASC)
) ON [PRIMARY];
GO

-- Bảng TheLoai_New
CREATE TABLE [dbo].[TheLoai_New](
    [MaLoai] [int] IDENTITY(1,1) NOT NULL,
    [TenLoai] [nvarchar](50) NULL,
    PRIMARY KEY CLUSTERED ([MaLoai] ASC)
) ON [PRIMARY];
GO

-- Bảng TacGia_New
CREATE TABLE [dbo].[TacGia_New](
    [MaTG] [int] IDENTITY(1,1) NOT NULL,
    [TenTG] [nvarchar](50) NULL,
    [QueQuan] [nvarchar](250) NULL,
    [NgaySinh] [smalldatetime] NULL,
    [NgayMat] [smalldatetime] NULL,
    [TieuSu] [nvarchar](500) NULL,
    PRIMARY KEY CLUSTERED ([MaTG] ASC)
) ON [PRIMARY];
GO

-- Bảng NhaXuatBan_New
CREATE TABLE [dbo].[NhaXuatBan_New](
    [MaNXB] [int] IDENTITY(1,1) NOT NULL,
    [TenNXB] [nvarchar](50) NULL,
    [DiaChi] [nvarchar](250) NULL,
    [DienThoai] [varchar](50) NULL,
    PRIMARY KEY CLUSTERED ([MaNXB] ASC)
) ON [PRIMARY];
GO

-- Bảng KhachHang_New
CREATE TABLE [dbo].[KhachHang_New](
    [MaKH] [int] IDENTITY(1,1) NOT NULL,
    [TenKH] [nvarchar](50) NULL,
    [Email] [varchar](50) NULL,
    [DiaChi] [nvarchar](250) NULL,
    [DienThoai] [varchar](50) NULL,
    [NgaySinh] [smalldatetime] NULL,
    [TaiKhoan] [varchar](50) NOT NULL,
    [MatKhau] [varchar](50) NOT NULL,
    [NgayTao] [datetime] NULL,
    [TrangThai] [bit] NULL,
    PRIMARY KEY CLUSTERED ([MaKH] ASC)
) ON [PRIMARY];
GO

-- Bảng DonDatHang_New
CREATE TABLE [dbo].[DonDatHang_New](
    [MaDDH] [int] IDENTITY(1,1) NOT NULL,
    [NgayDat] [smalldatetime] NULL DEFAULT (GETDATE()),
    [NgayGiao] [smalldatetime] NULL,
    [TinhTrang] [bit] NULL,
    [MaKH] [int] NOT NULL,
    [ThanhToan] [int] NULL,
    [Tracking] [int] NULL,
    PRIMARY KEY CLUSTERED ([MaDDH] ASC)
) ON [PRIMARY];
GO

-- Bảng ChiTietDDH_New
CREATE TABLE [dbo].[ChiTietDDH_New](
    [MaSach] [int] NOT NULL,
    [MaDDH] [int] NOT NULL,
    [SoLuong] [int] NULL,
    [DonGia] [money] NULL,
    PRIMARY KEY CLUSTERED ([MaSach] ASC, [MaDDH] ASC)
) ON [PRIMARY];
GO

-- Bảng Sach_New
CREATE TABLE [dbo].[Sach_New](
    [MaSach] [int] IDENTITY(1,1) NOT NULL,
    [MaLoai] [int] NOT NULL,
    [MaNXB] [int] NOT NULL,
    [MaTG] [int] NOT NULL,
    [TenSach] [nvarchar](250) NULL,
    [GiaBan] [money] NULL,
    [Mota] [nvarchar](500) NULL,
    [NguoiDich] [nvarchar](50) NULL,
    [AnhBia] [varchar](50) NULL,
    [NgayCapNhat] [smalldatetime] NULL DEFAULT (GETDATE()),
    [SoLuongTon] [int] NULL,
    PRIMARY KEY CLUSTERED ([MaSach] ASC)
) ON [PRIMARY];
GO

-- Bảng LienHe_New
CREATE TABLE [dbo].[LienHe_New](
    [MaLH] [int] IDENTITY(1,1) NOT NULL,
    [Ho] [nvarchar](50) NULL,
    [Ten] [nvarchar](50) NULL,
    [Email] [varchar](100) NULL,
    [DienThoai] [varchar](50) NULL,
    [NoiDung] [nvarchar](500) NULL,
    [NgayCapNhat] [smalldatetime] NULL,
    PRIMARY KEY CLUSTERED ([MaLH] ASC)
) ON [PRIMARY];
GO

-- Thêm các ràng buộc khóa ngoại
ALTER TABLE [dbo].[DonDatHang_New] ADD CONSTRAINT FK_DonDatHang_New_KhachHang_New
    FOREIGN KEY ([MaKH]) REFERENCES [dbo].[KhachHang_New] ([MaKH]);
GO

ALTER TABLE [dbo].[ChiTietDDH_New] ADD CONSTRAINT FK_ChiTietDDH_New_Sach_New
    FOREIGN KEY ([MaSach]) REFERENCES [dbo].[Sach_New] ([MaSach]);
GO

ALTER TABLE [dbo].[ChiTietDDH_New] ADD CONSTRAINT FK_ChiTietDDH_New_DonDatHang_New
    FOREIGN KEY ([MaDDH]) REFERENCES [dbo].[DonDatHang_New] ([MaDDH]);
GO

ALTER TABLE [dbo].[Sach_New] ADD CONSTRAINT FK_Sach_New_TheLoai_New
    FOREIGN KEY ([MaLoai]) REFERENCES [dbo].[TheLoai_New] ([MaLoai]);
GO

ALTER TABLE [dbo].[Sach_New] ADD CONSTRAINT FK_Sach_New_NhaXuatBan_New
    FOREIGN KEY ([MaNXB]) REFERENCES [dbo].[NhaXuatBan_New] ([MaNXB]);
GO

ALTER TABLE [dbo].[Sach_New] ADD CONSTRAINT FK_Sach_New_TacGia_New
    FOREIGN KEY ([MaTG]) REFERENCES [dbo].[TacGia_New] ([MaTG]);
GO