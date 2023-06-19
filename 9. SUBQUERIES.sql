USE employees;
 /* ------------ WHERE - IN ------------ */
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            m.emp_no
        FROM
            dept_manager m);
            
 /* --------------- EXISTS -------------------- */
  SELECT 
    e.first_name, e.last_name, e.emp_no
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager m
		WHERE
			m.emp_no = e.emp_no
		ORDER BY 
			emp_no);
            
 /* ----------------SELECT - FROM ------------------ */ 
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_Id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_Id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A
UNION  
 SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_Id,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_Id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20)  AS B;