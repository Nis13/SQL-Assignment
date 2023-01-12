/*1. Find the names of all instructors in the History department*/
SELECT instructor_name 
FROM instructor
WHERE department_name = 'History';

-- Relational Alegbra
--π instructor_name (σ department_name = 'History' (instructor))

/*2. Findsthe instructor ID and department name of all instructors associated with a
department with budget of greater than $95,000*/
SELECT instructor_id, instructor.department_name 
FROM instructor 
INNER JOIN 
Department ON instructor.department_name=department.department_name 
WHERE Budget>95000;

--Relational Algebra
--π department_id, department_name (instructor) × σ Budget > 95000 (department)


/*3. Findsthe names of all instructors in the Comp. Sci. department together with the
course titles of all the courses that the instructors teach*/
SELECT instructor.instructor_name, course.course_title
FROM instructor
JOIN teaches ON instructor.instructor_id = teaches.instructor_id
JOIN Course ON teaches.course_id = course.course_id
WHERE instructor.department_name = 'Computer Science';

--π Name, Title (Instructor ⨝ Teaches ⨝ Section ⨝ Course) 

/*4. Find the names of all students who have taken the course title of “Game Design”.*/
SELECT Student_name
FROM Student
JOIN Section ON teaches.sec_id= section.sec_id
JOIN Course ON section.course_id = course.course_id
WHERE course.course_title = 'Game Design';

/*5. For each department, find the maximum salary of instructors in that department. You
may assume that every department has at least one instructor*/
SELECT Department_name, MAX(Salary)
FROM instructor
GROUP BY Department_name

--σ MAX(Salary) (Instructor) GROUPBY Dept_Name

/*6. Find the lowest, across all departments, of the per-department maximum salary
computed by the preceding query.*/
SELECT department_name, salary
FROM instructor
WHERE salary
	IN (
		SELECT MAX(salary)
		FROM instructor
		GROUP BY department_name
	)
ORDER BY salary
LIMIT 1;

/*7. Find the ID and names of all students who do not have an advisor.*/