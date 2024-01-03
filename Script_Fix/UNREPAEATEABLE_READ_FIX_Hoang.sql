
-- Cập nhật thông tin hồ sơ 
DROP PROC UpdateThongTinHoSo
DROP PROC LayThongTinHoSo
CREATE PROC UpdateThongTinHoSo
     @MaHS INT,
	 @NgayKham datetime,
	 @MaKH int
AS
BEGIN TRAN 
     
	 BEGIN TRY

	 IF NOT EXISTS (SELECT * FROM HoSoBN WHERE MaHS = @MaHS)
	 BEGIN 
	       PRINT N'Không tồn tại hồ sơ đó'
		   ROLLBACK TRAN
		   RETURN 0
	 END
	 

	 UPDATE HoSoBN SET NgayKham = @NgayKham, MaKH = @MaKH Where MaHS = @MaHS;
	 WAITFOR DELAY '0:0:10';
	 END TRY 
	 BEGIN CATCH
	       
		   PRINT N'Lỗi hệ thống'
	       ROLLBACK TRAN
	 END CATCH
COMMIT TRAN

--Lấy thông tin hồ sơ 
CREATE PROC LayThongTinHoSo
     @MaHS INT
AS
SET TRAN ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN 
     
	 BEGIN TRY

	 IF NOT EXISTS (SELECT * FROM HoSoBN WHERE MaHS = @MaHS)
	 BEGIN 
	       PRINT N'Không tồn tại hồ sơ đó'
		   ROLLBACK TRAN
		   RETURN 0
	 END
	 

	 SELECT * FROM HoSoBN Where MaHS = @MaHS;
	 
	 END TRY 
	 BEGIN CATCH
	       
		   PRINT N'Lỗi hệ thống'
	       ROLLBACK TRAN
	 END CATCH
COMMIT TRAN

