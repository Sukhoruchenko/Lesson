--Создать функцию (на выходе: файл в репозитории dbo.udf_GetSKUPrice.sql в ветке Functions)
--Входной параметр @ID_SKU Рассчитывает стоимость передаваемого продукта из таблицы dbo.Basket по формуле
--сумма Value по переданному SKU / сумма Quantity по переданному SKU
--На выходе значение типа decimal(18, 2)

create or alter function udf_GetSKUPrice(@ID_SKU int)
returns decimal(18, 2)
begin
	declare @Cost decimal(18, 2)

    select @Cost = value/quantity
	from dbo.Basket 
	where ID_SKU = @ID_SKU

	return @Cost
end;

go
select dbo.udf_GetSKUPrice(3)
