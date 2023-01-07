CREATE DATABASE Db_Employees;

CREATE TABLE Tbl_Employee(
	employee_name VARCHAR(255) PRIMARY KEY ,
	Street VARCHAR(255),
	City VARCHAR(255)
)

CREATE TABLE Tbl_Works(
	employee_name VARCHAR(255) PRIMARY KEY,
	company_name VARCHAR(255),
	Salary INT,
	FOREIGN KEY (employee_name) REFERENCES Tbl_Employee(employee_name)
)

CREATE TABLE Tbl_Company(
	company_name VARCHAR(255) PRIMARY KEY,
	city VARCHAR(255)
)

CREATE TABLE Tbl_Manages(
	employee_name VARCHAR(255) PRIMARY KEY,
	manager_name VARCHAR(255),
	FOREIGN KEY (employee_name) REFERENCES Tbl_Employee(employee_name),
	FOREIGN KEY (manager_name) REFERENCES Tbl_Employee(employee_name)
)

INSERT INTO Tbl_Employee (employee_name, Street, City)
VALUES
	('Priti Rana', 'Baneshwor','Kathmandu'),
	('Jones', 'Kalanki', 'Kathmandu'),
	('Ankita Baracharya', 'Taksar tole', 'Tansen'),
	('Akriti Shakya', 'Buddha path', 'Bhairahawa'),
	('Sanyam Thapa', 'Sanepa','Kathmandu'),
	('Prinsa Joshi', 'Suryabinayak', 'Bhaktapur'),
	('Shiwani Shah', 'Baneshwor', 'Kathmandu'),
	('Rashmi Khadka','Baneshwor', 'Kathmandu'),
	('Pratima Dawadi', 'Raniban', 'Kathmandu'),
	('Pratigya Poudel', 'Baneshwor', 'Kathmandu');

SELECT * FROM Tbl_Employee;
SELECT * FROM Tbl_Works;
SELECT * FROM Tbl_Company;
SELECT * FROM Tbl_Manages;
INSERT INTO Tbl_Works(employee_name, company_name, salary)
VALUES
	('Priti Rana', 'Bajra', 65000),
	('Pratigya Poudel', 'F1soft', 40000),
	('Rashmi Khadka', 'Hamro patro', 20000),
	('Prinsa Joshi', 'First Bank Corporation', 15000),
	('Akriti Shakya', 'Small Bank Corporation', 40000),
	('Jones', 'Small Bank Corporation', 35000),
	('Ankita Baracharya', 'Small Bank Corporation', 50000),
	('Sanyam Thapa', 'First Bank Corporation', 45000),
	('Shiwani Shah', 'Bajra', 55000),
	('Pratima Dawadi', 'F1soft', 61000);

INSERT INTO Tbl_Company(company_name, city)
VALUES 
	('F1soft', 'Kathmandu'),
	('Hamro patro', 'Lalitpur'),
	('First Bank Corporation', 'Kathmandu'),
	('Small Bank Corporation', 'Lalitpur'),
	('Bajra', 'Bhaktapur');

INSERT INTO Tbl_Manages(employee_name, manager_name)
VALUES
	('Shiwani Shah', 'Priti Rana'),
	('Prinsa Joshi', 'Sanyam Thapa'),
	('Akriti Shakya','Ankita Baracharya'),
	('Jones', 'Ankita Baracharya');
