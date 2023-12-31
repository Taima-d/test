USE [ll]
GO
/****** Object:  StoredProcedure [dbo].[SelectPateintProfile]    Script Date: 13/05/2022 17:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SelectPateintProfile] 
  @Patient_Id int
AS
BEGIN
  SELECT distinct Patients.Patient_Id, Users.Fname,Users.Lname,Users.Phone,DATEDIFF(month,Patients.Birthday,GETDATE())/12 age,
  Patients.BloodType,users.Gender,users.city
  from Appointments,Doctors,Users,Patients
  where
  users.User_Id=Patients.UserId
   and Patients.Patient_Id=@Patient_Id
   End