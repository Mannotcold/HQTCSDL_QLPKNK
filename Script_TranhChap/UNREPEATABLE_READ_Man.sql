USE [DOANHQT]
GO

/****** Object:  StoredProcedure [dbo].[Sp_LayTongTinTK1]    Script Date: 12/31/2023 5:43:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Sp_LayTongTinTK1]
	@SDT VARCHAR(15),
	@MATKHAU VARCHAR(50)
AS
BEGIN TRAN
	BEGIN TRY
		DECLARE @LoaiTK VARCHAR(50),
				@Ma INT;
		
		-- X? lí l?y thông tin mã acc
		SELECT @LoaiTK = A.LoaiTK, @Ma = NS.MaNS
		FROM TaiKhoan A
		INNER JOIN NhaSi NS ON A.SDT = NS.SDTNS
		WHERE A.SDT = @SDT AND A.MatKhau = @MATKHAU;

		-- ?? TEST
		WAITFOR DELAY '0:0:5'

		-- Ki?m tra tài kho?n có t?n t?i hay không
		IF @LoaiTK IS NULL
		BEGIN
			PRINT N'Tài Kho?n Không T?n T?i'
			ROLLBACK TRAN
			RETURN 0
		END	

		-- X? lí l?y thông tin
		SELECT A.SDT, A.MatKhau, NS.HoTenNS, NS.DiaChiNS, NS.SDTNS, NS.EmailNS, @LoaiTK AS LoaiTK, @Ma AS MaNS
		FROM TaiKhoan A
		INNER JOIN NhaSi NS ON A.SDT = NS.SDTNS
		WHERE A.SDT = @SDT AND A.MatKhau = @MATKHAU;
	END TRY
	BEGIN CATCH
		PRINT N'L?I H? TH?NG'
		ROLLBACK TRAN
	END CATCH
COMMIT TRAN
GO

CREATE PROC [dbo].[Sp_LayTongTinTK]
	@SDT VARCHAR(15),
	@MATKHAU VARCHAR(50),
	@LoaiTK VARCHAR(50)
AS
BEGIN TRAN
	BEGIN TRY
		DECLARE @Ma INT;
		
		-- X? lí l?y thông tin mã acc
		SELECT @Ma = NS.MaNS
		FROM TaiKhoan A
		INNER JOIN NhaSi NS ON A.SDT = NS.SDTNS
		WHERE A.SDT = @SDT AND A.MatKhau = @MATKHAU AND A.LoaiTK = @LoaiTK;

		-- ?? TEST
		WAITFOR DELAY '0:0:5'

		-- Ki?m tra mans có t?n t?i hay không
		IF @Ma IS NULL
		BEGIN
			PRINT N'Nha s? Không T?n T?i'
			ROLLBACK TRAN
			RETURN 0
		END	

		-- X? lí l?y thông tin
		SELECT *
		FROM NhaSi NS
		WHERE NS.MaNS = @Ma;
	END TRY
	BEGIN CATCH
		PRINT N'L?I H? TH?NG'
		ROLLBACK TRAN
	END CATCH
COMMIT TRAN
GO



CREATE PROC [dbo].[Sp_DoiMK]
	@SDT INT,
	@MATKHAU VARCHAR(50)
AS
BEGIN TRAN
	BEGIN TRY
		-- Ki?m tra nhân viên có t?n t?i hay không
		IF NOT EXISTS (SELECT * FROM TaiKhoan WHERE SDT = @SDT)
		BEGIN
			PRINT 'Tài kho?n không t?n t?i.'
			ROLLBACK TRAN
			RETURN 0
		END	

		-- X? lí Update m?t kh?u
		UPDATE TaiKhoan
		SET MatKhau = @MATKHAU 
		WHERE SDT = @SDT	
	END TRY
	BEGIN CATCH
		PRINT N'L?I H? TH?NG'
		ROLLBACK TRAN
		RETURN 0
	END CATCH
COMMIT TRAN
RETURN 1
GO


