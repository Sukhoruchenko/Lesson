--dbo.SKU (ID identity, Code, Name)����������� �� ������������ ���� Code
--���� Code �����������: "s" + ID
--dbo.Family (ID identity, SurName, BudgetValue)
--dbo.Basket (ID identity, ID_SKU (������� ���� �� ������� dbo.SKU), ID_Family (������� ���� �� ������� dbo.Family) Quantity, Value, PurchaseDate, DiscountValue)�����������, ��� ���� Quantity � Value �� ����� ���� ������ 0
--�������� �������� �� ��������� ��� ���� PurchaseDate: ���� ���������� ������ (������� ����)

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
