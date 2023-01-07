/* Find the names of all employees who work for First Bank Corporation.*/

SELECT employee_name from Tbl_works 
where company_name= 'First Bank Corporation';

/*Find the names and cities of residence of all employees who work for First Bank Corporation.*/

SELECT employee_name, City from Tbl_Employee
where employee_name IN ( 
	SELECT employee_name FROM  Tbl_Works
	WHERE company_name = 'First Bank Corporation');

/*Find the names, street addresses, and cities of residence of all employees who work for
First Bank Corporation and earn more than $10,000.*/

SELECT employee_name,Street, City from Tbl_Employee
where employee_name IN ( 
	SELECT employee_name FROM  Tbl_Works
	WHERE company_name = 'First Bank Corporation' AND salary>10000);


/*Find all employees in the database who live in the same cities as the companies for
which they work.*/

SELECT employee_name from Tbl_Employee
WHERE City = (
	SELECT city FROM Tbl_Company
	WHERE company_name = (
		SELECT company_name FROM Tbl_Works
		WHERE Tbl_Works.employee_name = Tbl_Employee.employee_name)
		);
					

/*	(e) Find all employees in the database who live in the same cities and on the same streets
as do their managers.*/

SELECT employee_name from Tbl_Manages 
WHERE (
	SELECT City FROM Tbl_Employee 
	WHERE manager_name = employee_name) = (
	SELECT City FROM Tbl_Employee
	WHERE Tbl_Employee.employee_name = Tbl_Manages.employee_name)
	AND
	( SELECT Street FROM Tbl_Employee 
	WHERE manager_name = employee_name) = (
	SELECT Street FROM Tbl_Employee
	WHERE Tbl_Employee.employee_name = Tbl_Manages.employee_name);
	
/*(f) Find all employees in the database who do not work for First Bank Corporation	*/
SELECT employee_name FROM Tbl_Works
WHERE company_name != 'First Bank Corporation';

/*(g) Find all employees in the database who earn more than each employee of Small Bank
Corporation.	*/

SELECT employee_name FROM Tbl_Works
WHERE salary > (
	SELECT MAX(salary) FROM Tbl_Works 
	WHERE company_name ='Small Bank Corporation');

/*(h) Assume that the companies may be located in several cities. Find all companies located
in every city in which Small Bank Corporation is located.	*/

SELECT * FROM Tbl_Company
WHERE city = (
	SELECT city FROM Tbl_Company
	WHERE company_name ='Small Bank Corporation') AND company_name !='Small Bank Corporation' ;

/*	(i) Find all employees who earn more than the average salary of all employees of their
company.*/

SELECT * FROM Tbl_Works
WHERE Salary > (
	SELECT AVG(salary) From Tbl_Works
	Where Tbl_Works.company_name = company_name);

/*	(j) Find the company that has the most employees.*/
SELECT company_name, COUNT(*) as num_employees
FROM Tbl_Works
GROUP BY company_name
ORDER BY num_employees DESC 

/*	(k) Find the company that has the smallest payroll.*/
SELECT company_name, SUM(salary) as payroll 
FROM Tbl_Works
GROUP BY company_name
ORDER BY payroll ASC
LIMIT 1;