


CREATE PROC Sp_XemThongTinCaNhan
       @MaKH int,
	   @HoTenKH varchar(50),
	   @NgaySinhKH datetime,
	   @DiaChiKH varchar(50),
	   @SDTKH int,
	   @EmailKH varchar(50),
	   @MaNV int
AS
BEGIN TRAN 
     
	 BEGIN TRY

	 IF EXISTS (SELECT * FROM KHACHHANG WHERE SDTKH = @SDTKH)
BEGIN
       PRINT N'Không tồn tài khoản'
       ROLLBACK TRAN
       RETURN 0

END

	 

	UPDATE KHACHHANG SET EmailKH = @EmailKH Where SDTKH = @SDTKH;
	 WAITFOR DELAY '0:0:10';
	 END TRY 
	 BEGIN CATCH
	       
		   PRINT N'Lỗi hệ thống'
	       ROLLBACK TRAN
	 END CATCH
COMMIT TRAN

CREATE PROC Sp_XemThongTinKhachHang
       @MaKH int
AS
BEGIN TRAN 
         SET TRAN ISOLATION LEVEL READ UNCOMMITTED
	 BEGIN TRY

	 IF EXISTS (SELECT * FROM KHACHHANG WHERE MaKH = @MaKH)
BEGIN
         PRINT N'Không tồn khách hàng đó'
         ROLLBACK TRAN
         RETURN 0
END

	 

	 SELECT * FROM KHACHHANG Where MaKH = @MaKH;
	 
	 END TRY 
	 BEGIN CATCH
	       
		   PRINT N'Lỗi hệ thống'
	       ROLLBACK TRAN
	 END CATCH
COMMIT TRAN