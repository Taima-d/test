USE [ll]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPateintForDoc]    Script Date: 13/05/2022 17:36:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SelectAllPateintForDoc] 
  @Doctor_Id int
AS
BEGIN
  SELECT distinct Patients.Patient_Id, Users.Fname,Users.Lname,Users.Phone,DATEDIFF(month,Patients.Birthday,GETDATE())/12 age,
  Patients.BloodType,users.Gender,users.city
  from Appointments,Doctors,Users,Patients
  where
  Patients.Patient_Id=Appointments.PatientId
  and users.User_Id=Patients.UserId
    and Doctors.Doctor_Id=@Doctor_Id
End