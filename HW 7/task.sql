--1
CREATE VIEW samsBills AS
SELECT 
w.first_name, 
w.surname,
b.bill_date,
c.cust_name,
b.bill_total

FROM waiters w

JOIN  bills b ON w.waiter_id = b.waiter_id
JOIN  customers c ON b.customer_id = c.customer_id
WHERE w.first_name = 'Sam' AND w.surname = 'Pitt';


--2
SELECT 
first_name,
surname,
bill_date,
cust_name,
bill_total

FROM samsBills
WHERE  bill_total > 400;

--3
CREATE VIEW roomTotals 
SELECT room_name, SUM(bill_total) AS total_sum
FROM rooms
JOIN bills USING (room_id)
GROUP BY room_name;

--4
CREATE VIEW teamTotals 
SELECT 
CONCAT(first_name, ' ', surname) AS headwaiter_name,
SUM(b.bill_total) AS total_sum
FROM  waiters w
JOIN  bills b ON w.waiter_id = b.waiter_id
GROUP BY   headwaiter_name;
