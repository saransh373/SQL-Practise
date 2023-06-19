USE employees_mod;
SELECT 
    YEAR(de.from_date) AS hire_year, e.gender, COUNT(e.emp_no)
FROM
    t_employees e
        JOIN
    t_dept_emp de ON e.emp_no = de.emp_no

GROUP BY hire_year , e.gender
HAVING MAX(YEAR(de.from_date)) >= '1990';


