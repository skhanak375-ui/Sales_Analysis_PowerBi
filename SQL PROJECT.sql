Use  hr_analytics;
SELECT COUNT(*) AS Total_Employees
FROM employee;
SELECT
    Department,
    COUNT(*) AS Employee_Count
FROM employee
GROUP BY Department;
SELECT Department, MAX(Salary) AS Highest_Salary
FROM employee
GROUP BY Department;
SELECT Department,
       AVG(Salary) AS Avg_Salary
FROM employee
GROUP BY Department
HAVING Avg_Salary > 70000;
SELECT Department, COUNT(*) AS Employees
FROM employee
GROUP BY Department
HAVING COUNT(*) > 20;
SELECT Department,
       COUNT(*) AS Employees
FROM employee
WHERE YEAR(Joining_Date) > 2020
GROUP BY Department;
SELECT
    Name,
    Salary,
    CASE
        WHEN Salary > 70000 THEN 'High'
        WHEN Salary BETWEEN 40000 AND 70000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Status
FROM employee;
SELECT
    CASE
        WHEN Salary > 70000 THEN 'High'
        WHEN Salary BETWEEN 40000 AND 70000 THEN 'Medium'
        ELSE 'Low'
    END AS Salary_Status,
    COUNT(*) AS Employees
FROM employee
GROUP BY
    CASE
        WHEN Salary > 70000 THEN 'High'
        WHEN Salary BETWEEN 40000 AND 70000 THEN 'Medium'
        ELSE 'Low'
    END;
    SELECT Name, Salary
FROM employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM employee
);
SELECT
    e.Name AS Employee_Name,
    m.Name AS Manager_Name
FROM employee e
INNER JOIN employee m
    ON e.Manager_ID = m.Employee_ID;
    
SELECT e.Name, d.Department
FROM employee e
LEFT JOIN Department d
    ON e.Dept_ID = d.Dept_ID; 

SELECT Name, Department
FROM employee
WHERE Department = 'HR'

UNION

SELECT Name, Department
FROM employee
WHERE Department = 'IT';    

SELECT
    Department,
    AVG(Salary) AS Avg_Salary,
    COUNT(*) AS Employees
FROM employee
GROUP BY Department
HAVING AVG(Salary) > 75000;
SELECT Name, Salary
FROM employee
WHERE Department = 'IT'
  AND Salary > (
      SELECT AVG(Salary)
      FROM employee
  );
    SELECT e.Name, e.Department, e.Salary
FROM employee e
INNER JOIN (
    SELECT Department, MAX(Salary) AS Max_Salary
    FROM employee
    GROUP BY Department
) m
ON e.Department = m.Department
AND e.Salary = m.Max_Salary;
SELECT e.Name,
       e.Department,
       e.Salary
FROM employee e
INNER JOIN (
    SELECT Department, MAX(Salary) AS Max_Salary
    FROM employee
    GROUP BY Department
) m
ON e.Department = m.Department
AND e.Salary = m.Max_Salary;
SELECT
    YEAR(Joining_Date) AS Joining_Year,
    MONTHNAME(Joining_Date) AS Joining_Month,
    COUNT(*) AS Employees
FROM employee
GROUP BY
    YEAR(Joining_Date),
    MONTH(Joining_Date),
    MONTHNAME(Joining_Date)
ORDER BY
    Joining_Year,
    MONTH(Joining_Date);