--dbo.SKU (ID identity, Code, Name)Ограничение на уникальность поля Code
--Поле Code вычисляемое: "s" + ID
--dbo.Family (ID identity, SurName, BudgetValue)
--dbo.Basket (ID identity, ID_SKU (внешний ключ на таблицу dbo.SKU), ID_Family (Внешний ключ на таблицу dbo.Family) Quantity, Value, PurchaseDate, DiscountValue)Ограничение, что поле Quantity и Value не могут быть меньше 0
--Добавить значение по умолчанию для поля PurchaseDate: дата добавления записи (текущая дата)

create table dbo.SKU (
  ID int primary key identity(1, 1) not null,
  Code as 's' + cast(id as varchar(255)),
  constraint UK_SKU_Code unique (Code),
  Name varchar(255) not null
);

create table dbo.Family (
  ID int primary key identity(1, 1) not null,
  SurName varchar(255) not null,
  BudgetValue int
);

create table dbo.Basket (
  ID int primary key identity(1, 1) not null,
  ID_SKU int not null,
  ID_Family int not null,
  Quantity int check (Quantity > 0 ),
  Value int check (Value > 0 ),
  PurchaseDate datetime default(getdate()),
  DiscountValue int,
  foreign key (ID_SKU) references dbo.SKU (ID),
  foreign key (ID_Family)  references dbo.Family (ID)
);
