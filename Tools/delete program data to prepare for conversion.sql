

---select count(*) from x_WalkDOC.AllDocs_LOCAL -- 11418



set nocount on; -- set nocount off;

begin tran -- rollback

set xact_abort on

-- There are no students manually added by the crosswalk import

declare @zg uniqueidentifier ; select @zg = '00000000-0000-0000-0000-000000000000'

declare @SaveStudents table (StudentID uniqueidentifier null, OldNumber varchar(50) not null, OldFirstname varchar(50) not null, OldLastname varchar(50) not null, NewNumber varchar(50), NewFirstname varchar(50) not null, NewLastname varchar(50) not null) ; 

----delete x from PrgDocument x join PrgItem i on x.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgDocument : ' + convert(varchar(10), @@rowcount)

----delete x from IepDisabilityEligibility x join PrgSection ps on x.InstanceID = ps.ID join PrgItem i on ps.ItemID = i.ID  where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'IepDisabilityEligibility : ' + convert(varchar(10), @@rowcount)
----delete x from IepGoal x join PrgGoal g on x.ID = g.ID join PrgSection ps on g.InstanceID = ps.ID join PrgItem i on ps.ItemID = i.ID  where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'IepGoal : ' + convert(varchar(10), @@rowcount)

------ objectives
----delete prgGoal where parentid in (
----	select  x.ID from PrgGoal x join PrgGoalArea ga on x.GoalAreaID = ga.ID and x.instanceID =ga.InstanceID join PrgGoals gs on ga.InstanceID = gs.ID join PrgSection ps on gs.ID = ps.ID join PrgItem i on ps.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ) ; print 'PrgGoal : ' + convert(varchar(10), @@rowcount)

----delete x 
------ select x.*
----from PrgGoal x 
------join PrgGoalArea ga on x.instanceID =ga.InstanceID -- and (x.GoalAreaID = ga.ID or x.GoalAreaID is null)
----join PrgGoals gs on x.InstanceID = gs.ID 
----join PrgSection ps on gs.ID = ps.ID 
----join PrgItem i on ps.ItemID = i.ID 
----where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents)  ; print 'PrgGoal : ' + convert(varchar(10), @@rowcount)

----delete x from PrgGoalArea x join PrgGoals gs on x.InstanceID = gs.ID join PrgSection ps on gs.ID = ps.ID join PrgItem i on ps.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents)  ; print 'PrgGoalArea : ' + convert(varchar(10), @@rowcount)
------PrgDocument : 470
------IepDisabilityEligibility : 471
------IepGoal : 1433
------PrgGoal : 2862
------PrgGoal : 1433
------PrgGoalArea : 1129

------select * from prgGoal
------select * from PrgSection where ID in ('54E0245C-944A-464F-B35B-7868F9C93E2F', 'CBB00287-CA61-4208-9DE3-04EB6AE7BE25')
------select * from PrgItem where ID in ('04442DE4-D3A2-493A-93F7-C8AD3890F2A2', '47DFD78F-641A-4D87-A6B1-C054A796830D')
------select * from Student where ID in ('322C0718-93BF-4732-B75D-201209DD989A', '1260BC9B-69D7-4377-904A-5AC2C1589727')


----delete x from IepJustification x join PrgSection ps on x.InstanceID = ps.ID join PrgItem i on ps.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'IepJustification : ' + convert(varchar(10), @@rowcount)
----delete x from IepPostSchoolArea x join PrgSection ps on x.InstanceID = ps.ID join PrgItem i on ps.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'IepPostSchoolArea : ' + convert(varchar(10), @@rowcount)
----delete x from IepSpecialFactor x join PrgSection ps on x.InstanceID = ps.ID join PrgItem i on ps.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'IepSpecialFactor : ' + convert(varchar(10), @@rowcount)
----delete x from IepTestAccom x join IepAccommodation ia on x.AccommodationID = ia.ID join IepAccommodationCategory iac on ia.CategoryID = iac.ID join PrgSection ps on ia.InstanceID = ps.ID join PrgItem i on ps.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'IepTestAccom : ' + convert(varchar(10), @@rowcount)

----delete x from PrgActivity x join PrgItem i on x.ID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgActivity : ' + convert(varchar(10), @@rowcount)
----delete x from PrgActivitySchedule x join PrgItem i on x.ItemId = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgActivitySchedule : ' + convert(varchar(10), @@rowcount)
----delete x from PrgGoal x join PrgSection ps on x.InstanceID = ps.ID join PrgItem i on ps.ItemId = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgGoal : ' + convert(varchar(10), @@rowcount)
----delete x from PrgInterventionSubVariant x join PrgItem i on x.InterventionID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgInterventionSubVariant : ' + convert(varchar(10), @@rowcount)

----delete x from PrgCrossVersionGoal x where ID not in (select CrossVersionGoalID from PrgGoal) ; print 'PrgCrossVersionGoal : ' + convert(varchar(10), @@rowcount)

----delete x from PrgItemRel x join PrgItem i on x.InitiatingItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgItemRel : ' + convert(varchar(10), @@rowcount)
----delete x from PrgItemTeamMember x join PrgItem i on x.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents)  ; print 'PrgItemTeamMember : ' + convert(varchar(10), @@rowcount)
----delete x from PrgMilestone x join PrgItem i on x.StartingItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgMilestone : ' + convert(varchar(10), @@rowcount)

----delete x from PrgActivityBatch x join PrgItem i on x.ID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgActivityBatch : ' + convert(varchar(10), @@rowcount)
----delete x from MedicaidExtractIssue x join ServiceDeliveryStudent y on y.ID = x.ServiceDeliveryStudentID where y.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'MedicaidExtractIssue : ' + convert(varchar(10), @@rowcount)
----delete x from ServiceDeliveryStudent x where x.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'ServiceDeliveryStudent : ' + convert(varchar(10), @@rowcount)

----delete x from ServicePlanDiagnosisCode x join ServicePlan y on x.PlanID = y.ID where y.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'ServicePlanDiagnosisCode : ' + convert(varchar(10), @@rowcount)

----delete x from IepServicePlan x join ServicePlan sp on x.ID = sp.ID where sp.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'IepServicePlan : ' + convert(varchar(10), @@rowcount)
----delete x from ServicePlan x where x.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'ServicePlan : ' + convert(varchar(10), @@rowcount)

----delete x from PrgSection x join PrgItem i on x.ItemID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgSection : ' + convert(varchar(10), @@rowcount)

----delete x from IepDisability x where deleteddate is not null  ; print 'IepDisability : ' + convert(varchar(10), @@rowcount) -- maintained by config import
----delete x from IepPlacementOption x where DeletedDate is not null or Sequence = 99  ; print 'IepPlacementOption : ' + convert(varchar(10), @@rowcount)-- maintained by config import

----delete x from IepDisability x where x.DeterminationFormTemplateID is null 

------ set nocount off;
------delete x from ServiceSchedule x where ID not in (select z.ID from ServiceSchedule z join ServiceScheduleServicePlan sssp on z.ID = sssp.ScheduleID join ServicePlan sp on sssp.ServicePlanID = sp.ID  where sp.StudentID in (select isnull(StudentID, @zg) from @SaveStudents) )  ; print 'ServiceSchedule : ' + convert(varchar(10), @@rowcount)-- ??
------delete x from ServiceSchedule x where ID not in (select z.ID from ServiceSchedule z join PrgLocation pl on z.LocationID = pl.ID where pl.DeletedDate is not null) ; print 'ServiceSchedule (for PrgLocation) : ' + convert(varchar(10), @@rowcount)-- ??
------delete x from Schedule x where ID not in (select ID from ServiceSchedule ss) and ID not in (select distinct ProbeScheduleID from PrgGoal)  ; print 'Schedule : ' + convert(varchar(10), @@rowcount)-- ??

------delete s
-------- select s.ID, pg.ID, ss.ID 
------from Schedule s left join 
------PrgGoal pg on s.ID = pg.ProbeScheduleID left join
------ServiceSchedule ss on ss.ID = s.ID
------where pg.ID is null and ss.ID is null

------ where the ServiceFrequency is hidden from the UI (DeletedDate is not null) delete the ServiceFrequency record
----delete ServiceFrequency where DeletedDate is not null  /* Sequence = 99 */ ; print 'ServiceFrequency : ' + convert(varchar(10), @@rowcount) -- is there any benefit in attempting to delete Legacy data?
------PrgDocument : 470
------IepDisabilityEligibility : 471
------IepGoal : 1433
------PrgGoal : 2862
------PrgGoal : 1433
------PrgGoalArea : 1129
------IepJustification : 0
------IepPostSchoolArea : 0
------IepSpecialFactor : 0
------IepTestAccom : 0
------PrgActivity : 460
------PrgActivitySchedule : 0
------PrgGoal : 0
------PrgInterventionSubVariant : 0
------PrgCrossVersionGoal : 1451
------PrgItemRel : 20
------PrgItemTeamMember : 27
------PrgMilestone : 11
------PrgActivityBatch : 0
------MedicaidExtractIssue : 0
------ServiceDeliveryStudent : 0
------ServicePlanDiagnosisCode : 0
------IepServicePlan : 1214
------ServicePlan : 1214
------PrgSection : 8441
------IepDisability : 1
------IepPlacementOption : 2
------ServiceFrequency : 0

------ commit


----begin tran -- rollback
---- where the ServiceProviderTitle record is not visible in the UI (DeletedDate is not null), the Default Provider Title is set to NULL in the ServiceDef record
--update x set DefaultProviderTitleID = NULL
--from ServiceDef x
--where x.DefaultProviderTitleID in (select ID from ServiceProviderTitle where DeletedDate is not null) ; print 'set ServiceDef.DefaultProviderTitleID = NULL for doomed ServiceProviderTitle IDs : ' + convert(varchar(10), @@rowcount) 

---- where the ServiceProviderTitle record is not visible in the UI (DeletedDate is not null), title is removed from the User's profile as their title
--update x set ProviderTitleID = NULL
--from UserProfile x
--where x.ProviderTitleID in (select ID from ServiceProviderTitle where DeletedDate is not null) ; print 'set UserProfile.ProviderTitleID = NULL for doomed ServiceProviderTitle IDs : ' + convert(varchar(10), @@rowcount) 

---- where the ServiceProviderTitle record is not visible in the UI (DeletedDate is not null), delete the record
--delete t from ServiceProviderTitle t where t.DeletedDate is not null ; print 'ServiceProviderTitle : ' + convert(varchar(10), @@rowcount) 

---- where the ServiceDef is not visible in the UI (not desired as part of the sped configuration), remove association from related records then delete the ServiceDef record
--delete x from ServiceDef sd join UserProfileServiceDefPermission x on sd.ID = x.ServiceDefID where sd.DeletedDate is not null and sd.ID not in (select DefID from ServicePlan where StudentID in (select isnull(StudentID, @zg) from @SaveStudents)) ; print 'UserProfileServiceDefPermission : ' + convert(varchar(10), @@rowcount) 
--delete x from ServiceDef sd join ServiceDefDiagnosisCode x on sd.ID = x.ServiceDefID where sd.ID   in (select ID from ServiceDef where DeletedDate is not null )and sd.ID not in (select DefID from ServicePlan where StudentID in (select isnull(StudentID, @zg) from @SaveStudents))
--delete x from ServiceDef sd join ServiceDefProcedure x on sd.ID = x.ServiceDefID where sd.ID  in (select ID from ServiceDef where DeletedDate is not null ) and sd.ID not in (select DefID from ServicePlan where StudentID in (select isnull(StudentID, @zg) from @SaveStudents))
--delete sd from ServiceDef sd where DeletedDate is not null and sd.ID in (select ID from ServiceDef where DeletedDate is not null ) and sd.ID not in (select DefID from ServicePlan where StudentID in (select isnull(StudentID, @zg) from @SaveStudents)) ; print 'ServiceDef : ' + convert(varchar(10), @@rowcount) 

---- where the PrgLocation is not visible in the UI (not desired as part of the sped configuration), remove association from related records then delete the PrgLocation record
--update sd set DefaultLocationID = NULL from ServiceDef sd where DefaultLocationID in (select ID from PrgLocation where DeletedDate is not null)
--delete PrgLocation where DeletedDate is not null ; print 'PrgLocation : ' + convert(varchar(10), @@rowcount) -- is there any benefit in attempting to delete Legacy data?

----delete x from Schedule x left join (
----	select g.ID, g.ProbeScheduleID, i.StudentID
----	from PrgGoal g join 
----		PrgSection ps on g.InstanceID = ps.ID join 
----		PrgItem i on ps.ItemID = i.ID 
----	) g on x.ID = g.ProbeScheduleID left join (
----	select sp.ID ServicePlanID, ss.ID ServiceScheduleID, sp.StudentID
----	from ServiceSchedule ss join
----		ServiceScheduleServicePlan sssp on ss.ID = sssp.ScheduleID join 
----		ServicePlan sp on sssp.ServicePlanID = sp.ID
----	) v on x.ID = v.ServiceScheduleID
----where not (v.StudentID in (select isnull(StudentID, @zg) from @SaveStudents) or g.StudentID in (select isnull(StudentID, @zg) from @SaveStudents)) ; print 'Schedule : ' + convert(varchar(10), @@rowcount) -- ?

--delete x from MedicaidCertification x ; print 'MedicaidCertification : ' + convert(varchar(10), @@rowcount)

--delete x from ServiceDelivery x join ServiceDeliveryStudent sds on x.ID = sds.DeliveryID where sds.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'ServiceDelivery : ' + convert(varchar(10), @@rowcount)
--delete x from PrgVersionIntent x join PrgItemIntent i on x.ItemIntentId = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents); print 'PrgVersionIntent : ' + convert(varchar(10), @@rowcount)
--delete x from PrgItemIntent x where x.StudentId not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgItemIntent : ' + convert(varchar(10), @@rowcount)

--delete x from ProbeScore x join ProbeTime t on x.ProbeTimeID = t.ID  where t.StudentId not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'ProbeScore : ' + convert(varchar(10), @@rowcount)
--delete x from ProbeTime x where x.StudentId not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'ProbeTime : ' + convert(varchar(10), @@rowcount)

--delete x from PrgGoalProgress x join PrgGoal g on x.GoalID = g.ID join PrgSection ps on g.InstanceID = ps.ID join PrgItem i on ps.ItemID = i.ID where i.StudentId not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgGoalProgress : ' + convert(varchar(10), @@rowcount)
--delete x from FormInstanceBatch x join FormInstance fi on x.Id = fi.FormInstanceBatchId join StudentForm sf on fi.Id = sf.Id where sf.StudentId not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'FormInstanceBatch : ' + convert(varchar(10), @@rowcount)

--delete x from FormInstanceBatchRule x ; print 'FormInstanceBatchRule : ' + convert(varchar(10), @@rowcount)
--delete x from FormInstanceInterval x join PrgItemForm pif on x.InstanceId = pif.ID join PrgItem i on pif.ItemID = i.ID where i.StudentId not in (select isnull(StudentID, @zg) from @SaveStudents)  ; print 'FormInstanceInterval : ' + convert(varchar(10), @@rowcount)

--delete x from StudentFormInstanceBatch x join FormInstance fi on x.id = fi.FormInstanceBatchID join StudentForm sf on fi.ID = sf.ID where sf.StudentId not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'StudentFormInstanceBatch : ' + convert(varchar(10), @@rowcount)

--delete x from PrgSection x join PrgItem y on y.ID = x.ItemID where y.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgSection : ' + convert(varchar(10), @@rowcount)

--delete x from FormInstance x join PrgItemForm pif on x.Id = pif.ID join PrgItem i on pif.ItemID = i.ID where i.StudentId not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'FormInstance : ' + convert(varchar(10), @@rowcount)

--delete x from PrgActivitySchedule x join PrgItem y on y.ID = x.ItemId where y.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgActivitySchedule : ' + convert(varchar(10), @@rowcount)

--delete x from PrgActivitySchedule x join IntvTool y on y.ID = x.ToolID join PrgItem z on z.ID = y.InterventionID where z.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgActivitySchedule : ' + convert(varchar(10), @@rowcount)

--delete x from IntvTool x join PrgItem y on y.ID = x.InterventionID where y.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgActivitySchedule : ' + convert(varchar(10), @@rowcount)

--delete x from PrgMatrixOfServices x join PrgItem i on x.ID = i.ID where i.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgMatrixOfServices : ' + convert(varchar(10), @@rowcount)

---- drop the table if it's there
----if object_id ('x_DATATEAM.AttachmentBackup_FileID') is not null
----drop table x_DATATEAM.AttachmentBackup_FileID

---- save ids to later delete only imported files
--if object_id ('x_DATATEAM.AttachmentBackup_FileID') is null
--begin
--select FileID
--into x_DATATEAM.AttachmentBackup_FileID -- need this to delete 
--from Attachment
---- there should be no attachments before go-live
--end
----set ServiceDef.DefaultProviderTitleID = NULL for doomed ServiceProviderTitle IDs : 0
----set UserProfile.ProviderTitleID = NULL for doomed ServiceProviderTitle IDs : 0
----ServiceProviderTitle : 0
----UserProfileServiceDefPermission : 12
----ServiceDef : 3
----PrgLocation : 1
----MedicaidCertification : 1
----ServiceDelivery : 0
----PrgVersionIntent : 14
----PrgItemIntent : 24
----ProbeScore : 3
----ProbeTime : 3
----PrgGoalProgress : 0
----FormInstanceBatch : 0
----FormInstanceBatchRule : 0
----FormInstanceInterval : 6112
----StudentFormInstanceBatch : 0
----PrgSection : 0
----FormInstance : 6112
----PrgActivitySchedule : 0
----PrgActivitySchedule : 0
----PrgActivitySchedule : 0
----PrgMatrixOfServices : 0
-- commit



begin tran -- rollback

set xact_abort on

-- There are no students manually added by the crosswalk import

--declare @zg uniqueidentifier ; select @zg = '00000000-0000-0000-0000-000000000000'

--declare @SaveStudents table (StudentID uniqueidentifier null, OldNumber varchar(50) not null, OldFirstname varchar(50) not null, OldLastname varchar(50) not null, NewNumber varchar(50), NewFirstname varchar(50) not null, NewLastname varchar(50) not null) ; 

--delete x from PrgItem x where x.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgItem : ' + convert(varchar(10), @@rowcount)
--delete x from PrgInvolvement x where x.StudentID not in (select isnull(StudentID, @zg) from @SaveStudents) ; print 'PrgInvolvement : ' + convert(varchar(10), @@rowcount)

---- where the PrgStatus was added by data conversion (sequence = 99) or hidden from the UI (DeletedDate is not null) remove this status from the PrgItemOutcome, then delete the PrgStatus record
--delete dbo.PrgItemOutcome where NextStatusID in (select ID from PrgStatus where IsExit = 1 and ProgramID = 'F98A8EF2-98E2-4CAC-95AF-D7D89EF7F80C' and (DeletedDate is not null or Sequence = 99)) ; print 'PrgItemOutcome : ' + convert(varchar(10), @@rowcount) 
--delete PrgStatus where IsExit = 1 and ProgramID = 'F98A8EF2-98E2-4CAC-95AF-D7D89EF7F80C' and (DeletedDate is not null or Sequence = 99) ; print 'PrgStatus : ' + convert(varchar(10), @@rowcount) 

--delete x from MosRatingDef x join PrgGoalAreaDef d on x.IepGoalAreaDefID = x.ID where d.DeletedDate is not null and d.Sequence = 99

--delete x from PrgGoalAreaDef x where x.DeletedDate is not null and x.Sequence = 99 

-- delete duplicate schools imported previously
--delete pts
---- select pts.*
--from (select Number from School where deleteddate is null group by Number having COUNT(*) > 1) n
--join School h on n.Number = h.Number and h.ManuallyEntered = 1 
--join ProbeTypeSchool pts on h.ID = pts.SchoolID ; print 'ProbeTypeSchool : ' + convert(varchar(10), @@rowcount) 

---- where duplicate schools have been manually entered, save 1 of them
--delete h
---- select h.*
--from (select Number from School where deleteddate is null group by Number having COUNT(*) > 1) n
--join School h on n.Number = h.Number and h.ManuallyEntered = 1 
--where convert(varchar(36), h.ID) > (
--	select top 1 convert(varchar(36), hd.ID)
--	from School hd 
--	where hd.Number = h.Number 
--	order by hd.ManuallyEntered desc, hd.Street, convert(varchar(36), hd.ID) -- 1. save the SIS entered duplicate school,   2) keep the one with a street address, 3) arbitrarily order by GUID to pick one at random
--	) ; print 'School : ' + convert(varchar(10), @@rowcount)
----The DELETE statement conflicted with the REFERENCE constraint "FK_Student#ResidenceSchool#". The conflict occurred in database "Enrich_SCBOCES_Dev", table "dbo.Student", column 'ResidenceSchoolID'.

--/*
---- select * from school where Number in ('4860', '4860')

--select Number, sum(case when DeletedDate is null then 0 else 1 end) as Deleted
--from School
--group by Number
--having count(*) > 1

--select * from School where Number in ('0066', '4860') order by Number, DeletedDate


--select h.Number, h.Name, count(*) tot
--from Student s
--join School h on s.ResidenceSchoolID = h.ID
--where ResidenceSchoolID in ('E86C8D3C-1F6C-4E61-8A50-321CE6013FFA', '2ED5329E-07D0-414F-9AA4-3E02E50B2F59', '8CA6B912-9A9F-43F8-8A85-3E82B73628DF')
--group by h.Number, h.Name
----4860	La Veta Elementary	6
----4860	La Veta Elementary School	3
----4860	La Veta Elementary School (preschool)	4

--x_datateam.findguid 'E86C8D3C-1F6C-4E61-8A50-321CE6013FFA'
--select * from dbo.IepDemographics where HomeSchoolID = 'E86C8D3C-1F6C-4E61-8A50-321CE6013FFA'
--select * from dbo.IepDemographics where ServiceSchoolID = 'E86C8D3C-1F6C-4E61-8A50-321CE6013FFA'
--select * from dbo.School where ID = 'E86C8D3C-1F6C-4E61-8A50-321CE6013FFA'
--select * from dbo.Student where ResidenceSchoolID = 'E86C8D3C-1F6C-4E61-8A50-321CE6013FFA'





--x_datateam.findguid '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from dbo.AuditLogEntry where TargetID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from dbo.ClassRoster where SchoolID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from ENRICH.MAP_SchoolID where DestID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from ENRICH.MAP_SchoolID where ID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from dbo.PrgItem where SchoolID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from dbo.School where ID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from dbo.Student where CurrentSchoolID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from dbo.Student where ResidenceSchoolID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from dbo.StudentSchool where SchoolID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'
--select * from dbo.StudentSchoolHistory where SchoolID = '2ED5329E-07D0-414F-9AA4-3E02E50B2F59'





--x_datateam.findguid '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.AuditLogEntry where ContextID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.ClassRoster where SchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from ENRICH.MAP_SchoolID where DestID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from ENRICH.MAP_SchoolID where ID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.PrgItem where SchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.ProbeTypeSchool where SchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.School where ID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.Student where CurrentSchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.Student where ResidenceSchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.StudentSchool where SchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.StudentSchoolHistory where SchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.Teacher where CurrentSchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.TeacherSchoolHistory where SchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'
--select * from dbo.UserProfileSchool where SchoolID = '8CA6B912-9A9F-43F8-8A85-3E82B73628DF'









--*/







---- delete soft-deleted schools
--delete pts
---- select pts.*
--from (select Number from School where deleteddate is not null ) n
--join School h on n.Number = h.Number and h.ManuallyEntered = 1 
--join ProbeTypeSchool pts on h.ID = pts.SchoolID ; print 'ProbeTypeSchool : ' + convert(varchar(10), @@rowcount) 

--delete x
---- select x.*
--from ProbeTypeSchool x join 
--School s on x.SchoolID = s.ID
--where s.ManuallyEntered = 1

--delete x
--from School x 
--where x.ManuallyEntered = 1
--and not exists (select 1 from Student where ResidenceSchoolID = x.ID)

--delete h
---- select h.*
--from (select Number from School where deleteddate is not null) n
--join School h on n.Number = h.Number and h.ManuallyEntered = 1 and h.ID not in (select SchoolID from dbo.T_FCAT_ReadingAndMath union select ResidenceSchoolID from Student) ; print 'School : ' + convert(varchar(10), @@rowcount)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--delete x
--from PrgItemIntent x
--left join @SaveStudents s on x.StudentId = s.StudentID
--where s.StudentID is null ; print 'PrgItemIntent : ' + convert(varchar(10), @@rowcount)

--delete s
---- select s.ManuallyEntered, s.*
--from (select Number = isnull(Number,'') from Student group by isnull(Number,'') having COUNT(*) > 1 ) n join 
--Student s on n.Number = s.Number and s.ManuallyEntered = 1 and s.IsActive = 1 left join
--@SaveStudents z on s.ID = z.StudentID ; print 'Student by Number : ' + convert(varchar(10), @@rowcount)
declare @zg uniqueidentifier ; select @zg = '00000000-0000-0000-0000-000000000000'

declare @SaveStudents table (StudentID uniqueidentifier null, OldNumber varchar(50) not null, OldFirstname varchar(50) not null, OldLastname varchar(50) not null, NewNumber varchar(50), NewFirstname varchar(50) not null, NewLastname varchar(50) not null) ; 


---- the from and where clauses must match for the next 2 queries
--delete sgs
--from (select FirstName, LastName, DOB from Student where IsActive = 1 group by FirstName, LastName, DOB having COUNT(*) > 1 ) fld join 
--Student s on fld.FirstName = s.FirstName and fld.LastName = s.LastName and fld.DOB = s.DOB and s.ManuallyEntered = 1 and s.IsActive = 1 join
--StudentGroupStudent sgs on s.ID = sgs.StudentID left join
--@SaveStudents z on s.ID = z.StudentID 
--where z.OldNumber is null ; print 'StudentGroupStudent by Last, First, DOB : ' + convert(varchar(10), @@rowcount)

-- what are we trying to delete here?
-- delete s
select s.ManuallyEntered, s.*
from (
	select FirstName, LastName, DOB, count(*) tot
	from Student 
	where IsActive = 1 
	group by FirstName, LastName, DOB 
	having COUNT(*) > 1 
	) fld join 
Student s on fld.FirstName = s.FirstName and fld.LastName = s.LastName and fld.DOB = s.DOB and s.ManuallyEntered = 1 and s.IsActive = 1 left join
@SaveStudents z on s.ID = z.StudentID 
where z.OldNumber is null and
s.ID not in (select Student2ID from StudentRecordException) ; print 'Student by Last, First, DOB : ' + convert(varchar(10), @@rowcount)
go
--Msg 547, Level 16, State 0, Line 14
--The DELETE statement conflicted with the REFERENCE constraint "FK_StudentRosterYearInformation#Student#StudentRosterYearInformations". The conflict occurred in database "Enrich_DC3_CO_SCBOCES", table "dbo.StudentRosterYear", column 'StudentId'.


select s.Number, s.FirstName, s.middlename, s.LastName, s.dob, s.ManuallyEntered, s.IsActive
from (
	select FirstName, LastName, DOB, count(*) tot
	from Student 
	where IsActive = 1 
	group by FirstName, LastName, DOB 
	having COUNT(*) > 1 
	) fld join 
Student s on fld.FirstName = s.FirstName and fld.LastName = s.LastName and fld.DOB = s.DOB /* and s.ManuallyEntered = 1 */ and s.IsActive = 1 
order by s.LastName, s.FirstName, s.DOB






-- break the association between the mosratingdef and PrgGoalAreas that will be deleted.  is this okay?
update dbo.MosRatingDef set IepGoalAreaDefID = NULL where IepGoalAreaDefID in (select ID from dbo.PrgGoalAreaDef where DeletedDate is not null ) -- is this okay?


--Msg 9002, Level 17, State 4, Line 172
--The transaction log for database 'Enrich_DC3_CO_SCBOCES' is full. To find out why space in the log cannot be reused, see the log_reuse_wait_desc column in sys.databases

-- select log_reuse_wait_desc, * from sys.databases where name = 'Enrich_DC3_CO_SCBOCES'


delete dbo.PrgGoalAreaDef where DeletedDate is not null -- gg
--The DELETE statement conflicted with the REFERENCE constraint "FK_PrgGoal#AreaOfNeed#Goals". The conflict occurred in database "Enrich_SCBOCES_Dev", table "dbo.PrgGoal", column 'GoalAreaID'.
--The DELETE statement conflicted with the REFERENCE constraint "FK_PrgGoal#AreaOfNeed#Goals". The conflict occurred in database "Enrich_SCBOCES_Dev", table "dbo.PrgGoal", column 'GoalAreaID'.
--The DELETE statement conflicted with the REFERENCE constraint "FK_PrgGoal#AreaOfNeed#Goals". The conflict occurred in database "Enrich_SCBOCES_Dev", table "dbo.PrgGoal", column 'GoalAreaID'.
--The DELETE statement conflicted with the REFERENCE constraint "FK_PrgGoal#AreaOfNeed#Goals". The conflict occurred in database "Enrich_SCBOCES_Dev", table "dbo.PrgGoal", column 'GoalAreaID'.

go

-- delete orphaned map table records (mostly for lookups) -- select * from x_WalkIEP.MAP_IepRefID

if exists (select 1 from sys.schemas where name = 'x_WalkIEP')
begin

	print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX DELETING x_WalkIEP XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

	if exists (select 1 from sys.objects where name = 'x_WalkIEP.MAP_IepRefID')
	begin
		delete x -- select *
		from x_WalkIEP.MAP_IepRefID x -- map
		where DestID not in (select ID from PrgItem) -- destination
		print 'x_WalkIEP.MAP_IepRefID : ' +convert(varchar(10), @@rowcount)
	end

	if exists (select 1 from sys.objects where name = 'x_WalkIEP.MAP_PrgSectionID_NonVersioned')
	begin
		delete x -- select *
		from x_WalkIEP.MAP_PrgSectionID_NonVersioned x -- map
		where DestID not in (select ID from PrgSection) -- destination
		print 'x_WalkIEP.MAP_PrgSectionID_NonVersioned : ' +convert(varchar(10), @@rowcount)
	end

	if object_id('x_WalkIEP.MAP_OrgUnitID') is not null
	begin
		delete x -- select *
		from x_WalkIEP.MAP_OrgUnitID x -- map
		where DestID not in (select ID from OrgUnit) -- destination
		print 'x_WalkIEP.MAP_OrgUnitID : ' +convert(varchar(10), @@rowcount)
	end

	if object_id('x_WalkIEP.MAP_StudentRefID') is not null
	begin
		delete x -- select *
		from x_WalkIEP.MAP_StudentRefID s join
		dbo.Student x on s.DestID = x.ID 
		where x.ManuallyEntered = 1
		print 'dbo.Student (manually entered) : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_StudentRefID x -- map
		--where DestID not in (select ID from Student) -- destination ------------------------------ we want all of them gone.  what about their manually added student records?
		print 'x_WalkIEP.MAP_StudentRefID : ' +convert(varchar(10), @@rowcount)

		print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 05 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

		delete x -- select *
		from x_WalkIEP.MAP_PrgVersionID x -- map
		where DestID not in (select ID from PrgVersion) -- destination
		print 'x_WalkIEP.MAP_PrgVersionID : ' +convert(varchar(10), @@rowcount)

		-- new
		if exists (select 1 from sys.objects where name = 'x_WalkIEP.MAP_PrgGoalAreaDefID' and type = 'U')
		begin
			delete x -- select *
			from x_WalkIEP.MAP_PrgGoalAreaDefID x -- map
			where DestID not in (select ID from PrgGoal) -- destination
			print 'x_WalkIEP.MAP_PrgGoalAreaDefID : ' +convert(varchar(10), @@rowcount)
		end

		delete x -- select *
		from x_WalkIEP.MAP_PrgGoalID x -- map
		where DestID not in (select ID from PrgGoal) -- destination
		print 'x_WalkIEP.MAP_PrgGoalID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_IepPlacementID x -- map
		where DestID not in (select ID from IepPlacement) -- destination
		print 'x_WalkIEP.MAP_IepPlacementID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_ServiceProviderTitleID x -- map
		where DestID not in (select ID from ServiceProviderTitle) -- destination
		print 'x_WalkIEP.MAP_ServiceProviderTitleID : ' +convert(varchar(10), @@rowcount)

		print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 10 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

		delete x -- select *
		from x_WalkIEP.MAP_ScheduleID x -- map
		where DestID not in (select ID from Schedule) -- destination
		print 'x_WalkIEP.MAP_ScheduleID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_ServicePlanID x -- map
		where DestID not in (select ID from ServicePlan) -- destination
		print 'x_WalkIEP.MAP_ServicePlanID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_IepDisabilityEligibilityID  x -- map
		where DestID not in (select ID from IepDisabilityEligibility) -- destination
		print 'x_WalkIEP.MAP_IepDisabilityEligibilityID  : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_PrgLocationID x -- map
		where DestID not in (select ID from PrgLocation) -- destination
		print 'x_WalkIEP.MAP_PrgLocationID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_IepDisabilityID x -- map
		where DestID not in (select ID from IepDisability) -- destination
		print 'x_WalkIEP.MAP_IepDisabilityID : ' +convert(varchar(10), @@rowcount)

		print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 15 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

		delete x -- select *
		from x_WalkIEP.MAP_GradeLevelID x -- map
		where DestID not in (select ID from GradeLevel) -- destination
		print 'x_WalkIEP.MAP_GradeLevelID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_ServiceFrequencyID x -- map
		where DestID not in (select ID from ServiceFrequency) -- destination
		print 'x_WalkIEP.MAP_ServiceFrequencyID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_ServiceCategoryID x -- map
		where DestID not in (select ID from ServiceCategory) -- destination
		print 'x_WalkIEP.MAP_ServiceCategoryID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_PrgInvolvementID x -- map
		where DestID not in (select ID from PrgInvolvement) -- destination
		print 'x_WalkIEP.MAP_PrgInvolvementID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_PrgGoalAreaID x -- 
		where DestID not in (select ID from PrgGoalArea) -- destination
		print 'x_WalkIEP.MAP_PrgGoalArea : ' +convert(varchar(10), @@rowcount)

		print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 20 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

		delete x -- select *
		from x_WalkIEP.MAP_SchoolID x -- map
		where DestID not in (select ID from School) -- destination
		print 'x_WalkIEP.MAP_SchoolID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_PrgGoalObjectiveID x -- map
		where DestID not in (select ID from PrgGoal) -- destination
		print 'x_WalkIEP.MAP_PrgGoalObjectiveID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_PrgSectionID x -- map
		where DestID not in (select ID from PrgSection) -- destination
		print 'x_WalkIEP.MAP_PrgSectionID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_ServiceDefID x -- map
		where DestID not in (select ID from ServiceDef) -- destination
		print 'x_WalkIEP.MAP_ServiceDefID : ' +convert(varchar(10), @@rowcount)

		delete x -- select *
		from x_WalkIEP.MAP_IepPlacementOptionID x -- map
		where DestID not in (select ID from IepPlacementOption) -- destination
		print 'x_WalkIEP.MAP_IepPlacementOptionID : ' +convert(varchar(10), @@rowcount)

		print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 25 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

		delete x -- select *
		from x_WalkIEP.MAP_PrgStatusID x -- map
		where DestID not in (select ID from PrgStatus) -- destination
		print 'x_WalkIEP.MAP_PrgStatusID : ' +convert(varchar(10), @@rowcount)

		if exists (select 1 from sys.objects where name = 'x_WalkIEP.Lookups')
		begin
			drop view x_WalkIEP.Lookups
			drop table x_WalkIEP.Lookups_LOCAL
		end
	end
end
go


print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 27 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
-- x_Walk data (BIP and Eval)

--if object_Id('x_Walk.MAP_AttendanceSchools') is not null
--exec x_walk.DeletePrevious 'ALL'
--go


--if object_id('x_Walk.DeletePrevious') is not null
--drop proc x_Walk.DeletePrevious

--if object_id('x_Walk.FormInputFields') is not null
--drop view x_Walk.FormInputFields


print 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 29 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

-- fail orphaned data import tasks
update t set StatusID = 'F'
-- select * 
from VC3TaskScheduler.ScheduledTask t
where TaskTypeID = 'F03A0C51-7294-4B57-AFB7-AFF136E4025F' 
and (isnull(StatusID,'P') in ('P', 'R'))
go

delete t
-- select * 
from VC3TaskScheduler.ScheduledTask t
where TaskTypeID = 'F03A0C51-7294-4B57-AFB7-AFF136E4025F' -- order by starttime desc
and StartTime is null
go

--select * from sys.objects where name= 'Transform_IepPlacement_Function'


-- drop all objects in import schemas
declare @o varchar(100), @ut varchar(2), @n varchar(5), @q varchar(max); select @n = '
'
declare O cursor for 
select o.name, o.type from sys.schemas s join sys.objects o on s.schema_id = o.schema_id where s.name = 'x_WalkIEP' and o.type in ('U', 'V', 'P', 'TF') order by o.type desc, o.name

open O
fetch O into @o, @ut

while @@fetch_status = 0
begin

set @q = 'print ''dropping x_WalkIEP.'+@o+'''
if exists (select 1 from sys.schemas s join sys.objects o on s.schema_id = o.schema_id where s.name = ''x_WalkIEP'' and o.name = '''+@o+''')
drop '+case @ut when  'V' then 'view ' when 'U' then 'table ' when 'P' then 'proc ' when 'TF' then 'function ' end+ 'x_WalkIEP.'+ @o+@n+@n

exec (@q)
--print @q

fetch O into @o, @ut
end
close O
deallocate O

go



declare @o varchar(100), @ut varchar(2), @n varchar(5), @q varchar(max); select @n = '
'

-- x_WalkDOC
declare O cursor for 
select o.name, o.type from sys.schemas s join sys.objects o on s.schema_id = o.schema_id where s.name = 'x_WalkDOC' and o.type in ('U', 'V', 'P', 'TF') order by o.type desc, o.name

open O
fetch O into @o, @ut

while @@fetch_status = 0
begin

set @q = 'if exists (select 1 from sys.schemas s join sys.objects o on s.schema_id = o.schema_id where s.name = ''x_WalkDOC'' and o.name = '''+@o+''')
drop '+case @ut when  'V' then 'view ' when 'U' then 'table ' when 'P' then 'proc ' when 'TF' then 'function ' end+ 'x_WalkDOC.'+ @o+@n+@n

exec (@q)

fetch O into @o, @ut
end
close O
deallocate O

go





declare @o varchar(100), @ut varchar(2), @n varchar(5), @q varchar(max); select @n = '
'

-- x_Walk
declare O cursor for 
select o.name, o.type from sys.schemas s join sys.objects o on s.schema_id = o.schema_id where s.name = 'x_Walk' and o.type in ('U', 'V', 'P', 'TF') order by o.type desc, o.name

open O
fetch O into @o, @ut

while @@fetch_status = 0
begin

set @q = 'if exists (select 1 from sys.schemas s join sys.objects o on s.schema_id = o.schema_id where s.name = ''x_Walk'' and o.name = '''+@o+''')
drop '+case @ut when  'V' then 'view ' when 'U' then 'table ' when 'P' then 'proc ' when 'TF' then 'function ' end+ 'x_Walk.'+ @o+@n+@n

exec (@q)

fetch O into @o, @ut
end
close O
deallocate O






UPDATE SystemSettings SET SecurityRebuiltDate = NULL

declare @t varchar(100) --, @q varchar(max)
declare T cursor for 
select DestTable from VC3ETL.LoadTable where ExtractDatabase = '004B264C-83C2-4BC9-8140-8BEE09B7FD06' and DestTable is not null and DestTable not like 'x_WalkIEP%'
union 
select 'PrgDocument'
union
select 'FormTemplate'
union
select DestTable from VC3ETL.LoadTable where ExtractDatabase = '35612529-9F3D-4971-A3DD-90E795E39080' and DestTable is not null and DestTable not like 'x_LEGACYGIFT%'

open T 
fetch T into @t

while @@fetch_status = 0
begin

set @q = 'DBCC DBREINDEX ('+@t+') WITH NO_INFOMSGS'
exec (@q)

fetch T into @t
end
close T
deallocate T



delete v
-- select v.* 
from VC3Deployment.Version v
where Module in ('x_WalkIEP', 'x_WalkDOC', 'x_Walk')

delete d
-- select *
from VC3Deployment.ModuleDependency d
where UsedBy in ('x_Walk', 'x_WalkIEP', 'x_WalkDOC')

delete m
-- select m.*
from VC3Deployment.Module m where ID in ('x_Walk', 'x_WalkIEP', 'x_WalkDOC')


if exists (select 1 from sys.schemas where name = 'x_Walk')
drop schema x_Walk 

if exists (select 1 from sys.schemas where name = 'x_WalkIEP')
drop schema x_WalkIEP

if exists (select 1 from sys.schemas where name = 'x_WalkDOC')
drop schema x_WalkDOC

commit

-- rollback 

/*

PrgDocument : 0
IepDisabilityEligibility : 7237
IepGoal : 21991
PrgGoal : 43982
PrgGoal : 21991
PrgGoalArea : 19279
IepJustification : 0
IepPostSchoolArea : 0
IepSpecialFactor : 0
IepTestAccom : 0
PrgActivity : 0
PrgActivitySchedule : 0
PrgGoal : 0
PrgInterventionSubVariant : 0
PrgCrossVersionGoal : 21991
PrgItemRel : 0
PrgItemTeamMember : 0
PrgMilestone : 7229
PrgActivityBatch : 0
MedicaidExtractIssue : 0
ServiceDeliveryStudent : 0
ServicePlanDiagnosisCode : 0
IepServicePlan : 16127
ServicePlan : 16127
PrgSection : 123029
IepDisability : 0
IepPlacementOption : 2
ServiceSchedule : 16127
ServiceSchedule (for PrgLocation) : 0
Schedule : 16127
ServiceFrequency : 0
set ServiceDef.DefaultProviderTitleID = NULL for doomed ServiceProviderTitle IDs : 0
set UserProfile.ProviderTitleID = NULL for doomed ServiceProviderTitle IDs : 0
ServiceProviderTitle : 0
UserProfileServiceDefPermission : 0
ServiceDef : 8
PrgLocation : 1
Schedule : 0
MedicaidCertification : 0
ServiceDelivery : 0
PrgVersionIntent : 1
PrgItemIntent : 4
ProbeScore : 0
ProbeTime : 0
PrgGoalProgress : 0
FormInstanceBatch : 0
FormInstanceBatchRule : 0
FormInstanceInterval : 86844
StudentFormInstanceBatch : 0
PrgSection : 0
FormInstance : 86844
PrgActivitySchedule : 0
PrgActivitySchedule : 0
PrgActivitySchedule : 0
PrgMatrixOfServices : 0
PrgItem : 7237
PrgInvolvement : 7237
PrgItemOutcome : 0
PrgStatus : 0
ProbeTypeSchool : 0
School : 0
ProbeTypeSchool : 0
School : 0
PrgItemIntent : 0
Student by Number : 0
StudentGroupStudent by Last, First, DOB : 0
Student by Last, First, DOB : 0
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX DELETING x_WalkIEP XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
x_WalkIEP.MAP_OrgUnitID : 0
dbo.Student (manually entered) : 0
x_WalkIEP.MAP_StudentRefID : 0
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 05 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
x_WalkIEP.MAP_PrgVersionID : 7237
x_WalkIEP.MAP_PrgGoalID : 21991
x_WalkIEP.MAP_IepPlacementID : 7236
x_WalkIEP.MAP_ServiceProviderTitleID : 0
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 10 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
x_WalkIEP.MAP_ScheduleID : 16127
x_WalkIEP.MAP_ServicePlanID : 16127
x_WalkIEP.MAP_IepDisabilityEligibilityID  : 7237
x_WalkIEP.MAP_PrgLocationID : 1
x_WalkIEP.MAP_IepDisabilityID : 0
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 15 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
x_WalkIEP.MAP_GradeLevelID : 0
x_WalkIEP.MAP_ServiceFrequencyID : 0
x_WalkIEP.MAP_ServiceCategoryID : 0
x_WalkIEP.MAP_PrgInvolvementID : 7237
x_WalkIEP.MAP_PrgGoalArea : 19279
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 20 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
x_WalkIEP.MAP_SchoolID : 0
x_WalkIEP.MAP_PrgGoalObjectiveID : 43982
x_WalkIEP.MAP_PrgSectionID : 108555
x_WalkIEP.MAP_ServiceDefID : 8
x_WalkIEP.MAP_IepPlacementOptionID : 2
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 25 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
x_WalkIEP.MAP_PrgStatusID : 0
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 27 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 29 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
dropping x_WalkIEP.ClassroomAccommodations
dropping x_WalkIEP.ClassroomAccommodationsFlagsPivot
dropping x_WalkIEP.ClassroomAccommodationsTextsPivot
dropping x_WalkIEP.District
dropping x_WalkIEP.Encore_EligibilityDate_V
dropping x_WalkIEP.Encore_TestAccommodations
dropping x_WalkIEP.Encore_TestParticipation
dropping x_WalkIEP.EvaluateIncomingItems
dropping x_WalkIEP.Goal
dropping x_WalkIEP.GoalAreaExists
dropping x_WalkIEP.GoalAreaPivotView
dropping x_WalkIEP.GoalExtract_Encore
dropping x_WalkIEP.IEP
dropping x_WalkIEP.ImportPrgSectionsFormTemplates
dropping x_WalkIEP.MAP_SpedStaffMemberView
dropping x_WalkIEP.MaxESY
dropping x_WalkIEP.MeetingParticipantsExtract_DETAIL
dropping x_WalkIEP.MeetingParticipantsExtract_MAIN
dropping x_WalkIEP.MeetingParticipantsTextsPivot
dropping x_WalkIEP.Objective
dropping x_WalkIEP.ObjectiveExtract_Encore
dropping x_WalkIEP.PostSchoolAreaPivotView
dropping x_WalkIEP.PostSchoolGoalsExtract
dropping x_WalkIEP.PostSchoolGoalsTextsPivot
dropping x_WalkIEP.PresentLevelsExtract
dropping x_WalkIEP.PresentLevelsTextsPivot
dropping x_WalkIEP.PrimaryGoalAreaPerGoal
dropping x_WalkIEP.PriorWrittenNotice
dropping x_WalkIEP.PriorWrittenNoticeTextsPivot
dropping x_WalkIEP.ProcSafeguardsDatesPivot
dropping x_WalkIEP.ProcSafeguardsExtract
dropping x_WalkIEP.School
dropping x_WalkIEP.SchoolProgressFrequency
dropping x_WalkIEP.SelectLists
dropping x_WalkIEP.SelectListsUniqueLabel
dropping x_WalkIEP.Service
dropping x_WalkIEP.ServiceDelivery
dropping x_WalkIEP.ServiceDeliveryTextsPivot
dropping x_WalkIEP.ServiceExtract_Encore
dropping x_WalkIEP.ServiceExtract_Encore_Split
dropping x_WalkIEP.ServiceStartEndDates
dropping x_WalkIEP.SpecialFactors
dropping x_WalkIEP.SpecialFactorsFlagsPivot
dropping x_WalkIEP.SpecialFactorsTextsPivot
dropping x_WalkIEP.SpedStaffMember
dropping x_WalkIEP.StaffSchool
dropping x_WalkIEP.StateDistrictParticipationDef
dropping x_WalkIEP.Student
dropping x_WalkIEP.StudentDisability
dropping x_WalkIEP.StudentDisabilityPivot
dropping x_WalkIEP.StudentDisabilitySequenced
dropping x_WalkIEP.StudentPrimaryDisab
dropping x_WalkIEP.StudentView
dropping x_WalkIEP.SubGoalAreaPivotView
dropping x_WalkIEP.TeamMember
dropping x_WalkIEP.TestAccommodations_MAIN
dropping x_WalkIEP.TestAccommodationsTextsPivot
dropping x_WalkIEP.TestParticipation_Detail
dropping x_WalkIEP.Transform_Ethnicity
dropping x_WalkIEP.Transform_FormInputDateValue
dropping x_WalkIEP.Transform_FormInputFlagValue
dropping x_WalkIEP.Transform_FormInputTextValue
dropping x_WalkIEP.Transform_FormInputValue
dropping x_WalkIEP.Transform_GradeLevel
dropping x_WalkIEP.Transform_IepDates
dropping x_WalkIEP.Transform_IepDemographics
dropping x_WalkIEP.Transform_IepDisability
dropping x_WalkIEP.Transform_IepDisabilityEligibility
dropping x_WalkIEP.Transform_IepEligibilityDetermination
dropping x_WalkIEP.Transform_IepESY
dropping x_WalkIEP.Transform_IepGoal
dropping x_WalkIEP.Transform_IepGoalPostSchoolAreaDef
dropping x_WalkIEP.Transform_IepLeastRestrictiveEnvironment
dropping x_WalkIEP.Transform_IepPlacement
dropping x_WalkIEP.Transform_IepPlacementOption
dropping x_WalkIEP.Transform_IepService
dropping x_WalkIEP.Transform_IepServicePlan_ss
dropping x_WalkIEP.Transform_IepServices
dropping x_WalkIEP.Transform_IepTestParticipation
dropping x_WalkIEP.Transform_OrgUnit
dropping x_WalkIEP.Transform_Person
dropping x_WalkIEP.Transform_PrgConsent
dropping x_WalkIEP.Transform_PrgDocument
dropping x_WalkIEP.Transform_PrgGoal
dropping x_WalkIEP.Transform_PrgGoalArea
dropping x_WalkIEP.Transform_PrgGoalarea_goals
dropping x_WalkIEP.Transform_PrgGoalareaDef
dropping x_WalkIEP.Transform_PrgGoalObjective
dropping x_WalkIEP.Transform_PrgGoalProgress
dropping x_WalkIEP.Transform_PrgGoalProgress_Objective
dropping x_WalkIEP.Transform_PrgGoals
dropping x_WalkIEP.Transform_PrgGoalSecondaryGoalAreaDef
dropping x_WalkIEP.Transform_PrgGoalSubGoalAreaDef
dropping x_WalkIEP.Transform_PrgIep
dropping x_WalkIEP.Transform_PrgInvolvement
dropping x_WalkIEP.Transform_PrgInvolvementTeamMember
dropping x_WalkIEP.Transform_PrgItemTeamMember
dropping x_WalkIEP.Transform_PrgLocation
dropping x_WalkIEP.Transform_PrgSection
dropping x_WalkIEP.Transform_PrgSectionFormInstance
dropping x_WalkIEP.Transform_PrgStatus
dropping x_WalkIEP.Transform_PrgSubGoalAreaDef
dropping x_WalkIEP.Transform_Schedule
dropping x_WalkIEP.Transform_School
dropping x_WalkIEP.Transform_ServiceCategory
dropping x_WalkIEP.Transform_ServiceDef
dropping x_WalkIEP.Transform_ServiceFrequency
dropping x_WalkIEP.Transform_ServiceProviderTitle
dropping x_WalkIEP.Transform_ServiceSchedule
dropping x_WalkIEP.Transform_StaffSchool
dropping x_WalkIEP.Transform_Student
dropping x_WalkIEP.Transform_StudentSchoolAndGrade
dropping x_WalkIEP.Transform_UserProfile
dropping x_WalkIEP.Transform_UserProfileOrgUnit
dropping x_WalkIEP.Transform_UserProfileSchool
dropping x_WalkIEP.AssessmentParticipations
dropping x_WalkIEP.AssessmentTests
dropping x_WalkIEP.ClassroomAccommodations_LOCAL
dropping x_WalkIEP.CO_IEP_Page02_MtgPart_RAW
dropping x_WalkIEP.District_LOCAL
dropping x_WalkIEP.DistrictSchoolLeadingZeros
dropping x_WalkIEP.Encore_AttributeMetadata_RAW
dropping x_WalkIEP.Encore_CO_AnnualReview_RAW
dropping x_WalkIEP.Encore_CO_Consent_InvitingAgencies_RAW
dropping x_WalkIEP.Encore_CO_EvaluationReport_RAW
dropping x_WalkIEP.Encore_CO_IEP_Page01_Information_RAW
dropping x_WalkIEP.Encore_CO_IEP_Page02_MtgPart_RAW
dropping x_WalkIEP.Encore_CO_IEP_Page03_RAW
dropping x_WalkIEP.Encore_CO_IEP_page04a_TransServ_RAW
dropping x_WalkIEP.Encore_CO_IEP_page04b_TransitionServices_RAW
dropping x_WalkIEP.Encore_CO_IEP_Page06_ServicesLRE_RAW
dropping x_WalkIEP.Encore_CO_IEP_Page07_ParentConsent_RAW
dropping x_WalkIEP.Encore_CO_IEP_Page08_RAW
dropping x_WalkIEP.Encore_CO_PriorNotice_ConsentForEval_RAW
dropping x_WalkIEP.Encore_CO_PriorWrittenNotice_RAW
dropping x_WalkIEP.Encore_CO_StudentTransfer_RAW
dropping x_WalkIEP.Encore_CO_TransferReview_NextEligMtg_RAW
dropping x_WalkIEP.Encore_CodeClient_RAW
dropping x_WalkIEP.Encore_CustomAttributeMetadata_RAW
dropping x_WalkIEP.Encore_Customization_RAW
dropping x_WalkIEP.Encore_CustomOutcomeAttribute_RAW
dropping x_WalkIEP.Encore_CustomOutcomeAttributeData_RAW
dropping x_WalkIEP.Encore_DisabilityCodes_V_RAW
dropping x_WalkIEP.Encore_District_RAW
dropping x_WalkIEP.Encore_Event_RAW
dropping x_WalkIEP.Encore_EventFormFieldMaster_RAW
dropping x_WalkIEP.Encore_EventGoal_RAW
dropping x_WalkIEP.Encore_EventGoalObj_RAW
dropping x_WalkIEP.Encore_EventGoalObjAttribute_RAW
dropping x_WalkIEP.Encore_EventGroup_RAW
dropping x_WalkIEP.Encore_EventType_RAW
dropping x_WalkIEP.Encore_GRAttributeMaster_RAW
dropping x_WalkIEP.Encore_GRServiceArea_RAW
dropping x_WalkIEP.Encore_GRServiceAreaGoal_RAW
dropping x_WalkIEP.Encore_IEP_RAW
dropping x_WalkIEP.Encore_Outcome_RAW
dropping x_WalkIEP.Encore_OutcomeAttributeMaster_RAW
dropping x_WalkIEP.Encore_ReferenceCode_RAW
dropping x_WalkIEP.Encore_ReferenceType_RAW
dropping x_WalkIEP.Encore_School_RAW
dropping x_WalkIEP.Encore_Student_RAW
dropping x_WalkIEP.Encore_StudentStatus_RAW
dropping x_WalkIEP.Goal_LOCAL
dropping x_WalkIEP.IEP_LOCAL
dropping x_WalkIEP.ImportPrgSections
dropping x_WalkIEP.MAP_AdminUnitID
dropping x_WalkIEP.MAP_EncoreEnrich_ServiceDef
dropping x_WalkIEP.MAP_EthnicityID
dropping x_WalkIEP.MAP_FormInputValue_Services
dropping x_WalkIEP.MAP_FormInputValueID
dropping x_WalkIEP.MAP_FormInstance_Services
dropping x_WalkIEP.MAP_FormInstanceID
dropping x_WalkIEP.MAP_FormInstanceInterval_Services
dropping x_WalkIEP.MAP_GoalAreaPivot
dropping x_WalkIEP.MAP_GradeLevelID
dropping x_WalkIEP.MAP_IepDisabilityEligibilityID
dropping x_WalkIEP.MAP_IepDisabilityID
dropping x_WalkIEP.MAP_IepPlacementID
dropping x_WalkIEP.MAP_IepPlacementOptionID
dropping x_WalkIEP.MAP_IepPlacementTypeID
dropping x_WalkIEP.MAP_IepRefID
dropping x_WalkIEP.MAP_IEPStudentRefID
dropping x_WalkIEP.MAP_IepTestParticipationID
dropping x_WalkIEP.MAP_OrgUnitID
dropping x_WalkIEP.MAP_PersonID
dropping x_WalkIEP.MAP_PostSchoolAreaDefID
dropping x_WalkIEP.MAP_PrgDocumentID
dropping x_WalkIEP.MAP_PrgGoalareaDefID
dropping x_WalkIEP.MAP_PrgGoalareaID
dropping x_WalkIEP.MAP_PrgGoalID
dropping x_WalkIEP.MAP_PrgGoalObjectiveID
dropping x_WalkIEP.MAP_PrgInvolvementID
dropping x_WalkIEP.MAP_PrgInvolvementTeamMemberID
dropping x_WalkIEP.MAP_PrgLocationID
dropping x_WalkIEP.MAP_PrgSectionID
dropping x_WalkIEP.MAP_PrgSectionID_NonVersioned
dropping x_WalkIEP.MAP_PrgStatus_CrosswalkIEP
dropping x_WalkIEP.MAP_PrgStatusID
dropping x_WalkIEP.MAP_PrgSubGoalAreaDefID
dropping x_WalkIEP.MAP_PrgVersionID
dropping x_WalkIEP.MAP_ScheduleID
dropping x_WalkIEP.MAP_SchoolID
dropping x_WalkIEP.MAP_ServiceCategoryID
dropping x_WalkIEP.MAP_ServiceDefID
dropping x_WalkIEP.MAP_ServiceFrequencyID
dropping x_WalkIEP.MAP_ServicePlanID
dropping x_WalkIEP.MAP_ServiceProviderTitleID
dropping x_WalkIEP.MAP_StudentRefID
dropping x_WalkIEP.MAP_StudentRefIDAll
dropping x_WalkIEP.Map_SubGoalArea
dropping x_WalkIEP.MeetingParticipantsExtract_DETAIL_LOCAL
dropping x_WalkIEP.MeetingParticipantsExtract_MAIN_LOCAL
dropping x_WalkIEP.MostRecentIEPandAmmendments
dropping x_WalkIEP.Objective_LOCAL
dropping x_WalkIEP.PostSchoolGoals_LOCAL
dropping x_WalkIEP.PresentLevels_LOCAL
dropping x_WalkIEP.PrgItemOutcome_EndIEP
dropping x_WalkIEP.PriorWrittenNotice_LOCAL
dropping x_WalkIEP.ProcSafeguards_LOCAL
dropping x_WalkIEP.School_LOCAL
dropping x_WalkIEP.SchoolProgressFrequency_LOCAL
dropping x_WalkIEP.SelectLists_LOCAL
dropping x_WalkIEP.Service_LOCAL
dropping x_WalkIEP.ServiceExtract_Encore_LOCAL
dropping x_WalkIEP.SpecialFactors_LOCAL
dropping x_WalkIEP.SpedStaffMember_LOCAL
dropping x_WalkIEP.StaffSchool_LOCAL
dropping x_WalkIEP.Student_LOCAL
dropping x_WalkIEP.TeamMember_LOCAL
dropping x_WalkIEP.TEMP_ESYData
dropping x_WalkIEP.TestAccommodations_MAIN_LOCAL
dropping x_WalkIEP.TestParticipation_Detail_LOCAL
dropping x_WalkIEP.Transform_IepService_Snapshot
dropping x_WalkIEP.Transform_ServiceSchedule_Snapshot
dropping x_WalkIEP.Transform_IepPlacement_Function
dropping x_WalkIEP.Transform_Schedule_Function
dropping x_WalkIEP.Transform_StudentRace_Function
dropping x_WalkIEP.Create_IepService_Snapshot
dropping x_WalkIEP.Create_ServiceSchedule_Snapshot
dropping x_WalkIEP.Populate_MAP_StudentRefIDAll
dropping x_WalkIEP.PrgItem_DeleteObsoleteRecords
dropping x_WalkIEP.SpedConversionWrapUp
dropping x_WalkIEP.Transform_PrgInvolvement_Status

*/











































