/*(a) Modify the database so that Jones now lives in Newtown.*/
UPDATE Tbl_Employee
SET  City = 'Newtown'
WHERE employee_name = 'Jones';


/*(b) Give all employees of First Bank Corporation a 10 percent raise. */
UPDATE Tbl_Works
SET salary = salary + (salary * 0.1)
WHERE company_name = 'First Bank Corporation';

/* (c) Give all managers of First Bank Corporation a 10 percent raise.*/
UPDATE Tbl_Works
SET salary = salary + (salary * 0.1)
wHERE Tbl_Works.employee_name = ANY (SELECT DISTINCT manager_name FROM tbl_manages) AND company_name = 'First Bank Corporation';

/* (d) Give all managers of First Bank Corporation a 10 percent raise unless
the salary becomes greater than $100,000;
in such cases, give only a 3 percent raise.*/
UPDATE Tbl_Works
SET salary = 
    CASE 
        WHEN salary * 1.1 <= 100000 THEN salary * 1.1 
        ELSE salary * 1.03 
    END
WHERE Tbl_Works.employee_name = ANY (SELECT DISTINCT manager_name FROM tbl_manages)
		AND company_name = 'First Bank Corporation';


/*(e) Delete all tuples in the works relation for employees of Small Bank
Corporation. */
