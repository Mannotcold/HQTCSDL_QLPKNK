DROP PROC LayThongTinKH
DROP PROC UpdatedThongTinKH

CREATE PROC UpdatedThongTinKH
       @MaKH int,
	   @SDTKH int
AS
BEGIN TRAN 
     
	 BEGIN TRY

	 IF NOT EXISTS (SELECT * FROM KHACHHANG WHERE MaKH = @MaKH)
	 BEGIN 
	       PRINT N'Không tồn khách hàng đó'
		   ROLLBACK TRAN
		   RETURN 0
	 END
	 

	 UPDATE KHACHHANG SET SDTKH = @SDTKH Where MaKH = @MaKH;
	 WAITFOR DELAY '0:0:5';
	 IF(@SDTKH > 999999 OR @SDTKH < 100000)
	 BEGIN 
	      PRINT N'Số điện thoại sai'
	      ROLLBACK TRAN
		  RETURN 0
	 END
	 END TRY 
	 BEGIN CATCH
	       
		   PRINT N'Lỗi hệ thống'
	       ROLLBACK TRAN
	 END CATCH
COMMIT TRAN
RETURN 0
CREATE PROC LayThongTinKH
       @MaKH int
AS
SET TRAN ISOLATION LEVEL READ COMMITTED
BEGIN TRAN 
     
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

select * from KHACHHANG 





EXEC UpdatedThongTinKH @MaKH = 1, @SDTKH = 13

