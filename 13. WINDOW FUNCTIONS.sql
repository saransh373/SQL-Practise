# ROW_NUMBER()  Function

USE employees;
SELECT 
    emp_no, salary,
 ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM
    salaries;

# USING MULTIPLE ROW_NUMBER function

SELECT 
    emp_no, salary,
 ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num,
 ROW_NUMBER() OVER () as row_num2
FROM
    salaries;


# WINDOW FUNCTION

SELECT 
    emp_no, salary,
 ROW_NUMBER() OVER w AS row_num
FROM
    salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);


