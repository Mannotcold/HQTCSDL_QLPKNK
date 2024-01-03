USE [DOANHQT]
GO


CREATE PROC [dbo].[Sp_LayTongTinTK]
	@SDT VARCHAR(15),
	@MATKHAU VARCHAR(50),
	@LoaiTK VARCHAR(50)
AS
BEGIN TRAN
	BEGIN TRY
	SET TRAN ISOLATION LEVEL REPEATABLE READ

		DECLARE @Ma INT;
		
		-- X? l� l?y th�ng tin m� acc
		SELECT @Ma = NS.MaNS
		FROM TaiKhoan A
		INNER JOIN NhaSi NS ON A.SDT = NS.SDTNS
		WHERE A.SDT = @SDT AND A.MatKhau = @MATKHAU AND A.LoaiTK = @LoaiTK;

		-- ?? TEST
		WAITFOR DELAY '0:0:5'

		-- Ki?m tra mans c� t?n t?i hay kh�ng
		IF @Ma IS NULL
		BEGIN
			PRINT N'Nha s? Kh�ng T?n T?i'
			ROLLBACK TRAN
			RETURN 0
		END	

		-- X? l� l?y th�ng tin
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
		-- Ki?m tra nh�n vi�n c� t?n t?i hay kh�ng
		IF NOT EXISTS (SELECT * FROM TaiKhoan WHERE SDT = @SDT)
		BEGIN
			PRINT 'T�i kho?n kh�ng t?n t?i.'
			ROLLBACK TRAN
			RETURN 0
		END	

		-- X? l� Update m?t kh?u
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


