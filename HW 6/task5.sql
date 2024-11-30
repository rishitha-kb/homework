--1
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS number_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 2;

--2
SELECT t.room_name, COUNT(*) AS number_tables
FROM restRest_table t
WHERE t.no_of_seats > 6
GROUP BY t.room_name;

--3
SELECT rm.room_name, SUM(b.bill_total) AS total_bills
FROM restRoom_management rm
JOIN restBill b ON rm.room_date = b.bill_date
GROUP BY rm.room_name;

--4
SELECT s.first_name, s.surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff s
JOIN restRoom_management rm ON s.staff_no = rm.headwaiter
JOIN restBill b ON rm.room_date = b.bill_date
WHERE b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname
ORDER BY total_bill_amount DESC;

--5
SELECT b.cust_name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

--6
SELECT s.first_name, s.surname, COUNT(*) AS number_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT (*) >= 3;
