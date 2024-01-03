--Phantom Read Loi
CREATE PROCEDURE Sp_ThemLichHen_1 @NgayHen datetime, @ThoiGianHen time, @HoTenKH NVARCHAR(50), @MaKH int, @MaNS int
AS

BEGIN TRAN
	BEGIN TRY
	--Kiểm tra cuộc hẹn có trùng hay không
	IF(EXISTS(SELECT * FROM LichHen  WHERE NgayHen = ‘01-10-2023’ AND ThoiGianHen = '08:30:00') 
RETURN -1


	-- Kiểm tra mã nha sĩ có trùng hay không
	IF(EXISTS(SELECT * FROM LichHen  WHERE MaNS = ‘1’ ) 
    RETURN -1
	
	INSERT INTO LichHen(NgayHen, ThoiGianHen, TenKH, MaKH, MaNS) VALUES (‘01-10-2023’, ‘08:30:00’, N’Nguyen Van E’, ’ 3’, ‘2’) 
return 1
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
	return 1
GO

--PROCEDURE khách hàng xem danh sách đối tác
CREATE PROCEDURE sp_KH_XemDSDoiTac
AS

BEGIN TRAN
	BEGIN TRY
		SELECT Ngay,ThoiGian,MaNS FROM LichCaNhanNS 
		WAITFOR DELAY '0:0:10'
	END TRY
	BEGIN CATCH
			PRINT N'LỖI HỆ THỐNG'
			ROLLBACK TRAN
			RETURN 0
	END CATCH
COMMIT TRAN
return 1
GO
