create database HR_Management;
 use  HR_Management;
-- create tables in database
create table Departments( DepartmentID INT PRIMARY KEY AUTO_INCREMENT,Name VARCHAR(100) NOT NULL);
CREATE TABLE Employees (
        EmployeeID INT PRIMARY KEY AUTO_INCREMENT,Name VARCHAR(100),Email VARCHAR(100) UNIQUE,HireDate DATE,DepartmentID INT,
         FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID );
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT, EmployeeID INT UNIQUE,BasicSalary DECIMAL(10, 2),
    Bonus DECIMAL(10, 2), FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
    );
CREATE TABLE LeaveRequests ( RequestID INT PRIMARY KEY AUTO_INCREMENT,
 EmployeeID INT,StartDate DATE,EndDate DATE,Reason TEXT, Status ENUM('Pending', 'Approved', 'Rejected'),FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
    );
CREATE TABLE Evaluations (
 EvaluationID INT PRIMARY KEY AUTO_INCREMENT,
 EmployeeID INT,
EvalDate DATE,
Score INT CHECK (Score BETWEEN 1 AND 10),
 Comment TEXT,
 FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID));
---- inserting values in tables
INSERT INTO Departments (DepartmentID, Name) VALUES (1, 'HR'),(2, 'IT'),(3, 'Finance'),(4, 'Marketing'), (5, 'Operations');

INSERT INTO Employees (EmployeeID, Name, Email, HireDate, DepartmentID) VALUES
     (201, 'Ali Hassan', 'ali.hassan@example.com', '2022-03-15', 1),
   (202, 'Mona Saeed', 'mona.saeed@example.com', '2021-07-20', 2),
  (203, 'Ahmed Nabil', 'ahmed.nabil@example.com', '2020-05-10', 3),
    (204, 'Sara Mostafa', 'sara.mostafa@example.com', '2022-12-01', 1),
    (205, 'Youssef Adel', 'youssef.adel@example.com', '2023-01-25', 2),
   (206, 'Nour Magdy', 'nour.magdy@example.com', '2021-04-14', 3),
    (207, 'Khaled Yassin', 'khaled.yassin@example.com', '2020-09-30', 2),
    (208, 'Rana Sherif', 'rana.sherif@example.com', '2022-08-19', 1),
(209, 'Hany Fathy', 'hany.fathy@example.com', '2023-03-22', 3),
     (210, 'Laila Amr', 'laila.amr@example.com', '2021-11-11', 2),
   (211, 'Tamer Helmy', 'tamer.helmy@example.com', '2020-02-05', 3),
   (212, 'Farida Ayman', 'farida.ayman@example.com', '2023-06-18', 1),
  (213, 'Mahmoud Salah', 'mahmoud.salah@example.com', '2022-07-07', 2),
 (214, 'Heba Zaki', 'heba.zaki@example.com', '2023-09-09', 1),
  (215, 'Omar Reda', 'omar.reda@example.com', '2024-01-01', 3);

INSERT INTO Salaries (SalaryID, EmployeeID, BasicSalary, Bonus) VALUES
   (1, 201, 5000, 200),
   (2, 202, 6000, 300),
     (3, 203, 5500, 250),
     (4, 204, 5800, 270),
    (5, 205, 6200, 400),
    (6, 206, 5300, 150),
     (7, 207, 5100, 100),
    (8, 208, 4950, 120),
   (9, 209, 7000, 500),
     (10, 210, 6700, 350),
    (11, 211, 5600, 180),
   (12, 212, 5250, 130),
    (13, 213, 6100, 300),
    (14, 214, 4800, 100),
   (15, 215, 7500, 600);


INSERT INTO LeaveRequests (RequestID, EmployeeID, StartDate, EndDate, Reason, Status) VALUES
   (1, 201, '2024-01-10', '2024-01-15', 'Vacation', 'Approved'),
   (2, 202, '2024-02-01', '2024-02-03', 'Medical', 'Pending'),
     (3, 203, '2024-03-12', '2024-03-17', 'Emergency', 'Rejected'),
     (4, 204, '2024-04-05', '2024-04-09', 'Personal', 'Approved'),
    (5, 205, '2024-05-01', '2024-05-02', 'Sick', 'Approved'),
    (6, 206, '2024-05-10', '2024-05-15', 'Maternity', 'Pending'),
    (7, 207, '2024-06-01', '2024-06-06', 'Vacation', 'Approved'),
   (8, 208, '2024-07-10', '2024-07-15', 'Emergency', 'Rejected'),
    (9, 209, '2024-08-01', '2024-08-05', 'Travel', 'Approved'),(10, 210, '2024-09-15', '2024-09-18', 'Personal', 'Approved'),
     (11, 211, '2024-10-10', '2024-10-13', 'Sick', 'Pending'),
     (12, 212, '2024-11-01', '2024-11-07', 'Vacation', 'Approved'),
     (13, 213, '2024-12-05', '2024-12-10', 'Emergency', 'Rejected'),
     (14, 214, '2025-01-01', '2025-01-04', 'Medical', 'Approved'),
    (15, 215, '2025-02-10', '2025-02-12', 'Personal', 'Pending');

INSERT INTO Evaluations (EvaluationID, EmployeeID, EvalDate, Score, Comment) VALUES
    (1, 201, '2024-01-15', 9, 'Great work ethic'),
     (2, 202, '2024-01-20', 8, 'Good team player'),
    (3, 203, '2024-02-01', 7, 'Improved performance'),
     (4, 204, '2024-02-18', 6, 'Needs supervision'),
     (5, 205, '2024-03-05', 9, 'Excellent contribution'),
   (6, 206, '2024-03-25', 5, 'Below expectations'),
   (7, 207, '2024-04-01', 8, 'Positive attitude'),
    (8, 208, '2024-04-15', 10, 'Outstanding'),
   (9, 209, '2024-05-01', 6, 'Average work'),
     (10, 210, '2024-05-10', 7, 'Consistent'),
     (11, 211, '2024-06-01', 4, 'Needs improvement'),
    (12, 212, '2024-06-20', 8, 'Shows initiative'),
    (13, 213, '2024-07-01', 9, 'Very good work'),
    (14, 214, '2024-07-15', 10, 'Top performer'),
    (15, 215, '2024-08-01', 7, 'Good under pressure');
-------Queries------

-- Search employees whose name contains 'Ali'
SELECT * FROM Employees WHERE Name LIKE '%Ali%';

--  Calculate average total salary 
SELECT AVG(BasicSalary + Bonus) AS AverageTotalSalary FROM Salaries;

--  Count number of employees 
SELECT d.Name, COUNT(*) AS TotalEmployees
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name;

-- List all employees ordered by hire date 
SELECT * FROM Employees ORDER BY HireDate ASC;

-- List approved leave requests with employee names and dates
SELECT e.Name, lr.StartDate, lr.EndDate
FROM LeaveRequests lr
JOIN Employees e ON lr.EmployeeID = e.EmployeeID
WHERE lr.Status = 'Approved';

-- Count number of employees in each department (including empty departments)
SELECT D.Name AS DepartmentName, COUNT(E.EmployeeID) AS NumEmployees
FROM Departments D
LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.Name;

--  Count number of employees per department
SELECT D.Name AS DepartmentName, COUNT(E.EmployeeID) AS NumEmployees
FROM Departments D
LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.Name;

--List pending leave 
SELECT E.Name, L.StartDate, L.EndDate, L.Reason
FROM LeaveRequests L
JOIN Employees E ON L.EmployeeID = E.EmployeeID
WHERE L.Status = 'Pending';

--  List employees who scored 9 
SELECT E.Name, EV.Score
FROM Evaluations EV
JOIN Employees E ON EV.EmployeeID = E.EmployeeID
WHERE EV.Score >= 9;

-- 10. Show total bonus amount paid by each department
SELECT D.Name AS DepartmentName, SUM(S.Bonus) AS TotalBonus
FROM Employees E
JOIN Salaries S ON E.EmployeeID = S.EmployeeID
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.Name;

