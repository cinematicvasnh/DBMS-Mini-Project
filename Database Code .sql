create database HotelManagement;
use HotelMangement;

-- 1. hostel_user table  
CREATE TABLE hostel_user ( 
    user_id INT PRIMARY KEY, 
    username VARCHAR(50), 
    password VARCHAR(50), 
    role VARCHAR(20) 
); 
 -- 2. student table  
CREATE TABLE student ( 
    student_id INT PRIMARY KEY, 
    name VARCHAR(100), 
    gender VARCHAR(10), 
    dob DATE, 
    course VARCHAR(50), 
    phone VARCHAR(15), 
    email VARCHAR(100), 
    address TEXT 
); 
 -- 3. hostels table  
CREATE TABLE hostels ( 
    hostel_id INT PRIMARY KEY, 
    name VARCHAR(50), 
    location VARCHAR(100), 
    total_rooms INT, 
    type VARCHAR(20)  -- 'Boys', 'Girls', or 'Co-ed' 
); 
 -- 4. rooms table  
CREATE TABLE rooms ( 
    room_id INT PRIMARY KEY, 
 

 
    hostel_id INT, 
    room_number VARCHAR(10), 
    capacity INT, 
    occupied INT, 
    type VARCHAR(20),  -- 'AC', 'Non-AC', 'Single', 'Shared' 
    FOREIGN KEY (hostel_id) REFERENCES hostels(hostel_id) 
); 
 -- 5. warden table  
CREATE TABLE warden ( 
    warden_id INT PRIMARY KEY, 
    name VARCHAR(50), 
    phone VARCHAR(15), 
    email VARCHAR(100), 
    hostel_id INT, 
    FOREIGN KEY (hostel_id) REFERENCES hostels(hostel_id) 
); 
 -- 6. allotments table  
CREATE TABLE allotments ( 
    allotment_id INT PRIMARY KEY, 
    student_id INT, 
    room_id INT, 
    allot_date DATE, 
    leave_date DATE, 
    FOREIGN KEY (student_id) REFERENCES student(student_id), 
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) 
); 
 -- 7. payment table  
CREATE TABLE payment ( 
    payment_id INT PRIMARY KEY, 
    student_id INT, 
    amount DECIMAL(10, 2), 
    date DATE, 
    method VARCHAR(20),  -- 'UPI', 'Card', 'Cash', etc. 
    status VARCHAR(20),  -- 'Paid', 'Pending' 
    FOREIGN KEY (student_id) REFERENCES student(student_id) 
); 
 

 
 -- 8. complaints table  
CREATE TABLE complaints ( 
    complaint_id INT PRIMARY KEY, 
    student_id INT, 
    room_id INT, 
    issue TEXT, 
    date_filed DATE, 
    status VARCHAR(20),  -- 'Open', 'In Progress', 'Closed' 
    FOREIGN KEY (student_id) REFERENCES student(student_id), 
    FOREIGN KEY (room_id) REFERENCES rooms(room_id) 
); 
 -- 9. visitors table  
CREATE TABLE visitors ( 
    visitor_id INT PRIMARY KEY, 
    student_id INT, 
    name VARCHAR(50), 
    relation VARCHAR(50), 
    visit_date DATE, 
    in_time TIME, 
    out_time TIME, 
    FOREIGN KEY (student_id) REFERENCES student(student_id) 
); 
 -- 10. inventory table  
CREATE TABLE inventory ( 
    item_id INT PRIMARY KEY, 
    hostel_id INT, 
    item_name VARCHAR(50), 
    quantity INT, 
    condition_ VARCHAR(20),  -- 'New', 'Good', 'Damaged' 
    FOREIGN KEY (hostel_id) REFERENCES hostels(hostel_id) 
);


-- Entries
-- Sample data for student  
INSERT INTO student VALUES   
(1, 'Aditi Rana', 'Female', '1998-05-12', 'BCA', '9876543210', '23bca10808@cuchd.in', 
'1234, Main Street, Chandigarh'),  
(2, 'Ravi Kumar', 'Male', '1999-08-22', 'BBA', '9876501234', '23bca10809@cuchd.in', 
'4567, Sector 12, Mohali'),  
(3, 'Nikita Singh', 'Female', '1997-11-30', 'MBA', '9845623412', '23bca10810@cuchd.in', 
'7890, Chandigarh Road, Panchkula'); -- Sample data for hostels  
INSERT INTO hostels VALUES   
(1, 'Sukhna Tagore', 'Block A', 50, 'Girls'),  
(2, 'Ganga Bhawan', 'Block B', 80, 'Boys'),  
(3, 'Saraswati Bhawan', 'Block C', 60, 'Co-ed'); -- Sample data for rooms  
INSERT INTO rooms VALUES   
(101, 1, 'A101', 2, 1, 'AC'),  
(102, 1, 'A102', 2, 1, 'Non-AC'),  
(201, 2, 'B101', 3, 2, 'AC'), 
(202, 2, 'B102', 3, 1, 'Shared'), 
(301, 3, 'C101', 2, 1, 'AC'); -- Sample data for warden  
INSERT INTO warden VALUES   
(1, 'Mr. Sharma', '9876543210', 'warden1@cuchd.in', 1),  
(2, 'Mrs. Mehta', '9876501234', 'warden2@cuchd.in', 2); 

-- Sample data for allotments  
INSERT INTO allotments VALUES   
(1, 1, 101, '2024-07-01', NULL),  
(2, 2, 201, '2024-07-01', NULL),  
(3, 3, 301, '2024-07-02', NULL); -- Sample data for payment  
INSERT INTO payment VALUES   
(1, 1, 12000, '2024-07-01', 'UPI', 'Paid'),  
(2, 2, 10000, '2024-07-01', 'Cash', 'Paid'),  
(3, 3, 15000, '2024-07-02', 'Card', 'Pending'); -- Sample data for complaints  
INSERT INTO complaints VALUES   
(1, 1, 101, 'Leaking tap', '2024-07-05', 'Open'),  
(2, 2, 201, 'Fan not working', '2024-07-06', 'Closed'),  
(3, 3, 301, 'Lights not working', '2024-07-07', 'Open'); -- Sample data for visitors  
INSERT INTO visitors VALUES   
(1, 1, 'Priya Rana', 'Sister', '2024-07-05', '10:00:00', '12:00:00'),  
(2, 2, 'Mohan Kumar', 'Father', '2024-07-06', '09:00:00', '11:00:00'); -- Sample data for inventory  

INSERT INTO inventory VALUES   
(1, 1, 'Bed', 50, 'Good'),  
(2, 2, 'Table', 30, 'Damaged'),  
(3, 3, 'Chair', 40, 'Good');



-- Quiries

-- 1. Update Operation
UPDATE payment 
SET status = 'Paid' 
WHERE student_id = 3; 

-- 2. Delete Operation
DELETE FROM complaints 
WHERE complaint_id = 5; 

-- 3. ALTER Operation 
ALTER TABLE rooms 
ADD room_type VARCHAR(20); 

-- 4. JOIN with ASC (Ascending Order) 
SELECT s.name, r.room_number 
FROM student s 
JOIN allotments a ON s.student_id = a.student_id 
JOIN rooms r ON a.room_id = r.room_id 
ORDER BY r.room_number ASC; 

-- 5. JOIN with DESC (Descending Order) 
SELECT s.name, r.room_number 
FROM student s 
JOIN allotments a ON s.student_id = a.student_id 
JOIN rooms r ON a.room_id = r.room_id 
ORDER BY r.room_number DESC; 

-- 6. GROUP BY Operation 
SELECT h.name AS hostel_name, COUNT(s.student_id) AS total_students 
FROM hostels h 
JOIN rooms r ON h.hostel_id = r.hostel_id 
JOIN allotments a ON r.room_id = a.room_id 
JOIN student s ON a.student_id = s.student_id 
GROUP BY h.name; 

-- 7. SELECT BETWEEN Operation 
SELECT name, dob 
FROM student 
WHERE dob BETWEEN '1998-01-01' AND '2000-01-01'; 

-- 8. UNION Operation 
SELECT name FROM student WHERE course = 'BCA' 
UNION  
SELECT name FROM student WHERE course = 'BBA'; 

-- 9. LIKE Operation 
SELECT name 
FROM student 
WHERE name LIKE 'A%'; 

-- 10. LIMIT Operation 
SELECT s.name, p.amount, p.status 
FROM student s 
JOIN payment p ON s.student_id = p.student_id 
WHERE p.status = 'Pending' 
LIMIT 5; 

-- 11. DROP Operation 
DROP TABLE complaints; 

-- 12. SELECT with JOIN, ASC, and GROUP BY 
SELECT s.course, SUM(p.amount) AS total_paid 
FROM student s 
JOIN payment p ON s.student_id = p.student_id 
GROUP BY s.course 
ORDER BY total_paid ASC; 

-- 13. SELECT with LIKE and LIMIT 
SELECT name 
FROM student 
WHERE name LIKE '%Sharma%' 
LIMIT 3; 

-- 14 UPDATE with JOIN 
UPDATE rooms r 
JOIN hostels h ON r.hostel_id = h.hostel_id 
SET r.occupied = r.occupied + 1 
WHERE h.name = 'Sukhna Tagore' AND r.room_number = 'A101'; 

-- 15 DELETE with JOIN 
DELETE c 
FROM complaints c 
JOIN rooms r ON c.room_id = r.room_id 
JOIN hostels h ON r.hostel_id = h.hostel_id 
WHERE r.room_number = 'A101' AND h.name = 'Sukhna Tagore';