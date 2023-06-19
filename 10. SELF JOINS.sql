 SELECT 
    *
FROM
    emp_manager;
    
SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);
		
-- ----------------------------------------------------------
      /* -------------------------------*/ 
				#	VIEW   #
          /* -------------------- */      
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS 
	SELECT 
		emp_no, MAX(from_date) AS from_date, MAX(to_date)as to_date
	FROM dept_emp
    GROUP BY emp_no;
    
    
    
    
    
    
    
    
    
    
  