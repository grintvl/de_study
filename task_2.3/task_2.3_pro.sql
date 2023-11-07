--Дополнительные требования:

--1. Ваш SQL-запрос должен расшириться для учета общей суммы заказов и общего количества товаров, купленных каждым клиентом.

SELECT
    C.FirstName,
    C.LastName,
    SUM(O.TotalAmount) as TotalAmount,
    COUNT(DISTINCT OD.ProductID) as ProductsCount
FROM
    Customers AS C
    JOIN Orders AS O ON C.CustomerID = O.CustomerID
    JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
    LEFT JOIN Products AS P ON OD.ProductID = P.ProductID
GROUP BY
    C.FirstName,
    C.LastName
HAVING
    AVG(O.TotalAmount) > 0
ORDER BY
    TotalAmount DESC
LIMIT 5;

--2. Заказы клиентов должны быть разделены на две категории: «Новые заказы» (заказы, созданные менее месяца назад) и «Старые заказы» (заказы, созданные более месяца назад).

SELECT * 
FROM (SELECT C.FirstName, C.LastName, O.OrderID, O.TotalAmount, 
    DATE_SUB(NOW(), INTERVAL 1 MONTH) AS DateThreshold

FROM Customers AS C 
    JOIN Orders AS O
        ON C.CustomerID = O.CustomerID) AS T
    JOIN OrderDetails AS OD 
        ON T.OrderID = OD.OrderID 
            AND (OD.OrderDate < DateThreshold)
WHERE T.DateThreshold IS NOT NULL AND T.OrderDate IS NOT NULL
GROUP BY T.OrderID;

--3. Вам нужно рассчитать среднюю оценку продукта для каждого клиента на основе отзывов, оставленных ими о продуктах.

SELECT 
    C.CustomerID,
    AVG(R.Rating) AS AverageRating
FROM 
    Customers AS C
    JOIN Reviews AS R 
        ON C.CustomerID = R.CustomerID
GROUP BY C.CustomerID;

--4. Выведите список клиентов вместе с их общей суммой заказов, общим количеством товаров, новыми и старыми заказами, а также средней оценкой продукта.

SELECT C.FirstName, C.LastName,
    SUM(O.TotalAmount) as TotalAmount,
    COUNT(DISTINCT OD.ProductID) as ProductsCount,
    (SELECT COUNT(*) FROM Orders 
        WHERE CustomerID = C.CustomerID AND OrderDate > DATE_SUB(NOW(),INTERVAL 1 MONTH)) as NewOrdersCount,
    (SELECT COUNT(*) FROM Orders 
        WHERE CustomerID = C.CustomerID AND OrderDate <= DATE_SUB(NOW(),INTERVAL 1 MONTH)) as OldOrdersCount,
    AVG(R.Rating) as AverageRating

FROM Customers AS C
    JOIN Orders AS O 
        ON C.CustomerID = O.CustomerID
    JOIN OrderDetails AS OD 
        ON O.OrderID = OD.OrderID
    LEFT JOIN Products AS P 
        ON OD.ProductID = P.ProductID
    LEFT JOIN Reviews AS R 
        ON R.ProductID = P.ProductID AND R.CustomerID = C.CustomerID
GROUP BY C.FirstName, C.LastName
ORDER BY TotalAmount DESC