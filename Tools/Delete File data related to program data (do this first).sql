
/*
	Ran out of transaction log space when attempting to delete all imported files at once.
	Using this method to delete small batches of files at a time.
	Query was taking a very long time, so we are showing a count of seconds per batch of 100 FileData records

*/


begin tran -- rollback
delete x from Attachment x 
where x.label like '%[0-9][0-9]/[0-9][0-9]/[1-2][0-9][0-9][0-9]' -- all x_walk imported files have this naming convention.
--(8096 row(s) affected)

commit

set nocount on;
declare @fdct int, @starttime datetime, @endtime datetime, @sec varchar(10), @rowcount varchar(10)
select @fdct = count(*) from x_DATATEAM.AttachmentBackup_FileID y join FileData z on y.FileID = z.ID
select @fdct

while @fdct > 0 
begin

select @starttime = getdate()
begin tran
delete x 
from FileData x 
join (select top 100 * from x_DATATEAM.AttachmentBackup_FileID y join FileData z on y.FileID = z.ID) b on x.ID = b.FileID

select @rowcount = @@rowcount -- right after the delete statement to show precise record count. only last batch may not be 100 
select @endtime = getdate()
select @sec = datediff(ss, @starttime, @endtime)

commit
print @rowcount+'	rows processed in	'+@sec+' seconds'

select @fdct = count(*) from x_DATATEAM.AttachmentBackup_FileID y join FileData z on y.FileID = z.ID
end
