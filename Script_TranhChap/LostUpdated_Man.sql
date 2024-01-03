-- Phiên b?n 1 c?a stored procedure
CREATE PROCEDURE Sp_UpdateDichVu_1
(
  @MaDV CHAR(5),
  @TenDV VARCHAR(50),
  @Loai VARCHAR(50),
  @Tien FLOAT
)
AS
BEGIN
  BEGIN TRAN
  BEGIN TRY
    -- Ki?m tra xem d?ch v? t?n t?i hay không
    IF NOT EXISTS (SELECT *
                   FROM DichVu
                   WHERE MaDV = @MaDV)
    BEGIN
      PRINT 'D?ch v? ' + @MaDV + N' Không T?n T?i'
      ROLLBACK TRAN
      RETURN 0
    END
	WAITFOR DELAY '00:00:05'

    -- C?p nh?t thông tin d?ch v?
    UPDATE DichVu
    SET
      TenDV = @TenDV,
      Loai = @Loai,
      Tien = @Tien
    WHERE MaDV = @MaDV

    PRINT 'C?p nh?t thành công - Phiên b?n 1'
	
  END TRY
  BEGIN CATCH
    PRINT N'L?I H? TH?NG - Phiên b?n 1'
    ROLLBACK TRAN
    RETURN 0	
  END CATCH
  COMMIT TRAN
  RETURN 1
END

-- Phiên b?n 2 c?a stored procedure
CREATE PROCEDURE Sp_UpdateDichVu_2
(
  @MaDV CHAR(5),
  @TenDV VARCHAR(50),
  @Loai VARCHAR(50),
  @Tien FLOAT
)
AS
BEGIN
  BEGIN TRAN
  BEGIN TRY
    -- Ki?m tra xem d?ch v? t?n t?i hay không
    IF NOT EXISTS (SELECT *
                   FROM DichVu
                   WHERE MaDV = @MaDV)
    BEGIN
      PRINT 'D?ch v? ' + @MaDV + N' Không T?n T?i'
      ROLLBACK TRAN
      RETURN 0
    END

    -- C?p nh?t thông tin d?ch v?
    UPDATE DichVu
    SET
      TenDV = @TenDV,
      Loai = @Loai,
      Tien = @Tien
    WHERE MaDV = @MaDV

    PRINT 'C?p nh?t thành công - Phiên b?n 2'
  END TRY
  BEGIN CATCH
    PRINT N'L?I H? TH?NG - Phiên b?n 2'
    ROLLBACK TRAN
    RETURN 0	
  END CATCH
  COMMIT TRAN
  RETURN 1
END

select * from DICHVU

EXEC Sp_UpdateDichVu_1 'DV001', 'Kham rang tong quat', 'Dich vu nhanh', 150

EXEC Sp_UpdateDichVu_2 'DV001', 'Kham rang tong quat', 'Dich vu nhanh', 200
 