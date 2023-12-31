USE [Tabibi]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllAPPfordoc]    Script Date: 13/05/2022 17:34:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SelectAllAPPfordoc] 
  @Doctor_Id int
AS
BEGIN
  SELECT p.Fname,p.Lname,TimeSlots.Date , TimeSlots.TS_Start,p.phone,p.City,p.Email
  from Appointments , TimeSlots,Availabilities,Doctors,Users p,Patients,users D
  where TimeSlots.TS_Id=Appointments.TimeSlotId
  and Availabilities.Availability_Id=TimeSlots.AvailabilityId
  and Doctors.Doctor_Id=Availabilities.DoctorId
  and p.User_Id=Patients.UserId
  and D.User_Id=Doctors.UserId
  and Appointments.PatientId=Patients.Patient_Id
  and  Doctors.Doctor_Id=  @Doctor_Id
  and Appointments.Status like 3
End