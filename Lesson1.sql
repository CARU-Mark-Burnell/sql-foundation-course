SELECT   c.CustomerId,
         c.FirstName,
         c.LastName,
         --c.FirstName +' ' + c.LastName AS CustomerName,
         CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName1,
         c.City,
         c.Company
FROM     Customer AS c
WHERE    c.Company IS NOT NULL
--WHERE c.city IN ('london','Paris','Rome','Berlin')
--WHERE c.lastname NOT LIKE '%r'
ORDER BY c.company ASC;

SELECT   c.country,
         Count(*) AS NumberOfCustomers
FROM     Customer AS c
GROUP BY c.country
ORDER BY NumberOfCustomers DESC;

-- lOOKING AT INVOICES
SELECT i.InvoiceId,
       i.InvoiceDate,
       i.CustomerId,
       i.Total
FROM   Invoice AS i;

SELECT   i.CustomerId,
         c.FirstName,
         c.LastName,
         CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
         SUM(i.Total) AS Invoicetotal,
         COUNT(*) AS Numberofinvoices
FROM     Invoice AS i
         INNER JOIN
         Customer AS c
         ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId, c.FirstName, c.LastName, CONCAT(c.FirstName, ' ', c.LastName)
ORDER BY i.CustomerId;

--alternative way of invoices by customer
SELECT IBC.CustomerId,
       --  c.FirstName,
       --  c.LastName,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       IBC.InvoiceTotal,
       IBC.NumberOfInvoices
FROM   (SELECT   i.CustomerId,
                 SUM(i.Total) AS InvoiceTotal,
                 COUNT(*) AS NumberOfInvoices
        FROM     Invoice AS i
        GROUP BY i.CustomerId) AS IBC
       INNER JOIN
       Customer AS C
       ON IBC.CustomerId = C.CustomerId
       INNER JOIN
       Employee AS E
       ON E.EmployeeId = C.SupportRepId;

-- customers & employees
SELECT e.EmployeeId,
       --e.FirstName,
       --e.LastName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM   employee AS e
       INNER JOIN
       Customer AS c
       ON e.EmployeeId = c.SupportRepId;