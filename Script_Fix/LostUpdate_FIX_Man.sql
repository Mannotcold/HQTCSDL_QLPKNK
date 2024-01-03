-- Phiên b?n 1 c?a stored procedure
CREATE PROCEDURE Sp_UpdateDichVu_1_FIX
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
    -- Ki?m tra xem d?ch v? t?n t?i hay không và áp d?ng hint XLOCK
    IF NOT EXISTS (SELECT *
                   FROM DichVu WITH (XLOCK)
                   WHERE MaDV = @MaDV)
    BEGIN
      PRINT 'D?ch v? ' + @MaDV + N' Không T?n T?i'
      ROLLBACK TRAN
      RETURN 0
    END
	WAITFOR DELAY '00:00:05'

    -- C?p nh?t thông tin d?ch v? v?i hint XLOCK
    UPDATE DichVu WITH (XLOCK)
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
CREATE PROCEDURE Sp_UpdateDichVu_2_FIX
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
    -- Ki?m tra xem d?ch v? t?n t?i hay không và áp d?ng hint XLOCK
    IF NOT EXISTS (SELECT *
                   FROM DichVu WITH (XLOCK)
                   WHERE MaDV = @MaDV)
    BEGIN
      PRINT 'D?ch v? ' + @MaDV + N' Không T?n T?i'
      ROLLBACK TRAN
      RETURN 0
    END

    -- C?p nh?t thông tin d?ch v? v?i hint XLOCK
    UPDATE DichVu WITH (XLOCK)
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

-- Hi?n th? d? li?u tr??c khi th?c hi?n các l?nh c?p nh?t
SELECT * FROM DICHVU

-- Th?c hi?n c?p nh?t v?i hai phiên b?n c?a stored procedure
EXEC Sp_UpdateDichVu_1_FIX 'DV001', 'Kham rang tong quat', 'Dich vu nhanh', 250

EXEC Sp_UpdateDichVu_2_FIX 'DV001', 'Kham rang tong quat', 'Dich vu nhanh', 200

-- Hi?n th? d? li?u sau khi th?c hi?n các l?nh c?p nh?t
SELECT * FROM DICHVU
