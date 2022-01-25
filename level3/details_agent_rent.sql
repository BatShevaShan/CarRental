
--view
create view details_agent_rent 
(agent_name,agent_id,rent_id,rentBeginDate, rentEndDate)
as
select agent_name, agent_id, rent_id,rent_BeginDate, rent_EndDate
from agent natural join rent


--query
select a.agent_name, a.agent_id, a.rent_id,a.rentBeginDate
from details_agent_rent a
where a.rentBeginDate > to_date('1-1-2018', 'dd-mm-YYYY')
order by a.rent_id

--query
select a.agent_name, a.agent_id, a.rentBeginDate
from details_agent_rent a
where a.rentBeginDate= to_date('7-7-2020', 'dd-mm-YYYY')


--update
update details_agent_rent a 
set a.rentBeginDate = to_date('8-7-2020', 'dd-mm-YYYY')
where a.rentbegindate = to_date('7-7-2020', 'dd-mm-YYYY')


--query
select a.agent_id, a.rentBeginDate
from details_agent_rent a
where a.rentenddate = to_date('19-04-2011', 'dd-mm-YYYY') and agent_id = 87325


--delete
delete from details_agent_rent A
where a.rentenddate = to_date('19-04-2011', 'dd-mm-YYYY') and 
agent_id = 87325
