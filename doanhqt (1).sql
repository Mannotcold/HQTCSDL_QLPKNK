﻿DROP DATABASE DOANHQT

-- Drop foreign key constraints
ALTER TABLE KHACHHANG DROP CONSTRAINT FK_KHACHHANG_TAIKHOAN;
ALTER TABLE KHACHHANG DROP CONSTRAINT FK_KHACHHANG_NHANVIEN;

ALTER TABLE HOSOBN DROP CONSTRAINT FK_HOSOBN_KHACHHANG;
ALTER TABLE HOSOBN DROP CONSTRAINT FK_HOSOBN_NHANSI;

ALTER TABLE THUOC DROP CONSTRAINT FK_THUOC_NHANVIEN;
ALTER TABLE THUOC DROP CONSTRAINT FK_THUOC_QUANTRI;

ALTER TABLE LICHCANHANNS DROP CONSTRAINT FK_LICHCANHANNS_NHASI;

ALTER TABLE NHASI DROP CONSTRAINT FK_NHASI_TAIKHOAN;

ALTER TABLE LICHHEN DROP CONSTRAINT FK_LICHHEN_KHACHHANG;
ALTER TABLE LICHHEN DROP CONSTRAINT FK_LICHHEN_NHASI;

ALTER TABLE CT_HOADON DROP CONSTRAINT FK_CT_HOADON_HOADON;
ALTER TABLE CT_HOADON DROP CONSTRAINT FK_CT_HOADON_HOSOBN;

ALTER TABLE NHANVIEN DROP CONSTRAINT FK_NHANVIEN_TAIKHOAN;

ALTER TABLE QUANTRI DROP CONSTRAINT FK_QUANTRI_TAIKHOAN;

-- Drop tables
DROP TABLE CT_HOADON;
DROP TABLE HOADON;
DROP TABLE LICHHEN;
DROP TABLE LICHCANHANNS;
DROP TABLE NHASI;
DROP TABLE LichCaNhanNS;
DROP TABLE TaiKhoan;
DROP TABLE QuanTri;
DROP TABLE NhanVien;
DROP TABLE DichVu;
DROP TABLE HoSoBN;
DROP TABLE KHACHHANG;
DROP TABLE Thuoc;
drop table taikhoan


CREATE DATABASE DOANHQT
GO 
USE DOANHQT
GO

CREATE TABLE KHACHHANG
(
  MaKH          INT IDENTITY(1,1) PRIMARY KEY, 
  HoTenKH       VARCHAR(50) NOT NULL,
  NgaySinhKH    DATETIME NOT NULL,
  DiaChiKH      VARCHAR(50) NOT NULL,
  SDTKH         INT NOT NULL,
  EmailKH       VARCHAR(50) NOT NULL,
  MaNV          INT NOT NULL
);

CREATE TABLE HoSoBN
(
  MaHS          INT IDENTITY(1,1) PRIMARY KEY,
  NgayKham      DATETIME NOT NULL,
  NguoiKham     VARCHAR(50) ,
  DichVuSuDung  VARCHAR(50) NOT NULL,
  MaKH          INT NOT NULL,
  MaNS          INT NOT NULL
);

CREATE TABLE Thuoc
(
  MaThuoc       CHAR(5) NOT NULL,
  TenThuoc      VARCHAR(50) NOT NULL,
  DonViTinh     VARCHAR(10) NOT NULL,
  ChiDinh       VARCHAR(50) NOT NULL,
  SLTonKho      INT NOT NULL,
  NgayHetHan    DATETIME NOT NULL,
  MaQT          INT NOT NULL,
  PRIMARY KEY(MaThuoc)
  
);


CREATE TABLE LichCaNhanNS
(
  MaLichCaNhan  INT IDENTITY(1,1) PRIMARY KEY,
  Ngay          DATETIME NOT NULL,
  ThoiGian      TIME NOT NULL,
  MaNS          INT NOT NULL
);




CREATE TABLE NhaSi
(
  MaNS          INT IDENTITY(1,1) PRIMARY KEY,
  HoTenNS       VARCHAR(50) NOT NULL,
  NgaySinhNS    DATETIME NOT NULL,
  DiaChiNS      VARCHAR(50) NOT NULL,
  SDTNS         INT NOT NULL,
  EmailNS       VARCHAR(50) NOT NULL,
);

CREATE TABLE LichHen
(
  MaLichHen     INT IDENTITY(1,1) PRIMARY KEY,
  NgayHen       DATETIME NOT NULL,
  ThoiGianHen   DATETIME NOT NULL,
  NguoiDatLich  VARCHAR(50) NOT NULL,
  MaKH          INT NOT NULL,
  MaNS          INT NOT NULL
);


CREATE TABLE DichVu
(
  MaDV          CHAR(5) NOT NULL,
  TenDV         VARCHAR(50) NOT NULL,
  Loai          VARCHAR(50) NOT NULL,
  PRIMARY KEY(MaDV)
);

CREATE TABLE CT_HoaDon
(
  MaCTHD        INT IDENTITY(1,1) PRIMARY KEY,
  MaDV_Thuoc       CHAR(5) NOT NULL,
  TenDV         VARCHAR(50) NOT NULL,
  TenThuoc      VARCHAR(50) NOT NULL,
  SL            INT NOT NULL,
  LoaiDV        VARCHAR(50) NOT NULL,
  ThanhTien     INT NOT NULL,
  MaHD          INT NOT NULL,
  MaHS          INT NOT NULL
);

CREATE TABLE HoaDon
(
  MaHD          INT IDENTITY(1,1) PRIMARY KEY,
  TenKH         VARCHAR(50) NOT NULL,
  PhiThanhToan  INT NOT NULL
);

CREATE TABLE NhanVien
(
  MaNV          INT IDENTITY(1,1) PRIMARY KEY,
  HoTenNV       VARCHAR(50) NOT NULL,
  NgaySinhNV    DATETIME NOT NULL,
  DiaChiNV      VARCHAR(50) NOT NULL,
  SDTNV         INT NOT NULL,
  EmailNV       VARCHAR(50) NOT NULL
);

CREATE TABLE QuanTri
(
  MaQT          INT IDENTITY(1,1) PRIMARY KEY,
  HoTenQT       VARCHAR(50) NOT NULL,
  NgaySinhQT    DATETIME NOT NULL,
  DiaChiQT      VARCHAR(50) NOT NULL,
  SDTQT         INT NOT NULL,
  EmailQT       VARCHAR(50) NOT NULL
);

CREATE TABLE TaiKhoan
( 
  SDT           INT NOT NULL,
  MatKhau       VARCHAR(50) NOT NULL,
  LoaiTK        VARCHAR(50) NOT NULL,
  PRIMARY KEY(SDT) 
);

ALTER TABLE KHACHHANG ADD CONSTRAINT FK_KHACHHANG_TAIKHOAN FOREIGN KEY(SDTKH) REFERENCES TAIKHOAN(SDT);
ALTER TABLE KHACHHANG ADD CONSTRAINT FK_KHACHHANG_NHANVIEN FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV);

ALTER TABLE HOSOBN ADD CONSTRAINT FK_HOSOBN_KHACHHANG FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH);
ALTER TABLE HOSOBN ADD CONSTRAINT FK_HOSOBN_NHANSI FOREIGN KEY(MaNS) REFERENCES NHASI(MaNS);

--ALTER TABLE THUOC ADD CONSTRAINT FK_THUOC_NHANVIEN FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV);
ALTER TABLE THUOC ADD CONSTRAINT FK_THUOC_QUANTRI FOREIGN KEY(MaQT) REFERENCES QUANTRI(MaQT);

ALTER TABLE LICHCANHANNS ADD CONSTRAINT FK_LICHCANHANNS_NHASI FOREIGN KEY(MaNS) REFERENCES NHASI(MaNS);

ALTER TABLE NHASI ADD CONSTRAINT FK_NHASI_TAIKHOAN FOREIGN KEY(SDTNS) REFERENCES TAIKHOAN(SDT);

ALTER TABLE LICHHEN ADD CONSTRAINT FK_LICHHEN_KHACHHANG FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH);
ALTER TABLE LICHHEN ADD CONSTRAINT FK_LICHHEN_NHASI FOREIGN KEY(MaNS) REFERENCES NHASI(MaNS);

--ALTER TABLE CT_HOADON
--DROP CONSTRAINT FK_CT_HOADON_DICHVU;
--ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_DICHVU FOREIGN KEY(MaDV_Thuoc) REFERENCES DICHVU(MaDV);
--ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_THUOC FOREIGN KEY(MaDV_Thuoc) REFERENCES THUOC(MaThuoc);
ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_HOADON FOREIGN KEY(MaHD) REFERENCES HOADON(MaHD);
--ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_HOSOBN FOREIGN KEY(MaHS) REFERENCES HOSOBN(MaHS);

ALTER TABLE NHANVIEN ADD CONSTRAINT FK_NHANVIEN_TAIKHOAN FOREIGN KEY(SDTNV) REFERENCES TAIKHOAN(SDT);

ALTER TABLE QUANTRI ADD CONSTRAINT FK_QUANTRI_TAIKHOAN FOREIGN KEY(SDTQT) REFERENCES TAIKHOAN(SDT);


INSERT INTO TaiKhoan (SDT, MatKhau, LoaiTK) VALUES
(012650152, '12345', '0'),
(123456789, '12345', '1'),
(123456788, '12345', '1'),
(123456787, '12345', '1'),
(987654321, '12345', '2'),
(987654322, '12345', '2'),
(987654323, '12345', '2'),
(555555551, '12345', '3'),
(555555552, '12345', '3'),
(555555553, '12345', '3')

select * from TaiKhoan

INSERT INTO QuanTri (HoTenQT, NgaySinhQT, DiaChiQT, SDTQT, EmailQT) VALUES
('Nguyenhoaiman', '1-1-1999', 'hcm', 012650152, 'MAN2082002@GMAIL.COM')

select * from QuanTri

INSERT INTO NhanVien (HoTenNV, NgaySinhNV, DiaChiNV, SDTNV, EmailNV) VALUES
( 'Nguyen Van A', '05-15-1990', 'Ha Noi', 987654321, 'nva@gmail.com'),
( 'Tran Thi B', '12-10-1985', 'Da Nang', 987654322, 'ttb@gmail.com'),
( 'Le Van C', '07-22-1982', 'Ho Chi Minh', 987654323, 'lvc@gmail.com')

select * from NhanVien

INSERT INTO NhaSi (HoTenNS, NgaySinhNS, DiaChiNS, SDTNS, EmailNS) VALUES
('Tran Van A', '05-15-1990', 'Ha Noi', 123456789, 'tva@gmail.com'),
('Le Thi B', '12-10-1985', 'Da Nang', 123456788, 'ltb@gmail.com'),
('Nguyen Van C', '07-22-1982', 'Ho Chi Minh', 123456787, 'nvc@gmail.com')

select * from NhaSi

INSERT INTO KHACHHANG ( HoTenKH, NgaySinhKH, DiaChiKH, SDTKH, EmailKH, MaNV) VALUES
('Nguyen Van E', '05-15-1990', 'Ha Noi', 555555551, 'nve@gmail.com',1),
('Tran Thi L', '12-10-1985', 'Da Nang', 555555552, 'ttl@gmail.com', 2),
('Le Van M', '07-22-1982', 'Ho Chi Minh', 555555553, 'lvm@gmail.com', 3)

select * from KHACHHANG

INSERT INTO HoSoBN ( NgayKham, NguoiKham, DichVuSuDung, MaKH, MaNS) VALUES
('01-10-2023', 'KH001', 'Kham rang tong quat', 2,2),
('02-15-2023', 'KH002', 'Lay tuy', 2,5),
('03-22-2023', 'KH003', 'Nho rang khon', 3,1),
('04-18-2023', 'KH004', 'Tram rang', 4,4),
('05-25-2023', 'KH005', 'Trong rang su',5,3);
select * from HoSoBN






INSERT INTO Thuoc (MaThuoc, TenThuoc, DonViTinh, ChiDinh, SLTonKho, NgayHetHan, MaQT) VALUES
('T000','Khong su dung thuoc', 'Khong', 'Khong', 0, '01-01-2090',  1),
('T001','Paracetamol', 'Viên', 'Uống', 100, '12-31-2023',  1),
('T002','Ibuprofen', 'Viên', 'Uống', 80, '11-30-2023',  2),
('T003','Amoxicillin', 'Viên', 'Uống', 120, '05-31-2024', 3),
('T004','Aspirin', 'Viên', 'Uống', 90, '10-15-2023',4),
('T005','Loratadine', 'Viên', 'Uống', 60, '03-20-2024', 5),
('T006','Omeprazole', 'Viên', 'Uống', 150, '09-25-2023', 1),
('T007','Cetirizine', 'Viên', 'Uống', 110, '01-05-2024', 2);


INSERT INTO LichCaNhanNS (Ngay, ThoiGian, MaNS) VALUES
('01-10-2023', '08:30:00', 1),
('02-15-2023', '14:45:00', 2),
('03-22-2023', '09:20:00', 3),
('04-18-2023', '16:10:00', 1),
('05-25-2023', '11:30:00', 2),
('06-30-2023', '13:15:00', 3),
('07-15-2023', '10:00:00', 1),
('08-20-2023', '14:30:00', 2);
select * from LichCaNhanNS


INSERT INTO LichHen (NgayHen, ThoiGianHen, NguoiDatLich, MaKH, MaNS) VALUES
('01-10-2023', '08:30:00', 'Nguyen Van E', 3, 2),
('02-15-2023', '14:45:00', 'Nguyen Van E', 2,2),
('03-22-2023', '09:20:00', 'Tran Thi L', 3,3),
('04-18-2023', '16:10:00', 'Tran Thi L', 3,2);
select * from LichHen


INSERT INTO DichVu (MaDV,TenDV, Loai) VALUES
('DV000', 'Khong su dung dich vu', 'Khong'),
('DV001', 'Kham rang tong quat', 'Dich vu nhanh'),
('DV002', 'Lay tuy', 'Dich vu nhanh'),
('DV003', 'Nho rang khon', 'Dich vu nhanh'),
('DV004', 'Tram rang', 'Dich vu nhanh'),
('DV005', 'Trong rang su', 'Dich vu nhanh'),
('DV006', 'Chup X-quang rang', 'Dich vu nhanh'),
('DV007', 'Nho rang thuong', 'Dich vu nhanh'),
('DV008', 'Lay voi rang', 'Dich vu nhanh'),
('DV009', 'Lo trinh tay trang rang', 'Lo trinh'),
('DV010', 'Thuoc uong', 'Thuoc');
select * from DichVu



INSERT INTO CT_HoaDon ( MaDV_Thuoc, TenDV, TenThuoc, SL, LoaiDV, ThanhTien, MaHD, MaHS) VALUES
('DV001', 'Kham rang tong quat', 'Khong su dung thuoc', 1, 'Dich vu nhanh', 500000, 2,3),
('T000', 'Lay tuy', 'Khong su dung thuoc', 2, 'Dich vu nhanh', 1200000, 2,2),
('T000', 'Tram rang', 'Khong su dung thuoc', 3, 'Dich vu nhanh', 300000, 3,3),
('DV010', 'Thuoc uong', 'Paracetamol', 3, 'Thuoc', 30000, 4,4),
('T002', 'Thuoc uong', 'Ibuprofen', 4, 'Thuoc', 50000, 5,5),
('DV005', 'Trong rang su', 'Khong su dung thuoc', 6, 'Dich vu nhanh', 1500000, 1,1);
select * from CT_HoaDon

INSERT INTO HoaDon ( TenKH, PhiThanhToan) VALUES
('Nguyen Van E', 2000000),
('Tran Thi L', 1400000),
('Le Van M', 380000);

select * from HoaDon

-- Xử lí đăng nhập tài khoản
DROP PROCEDURE IF EXISTS Sp_DangNhap;

--CREATE PROC Sp_DangNhap
--	@SDT INT,
--	@MatKhau VARCHAR(50),
--	@LoaiTK VARCHAR(50) OUTPUT
--AS
--BEGIN
--	-- Loại bỏ khởi tạo giá trị
--	-- SET @LoaiTK = 'NULL'

--	IF NOT EXISTS (SELECT LoaiTK
--				FROM TaiKhoan 
--				WHERE SDT = @SDT 
--				AND MATKHAU = @MatKhau)
--	BEGIN
--		PRINT N'Sai tên đăng nhập hoặc mật khẩu'
--		RETURN 0
--	END
	
--	-- lấy loại acc
--	SET @LoaiTK = (SELECT LoaiTK
--				FROM TaiKhoan
--				WHERE  SDT = @SDT 
--				AND MATKHAU = @MatKhau)

--	-- xử lí đăng nhập
--	if (@LoaiTK IS NOT NULL)
--	BEGIN
--		PRINT N'Đăng nhập thành công'
--		RETURN 1
--	END
--	ELSE RETURN 0	
--END
--GO
select * from taikhoan

CREATE PROC SpDangNhap
	@SDT INT,
	@MatKhau VARCHAR(50),
	@LoaiTK VARCHAR(50) OUTPUT,
	@Ma CHAR(5) OUTPUT
AS
BEGIN
	-- Initialize output parameters
	SET @LoaiTK = NULL
	SET @Ma = NULL

	-- Check if the provided credentials match an employee account
	IF EXISTS (
		SELECT LoaiTK, MaNV
		FROM TaiKhoan 
		INNER JOIN NhanVien ON TaiKhoan.SDT = NhanVien.SDTNV
		WHERE TaiKhoan.SDT = @SDT AND TaiKhoan.MatKhau = @MatKhau
	)
	BEGIN
		-- Retrieve account type and ID for employee
		SELECT @LoaiTK = '2', @Ma = MaNV
		FROM TaiKhoan
		INNER JOIN NhanVien ON TaiKhoan.SDT = NhanVien.SDTNV
		WHERE TaiKhoan.SDT = @SDT AND TaiKhoan.MatKhau = @MatKhau

		PRINT N'Đăng nhập thành công'
		RETURN 1
	END
	-- Check if the provided credentials match an administrator account
	ELSE IF EXISTS (
		SELECT LoaiTK, MaQT
		FROM TaiKhoan 
		INNER JOIN QuanTri ON TaiKhoan.SDT = QuanTri.SDTQT
		WHERE TaiKhoan.SDT = @SDT AND TaiKhoan.MatKhau = @MatKhau
	)
	BEGIN
		-- Retrieve account type and ID for administrator
		SELECT @LoaiTK = '0', @Ma = MaQT
		FROM TaiKhoan
		INNER JOIN QuanTri ON TaiKhoan.SDT = QuanTri.SDTQT
		WHERE TaiKhoan.SDT = @SDT AND TaiKhoan.MatKhau = @MatKhau

		PRINT N'Đăng nhập thành công'
		RETURN 1
	END
	-- Check if the provided credentials match a customer account
	ELSE IF EXISTS (
		SELECT LoaiTK, MaKH
		FROM TaiKhoan 
		INNER JOIN KHACHHANG ON TaiKhoan.SDT = KHACHHANG.SDTKH
		WHERE TaiKhoan.SDT = @SDT AND TaiKhoan.MatKhau = @MatKhau
	)
	BEGIN
		-- Retrieve account type and ID for customer
		SELECT @LoaiTK = '3', @Ma = MaKH
		FROM TaiKhoan
		INNER JOIN KHACHHANG ON TaiKhoan.SDT = KHACHHANG.SDTKH
		WHERE TaiKhoan.SDT = @SDT AND TaiKhoan.MatKhau = @MatKhau

		PRINT N'Đăng nhập thành công'
		RETURN 1
	END
	-- Check if the provided credentials match a doctor account (NhaSi)
	ELSE IF EXISTS (
		SELECT LoaiTK, MaNS
		FROM TaiKhoan 
		INNER JOIN NhaSi ON TaiKhoan.SDT = NhaSi.SDTNS
		WHERE TaiKhoan.SDT = @SDT AND TaiKhoan.MatKhau = @MatKhau
	)
	BEGIN
		-- Retrieve account type and ID for NhaSi
		SELECT @LoaiTK = '1', @Ma = MaNS
		FROM TaiKhoan
		INNER JOIN NhaSi ON TaiKhoan.SDT = NhaSi.SDTNS
		WHERE TaiKhoan.SDT = @SDT AND TaiKhoan.MatKhau = @MatKhau

		PRINT N'Đăng nhập thành công'
		RETURN 1
	END
	-- Add more checks for other user types if needed

	-- If no match is found, print an error message and return 0
	ELSE
	BEGIN
		PRINT N'Sai tên đăng nhập hoặc mật khẩu'
		RETURN 0
	END
END



DECLARE @SDT int = 987654321;
DECLARE @MatKhau VARCHAR(50) = '12345';
DECLARE @LoaiTK VARCHAR(50);
DECLARE @Ma VARCHAR(5);

EXEC SpDangNhap @SDT, @MatKhau, @LoaiTK OUTPUT, @Ma OUTPUT;

PRINT 'Loại tài khoản: ' + CAST(@LoaiTK AS NVARCHAR(10));
PRINT 'Loại tài khoản: ' + CAST(@Ma AS NVARCHAR(10));






EXEC sp_addlogin 'QLPKNK_NHASI', '12345', 'DOANHQT';  
GO

CREATE USER NHASI FOR LOGIN QLPKNK_NHASI
GO
GRANT SELECT, INSERT, UPDATE ON HoSoBN TO NHASI
GRANT SELECT, INSERT, UPDATE ON NHASI TO NHASI
select * from NhaSi

Update NHASI set HOTENNS = 'MANHOAI' where SDTNS = '987654321'


EXEC sp_addlogin '987654321', '12345', 'DOANHQT';  
GO

CREATE USER [987654321] FOR LOGIN [987654321]
CREATE ROLE NHASIROLE;


GO
CREATE ROLE NHASIROLE;

EXEC sp_addrolemember 'NHASIROLE', [987654321];
GRANT SELECT, INSERT, UPDATE ON HoSoBN TO NHASIROLE
GRANT SELECT, INSERT, UPDATE ON NHASI TO NHASIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON CT_HOADON TO NHASIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON LichCaNhanNS TO NHASIROLE