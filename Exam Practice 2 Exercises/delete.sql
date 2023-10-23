-- 4 Delete
DELETE FROM Invoices WHERE ClientId = 11;
DELETE FROM ProductsClients WHERE ClientId = 11;
DELETE FROM Clients WHERE NumberVAT LIKE 'IT%';
