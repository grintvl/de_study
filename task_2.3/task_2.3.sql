--Напишите SQL-запросы, которые выполняют следующие действия:

--1. Возвращает список клиентов (имя и фамилия) с наибольшей общей суммой заказов.

SELECT C.FirstName, C.LastName 
FROM Customers AS C 
    JOIN Orders AS O ON C.CustomerID = O.CustomerID 
    JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID 
    
    ORDER BY SUM(OD.UnitPrice * OD.Quantity) 
    DESC LIMIT 5;

--2. Для каждого клиента из пункта 1 выводит список его заказов (номер заказа и общая сумма) в порядке убывания общей суммы заказов.

SELECT O.OrderID, O.TotalAmount 
FROM Customers AS C 
    JOIN Orders AS O ON C.CustomerID = O.CustomerID 
    JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID 
    
    GROUP BY O.OrderID, O.TotalAmount 
    ORDER BY O.TotalAmount 
    DESC;

--3. Выводит только тех клиентов, у которых общая сумма заказов превышает среднюю общую сумму заказов всех клиентов.

SELECT C.FirstName, C.LastName, AVG(O.TotalAmount) AS AverageTotalAmount
FROM Customers AS C
    JOIN Orders AS O ON C.CustomerID = O.CustomerID
    JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
    
    GROUP BY C.FirstName, C.LastName
    HAVING AVG(O.TotalAmount) < C.TotalAmount;