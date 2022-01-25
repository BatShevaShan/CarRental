select client_id from rent where vehicle_licensenumber in(
select vehicle_licensenumber from vehicle where model_id in (
select model_id from model where model_price >= ALL
( select model_price from model where model_id in(
select model_id from vehicle))))


select client_name, client_phonenr from client where client_id in(
select client_id from rent where rent_id in(
(select rent_id from report where report_ispaid = 'Y')))


select agent_name from agent
where agent_id in(
select agent_id from rent
group by agent_id
having count(*) > 1)


select a.agent_id, c.client_id from
agent a, client c, (select agent_id, client_id from rent) r
where a.agent_id = r.agent_id and c.client_id = r.client_id and a.city_id = c.city_id


update agent
set agent_salary = agent_salary + 1000 where agent_id in(
select agent_id from rent
group by agent_id
having count(*) > 7) and agent_salary < 15000



select * from city

update report
set report_ispaid = 'N' where rent_id = 212

delete from city c
where c.cityname= 'Arad'
