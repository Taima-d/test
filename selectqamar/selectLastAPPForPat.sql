USE [ll]
GO
/****** Object:  StoredProcedure [dbo].[selectLastAPPForPat]    Script Date: 13/05/2022 17:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectLastAPPForPat]
@Patient_Id int,@Doctor_Id int
as
begin 
select distinct max(TimeSlots.TS_Start) 'TS_Start',max(TimeSlots.Date) 'Date'
from Patients,Doctors,Availabilities,Appointments,TimeSlots
 
where
Doctors.Doctor_Id=Availabilities.DoctorId
and
Availabilities.Availability_Id=TimeSlots.AvailabilityId
and
TimeSlots.TS_Id=Appointments.TimeSlotId
and
Patients.Patient_Id=Appointments.PatientId
and
Patients.Patient_Id=@Patient_Id
and
Doctors.Doctor_Id=@Doctor_Id
End