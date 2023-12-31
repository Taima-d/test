USE [ll]
GO
/****** Object:  StoredProcedure [dbo].[SelectinfoforDoc]    Script Date: 13/05/2022 17:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectinfoforDoc]
@Doctor_Id int
as begin 
select distinct users.Fname,Users.Lname,Sections.Section_Name,Users.Photo
from users,Specialities,Doctor_Speciality,Sections,Doctors
where
Users.User_Id=Doctors.UserId
and
Sections.Section_Id=Specialities.SectionId
and
Specialities.Speciality_Id=Doctor_Speciality.SpecialityId
and
Doctors.Doctor_Id=Doctor_Speciality.DoctorId
and
Doctor_Speciality.DoctorId=@Doctor_Id
End