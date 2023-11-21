﻿CREATE DATABASE DOANHQT
GO 
USE DOANHQT
GO

CREATE TABLE KHACHHANG
(
  MaKH          CHAR(5) NOT NULL,
  HoTenKH       VARCHAR(50) NOT NULL,
  NgaySinhKH    DATETIME NOT NULL,
  DiaChiKH      VARCHAR(50) NOT NULL,
  SDTKH         INT NOT NULL,
  EmailKH       VARCHAR(50) NOT NULL,
  MaNV          CHAR(5) NOT NULL,
  PRIMARY KEY(MaKH)
);

CREATE TABLE HoSoBN
(
  MaHS          CHAR(5) NOT NULL,
  NgayKham      DATETIME NOT NULL,
  NguoiKham     VARCHAR(50) ,
  DichVuSuDung  VARCHAR(50) NOT NULL,
  MaKH          CHAR(5) NOT NULL,
  MaNS          CHAR(5) NOT NULL,
  PRIMARY KEY(MaHS)
);

select * from HoSoBN

CREATE TABLE Thuoc
(
  MaThuoc       CHAR(5) NOT NULL,
  TenThuoc      VARCHAR(50) NOT NULL,
  DonViTinh     VARCHAR(10) NOT NULL,
  ChiTinh       VARCHAR(50) NOT NULL,
  SLTonKho      INT NOT NULL,
  NgayHetHan    DATETIME NOT NULL,
  MaNV          CHAR(5) NOT NULL,
  MaQT          CHAR(5) NOT NULL,
  PRIMARY KEY(MaThuoc)
);

CREATE TABLE LichCaNhanNS
(
  MaLichCaNhan  CHAR(5) NOT NULL,
  Ngay          DATETIME NOT NULL,
  ThoiGian      DATETIME NOT NULL,
  MaNS          CHAR(5) NOT NULL,
  PRIMARY KEY(MaLichCaNhan)
);

CREATE TABLE NhaSi
(
  MaNS          CHAR(5) NOT NULL,
  HoTenNS       VARCHAR(50) NOT NULL,
  NgaySinhNS    DATETIME NOT NULL,
  DiaChiNS      VARCHAR(50) NOT NULL,
  SDTNS         INT NOT NULL,
  EmailNS       VARCHAR(50) NOT NULL,
  PRIMARY KEY(MaNS)
);

CREATE TABLE LichHen
(
  MaLichHen     CHAR(5) NOT NULL,
  NgayHen       DATETIME NOT NULL,
  ThoiGianHen   DATETIME NOT NULL,
  NguoiDatLich  VARCHAR(50) NOT NULL,
  MaKH          CHAR(5) NOT NULL,
  MaNS          CHAR(5) NOT NULL,
  PRIMARY KEY(MaLichHen)
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
  MaCTHD        CHAR(5) NOT NULL,
  MaDV          CHAR(5) NOT NULL,
  MaThuoc       CHAR(5) NOT NULL,
  TenDV         VARCHAR(50) NOT NULL,
  TenThuoc      VARCHAR(50) NOT NULL,
  SL            INT NOT NULL,
  LoaiDV        VARCHAR(50) NOT NULL,
  ThanhTien     INT NOT NULL,
  MaHD          CHAR(5) NOT NULL,
  MaHS          CHAR(5) NOT NULL,
  PRIMARY KEY(MaCTHD)
);

CREATE TABLE HoaDon
(
  MaHD          CHAR(5) NOT NULL,
  TenKH         VARCHAR(50) NOT NULL,
  PhiThanhToan  INT NOT NULL,
  PRIMARY KEY(MaHD)
);

CREATE TABLE NhanVien
(
  MaNV          CHAR(5) NOT NULL,
  HoTenNV       VARCHAR(50) NOT NULL,
  NgaySinhNV    DATETIME NOT NULL,
  DiaChiNV      VARCHAR(50) NOT NULL,
  SDTNV         INT NOT NULL,
  EmailNV       VARCHAR(50) NOT NULL,
  PRIMARY KEY(MaNV)
);

CREATE TABLE QuanTri
(
  MaQT          CHAR(5) NOT NULL,
  HoTenQT       VARCHAR(50) NOT NULL,
  NgaySinhQT    DATETIME NOT NULL,
  DiaChiQT      VARCHAR(50) NOT NULL,
  SDTQT         INT NOT NULL,
  EmailQT       VARCHAR(50) NOT NULL,
  PRIMARY KEY(MaQT)
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

ALTER TABLE THUOC ADD CONSTRAINT FK_THUOC_NHANVIEN FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV);
ALTER TABLE THUOC ADD CONSTRAINT FK_THUOC_QUANTRI FOREIGN KEY(MaQT) REFERENCES QUANTRI(MaQT);

ALTER TABLE LICHCANHANNS ADD CONSTRAINT FK_LICHCANHANNS_NHASI FOREIGN KEY(MaNS) REFERENCES NHASI(MaNS);

ALTER TABLE NHASI ADD CONSTRAINT FK_NHASI_TAIKHOAN FOREIGN KEY(SDTNS) REFERENCES TAIKHOAN(SDT);

ALTER TABLE LICHHEN ADD CONSTRAINT FK_LICHHEN_KHACHHANG FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH);
ALTER TABLE LICHHEN ADD CONSTRAINT FK_LICHHEN_NHASI FOREIGN KEY(MaNS) REFERENCES NHASI(MaNS);

ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_DICHVU FOREIGN KEY(MaDV) REFERENCES DICHVU(MaDV);
ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_THUOC FOREIGN KEY(MaThuoc) REFERENCES THUOC(MaThuoc);
ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_HOADON FOREIGN KEY(MaHD) REFERENCES HOADON(MaHD);
ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_HOSOBN FOREIGN KEY(MaHS) REFERENCES HOSOBN(MaHS);

ALTER TABLE NHANVIEN ADD CONSTRAINT FK_NHANVIEN_TAIKHOAN FOREIGN KEY(SDTNV) REFERENCES TAIKHOAN(SDT);

ALTER TABLE QUANTRI ADD CONSTRAINT FK_QUANTRI_TAIKHOAN FOREIGN KEY(SDTQT) REFERENCES TAIKHOAN(SDT);


INSERT INTO TaiKhoan (SDT, MatKhau, LoaiTK) VALUES
(123456789, '12345', '0'),
(987654321, '12345', '1'),
(555555555, '12345', '2');

select * from TaiKhoan
insert into TAIKHOAN(SDT,MATKHAU,LoaiTK) VALUES (125423344, '12345', '0')


INSERT INTO QuanTri (MaQT, HoTenQT, NgaySinhQT, DiaChiQT, SDTQT, EmailQT) VALUES
('QT001', 'Nguyenhoaiman', '1-1-1999', 'hcm', 123456789, 'MAN2082002@GMAIL.COM');

-- Xử lí đăng nhập tài khoản
DROP PROCEDURE IF EXISTS Sp_DangNhap;

CREATE PROC Sp_DangNhap
	@SDT INT,
	@MatKhau VARCHAR(50),
	@LoaiTK VARCHAR(50) OUTPUT
AS
BEGIN
	-- Loại bỏ khởi tạo giá trị
	-- SET @LoaiTK = 'NULL'

	IF NOT EXISTS (SELECT LoaiTK
				FROM TaiKhoan 
				WHERE SDT = @SDT 
				AND MATKHAU = @MatKhau)
	BEGIN
		PRINT N'Sai tên đăng nhập hoặc mật khẩu'
		RETURN 0
	END
	
	-- lấy loại acc
	SET @LoaiTK = (SELECT LoaiTK
				FROM TaiKhoan
				WHERE  SDT = @SDT 
				AND MATKHAU = @MatKhau)

	-- xử lí đăng nhập
	if (@LoaiTK IS NOT NULL)
	BEGIN
		PRINT N'Đăng nhập thành công'
		RETURN 1
	END
	ELSE RETURN 0	
END
GO


DECLARE @SDT int = 987654321;
DECLARE @MatKhau VARCHAR(50) = '12345';
DECLARE @LoaiTK INT;

EXEC Sp_DangNhap @SDT, @MatKhau, @LoaiTK OUTPUT;

PRINT 'Loại tài khoản: ' + CAST(@LoaiTK AS NVARCHAR(10));