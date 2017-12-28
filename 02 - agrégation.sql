-- nombre de lignes de commandes comportant le produit 5
select count(*)
from Order_Details
where ProductID = 5

-- nombre total d'exemplaires command�s pour le produit 5 
select sum(Quantity)
from Order_Details
where ProductID = 5

-- chiffre d'affaires g�n�r� par le produit 5 
select sum(Quantity * UnitPrice)
from Order_Details
where ProductID = 5

-- idem arondi � l'entier inf�rieur (floor) ou sup�rieur (ceiling)
select floor(sum(Quantity * UnitPrice))
from Order_Details
where ProductID = 5

-- valeur moyenne de la quantit� command�e pour le produit 5
select avg(Quantity)
from Order_Details
where ProductID = 5

-- Prix de la ligne de commande la plus ch�re
select max(Quantity * UnitPrice)
from Order_Details

-- Nombre de produits diff�rents command�s
select count(distinct ProductId)
from Order_Details

-- Frais de livraison moyens des commandes
select avg(freight)
from Orders

-- commandes dont les frais de livraison sont sup�rieurs � la moyenne
select orderid, CustomerID, freight
from Orders
where Freight > (select avg(freight) from Orders)
order by 3

-------------------------------------------------------
-- Regroupements (group by, top et having)

-- nombre de commandes par produit  (alisa: nb)
select productid, count(*) nb
from Order_Details
group by productid

-- nombre total d'exemplaires command�s par produit
select ProductID, sum(Quantity) NbCommand�s
from Order_Details
group by ProductID
order by 2 desc

-- top 10 des produits ayant g�n�r� le plus de chiffre d'affaires (CA=qt� x le prix)
select top(10) ProductID, sum(Quantity * UnitPrice) CA
from Order_Details
group by ProductID
order by 2 desc

-- nombre de commandes par pays et par ville
select ShipCountry, ShipCity, count(*) as NbCommandes
from Orders
group by ShipCountry, ShipCity
order by 1, 2

-- Pays pour lesquels il y a au moins 10 clients
select Country, count(*)
from Customers
group by Country
having count(*) >= 10
 