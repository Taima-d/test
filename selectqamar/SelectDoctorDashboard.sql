USE [ll]
GO
/****** Object:  StoredProcedure [dbo].[SelectDoctorDashboard]    Script Date: 13/05/2022 17:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SelectDoctorDashboard] 
  @Doctor_Id int
AS
BEGIN
select users.Fname,users.Lname,Patients.Patient_Id,TimeSlots.Date,TimeSlots.TS_Start,
Appointments.Description
from  Appointments ,TimeSlots,Availabilities,Doctors,Users,Patients
  where TimeSlots.TS_Id=Appointments.TimeSlotId
  and Availabilities.Availability_Id=TimeSlots.AvailabilityId
  and Doctors.Doctor_Id=Availabilities.DoctorId
  and Users.User_Id=Patients.UserId
  and Appointments.PatientId=Patients.Patient_Id
  and  Doctors.Doctor_Id= @Doctor_Id
  and Appointments.Status like 3
  end