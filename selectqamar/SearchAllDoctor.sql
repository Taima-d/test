USE [Tabibi]
GO
/****** Object:  StoredProcedure [dbo].[SearchAllDoctor]    Script Date: 13/05/2022 17:31:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SearchAllDoctor] 
AS
BEGIN

select  u.Fname ,  u.Lname , u.Photo , sec.Section_Name ,d.Address,d.Price1,d.Price2, sum(distinct app.Rating) 'rating'
from Users u 
inner join Doctors d
on u.User_Id=d.UserId
inner join Doctor_Speciality ds 
on d.Doctor_Id = ds.DoctorId
inner join Specialities sp 
on ds.SpecialityId= sp.Speciality_Id
inner join Sections sec on 
 sec.Section_Id = sp.SectionId
 left join Availabilities av 
 on d.Doctor_Id= av.DoctorId
 left join TimeSlots ts 
 on av.Availability_Id = ts.AvailabilityId
 left outer join Appointments app
 on ts.TS_Id =app.TimeSlotId
group by u.Fname , u.Lname ,u.Photo , sec.Section_Name ,d.Address,d.Price1,d.Price2
End