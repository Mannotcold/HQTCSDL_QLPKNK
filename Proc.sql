
-- X? lí ??ng nh?p tài kho?n
DROP PROCEDURE IF EXISTS Sp_DangNhap;

CREATE PROC Sp_DangNhap
	@SDT INT,
	@MatKhau VARCHAR(50),
	@LoaiTK VARCHAR(50) OUTPUT
AS
BEGIN
	-- Lo?i b? kh?i t?o giá tr?
	-- SET @LoaiTK = 'NULL'

	IF NOT EXISTS (SELECT LoaiTK
				FROM TaiKhoan 
				WHERE SDT = @SDT 
				AND MATKHAU = @MatKhau)
	BEGIN
		PRINT N'Sai tên ??ng nh?p ho?c m?t kh?u'
		RETURN 0
	END
	
	-- l?y lo?i acc
	SET @LoaiTK = (SELECT LoaiTK
				FROM TaiKhoan
				WHERE  SDT = @SDT 
				AND MATKHAU = @MatKhau)

	-- x? lí ??ng nh?p
	if (@LoaiTK IS NOT NULL)
	BEGIN
		PRINT N'??ng nh?p thành công'
		RETURN 1
	END
	ELSE RETURN 0	
END
GO
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

		PRINT N'??ng nh?p thành công'
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

		PRINT N'??ng nh?p thành công'
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

		PRINT N'??ng nh?p thành công'
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

		PRINT N'??ng nh?p thành công'
		RETURN 1
	END
	-- Add more checks for other user types if needed

	-- If no match is found, print an error message and return 0
	ELSE
	BEGIN
		PRINT N'Sai tên ??ng nh?p ho?c m?t kh?u'
		RETURN 0
	END
END



DECLARE @SDT int = 987654321;
DECLARE @MatKhau VARCHAR(50) = '12345';
DECLARE @LoaiTK VARCHAR(50);
DECLARE @Ma VARCHAR(5);

EXEC SpDangNhap @SDT, @MatKhau, @LoaiTK OUTPUT, @Ma OUTPUT;

PRINT 'Lo?i tài kho?n: ' + CAST(@LoaiTK AS NVARCHAR(10));
PRINT 'Lo?i tài kho?n: ' + CAST(@Ma AS NVARCHAR(10));

select * from TaiKhoan