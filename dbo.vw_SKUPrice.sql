--Создать представление (на выходе: файл в репозитории dbo.vw_SKUPrice в ветке VIEWs)
--Возвращает все атрибуты продуктов из таблицы dbo.SKU и 
--расчетный атрибут со стоимостью одного продукта (используя функцию dbo.udf_GetSKUPrice)

create or alter view vw_SKUPrice
as
select *, dbo.udf_GetSKUPrice(ID) as Price
from dbo.SKU

