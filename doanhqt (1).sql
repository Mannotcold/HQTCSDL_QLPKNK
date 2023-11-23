--DROP DATABASE DOANHQT



CREATE DATABASE DOANHQT
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

CREATE TABLE Thuoc
(
  MaThuoc       CHAR(5) NOT NULL,
  TenThuoc      VARCHAR(50) NOT NULL,
  DonViTinh     VARCHAR(10) NOT NULL,
  ChiDinh       VARCHAR(50) NOT NULL,
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
  MaDV_Thuoc       CHAR(5) NOT NULL,
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

--ALTER TABLE CT_HOADON
--DROP CONSTRAINT FK_CT_HOADON_DICHVU;
--ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_DICHVU FOREIGN KEY(MaDV_Thuoc) REFERENCES DICHVU(MaDV);
--ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_THUOC FOREIGN KEY(MaDV_Thuoc) REFERENCES THUOC(MaThuoc);
ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_HOADON FOREIGN KEY(MaHD) REFERENCES HOADON(MaHD);
ALTER TABLE CT_HOADON ADD CONSTRAINT FK_CT_HOADON_HOSOBN FOREIGN KEY(MaHS) REFERENCES HOSOBN(MaHS);

ALTER TABLE NHANVIEN ADD CONSTRAINT FK_NHANVIEN_TAIKHOAN FOREIGN KEY(SDTNV) REFERENCES TAIKHOAN(SDT);

ALTER TABLE QUANTRI ADD CONSTRAINT FK_QUANTRI_TAIKHOAN FOREIGN KEY(SDTQT) REFERENCES TAIKHOAN(SDT);


INSERT INTO TaiKhoan (SDT, MatKhau, LoaiTK) VALUES
(123456789, '12345', '0'),
(987654321, '12345', '1'),
(555555555, '12345', '2'),
(123123123, '12345', '2'),
(234234234, '12345', '0'),
(345345345, '12345', '1'),
(456456456, '12345', '2'),
(567567567, '12345', '0'),
(678678678, '12345', '1'),
(789789789, '12345', '2'),
(989898989, '12345', '0'),
(878787878, '12345', '1'),
(767676767, '12345', '2'),
(656565656, '12345', '0'),
(121212121, '12345', '1'),
(232323232, '12345', '2'),
(343434343, '12345', '3'),
(454545454, '12345', '3'),
(565656565, '12345', '3'),
(676767676, '12345', '3'),
(787878787, '12345', '3');
select * from TaiKhoan

insert into TAIKHOAN(SDT,MATKHAU,LoaiTK) VALUES (125423344, '12345', '0')

INSERT INTO QuanTri (MaQT, HoTenQT, NgaySinhQT, DiaChiQT, SDTQT, EmailQT) VALUES
('QT001', 'Nguyenhoaiman', '1-1-1999', 'hcm', 123456789, 'MAN2082002@GMAIL.COM'),
('QT002', 'Khanh', '12-21-2002', 'HCM', 234234234, 'khanh2002@gmail.com'),
('QT003', 'Hoang', '1-1-2002', 'DaNang', 567567567, 'hoang2002@gmail.com'),
('QT004', 'Danh', '2-2-2002', 'HoChiMinh', 989898989, 'danh2002@gmail.com'),
('QT005', 'HoangThiD', '03-18-1995', 'Hue', 656565656, 'hoangthid@gmail.com');
select * from QuanTri

INSERT INTO NhanVien (MaNV, HoTenNV, NgaySinhNV, DiaChiNV, SDTNV, EmailNV) VALUES
('NV001', 'Nguyen Van A', '05-15-1990', 'Ha Noi', 987654321, 'nva@gmail.com'),
('NV002', 'Tran Thi B', '12-10-1985', 'Da Nang', 345345345, 'ttb@gmail.com'),
('NV003', 'Le Van C', '07-22-1982', 'Ho Chi Minh', 678678678, 'lvc@gmail.com'),
('NV004', 'Hoang Van D', '03-18-1995', 'Hue', 878787878, 'hvd@gmail.com'),
('NV005', 'Pham Thi E', '09-05-1988', 'Can Tho', 121212121, 'pte@gmail.com');
select * from NhanVien

INSERT INTO NhaSi (MaNS, HoTenNS, NgaySinhNS, DiaChiNS, SDTNS, EmailNS) VALUES
('NS001', 'Tran Van A', '05-15-1990', 'Ha Noi', 123123123, 'tva@gmail.com'),
('NS002', 'Le Thi B', '12-10-1985', 'Da Nang', 555555555, 'ltb@gmail.com'),
('NS003', 'Nguyen Van C', '07-22-1982', 'Ho Chi Minh', 456456456, 'nvc@gmail.com'),
('NS004', 'Pham Van D', '03-18-1995', 'Hue', 789789789, 'pvd@gmail.com'),
('NS005', 'Nguyen Thi E', '09-05-1988', 'Can Tho', 767676767, 'nte@gmail.com'),
('NS006', 'Tran Thi T', '09-12-1998', 'Ben Tre', 232323232, 'ttt@gmail.com');
select * from NhaSi

INSERT INTO KHACHHANG (MaKH, HoTenKH, NgaySinhKH, DiaChiKH, SDTKH, EmailKH, MaNV) VALUES
('KH001', 'Nguyen Van E', '05-15-1990', 'Ha Noi', 343434343, 'nve@gmail.com', 'NV001'),
('KH002', 'Tran Thi L', '12-10-1985', 'Da Nang', 454545454, 'ttl@gmail.com', 'NV002'),
('KH003', 'Le Van M', '07-22-1982', 'Ho Chi Minh', 565656565, 'lvm@gmail.com', 'NV003'),
('KH004', 'Hoang Van N', '03-18-1995', 'Hue', 676767676, 'hvn@gmail.com', 'NV004'),
('KH005', 'Pham Thi K', '09-05-1988', 'Can Tho', 787878787, 'ptk@gmail.com', 'NV005');
select * from KHACHHANG

INSERT INTO HoSoBN (MaHS, NgayKham, NguoiKham, DichVuSuDung, MaKH, MaNS) VALUES
('HS001', '01-10-2023', 'KH001', 'Kham rang tong quat', 'KH001', 'NS002'),
('HS002', '02-15-2023', 'KH002', 'Lay tuy', 'KH002', 'NS005'),
('HS003', '03-22-2023', 'KH003', 'Nho rang khon', 'KH003', 'NS001'),
('HS004', '04-18-2023', 'KH004', 'Tram rang', 'KH004', 'NS004'),
('HS005', '05-25-2023', 'KH005', 'Trong rang su', 'KH005', 'NS003');
select * from HoSoBN

INSERT INTO Thuoc (MaThuoc, TenThuoc, DonViTinh, ChiDinh, SLTonKho, NgayHetHan, MaNV, MaQT) VALUES
('T000', 'Khong su dung thuoc', 'Khong', 'Khong', 0, '01-01-2090', 'NV001', 'QT001'),
('T001', 'Paracetamol', 'Viên', 'Uống', 100, '12-31-2023', 'NV001', 'QT001'),
('T002', 'Ibuprofen', 'Viên', 'Uống', 80, '11-30-2023', 'NV002', 'QT002'),
('T003', 'Amoxicillin', 'Viên', 'Uống', 120, '05-31-2024', 'NV003', 'QT003'),
('T004', 'Aspirin', 'Viên', 'Uống', 90, '10-15-2023', 'NV004', 'QT004'),
('T005', 'Loratadine', 'Viên', 'Uống', 60, '03-20-2024', 'NV005', 'QT005'),
('T006', 'Omeprazole', 'Viên', 'Uống', 150, '09-25-2023', 'NV001', 'QT001'),
('T007', 'Cetirizine', 'Viên', 'Uống', 110, '01-05-2024', 'NV002', 'QT002'),
('T008', 'Simvastatin', 'Viên', 'Uống', 70, '08-12-2023', 'NV003', 'QT003'),
('T009', 'Metformin', 'Viên', 'Uống', 130, '02-28-2024', 'NV004', 'QT004'),
('T010', 'Hydrochlorothiazide', 'Viên', 'Uống', 110, '07-10-2023', 'NV005', 'QT005'),
('T011', 'Losartan', 'Viên', 'Uống', 80, '04-15-2024', 'NV001', 'QT001'),
('T012', 'Atorvastatin', 'Viên', 'Uống', 100, '11-22-2023', 'NV002', 'QT002'),
('T013', 'Albuterol', 'Viên', 'Uống', 120, '05-20-2024', 'NV003', 'QT003'),
('T014', 'Amlodipine', 'Viên', 'Uống', 90, '10-01-2023', 'NV004', 'QT004'),
('T015', 'Warfarin', 'Viên', 'Uống', 60, '03-05-2024', 'NV005', 'QT005');
select * from Thuoc

INSERT INTO LichCaNhanNS (MaLichCaNhan, Ngay, ThoiGian, MaNS) VALUES
('LCN01', '01-10-2023', '08:30:00', 'NS001'),
('LCN02', '02-15-2023', '14:45:00', 'NS002'),
('LCN03', '03-22-2023', '09:20:00', 'NS003'),
('LCN04', '04-18-2023', '16:10:00', 'NS004'),
('LCN05', '05-25-2023', '11:30:00', 'NS005'),
('LCN06', '06-30-2023', '13:15:00', 'NS001'),
('LCN07', '07-15-2023', '10:00:00', 'NS002'),
('LCN08', '08-20-2023', '14:30:00', 'NS003'),
('LCN09', '09-25-2023', '16:45:00', 'NS004'),
('LCN10', '10-31-2023', '12:00:00', 'NS005'),
('LCN11', '11-05-2023', '09:15:00', 'NS001'),
('LCN12', '12-10-2023', '15:30:00', 'NS002'),
('LCN13', '01-15-2024', '11:45:00', 'NS003'),
('LCN14', '02-20-2024', '14:00:00', 'NS004'),
('LCN15', '03-25-2024', '17:15:00', 'NS005');
select * from LichCaNhanNS

INSERT INTO LichHen (MaLichHen, NgayHen, ThoiGianHen, NguoiDatLich, MaKH, MaNS) VALUES
('LH001', '01-10-2023', '08:30:00', 'Nguyen Van E', 'KH001', 'NS001'),
('LH002', '02-15-2023', '14:45:00', 'Nguyen Van E', 'KH002', 'NS002'),
('LH003', '03-22-2023', '09:20:00', 'Tran Thi L', 'KH003', 'NS003'),
('LH004', '04-18-2023', '16:10:00', 'Tran Thi L', 'KH004', 'NS004'),
('LH005', '05-25-2023', '11:30:00', 'Le Van M', 'KH005', 'NS005'),
('LH006', '06-30-2023', '13:15:00', 'Le Van M', 'KH001', 'NS001'),
('LH007', '07-15-2023', '10:00:00', 'Hoang Van N', 'KH002', 'NS002'),
('LH008', '08-20-2023', '14:30:00', 'Hoang Van N', 'KH003', 'NS003'),
('LH009', '09-25-2023', '16:45:00', 'Pham Thi K', 'KH004', 'NS004'),
('LH010', '10-31-2023', '12:00:00', 'Pham Thi K', 'KH005', 'NS005');
select * from LichHen

INSERT INTO DichVu (MaDV, TenDV, Loai) VALUES
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

INSERT INTO CT_HoaDon (MaCTHD, MaDV_Thuoc, TenDV, TenThuoc, SL, LoaiDV, ThanhTien, MaHD, MaHS) VALUES
('CT001', 'DV001', 'Kham rang tong quat', 'Khong su dung thuoc', 1, 'Dich vu nhanh', 500000, 'HD001', 'HS001'),
('CT002', 'T000', 'Lay tuy', 'Khong su dung thuoc', 2, 'Dich vu nhanh', 1200000, 'HD002', 'HS002'),
('CT003', 'T000', 'Tram rang', 'Khong su dung thuoc', 3, 'Dich vu nhanh', 300000, 'HD003', 'HS003'),
('CT004', 'DV010', 'Thuoc uong', 'Paracetamol', 3, 'Thuoc', 30000, 'HD004', 'HS004'),
('CT005', 'T002', 'Thuoc uong', 'Ibuprofen', 4, 'Thuoc', 50000, 'HD005', 'HS005'),
('CT006', 'DV005', 'Trong rang su', 'Khong su dung thuoc', 6, 'Dich vu nhanh', 1500000, 'HD001', 'HS001'),
('CT007', 'T000', 'Nho rang thuong', 'Khong su dung thuoc', 2, 'Dich vu nhanh', 200000, 'HD002', 'HS002'),
('CT008', 'DV010', 'Thuoc uong', 'Amoxicillin', 2, 'Thuoc', 80000, 'HD003', 'HS003'),
('CT009',  'T000', 'Nho rang khon', 'Khong su dung thuoc', 1, 'Dich vu nhanh', 100000, 'HD004', 'HS004'),
('CT010', 'DV010', 'Thuoc uong', 'Aspirin', 3, 'Thuoc', 25000, 'HD005', 'HS005');
select * from CT_HoaDon

INSERT INTO HoaDon (MaHD, TenKH, PhiThanhToan) VALUES
('HD001', 'Nguyen Van E', 2000000),
('HD002', 'Tran Thi L', 1400000),
('HD003', 'Le Van M', 380000),
('HD004', 'Hoang Van N', 130000),
('HD005', 'Pham Thi K', 75000);
select * from HoaDon

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