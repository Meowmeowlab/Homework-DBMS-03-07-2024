-- Câu 3: Cho các quan hệ:
-- • DonVi(MDV, TenDV, MaNQL, DiaDiem)
-- • DuAn (MaDA, TenDA, KinhPhi, MaDV)
-- và câu đại số quan hệ đã được tối ưu như sau:
-- Sử dụng thuật toán tối ưu, viết truy tối ưu.
-- 3.1. Viết truy vấn: Hiển thị TenDV=’XD2’, có kinh phí “Kinhphi > 9000” và biến đổi
-- thành câu truy vấn sử dụng đại số quan hệ.
-- 3.2. Sử dụng thuật toán tối ưu, viết truy tối ưu..
CREATE DATABASE `bai3`;

CREATE TABLE
    `bai3`.`donvi` (
        `madv` INT (4) NOT NULL AUTO_INCREMENT,
        `manql` INT (4) NOT NULL,
        `tendv` VARCHAR(10) NOT NULL,
        `diachi` VARCHAR(50) NOT NULL,
        PRIMARY KEY (`madv`)
    ) ENGINE = InnoDB;

CREATE TABLE
    `bai3`.`duan` (
        `mada` INT (4) NOT NULL AUTO_INCREMENT,
        `madv` INT (4) NOT NULL,
        `tenda` VARCHAR(10) NOT NULL,
        `kinhphi` INT (8) NOT NULL,
        PRIMARY KEY (`mada`)
    ) ENGINE = InnoDB;

-- Data
INSERT INTO
    bai3.donvi (madv, manql, tendv, diachi)
VALUES
    (1, 1001, 'XD2', 'Address1');

INSERT INTO
    bai3.donvi (madv, manql, tendv, diachi)
VALUES
    (2, 1002, 'XD3', 'Address2');

INSERT INTO
    bai3.duan (mada, madv, tenda, kinhphi)
VALUES
    (1, 1, 'Project1', 10000);

INSERT INTO
    bai3.duan (mada, madv, tenda, kinhphi)
VALUES
    (2, 2, 'Project2', 8000);

INSERT INTO
    bai3.duan (mada, madv, tenda, kinhphi)
VALUES
    (3, 1, 'Project3', 8500);

-- 3.1. Viết truy vấn: Hiển thị TenDV=’XD2’, có kinh phí “Kinhphi > 9000” và biến đổi
-- thành câu truy vấn sử dụng đại số quan hệ.
-- 3.2. Sử dụng thuật toán tối ưu, viết truy tối ưu..
SELECT
    dv.tendv,
    da.kinhphi
FROM
    donvi dv
    JOIN duan da ON dv.madv = da.madv
WHERE
    dv.tendv = 'XD2'
    AND da.kinhphi > 9000;

--Made by team meowmeow