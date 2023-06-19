USE employees;
 /* ---------- SELECT DISTINCT ----------*/
 SELECT DISTINCT
    gender
FROM
    employees;
    
/*------ AGGREGATE FUNCTIONS -----------*/
 -- COUNT
 SELECT DISTINCT
    COUNT(emp_no)
FROM
    employees;
    
  -- ORDER BY  
SELECT 
    *
FROM
    employees
ORDER BY first_name; #DESC for ordering in descending order

SELECT 
    *
FROM
    employees
ORDER BY emp_no ,last_name ;

-- GROUP BY
SELECT 
    first_name,COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name;
	
-- AS 
SELECT 
    first_name,COUNT(first_name) AS  Name_Count
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

-- HAVING (usually used with group by )
SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 200
ORDER BY first_name;


/**  ********* WHERE VS HAVING *********** */
SELECT 
    first_name, COUNT(first_name) AS name_count 
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;

