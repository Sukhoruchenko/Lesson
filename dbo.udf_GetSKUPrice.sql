--������� ������� (�� ������: ���� � ����������� dbo.udf_GetSKUPrice.sql � ����� Functions)
--������� �������� @ID_SKU ������������ ��������� ������������� �������� �� ������� dbo.Basket �� �������
--����� Value �� ����������� SKU / ����� Quantity �� ����������� SKU
--�� ������ �������� ���� decimal(18, 2)

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
