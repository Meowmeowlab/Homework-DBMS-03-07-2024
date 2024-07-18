-- Câu 2: Cho 3 bảng sau:
-- • KHACH_HANG (Ma_KH, HoTen, NgaySinh, GioiTinh, DiaChi)
-- • HOA_DON(Maso_HD, Ma_HH,Ma_KH,Ngay_lap_HD)
-- • HANG_HOA(Ma_HH, TEN_HH,MA_NSX)
-- 1.1. Viết truy vấn đưa ra họ tên khách hàng, tên hàng hóa, ngày mua của các khách
-- hàng mua vào ngày ‘20/11/2012’. và biến đổi thành câu truy vấn sử dụng đại số quan
-- hệ.
-- 1.2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
-- 2.1. Viết truy vấn: Hiển thị MaKH, Ngày Mua của khách hàng “Trần Huyền” và
-- biến đổi thành câu truy vấn sử dụng đại số quan hệ.
-- 2.2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
CREATE DATABASE `bai2`;

CREATE TABLE
    `bai2`.`khachhang` (
        `makh` INT (4) NOT NULL AUTO_INCREMENT,
        `hoten` VARCHAR(50) NOT NULL,
        `ngaysinh` DATE NOT NULL,
        `gioitinh` VARCHAR(1) NOT NULL,
        `diachi` VARCHAR(50) NOT NULL,
        PRIMARY KEY (`makh`)
    ) ENGINE = InnoDB;

CREATE TABLE
    `bai2`.`hoadon` (
        `mahd` INT (4) NOT NULL AUTO_INCREMENT,
        `mahh` INT (4) NOT NULL,
        `makh` INT (4) NOT NULL,
        `ngaylaphd` DATE NOT NULL,
        PRIMARY KEY (`mahd`)
    ) ENGINE = InnoDB;

CREATE TABLE
    `bai2`.`hanghoa` (
        `mahh` INT (4) NOT NULL AUTO_INCREMENT,
        `mansx` INT (4) NOT NULL,
        `tenhh` VARCHAR(10) NOT NULL,
        PRIMARY KEY (`mahh`)
    ) ENGINE = InnoDB;

-- 1.1. Viết truy vấn đưa ra họ tên khách hàng, tên hàng hóa, ngày mua của các khách
-- hàng mua vào ngày ‘20/11/2012’. và biến đổi thành câu truy vấn sử dụng đại số quan
-- hệ.
-- 1.2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
SELECT
    k.hoten,
    hh.tenhh,
    hd.ngaylaphd
FROM
    khachhang k
    JOIN hoadon hd ON k.makh = hd.makh
    JOIN hanghoa hh ON hd.mahh = hh.mahh
WHERE
    hd.ngaylaphd = '2012-11-20';

-- 2.1. Viết truy vấn: Hiển thị MaKH, Ngày Mua của khách hàng “Trần Huyền” và
-- biến đổi thành câu truy vấn sử dụng đại số quan hệ.
-- 2.2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
SELECT
    k.makh,
    hd.ngaylaphd
FROM
    khachhang k
    JOIN hoadon hd ON k.makh = hd.makh
WHERE
    k.hoten = 'Trần Huyền';

--Made by team meowmeow