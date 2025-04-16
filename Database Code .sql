CREATE DATABASE mahindra_showroom;
USE mahindra_showroom;

-- TABLES

-- 1. Showrooms Table
CREATE TABLE Showrooms (
    ShowroomID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    ManagerName VARCHAR(50)
);

-- 2. Cars Table
CREATE TABLE Cars (
    CarID INT PRIMARY KEY,
    Model VARCHAR(50) NOT NULL,
    Type VARCHAR(30) NOT NULL,
    Engine VARCHAR(30) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- 3. Inventory Table
CREATE TABLE Inventory (
    CarID INT,
    ShowroomID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (CarID, ShowroomID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (ShowroomID) REFERENCES Showrooms(ShowroomID)
);

-- 4. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Contact VARCHAR(20),
    Address VARCHAR(100),
    PreferredModel VARCHAR(50)
);

-- 5. Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Designation VARCHAR(30),
    SalesCount INT DEFAULT 0
);

-- 6. Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CarID INT,
    CustomerID INT,
    EmployeeID INT,
    SaleDate DATE,
    Price DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 7. Test Drives Table
CREATE TABLE TestDrives (
    TestDriveID INT PRIMARY KEY,
    CustomerID INT,
    CarID INT,
    TestDriveDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

-- 8. Services Table
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY,
    CarID INT,
    ServiceDate DATE,
    Description TEXT,
    Cost DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);

-- DATA INSERTIONS

-- Showrooms
INSERT INTO Showrooms VALUES
(1, 'Mahindra AutoZone', 'Mumbai', 'Rohit Sharma'),
(2, 'Mahindra MaxDrive', 'Delhi', 'Anjali Mehta'),
(3, 'Mahindra Elite Motors', 'Bangalore', 'Ravi Verma'),
(4, 'Mahindra SpeedHub', 'Chennai', 'Sunita Rao'),
(5, 'Mahindra DriveX', 'Pune', 'Aman Kapoor'),
(6, 'Mahindra ApexAuto', 'Hyderabad', 'Pooja Yadav'),
(7, 'Mahindra RapidCars', 'Ahmedabad', 'Kunal Bhatia'),
(8, 'Mahindra Zoom Motors', 'Jaipur', 'Neeraj Thakur'),
(9, 'Mahindra KingAuto', 'Lucknow', 'Riya Sinha'),
(10, 'Mahindra StarDrive', 'Kolkata', 'Saurav Ghosh');

-- Cars
INSERT INTO Cars VALUES
(1, 'Thar', 'SUV', 'Diesel', 1500000.00),
(2, 'XUV700', 'SUV', 'Petrol', 2000000.00),
(3, 'Scorpio-N', 'SUV', 'Diesel', 1800000.00),
(4, 'Bolero', 'MPV', 'Diesel', 1000000.00),
(5, 'XUV300', 'Compact SUV', 'Petrol', 1300000.00),
(6, 'Marazzo', 'MPV', 'Diesel', 1400000.00),
(7, 'Alturas G4', 'Luxury SUV', 'Diesel', 2700000.00),
(8, 'KUV100 NXT', 'Micro SUV', 'Petrol', 700000.00),
(9, 'eXUV300', 'Electric SUV', 'Electric', 1800000.00),
(10, 'BE.05', 'Concept EV', 'Electric', 2500000.00);

-- Inventory
INSERT INTO Inventory VALUES
(1, 1, 10),
(2, 2, 8),
(3, 3, 7),
(4, 4, 6),
(5, 5, 12),
(6, 6, 4),
(7, 7, 3),
(8, 8, 9),
(9, 9, 5),
(10, 10, 6);

-- Customers
INSERT INTO Customers VALUES
(1, 'Akash Malhotra', '9876543210', 'New Delhi', 'XUV700'),
(2, 'Sneha Reddy', '9823456789', 'Hyderabad', 'Thar'),
(3, 'Rahul Jain', '9012345678', 'Mumbai', 'Scorpio-N'),
(4, 'Priya Nair', '9567890123', 'Chennai', 'XUV300'),
(5, 'Karan Mehta', '9234567890', 'Pune', 'Bolero'),
(6, 'Ravneet Singh', '9812345670', 'Ludhiana', 'Alturas G4'),
(7, 'Megha Bansal', '9801234567', 'Jaipur', 'Marazzo'),
(8, 'Vikas Anand', '9786543210', 'Bangalore', 'BE.05'),
(9, 'Tanvi Kapoor', '9767890123', 'Ahmedabad', 'KUV100 NXT'),
(10, 'Siddharth Das', '9745678901', 'Kolkata', 'eXUV300');

-- Employees
INSERT INTO Employees VALUES
(1, 'Manoj Kumar', 'Sales Executive', 5),
(2, 'Divya Sharma', 'Sales Manager', 10),
(3, 'Nikhil Joshi', 'Support Staff', 3),
(4, 'Anita Das', 'Sales Executive', 6),
(5, 'Rajeev Kapoor', 'Technician', 2),
(6, 'Deepika Rani', 'Customer Relations', 4),
(7, 'Sandeep Chauhan', 'Sales Executive', 5),
(8, 'Arjun Verma', 'Inventory Manager', 1),
(9, 'Bhavna Tyagi', 'Finance Officer', 0),
(10, 'Mohit Yadav', 'Technician', 2);

-- Sales
INSERT INTO Sales VALUES
(1, 1, 1, 1, '2025-01-10', 1500000.00),
(2, 2, 2, 2, '2025-02-12', 2000000.00),
(3, 3, 3, 3, '2025-03-15', 1800000.00),
(4, 4, 4, 4, '2025-04-18', 1000000.00),
(5, 5, 5, 5, '2025-05-20', 1300000.00),
(6, 6, 6, 6, '2025-06-22', 1400000.00),
(7, 7, 7, 7, '2025-07-25', 2700000.00),
(8, 8, 8, 8, '2025-08-10', 2500000.00),
(9, 9, 9, 9, '2025-09-14', 700000.00),
(10, 10, 10, 10, '2025-10-05', 1800000.00);

-- Test Drives
INSERT INTO TestDrives VALUES
(1, 1, 1, '2025-01-05', 'Completed'),
(2, 2, 2, '2025-02-10', 'Pending'),
(3, 3, 3, '2025-03-10', 'Completed'),
(4, 4, 4, '2025-04-12', 'Completed'),
(5, 5, 5, '2025-05-15', 'Completed'),
(6, 6, 6, '2025-06-01', 'Completed'),
(7, 7, 7, '2025-07-03', 'Pending'),
(8, 8, 8, '2025-08-08', 'Completed'),
(9, 9, 9, '2025-09-12', 'Completed'),
(10, 10, 10, '2025-10-01', 'Pending');

-- Services
INSERT INTO Services VALUES
(1, 1, '2025-01-25', 'Oil Change and Engine Check', 3000.00),
(2, 2, '2025-02-28', 'AC Service', 2500.00),
(3, 3, '2025-03-30', 'Full Service', 5000.00),
(4, 4, '2025-04-25', 'Battery Replacement', 3500.00),
(5, 5, '2025-05-28', 'Brake Pad Replacement', 2800.00),
(6, 6, '2025-06-15', 'Suspension Check', 4000.00),
(7, 7, '2025-07-10', 'Interior Cleaning', 1500.00),
(8, 8, '2025-08-18', 'Tire Alignment', 2200.00),
(9, 9, '2025-09-21', 'Software Update', 1200.00),
(10, 10, '2025-10-10', 'General Inspection', 1800.00);



--  Quieries

-- 1) View all car models with prices
SELECT Model, Price FROM Cars;

-- 2) View total number of cars in each showroom
SELECT Showrooms.Name, SUM(Inventory.Quantity) AS TotalCars
FROM Inventory
JOIN Showrooms ON Inventory.ShowroomID = Showrooms.ShowroomID
GROUP BY Showrooms.Name;

-- 3) View cars sold by each employee
SELECT Employees.Name, COUNT(Sales.SaleID) AS TotalSold
FROM Sales
JOIN Employees ON Sales.EmployeeID = Employees.EmployeeID
GROUP BY Employees.Name;

-- 4) Insert a new customer
INSERT INTO Customers (CustomerID, Name, Contact, Address, PreferredModel)
VALUES (11, 'Arjun Singh', '9001234567', 'Noida', 'Thar');

-- 5) Update price of a specific car
UPDATE Cars SET Price = 2100000.00 WHERE Model = 'XUV700';

-- 6) Retrieve customers who took a test drive with car model
SELECT Customers.Name, Cars.Model, TestDrives.Status
FROM TestDrives
JOIN Customers ON TestDrives.CustomerID = Customers.CustomerID
JOIN Cars ON TestDrives.CarID = Cars.CarID;

-- 7) Retrieve all sales details with car, customer, and price
SELECT Sales.SaleID, Customers.Name, Cars.Model, Sales.Price
FROM Sales
JOIN Cars ON Sales.CarID = Cars.CarID
JOIN Customers ON Sales.CustomerID = Customers.CustomerID;

-- 8) Count services done per car
SELECT Cars.Model, COUNT(Services.ServiceID) AS TotalServices
FROM Services
JOIN Cars ON Services.CarID = Cars.CarID
GROUP BY Cars.Model;

-- 9) Average cost of services
SELECT AVG(Cost) AS AverageServiceCost FROM Services;

-- 10) Get all employees with more than 5 sales
SELECT Name, SalesCount FROM Employees WHERE SalesCount > 5;

-- 11) Showrooms having more than 8 cars in stock
SELECT Showrooms.Name, SUM(Inventory.Quantity) AS TotalStock
FROM Inventory
JOIN Showrooms ON Inventory.ShowroomID = Showrooms.ShowroomID
GROUP BY Showrooms.Name
HAVING SUM(Inventory.Quantity) > 8;

-- 12) INNER JOIN: Sales with employee and car
SELECT Employees.Name AS Employee, Cars.Model, Sales.SaleDate
FROM Sales
JOIN Employees ON Sales.EmployeeID = Employees.EmployeeID
JOIN Cars ON Sales.CarID = Cars.CarID;

-- 13) LEFT JOIN: All customers even if they didn’t take a test drive
SELECT Customers.Name, TestDrives.Status
FROM Customers
LEFT JOIN TestDrives ON Customers.CustomerID = TestDrives.CustomerID;

-- 14) RIGHT JOIN: All test drives and their customers
SELECT TestDrives.TestDriveID, Cars.Model, Customers.Name
FROM TestDrives
RIGHT JOIN Cars ON TestDrives.CarID = Cars.CarID
RIGHT JOIN Customers ON TestDrives.CustomerID = Customers.CustomerID;

-- 15) Group by test drive status
SELECT Status, COUNT(*) AS Total
FROM TestDrives
GROUP BY Status;
