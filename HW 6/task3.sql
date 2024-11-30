--1
SELECT DISTINCT s.first_name, s.surname
FROM restStaff
JOIN restBill b ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Tanya Singh';

--2
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE rm.room_name = 'Green'
  AND s.first_name = 'Charles'
  AND rm.room_date BETWEEN 160201 AND 160229;

--3
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT s.headwaiter
    FROM restStaff s
    WHERE s.first_name = 'Zoe' AND s.surname = 'Ball'
);

--4
SELECT b.cust_name, b.bill_total, s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

--5
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b.waiter_no
    FROM restBill b
    WHERE b.table_no IN (
        SELECT DISTINCT b.table_no
        FROM restBill b
        WHERE b.bill_no IN (00014, 00017)
    )
);

--6
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);