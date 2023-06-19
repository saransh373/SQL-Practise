CREATE TABLE employees_dup (
	emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender ENUM('M','F'),
    hire_date DATE
    );
    
INSERT INTO employees_dup 
SELECT 
	e.* 	
FROM 
	employees e 
	LIMIT 20;
    
INSERT INTO employees_dup VALUES
('10001','1953-09-02','Georgi', 'Facello', 'M','1986-06-26');

SELECT 
    *
FROM
    employees_dup;
    
SELECT
    *
FROM
    (SELECT
        e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
FROM
		employees e
WHERE
        last_name = 'Denis' 
	UNION SELECT
			NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
    FROM
        dept_manager dm) as a
ORDER BY -a.emp_no DESC;