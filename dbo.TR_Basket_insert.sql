--Создать триггер (на выходе: файл в репозитории dbo.TR_Basket_insert в ветке Triggers)
--   1. Если в таблицу dbo.Basket за раз добавляются 2 и более записей одного ID_SKU, то значение в поле DiscountValue, 
--   для этого ID_SKU рассчитывается по формуле Value * 5%, иначе DiscountValue = 0

create or alter trigger dbo.TR_Basket_insert
on dbo.Basket
after insert
as
begin
	declare @FlagCount int = 0

	if exists (select ID_SKU from inserted group by ID_SKU having count(*) > 1)
		set	@FlagCount = 1

	update b
	set b.DiscountValue = case  
		when @FlagCount = 1 
			then b.Value * 0.05
		when @FlagCount = 0 
			then 0
		end
	from dbo.Basket as b
		inner join inserted on inserted.id = b.ID
end
