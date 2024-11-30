--1
SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restRoom_management rm ON b.bill_date = rm.room_date
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total > 450.00
  AND s.first_name = 'Charles';

--2
SELECT s.first_name, s.surname
FROM restRoom_management rm
JOIN restStaff ON rm.headwaiter = s.staff_no
WHERE rm.room_date = 160111
  AND rm.room_name IN (
    SELECT restRest_table.room_name
    FROM restRest_table
    JOIN restBill b ON restRest_table.table_no = b.table_no
    WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111
  );

--3
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = 
   SELECT MIN(bill_total)
   FROM restBill


--4
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill 
);

--5
SELECT b.cust_name, s.first_name, s.surname, rm.room_name
FROM restBill b
JOIN restRoom_management rm ON b.bill_date = rm.room_date
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total = (
    SELECT MAX(b.bill_total)
    FROM restBill b
);