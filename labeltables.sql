create table bes_plabels
(	pl_cust		char(14),
	pl_label	char(60),
	pl_printer	char(60),
	pl_copies	int
)

CREATE UNIQUE INDEX [ixbes_plabel] ON [dbo].[bes_plabels] 
(
	[pl_cust] ASC
)

create table bes_plabelq
(
	plq_id		[dbo].[serial] IDENTITY(1,1) NOT NULL,
	plq_delv	[int],
	plg_date	[datetime],
	plq_status	char(1),
	plq_cust	char(14)
)

CREATE UNIQUE INDEX [ixbes_plabelq] ON [dbo].[bes_plabelq] 
(
	[plq_id] ASC
)

USE [efacdb]
GO
/****** Object:  Trigger [dbo].[trg_printlabels]    Script Date: 01/06/2010 16:02:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[trg_printlabels]
on [dbo].[bes_plabelq]
for insert
as
BEGIN

	EXEC msdb.dbo.sp_start_job @job_name = 'test'

END

truncate table bes_plabelq
select * from bes_plabelq

select * from bes_plabels
update bes_plabels set pl_printer = 'Gerry'
update bes_plabels  set pl_printer = 'RICOH Aficio 1032 PCL 6'

insert into bes_plabelq
(plq_delv, plg_date, plq_status, plq_cust)
values
(1017, getdate(), 'N', 'LIGHTBODY')