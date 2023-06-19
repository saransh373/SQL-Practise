-- WILDCARD CHARACTERS 
USE employees;
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');
 SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');   
/* -------------------------------------- */

-- BETWEEN AND 
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';

SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN '10004' AND ' 10012';

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
 /* ----------------------------------------------- */
 
  -- IS NOT NULL , IS NULL
  SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
/*-------------------------------*/

-- OPERATORS
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%')
        AND gender = 'F';
        
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;    
/* ------------------------------- */ 

-- SELECT DISTINCT 
SELECT DISTINCT
    hire_date
FROM
    employees;
 /* ----------------------------------- */
 
 -- Aggregate Functions
 # COUNT 
 SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
SELECT 
    COUNT(*)
FROM
	dept_manager;
    
# ORDER BY
SELECT 
    *
FROM
    employees
ORDER BY hire_date;
 /* -------------------------- */
 
# AS
SELECT 
    salary, COUNT(emp_no) AS emp_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

# HAVING
SELECT 
    emp_no, AVG(salary) AS average_salary
FROM
    salaries
GROUP BY emp_no
HAVING
    AVG(salary)> 120000
ORDER BY emp_no;
/* ---------------------------------------- */
   
  # WHERE VS HAVING 
  SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;
/* ------------------------------------- */

-- INSERT
INSERT INTO employees
VALUES
(
    999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
); 
SELECT 
    *
FROM
    titles
LIMIT 10;

insert into titles
(
	emp_no,
    title,
    from_date
)
values
(
	 999903,
    'Senior Engineer',
    '1997-10-01'
);
SELECT
    *
FROM
    titles
ORDER BY emp_no DESC;

INSERT INTO dept_emp
VALUES
(
	999903,
    'd005',
    '1997-10-01',
    '9999-01-01'
    );
    
SELECT 
    *
FROM
    departments
ORDER BY dept_no;

INSERT INTO departments 
VALUES 
(
	'd010',
    'Business Analysis'
    );
    
/* ------------------------------ */ 
# COUNT()
SELECT 
    COUNT(DISTINCT emp_no)
FROM
    dept_emp;
# SUM()
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
# MAX AND MIN     
SELECT 
    MAX(emp_no)
FROM
    employees;
SELECT 
    MIN(emp_no)
FROM
    employees;
    
 # AVG() 
 SELECT 
    AVG(salary)
FROM
    salaries
 WHERE
	from_date > '1997-01-01';
	
# ROUND ()  
 SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries;

/* ** COALESCE ** */
SELECT 
    dept_name,
    dept_no,
    COALESCE(dept_no, dept_name, 'N/A') AS dept_info
FROM
    departments_dup
ORDER BY dept_no;

SELECT
	IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name, 'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC; 

      /* --------------------- */
/* ----------- JOINS -----------------*/
 SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
FROM
    employees e
        INNER JOIN
    dept_manager_dup m ON e.emp_no = m.emp_no
ORDER BY m.dept_no;

# LEFT JOIN 
SELECT 
    e.emp_no, e.first_name, e.last_name, m.dept_no
FROM
    employees e
        LEFT JOIN
    dept_manager m ON e.emp_no = m.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY m.dept_no DESC , e.emp_no;

# CROSS JOIN 
SELECT 
    m.*, d.*
FROM
    dept_manager_dup m
        CROSS JOIN
    departments_dup d
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;

SELECT 
    e.gender, COUNT(m.emp_no) as emp_no
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
GROUP BY e.gender;

			/* ---------------- */
	/* -----------SUBQUERIES-------------- */
SELECT 
    m.*
FROM
    dept_manager m
WHERE
    m.emp_no IN (SELECT 
            e.emp_no
        FROM
            employees e
        WHERE
            e.hire_date BETWEEN '1990-01-01' AND '1995-01-01');

/* -------------------------------- */
SELECT 
    e.*
FROM
    employees e
WHERE
    EXISTS( SELECT 
           *
        FROM
            titles t
        WHERE
            t.title = 'Assistant Engineer'
              AND e.emp_no = t.emp_no
        ORDER BY emp_no);
        
CREATE TABLE emp_manager (
    emp_no INT NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT NOT NULL
);
INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    
SELECT 
    *
FROM
    emp_manager;
    
    
    
-- --------------VEIW----------------------

CREATE OR REPLACE VIEW v_average_salary AS
    SELECT 
        ROUND(AVG(salary),2) AS Avg_salary
    FROM
        salaries s
        JOIN
        dept_manager m ON s.emp_no = m.emp_no;
        
/* -----------STORED PROCEDURE-------------- */
DELIMITER $$
CREATE PROCEDURE avg_salary()
BEGIN 
	SELECT ROUND(AVG(salary),2) as Average_Salary 
    FROM	
		salaries;
END $$
DELIMITER ;
CALL avg_salary();

DELIMITER $$ 
CREATE PROCEDURE emp_no 
(IN p_first_name VARCHAR(20), IN p_last_name VARCHAR(20), OUT p_emp_no INTEGER)
BEGIN 
	SELECT e.emp_no INTO p_emp_no 
    FROM employees e
	WHERE e.first_name = p_first_name 
		AND e.last_name = p_last_name;
END $$

/* ---------- VARIABLE ------------*/
SET @v_emp_no = 0;
CALL emp_no('Aruna','Journel',@v_emp_no);
SELECT @v_emp_no;

/* ---------- FUNCTION --------*/ 
DELIMITER $$
CREATE FUNCTION f_emp_info 
	(p_first_name VARCHAR(20), p_last_name VARCHAR(20)) 
	RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN 
	DECLARE v_max_date DATE;
    DECLARE v_salary DECIMAL(10,2);
    SELECT AVG(s.salary) INTO v_salary 
    FROM employees e 
		JOIN salaries s 
			ON e.emp_no = s.emp_no
		WHERE e.first_name = p_first_name
		AND 	
			e.last_name = p_last_name;
	RETURN v_salary;
END $$
DELIMITER ;

/* - ----------------- TRIGGER ---------------------*/

DELIMITER $$
CREATE TRIGGER trig_hire_date
BEFORE INSERT on employees
FOR EACH ROW 
BEGIN
	IF NEW.hire_date > date_format(sysdate(),'%Y-%m-%d') THEN 
    SET NEW.hire_date = date_format(sysdate(),'%Y-%m-%d');
    END IF;
END $$
#INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');
	
/* ------------------- INDEX ----------------- */
SELECT 
    *
FROM
    salaries
WHERE
    salary > '89000';

CREATE INDEX i_salary ON salaries(salary);

/* ------------- WINDOW FUNCTIONS ---------------- */
# ROW_NUM
 -- EXERCISE 1
SELECT 
	emp_no,
	dept_no,
	ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num 
FROM dept_manager;

-- EXERCISE 2
SELECT first_name, 
last_name, 
emp_no, 
ROW_NUMBER() OVER(PARTITION BY first_name ORDER BY last_name ASC) 
FROM employees;

SELECT 
	dm.emp_no, 
	salary ,
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary),
    ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) 
FROM 
	dept_manager dm 
JOIN 
	salaries s ON dm.emp_no = s.emp_no;
    
    
/* -------- WINDOW ------------ */
SELECT 
	emp_no, 
    first_name,
    last_name,
    ROW_NUMBER () OVER w AS row_num
FROM employees
WINDOW w AS (PARTITION BY first_name ORDER BY emp_no);