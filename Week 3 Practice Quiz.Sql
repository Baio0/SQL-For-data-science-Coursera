--Q1) How many albums does the artist Led Zeppelin have?
--Answer 14 
select albumid
from albums
where artistid in (select artistid
        from artists
        where Name='Led Zeppelin'
            );



--Q2) Create a list of album titles and the unit prices for the artist "Audioslave".
--Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.
--Answer 40
select Al.Title,Tr.UnitPrice
from ((Albums Al Inner join artists Ar On Al.Artistid=Ar.Artistid)
inner join Tracks Tr on Tr.Albumid=Al.Albumid
)
where Ar.Name='Audioslave';


--Q3) Find the first and last name of any customer who
--does not have an invoice. Are there any customers returned from the query?  
--Answer No 

select C.FirstName, C.Lastname
From Customers C
where C.Customerid not in (
        select customerid
        from invoices
);

--Q4) Find the total price for each album.
--What is the total price for the album “Big Ones”?
--Answer 14.85
select Al.Title,Tr.Albumid,sum(Tr.UnitPrice) as total_price
from tracks Tr 
    inner join Albums Al on Al.albumid=Tr.albumid
--Tr inner join Invoice_items Inn on Tr.trackid=Inn.trackid

where Al.Title='Big Ones'
group by Tr.albumid
order by Tr.Albumid
;


--Q5) How many records are created when you apply a Cartesian join to the invoice and invoice items table?
--Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.
--Answer: 922880

select inn.Invoiceid 
from invoice_items Int cross join invoices Inn 
;