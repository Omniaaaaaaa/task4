CREATE database MARKET;

USE market;

CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  price DECIMAL(10,2)
);

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  email VARCHAR(50)
);

CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
); 


INSERT INTO Products (product_id, product_name, price) VALUES
(55, 'A', 10.99),
(88, 'B', 15.66),
(99, 'C', 20.99);

INSERT INTO Customers (customer_id, customer_name, email) VALUES
(422177, 'omnia', 'omnia@email.com'),
(422188, 'mariam', 'mariam@email.com'),
(4221697, 'nour', 'nouren@email.com');

INSERT INTO Orders (order_id, customer_id, product_id, quantity) VALUES
(1, 1, 1, 2),
(2, 2, 3, 1),
(3, 3, 2 ,3);

SELECT *
FROM Orders
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;

SELECT *
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id;

SELECT *
FROM Orders
RIGHT JOIN Customers ON Orders.customer_id = Customers.customer_id;
 
SELECT *
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- Implicit join syntax
SELECT *
FROM Customers c
JOIN Products p
ON c.customer_id = p.product_id;

SELECT *
FROM  Products p, customers c
WHERE p.product_id = c.customer_id;

-- Self outer joins
SELECT customer_id,customer_name AS product_id, product_name
FROM customers c
JOIN Products p
ON p.product_id = c.customer_id;

-- Natural join
SELECT product_id, product_name
FROM Products p
NATURAL JOIN customers c;

-- cross join
SELECT customer_name AS customer, product_name AS product
FROM customers c
CROSS JOIN products p
ORDER BY customer_name;

-- union
SELECT customer_name
FROM customers
UNION
SELECT customer_id
FROM customers;
