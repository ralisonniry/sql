-- nombre de lignes de commandes comportant le produit 5
select count(*)
from Order_Details
where ProductID = 5

-- nombre total d'exemplaires commandés pour le produit 5 
select sum(Quantity)
from Order_Details
where ProductID = 5

-- chiffre d'affaires généré par le produit 5 
select sum(Quantity * UnitPrice)
from Order_Details
where ProductID = 5

-- idem arondi à l'entier inférieur (floor) ou supérieur (ceiling)
select floor(sum(Quantity * UnitPrice))
from Order_Details
where ProductID = 5

-- valeur moyenne de la quantité commandée pour le produit 5
select avg(Quantity)
from Order_Details
where ProductID = 5

-- Prix de la ligne de commande la plus chère
select max(Quantity * UnitPrice)
from Order_Details

-- Nombre de produits différents commandés
select count(distinct ProductId)
from Order_Details

-- Frais de livraison moyens des commandes
select avg(freight)
from Orders

-- commandes dont les frais de livraison sont supérieurs à la moyenne
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

-- nombre total d'exemplaires commandés par produit
select ProductID, sum(Quantity) NbCommandés
from Order_Details
group by ProductID
order by 2 desc

-- top 10 des produits ayant généré le plus de chiffre d'affaires (CA=qté x le prix)
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
 