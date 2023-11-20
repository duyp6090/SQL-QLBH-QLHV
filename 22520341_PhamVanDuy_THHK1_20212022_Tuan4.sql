--3.e tim ho ten cua cac nhan vien lam viec cho tat ca cac de an do phong dieu hanh chu tri
SELECT HOTEN
FROM NHANVIEN
WHERE NOT EXISTS(
SELECT DISTINCT(*)
FROM PHONGBAN P
WHERE TENPHG='Dieu Hanh'
AND NOT EXISTS(
SELECT *
FROM DEAN D
WHERE D.MAPHG=P.MAPHG
	  AND D.MANV=D.MANV
))
--3.f cho biet ten phong ban cung ho ten truong phong cua phong ban co dong nhan vien nhat
 
--Dau tien tim ra phong ban va ten cua trgphong ban
SELECT TENPHG, HOTEN, P.MAPHG
FROM NHANVIEN V, PHONGBAN P
WHERE  V.MANV = P.TRPHG

-- Chon ra so luong  NV phong ban cua nhan vien
SELECT  TENPHG, HOTEN
FROM NHANVIEN V, PHONGBAN P
WHERE  V.MANV = P.TRPHG 
AND EXISTS(
SELECT TOP 1 TENPHG, L.HOTEN, COUNT(*)
FROM(SELECT TENPHG, HOTEN, P.MAPHG
     FROM NHANVIEN V, PHONGBAN P
     WHERE V.MANV = P.TRPHG) L, NHANVIEN V
WHERE V.MAPHG = L.MAPHG
GROUP BY TENPHG, L.HOTEN
ORDER BY COUNT(*) DESC)


