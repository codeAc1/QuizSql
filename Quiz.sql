--Academy databazasını yaradın - 2 bal
Create Database Academy

Use Academy
--Groups(İd,Name) ve Students(İd,Name,Surname,Groupİd) table-ları yaradın(one-to-many), təkrar qrup adı əlavə etmək olmasın - 5 bal

Create Table Groups
(
	Id int primary key identity,
	Name nvarchar(100) unique
)

Create Table Students
(
	Id int primary key identity,
	Name nvarchar(100),
	SurName nvarchar(100),
	GroupId int references Groups(Id)

)

--Students table-na Grade (int) kalonunu əlavə etmək - 3 bal
Alter Table Students
Add Grade int

--Groups table-na 3 data(P224,P124,P221), Students table-na 4 data əlavə edin(1 tələbə p221 qrupna, 3 tələbə p224 qrupuna aid olsun) - 5 bal
Insert into Groups(name)
values('P224'),('P124'),('P221')

Insert Into Students (Name,SurName,GroupId,Grade)
values('Saxavat','Aliyev',1,100),
		('Eli','Veliyev',1,90),
		('Murad','Memmedov',1,80),
		('Qurban','Qurbanov',3,45)


--P224 qrupuna aid olan tələbələrin siyahisini gosterin - 10 bal
select * from Students as st
where st.GroupId=1

--Her qrupda neçə tələbə olduğunu göstərən siyahı çıxarmaq - 15 bal
Select gr.Name 'Group Name', Count(gr.Name) 'Student Count' from Groups as gr
join Students as st
on gr.Id=st.GroupId
group by gr.Name

--View yaratmaq - tələbə adını, qrupun adını-qrup kimi , tələbə soyadını, tələbənin balını göstərməli - 20 bal
select st.Name 'Student Name', st.SurName 'Surname ', gr.Name 'Group Name', st.grade 'Grade' from Students as st
join Groups as gr
on gr.Id=st.GroupId

Create view usv_GetStudent 
as
select st.Name 'Student Name', st.SurName 'Surname ', gr.Name 'Group Name', st.grade 'Grade' from Students as st
join Groups as gr
on gr.Id=st.GroupId

select * from GetStudent

Create Procedure usp_Select_Students(@Grade int)
	AS
	Begin
	select * from Students st
	where st.grade>@Grade
	End

	 --Test Procedure
	Exec usp_Select_Students '3'



