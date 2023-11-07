create table if not exists public.Customers (
	CustomerID serial primary key,
	FirstName varchar(40),
	LastName varchar(40),
	Email varchar(40)
);

create table if not exists public.Orders (
	OrderID serial primary key,
	CustomerID integer,
	OrderDate timestamp,
	TotalAmount decimal,
	FOREIGN key (CustomerID) references Customers (CustomerID)
);

create table if not exists public.OrderDetails (
	OrderDetailID serial primary key,
	OrderID integer references public.Orders,
	ProductID integer,
	Quantity integer,
	UnitPrice decimal
);

create table if not exists public.Products (
	ProductID serial primary key,
	ProductName varchar(100),
	CategoryID integer,
	Price decimal
);

create table if not exists public.ProductReviews (
	ReviewID serial primary key,
	ProductID integer references public.Products,
	CustomerID integer references public.Orders,
	Rating integer, 
    ReviewText text
);