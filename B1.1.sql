-- Câu 1: Cho hai bảng nhân viên và đơn vị sau:
-- • NhanVien (MaNV, MasoDV, HoTen, NgaySinh, GioiTinh, Luong)
-- • DonVi(MaDV, TenDV)
-- 1. Viết các chi vấn đưa ra họ tên nhân viên nữ ở đơn vị có tên là “phòng đào tạo” và biến đổi
-- thành câu truy vấn sử dụng đại số quan hệ.
-- 2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
CREATE DATABASE `bai1`;

CREATE TABLE
    `bai1`.`nhanvien` (
        `manv` INT (4) NOT NULL AUTO_INCREMENT,
        `masodv` INT (4) NOT NULL,
        `hoten` VARCHAR(10) NOT NULL,
        `ngaysinh` DATE NOT NULL,
        `gioitinh` VARCHAR(1) NOT NULL,
        `luong` VARCHAR(10) NOT NULL,
        PRIMARY KEY (`manv`)
    ) ENGINE = InnoDB;

CREATE TABLE
    `bai1`.`donvi` (
        `masodv` INT (4) NOT NULL,
        `tendv` VARCHAR(10) NOT NULL
    ) ENGINE = InnoDB;

-- 1. Viết các chi vấn đưa ra họ tên nhân viên nữ ở đơn vị có tên là “phòng đào tạo” và biến đổi
-- thành câu truy vấn sử dụng đại số quan hệ.
-- 2. Sử dụng thuật toán tối ưu, viết truy tối ưu.
SELECT
    n.hoten,
    n.masodv,
    d.tendv
FROM
    nhanvien n
    JOIN donvi d ON n.masodv = d.masodv
WHERE
    n.gioitinh = 'F'
    AND d.tendv = 'Phòng Đào Tạo';

--Made by team meowmeow