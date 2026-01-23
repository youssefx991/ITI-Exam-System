use ITI_ExamSystem
go

-- select by stydent id
create or alter procedure sp_Student_SelectById
    @StId INT
as
begin
    select *
    from Student S
    where S.StId = @StId
end
go


exec sp_Student_SelectById 2;