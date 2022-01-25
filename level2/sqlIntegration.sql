select * from client a where a.clientid not in(select client_id from client1);

insert into client1 t (t.client_id, t.client_name, t.client_phonenr, t.client_address, t.city_id) 
select s.clientid, s.clientname, s.phonenr, s.address, s.cityid
from client s
where s.clientid not in (select client_id from client1);



select * from department a where a.d_id not in(select department_id 
from department1);


select count(*) from area;
select count(*) from area1;

select * from area a where a.areaid not in(select area_id from area1);

insert into area1 t (t.area_id, t.area_name) 
select s.areaid, s.areaname
from area s
where s.areaid not in (select area_id from area1);


