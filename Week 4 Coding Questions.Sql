-- Q1 Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
--What is the city and country result for CustomerID 16?
SELECT CustomerId,FirstName,LastName,FirstName ||' '||LastName as 'Fullname', Address||'.'||Upper(City)||'.'||Upper(Country) as 'Address'
from Customers
 ;


--Q2 Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
--What is the final result for Robert King?
SELECT CustomerId,Firstname,Lastname,lower(substr(Firstname,1,4)||' '||substr(Lastname,1,2)) as Fullname
from Customers
;

--Q3 Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
--What is the lastname of the last person on the list returned?
SELECT Lastname,Firstname,HireDate,date(HireDate),date('now')-date(HireDate) as workyears
from Employees
where workyears>=15
Order By Lastname ASC
;

--Q4 Profiling the Customers table, answer the following question.
--Profiling the Customers table, answer the following question.

SELECT *
FROM Customers
WHERE 
Phone
--Fax 
--Postalcode
--Address
--Company
--FirstName
IS NULL ;

--Q5 Find the cities with the most customers and rank in descending order.
--Which of the following cities indicate having 2 customers?

SELECT City,COUNT(*)
FROM Customers
GROUP BY City
ORDER BY COUNT(*) DESC

--Q6 Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
-- Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.

SELECT C.FirstName,
       C.LastName,
       I.InvoiceId,
       C.FirstName || C.LastName || I.InvoiceID AS NewId
FROM Customers C INNER JOIN Invoices I
ON C.CustomerId = I.CustomerID
WHERE NewId LIKE 'AstridGruber%'