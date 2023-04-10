--������� ��������� (�� ������: ���� � ����������� dbo.usp_MakeFamilyPurchase � ����� Procedures)
--������� �������� (@FamilySurName varchar(255)) ���� �� �������� ��������� SurName ������� dbo.Family
--��������� ��� ������ ��������� ������ � ������� dbo.Family � ���� BudgetValue �� ������      
--1. dbo.Family.BudgetValue - sum(dbo.Basket.Value), ��� dbo.Basket.Value ������� ��� ���������� � ��������� �����
--2. ��� �������� ��������������� dbo.Family.SurName ������������ �������� ������, ��� ����� ����� ���

create or alter procedure usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
as
begin
	if exists (select * from dbo.Family	where SurName = @FamilySurName) 
	begin
		update f
		set f.BudgetValue = (select sum(b.Value) from dbo.Basket as b where b.ID_Family = f.ID)
		from dbo.Family as f
		where f.SurName = @FamilySurName
	end
	else raiserror('����������� ������� �������', 18, 1)
end


