CREATE TABLE
    `bai4`.`Nhan_Vien` (
        `Ma_NV` VARCHAR(100) NOT NULL,
        `Ma_DV` VARCHAR(100) NOT NULL,
        `Ho_Ten` VARCHAR(100) NOT NULL,
        `Dien_Thoai` VARCHAR(100) NOT NULL,
        `Ma_chuc_vu` VARCHAR(100) NOT NULL,
        PRIMARY KEY (`Ma_NV`)
    ) ENGINE = InnoDB;

INSERT INTO
    bai4.Nhan_Vien (Ma_NV, Ma_DV, Ho_Ten, Dien_Thoai, Ma_chuc_vu)
VALUES
    ("BPBH001", "KDBH01", "DUY", "0908790865", "NAH"),
    ("BPBH009", "KDBH02", "DANH", "0913466778", "NT"),
    (
        "BPBH002",
        "KDBH02",
        "TRANG",
        "01225344348",
        "LTT"
    );

CREATE TABLE
    `bai4`.`Don_Vi` (
        `Ma_DV` VARCHAR(100) NOT NULL,
        `Ten_DV` VARCHAR(100) NOT NULL,
        PRIMARY KEY (`Ma_DV`)
    ) ENGINE = InnoDB;

INSERT INTO
    bai4.Don_Vi (Ma_DV, Ten_DV)
VALUES
    ("KDBH01", "BÁN HÀNG 01"),
    ("KDBH02", "BÁN HÀNG 02"),
    ("KDBH03", "BÁN HÀNG 03");

CREATE TABLE
    `bai4`.`KHACH_HANG` (
        `Ma_KH` VARCHAR(100) NOT NULL,
        `Ho_Ten` VARCHAR(100) NOT NULL,
        `Ngay_Sinh` DATE NULL,
        `Gioi_Tinh` VARCHAR(10) NULL,
        `Dia_Chi` VARCHAR(100) NOT NULL,
        PRIMARY KEY (`Ma_KH`)
    ) ENGINE = InnoDB;

INSERT INTO
    bai4.KHACH_HANG (Ma_KH, Ho_Ten, Ngay_Sinh, Gioi_Tinh, Dia_Chi)
VALUES
    (
        "K123301",
        "Cty Tnhh Tâm Điểm",
        NULL,
        NULL,
        "10B Nguyễn Thị Minh Khai, Quận 1 HCM"
    ),
    (
        "PL14229",
        "Đặng Thị Phương Lan",
        "1979-02-12",
        "Nữ",
        "142/29 Nguyễn Thị Thập, Quận 7 HCM"
    ),
    (
        "K123401",
        "Đặng Thanh Tâm",
        "1969-05-13",
        "Nam",
        "23 Lý Thái Tổ, Phường 2 Vĩnh Long"
    );

CREATE TABLE
    `bai4`.`HOA_DON` (
        `Maso_HD` VARCHAR(100) NOT NULL,
        `Ma_HH` VARCHAR(100) NOT NULL,
        `Ma_NV` VARCHAR(100) NOT NULL,
        `Ma_KH` VARCHAR(100) NOT NULL,
        `Ngay_lap_HD` DATE NOT NULL,
        PRIMARY KEY (`Maso_HD`)
    ) ENGINE = InnoDB;

INSERT INTO
    bai4.HOA_DON (Maso_HD, Ma_HH, Ma_NV, Ma_KH, Ngay_lap_HD)
VALUES
    (
        "2A09",
        "SVE15127CVB",
        "BPBH001",
        "PL14229",
        "2012-07-12"
    ),
    (
        "1F16",
        "AE960WN185W",
        "BPBH009",
        "K123301",
        "2012-12-17"
    ),
    (
        "1E37",
        "AE960WN185W",
        "BPBH002",
        "K123301",
        "2012-12-22"
    ),
    (
        "1E38",
        "SVE15129CVB",
        "BPBH009",
        "K123401",
        "2012-12-25"
    );

CREATE TABLE
    `bai4`.`HANG_HOA` (
        `Ma_HH` VARCHAR(100) NOT NULL,
        `Ten_HH` VARCHAR(100) NOT NULL,
        `MA_NSX` VARCHAR(100) NOT NULL,
        `Gia` VARCHAR(100) NOT NULL,
        `Bao_Hanh` VARCHAR(100) NOT NULL,
        PRIMARY KEY (`Ma_HH`)
    ) ENGINE = InnoDB;

INSERT INTO
    bai4.HANG_HOA (Ma_HH, Ten_HH, MA_NSX, Gia, Bao_Hanh)
VALUES
    (
        "AE960WN185W",
        "LCD AOD 18”5 E960WN",
        "CNAOD",
        "1.880.000",
        "36"
    ),
    (
        "SVE15127CVB",
        "SONY SVE15127CVB",
        "NBSONY",
        "18.990.000",
        "12"
    ),
    (
        "SVE15129CVB",
        "SONY SVE15129CVB",
        "NBSONY",
        "21.990.000",
        "12"
    )
    -- Áp dụng thuật toán tối ưu hóa cây đại số quan hệ viết các truy vấn:
    -- 1.1. Viết truy vấn đưa ra tên nhân viên, tên hàng hóa, ngày bán của các hàng hóa được
    -- bán bởi đơn vị có tên “BÁN HÀNG 01”. và biến đổi thành câu truy vấn sử dụng đại
    -- số quan hệ.
    -- 1.2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
SELECT
    nv.Ho_Ten,
    hh.TEN_HH,
    hd.Ngay_lap_HD
FROM
    Nhan_Vien nv
    JOIN HOA_DON hd ON nv.Ma_NV = hd.Ma_NV
    JOIN HANG_HOA hh ON hd.Ma_HH = hh.Ma_HH
    JOIN Don_Vi dv ON dv.Ma_DV = nv.Ma_DV
WHERE
    dv.Ten_DV = 'BÁN HÀNG 01';

-- 2.1 Viết truy vấn: Hiển thị MaKH, tên khách hàng, Ngày Mua của khách hàng
-- “Đặng Thanh Tâm” mua ngày “25/12/2012”. và biến đổi thành câu truy vấn sử dụng
-- đại số quan hệ.
-- 2.2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
SELECT
    kh.Ho_Ten,
    hd.Ngay_lap_HD
FROM
    KHACH_HANG kh
    JOIN HOA_DON hd ON kh.Ma_KH = hd.Ma_KH
WHERE
    kh.Ho_Ten = 'Đặng Thanh Tâm'
    AND hd.Ngay_lap_HD = '2012-12-25';

-- 3.1. Viết truy vấn tìm: Ten_DV, Ma_HH, Ngay_lap_HD,Gia. và biến đổi thành câu
-- truy vấn sử dụng đại số quan hệ.
-- 3.2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
SELECT
    dv.Ten_DV,
    hh.Ma_HH,
    hd.Ngay_lap_HD,
    hh.Gia
FROM
    Don_Vi dv
    JOIN Nhan_Vien nv ON dv.Ma_DV = nv.Ma_DV
    JOIN HOA_DON hd ON nv.Ma_NV = hd.Ma_NV
    JOIN HANG_HOA hh ON hd.Ma_HH = hh.Ma_HH;

--Made by team meowmeow