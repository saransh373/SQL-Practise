USE employees;
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;
				 /* --------- */
/* --------------- INNER JOIN ------------------ */
				/* ---------- */
SELECT 
    d.dept_name,
    m.dept_no,
    m.emp_no   
FROM
    departments_dup d
        INNER JOIN
    dept_manager_dup m ON d.dept_no = m.dept_no
ORDER BY m.dept_no;

/* TO AVOID DUPLICATE USE GROUP BY */
SELECT 
    d.dept_name,
    m.dept_no,
    m.emp_no   
FROM
    departments_dup d
        JOIN
    dept_manager_dup m ON d.dept_no = m.dept_no
GROUP BY m.emp_no, m.dept_no,d.dept_name
ORDER BY m.dept_no;

	/* ------------- */
/*----------LEFT JOIN------------*/
		# we should be careful while chosing table 
SELECT 
    m.dept_no,
    m.emp_no,
    d.dept_name
FROM
   dept_manager_dup m
        LEFT JOIN
     departments_dup d ON d.dept_no = m.dept_no
GROUP BY m.emp_no, m.dept_no,d.dept_name
ORDER BY m.dept_no; 

/* --------RIGHT JOIN---------- */
SELECT 
    d.dept_no,
    m.emp_no,
    d.dept_name
FROM
   dept_manager_dup m
        RIGHT JOIN
     departments_dup d ON d.dept_no = m.dept_no
GROUP BY m.emp_no, d.dept_no,d.dept_name
ORDER BY m.dept_no; 


/* --------- CROSS JOIN -------------------- */
SELECT 
    m.*, d.*
FROM
    dept_manager m
        CROSS JOIN
    departments d
WHERE
	d.dept_no <> m.dept_no 
ORDER BY m.emp_no , d.dept_no;

/* ------------- TWO OR MORE TABLES -------------- */
SELECT 
    e.*, d.*
FROM
    dept_manager m
        CROSS JOIN
    departments d
		JOIN 
        employees e on e.emp_no = m.emp_no
WHERE
	d.dept_no <> m.dept_no 
ORDER BY m.emp_no , d.dept_no;

SELECT 
    e.first_name, e.last_name, e.hire_date,m.from_date, d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON d.dept_no = m.dept_no;

/* JOINING 3 or more tables */
SELECT 
    d.dept_name, AVG(salary) AS average_salary
FROM
    departments d
    	JOIN
	dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
    GROUP BY d.dept_no;