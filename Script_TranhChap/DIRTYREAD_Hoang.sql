
DROP PROC LayThongTinKH
DROP PROC UpdatedThongTinKH

CREATE PROC UpdatedThongTinKH
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

	 IF NOT EXISTS (SELECT * FROM KHACHHANG WHERE MaKH = @MaKH)
	 BEGIN 
	       PRINT N'Không tồn khách hàng đó'
		   ROLLBACK TRAN
		   RETURN 0
	 END
	 

	 UPDATE KHACHHANG SET HoTenKH = @HoTenKH, NgaySinhKH = @NgaySinhKH, DiaChiKH = @DiaChiKH, SDTKH = @SDTKH, EmailKH = @EmailKH, MaNV = @MaNV Where MaKH = @MaKH;
	 WAITFOR DELAY '0:0:10';
	 END TRY 
	 BEGIN CATCH
	       
		   PRINT N'Lỗi hệ thống'
	       ROLLBACK TRAN
	 END CATCH
COMMIT TRAN

CREATE PROC LayThongTinKH
       @MaKH int
AS
BEGIN TRAN 
         SET TRAN ISOLATION LEVEL READ UNCOMMITTED
	 BEGIN TRY

	 IF NOT EXISTS (SELECT * FROM KHACHHANG WHERE MaKH = @MaKH)
	 BEGIN 
	       PRINT N'Không tồn tại khách hàng đó'
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


