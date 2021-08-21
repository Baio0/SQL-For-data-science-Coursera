-- Question 1. 
--Using a subquery, find the names of all the tracks for the album "Californication".
--What is the title of the 8th track?
select Tr.name
from Tracks Tr inner join Albums Ar on Tr.AlbumId=Ar.AlbumId
where Ar.Title='Californication';  

--Question 2. 
--Find the total number of invoices for each customer along with the customer's full name, city and email.
--After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter the answer below (feel free to copy and paste).

select C.firstname, C.lastname, C.City,C.email,count(Inn.invoiceId)
from Customers C 
    inner join Invoices Inn on C.CustomerId=Inn.CustomerId 
group by C.CustomerId;  

--Question 3. 
--Retrieve the track name, album, artistID, and trackID for all the albums.
--What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.
select Tr.name, Al.Title, Tr.Trackid,Al.ArtistId
from Tracks Tr 
    inner join Albums Al on Tr.AlbumId=Al.AlbumId;  

--Question 4 
--Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
--After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?
select Em.lastname,Em.reportsto
from Employees Em 
    inner join Employees Ma on Em.Reportsto=Ma.EmployeeId
    where Ma.lastname='Mitchell'
    ;


--Question 5 
--Find the name and ID of the artists who do not have albums. 
--After running the query described above, two of the records returned have the same last name. Enter that name below.
select Ar.name,Ar.ArtistId
from Artists Ar 
where Ar.ArtistId not in (
    select Al.ArtistId
    from Albums Al
)
;

--Question 6
--Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
--After running the query described above, determine what is the last name of the 6th record? Enter it below. Remember to order things in descending order to be sure to get the correct answer.

select firstname,lastname
from employees 
union 
select firstname,lastname
from customers 
order by lastname desc
;
