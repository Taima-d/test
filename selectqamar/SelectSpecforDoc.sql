USE [ll]
GO
/****** Object:  StoredProcedure [dbo].[SelectSpecforDoc]    Script Date: 13/05/2022 17:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectSpecforDoc]
@Doctor_Id int
as begin 
select Specialities.Speciality_Name
from Specialities,Doctor_Speciality,Doctors
where
Specialities.Speciality_Id=Doctor_Speciality.SpecialityId
and
Doctors.Doctor_Id=Doctor_Speciality.DoctorId
and
Doctor_Speciality.DoctorId=@Doctor_Id
end