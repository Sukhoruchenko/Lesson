--������� ������������� (�� ������: ���� � ����������� dbo.vw_SKUPrice � ����� VIEWs)
--���������� ��� �������� ��������� �� ������� dbo.SKU � 
--��������� ������� �� ���������� ������ �������� (��������� ������� dbo.udf_GetSKUPrice)

create or alter view vw_SKUPrice
as
select *, dbo.udf_GetSKUPrice(ID) as Price
from dbo.SKU

