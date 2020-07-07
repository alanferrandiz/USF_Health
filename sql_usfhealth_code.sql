if OBJECT_ID('usp_individuals_select_all') is not null
	drop procedure usp_individuals_select_all
go
create procedure usp_individuals_select_all
as
select ind_id, ind_first_name, ind_last_name, ind_gender from tb_individuals
go

if OBJECT_ID('usp_individuals_insert') is not null
	drop procedure usp_individuals_insert
go
create procedure usp_individuals_insert
(
	@ind_first_name		varchar(800) = null,
	@ind_last_name		varchar(800) = null,
	@ind_gender			char(1) = null
)
as
begin
	insert into tb_individuals (ind_first_name, ind_last_name, ind_gender)
	values (@ind_first_name, @ind_last_name, @ind_gender)
end
go

if OBJECT_ID('usp_individuals_update') is not null
	drop procedure usp_individuals_update
go
create procedure usp_individuals_update
(
	@ind_id				int,
	@ind_first_name		varchar(800) = null,
	@ind_last_name		varchar(800) = null,
	@ind_gender			char(1) = null
)
as
begin
	update	tb_individuals 
	set		ind_first_name = @ind_first_name,
			ind_last_name = @ind_last_name,
			ind_gender = @ind_gender
	where	ind_id = @ind_id
end
go

if OBJECT_ID('usp_individuals_delete') is not null
	drop procedure usp_individuals_delete
go
create procedure usp_individuals_delete
(
	@ind_id				int
)
as
begin
	delete	tb_individuals 
	where	ind_id = @ind_id
end
go

if OBJECT_ID('usp_individuals_select') is not null
	drop procedure usp_individuals_select
go
create procedure usp_individuals_select
(
	@ind_id				int
)
as
	select ind_id, ind_first_name, ind_last_name, ind_gender 
	from tb_individuals
	where ind_id = @ind_id
go