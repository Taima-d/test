USE [ll]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllAPPforpatdoc]    Script Date: 13/05/2022 17:36:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SelectAllAPPforpatdoc] 
  @Patient_Id int,
   @Doctor_Id int
AS
BEGIN

  SELECT DISTINCT Users.Fname,Users.Lname,TimeSlots.Date,TimeSlots.TS_Start,Appointments.Reserve_date,Sections.Section_Name
  ,Appointments.Status
  from Appointments ,TimeSlots,Availabilities,Doctors,Users,Sections,Patients,Specialities,Doctor_Speciality
  where 
  users.User_Id=Doctors.UserId
    and Doctors.Doctor_Id=Availabilities.DoctorId
	and  Availabilities.Availability_Id=TimeSlots.AvailabilityId
  and
  TimeSlots.TS_Id=Appointments.TimeSlotId
  
  AND Doctors.Doctor_Id=Doctor_Speciality.DoctorId
  AND
  Specialities.Speciality_Id=Doctor_Speciality.SpecialityId
  AND
  Sections.Section_Id=Specialities.SectionId
  AND
  Appointments.PatientId=Patients.Patient_Id
  and
  Patients.Patient_Id=@Patient_Id
  and
 Doctors.Doctor_Id=@Doctor_Id
End