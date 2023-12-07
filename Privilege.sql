

--Bac si


EXEC sp_addlogin '987654321', '12345', 'DOANHQT';  
GO

GO
CREATE ROLE NHASIROLE;

CREATE USER [987654321] FOR LOGIN [987654321]
EXEC sp_addrolemember 'NHASIROLE', [987654321];
GRANT SELECT, INSERT, UPDATE ON HoSoBN TO NHASIROLE
GRANT SELECT, INSERT, UPDATE ON NHASI TO NHASIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON CT_HOADON TO NHASIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON LichCaNhanNS TO NHASIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON HoSoBN TO NHASIROLE
GRANT SELECT ON DichVu TO NHASIROLE
GRANT SELECT ON Thuoc TO NHASIROLE
GRANT SELECT ON KhachHang TO NHASIROLE
GRANT INSERT ON HOADON TO NHASIROLE


--KhachHang
EXEC sp_addlogin '123456789', '12345', 'DOANHQT';  
GO
GO
CREATE ROLE KHACHHANGROLE;
EXEC sp_addrolemember 'KHACHHANGROLE', [123456789];
GRANT SELECT, INSERT, UPDATE ON KHACHHANG TO KHACHHANGROLE
GRANT SELECT ON HoSoBN TO KHACHHANGROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON LichHen TO KHACHHANGROLE
GRANT SELECT ON DichVu TO KHACHHANG
GRANT SELECT ON HoaDon TO KHACHHANG


--QuanTri

EXEC sp_addlogin '321321321', '12345', 'DOANHQT';  
GO

GO
CREATE ROLE QUANTRIROLE;
CREATE USER [321321321] FOR LOGIN [321321321]
EXEC sp_addrolemember 'QUANTRIROLE', [321321321];
GRANT SELECT, INSERT, UPDATE ON QuanTri TO QUANTRIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON TaiKhoan TO QUANTRIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON NhaSi TO QUANTRIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO QUANTRIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON Thuoc TO QUANTRIROLE
GRANT SELECT, INSERT, UPDATE, DELETE ON DichVu TO QUANTRIROLE

--NhanVien
EXEC sp_addlogin '1234567', '12345', 'DOANHQT';  

CREATE ROLE NHANVIENROLE;

EXEC sp_addrolemember 'NHANVIENROLE', [1234567];

GRANT SELECT, INSERT, UPDATE ON KHACHHANG TO NHANVIENROLE
GRANT SELECT, INSERT, UPDATE ON LICHHEN TO NHANVIENROLE
GRANT SELECT ON CT_HOADON TO NHANVIENROLE
GRANT SELECT ON HOSOBN TO NHANVIENROLE