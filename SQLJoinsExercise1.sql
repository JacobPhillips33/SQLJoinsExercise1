/* DONE - joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS 'Product Name', c.Name AS 'Category Name'
FROM bestbuy.products p
INNER JOIN bestbuy.categories c
ON p.CategoryID = c.CategoryID
WHERE c.Name = 'Computers';
 
/* DONE - joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name AS Product_Name, p.Price, r.Rating
FROM bestbuy.products p
INNER JOIN bestbuy.reviews r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
/* DONE - joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.EmployeeID, e.FirstName AS First_Name, e.LastName AS Last_Name, SUM(s.Quantity) AS Total_Quantity_Sold
FROM bestbuy.sales s
INNER JOIN bestbuy.employees e
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total_Quantity_Sold DESC;

/* DONE - joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name AS Category_Name , d.Name AS Department_Name
FROM bestbuy.categories c
INNER JOIN bestbuy.departments d
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* DONE - joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name as Product_Name, SUM(s.Quantity) AS Total_Number_Sold, SUM(s.Quantity)*PricePerUnit AS Total_Price_Sold
 FROM bestbuy.sales s
 INNER JOIN bestbuy.products p
 ON s.ProductID = p.ProductID
 WHERE p.Name = 'Eagles: Hotel California';

/* DONE - joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name AS Product_Name, r.Reviewer AS Reviewer_Name, r.Rating, r.Comment
FROM bestbuy.reviews r
INNER JOIN bestbuy.products p
ON r.ProductID = p.ProductID
WHERE p.Name = 'Visio TV'
ORDER BY r.Rating
LIMIT 1;



-- ------------------------------------------ Extra - May be difficult
/* DONE - Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName AS First_Name, e.LastName AS Last_Name, p.Name AS Product_Name, SUM(s.Quantity) AS Quantity_Sold
FROM bestbuy.sales s
INNER JOIN bestbuy.employees e ON s.EmployeeID = e.EmployeeID
INNER JOIN bestbuy.products p ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.Name
ORDER BY e.EmployeeID, Quantity_Sold DESC;

