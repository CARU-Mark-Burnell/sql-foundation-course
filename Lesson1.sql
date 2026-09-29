SELECT   c.CustomerId,
         c.FirstName,
         c.LastName,
         c.City,
         c.Company
FROM     Customer AS c
WHERE    c.Company IS NOT NULL
--WHERE c.city IN ('london','Paris','Rome','Berlin')
--WHERE c.lastname NOT LIKE '%r'
ORDER BY c.company ASC;

SELECT
    c.country,
    Count(*) As NumberOfCustomers
From Customer AS c
GROUP BY c.country
ORDER BY NumberOfCustomers DESC

-- lOOKING AT INVOICES

SELECT i.InvoiceId,
       i.InvoiceDate,
       i.CustomerId,
       i.Total
FROM   Invoice AS i

SELECT   i.CustomerId,
         SUM(i.Total) AS invoicetotal
FROM     Invoice AS i
GROUP BY i.CustomerId
ORDER BY i.CustomerId;
