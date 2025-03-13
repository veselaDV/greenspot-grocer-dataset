-- Investigating inventory levels and cost per product.
--
SELECT i.productNumber, 
	p.description,
    i.quantityInStock,
    i.purchaseCost,
    ROUND(SUM(i.quantityInStock*i.purchaseCost), 2) AS totalCost
FROM inventory i
INNER JOIN products p
	ON i.productNumber = p.productID
GROUP BY i.productNumber, i.purchaseCost, i.quantityInStock
ORDER BY totalCost DESC;

-- Calculating the total revenue, number of sales and number of orders.
--
SELECT COUNT(orderID) AS totalOrders,
	SUM(quantitySold*salePrice) AS totalRevenue,
	SUM(o.quantitySold) AS numberOfSales
FROM orders o
INNER JOIN products p
	ON o.productNumOrd = p.productID;

-- Top 3 products by revenue.
--
SELECT o.productNumOrd,
	p.description,
	SUM(quantitySold*salePrice) AS totalRevenue
FROM orders o
INNER JOIN products p
	ON o.productNumOrd = p.productID
GROUP BY o.productNumOrd
ORDER BY totalRevenue DESC
LIMIT 3;

-- Top 3 products by sales.
--
SELECT o.productNumOrd, 
	p.description, 
	SUM(o.quantitySold) AS numberOfSales
FROM orders o
INNER JOIN products p
	ON o.productNumOrd = p.productID
GROUP BY o.productNumOrd
ORDER BY numberOfSales DESC
LIMIT 3;

-- Profit per product.
--
SELECT productNumOrd, description, purchaseCost, salePrice, (salePrice - purchaseCost) AS profit
FROM 
	(SELECT o.productNumOrd, p.description, salePrice
	FROM orders o
	INNER JOIN products p
		ON o.productNumOrd = p.productID
	GROUP BY o.productNumOrd, salePrice
	ORDER BY o.productNumOrd) as tt1
INNER JOIN inventory i
	ON tt1.productNumOrd = i.productNumber
    ORDER BY profit DESC;

-- Customers ranked by number of orders.
SELECT o.customerID,
	customerName,
	SUM(quantitySold) AS totalQUantitySoldPerCust,
	COUNT(orderID) AS totalOrdersPerCust
FROM orders o
INNER JOIN customers c
	ON o.customerID = c.customerID
GROUP BY customerID, customerName
ORDER BY COUNT(orderID) DESC;
