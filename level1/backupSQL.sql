prompt PL/SQL Developer import file
prompt Created on Wednesday, April 21, 2021 by aviya
set feedback off
set define off
prompt Creating AREA...
create table AREA
(
  area_id   NUMBER(3) not null,
  area_name VARCHAR2(20) not null
)
;
alter table AREA
  add primary key (AREA_ID)
;

prompt Creating CITY...
create table CITY
(
  city_name VARCHAR2(20) not null,
  city_id   NUMBER(3) not null,
  area_id   NUMBER(3) not null
)
;
alter table CITY
;
alter table CITY
  add foreign key (AREA_ID)
  references AREA (AREA_ID);

prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  department_id   NUMBER(5) not null,
  department_name VARCHAR2(15) not null
)
;
alter table DEPARTMENT
  add primary key (DEPARTMENT_ID)
;

prompt Creating AGENT_RATING...
create table AGENT_RATING
(
  agent_id       NUMBER(5) not null,
  agent_name     VARCHAR2(20) not null,
  agent_hireyear NUMBER(4) not null,
  agent_salary   NUMBER(8,2) not null,
  department_id  NUMBER(5) not null,
  city_id        NUMBER(3) not null
)
;
alter table AGENT_RATING
  add primary key (AGENT_ID)
;
alter table AGENT_RATING
  add foreign key (DEPARTMENT_ID)
  references DEPARTMENT (DEPARTMENT_ID);
alter table AGENT_RATING
  add foreign key (CITY_ID)
  references CITY (CITY_ID);

prompt Creating BRAND...
create table BRAND
(
  brand_id   NUMBER(8) not null,
  brand_name VARCHAR2(20) not null
)
;
alter table BRAND
  add primary key (BRAND_ID)
;

prompt Creating CLIENT...
create table CLIENT
(
  client_phonenr VARCHAR2(10) not null,
  client_id      NUMBER(5) not null,
  client_name    VARCHAR2(20),
  client_address VARCHAR2(25) not null,
  city_id        NUMBER(3) not null
)
;
alter table CLIENT
  add primary key (CLIENT_ID)
;
alter table CLIENT
  add foreign key (CITY_ID)
  references CITY (CITY_ID);

prompt Creating MODEL...
create table MODEL
(
  model_id         NUMBER(5) not null,
  model_seats      NUMBER(2) not null,
  model_color      VARCHAR2(6) not null,
  model_price      NUMBER(8,2) not null,
  model_hasbooster VARCHAR2(4) not null,
  brand_id         NUMBER(8) not null
)
;
alter table MODEL
  add primary key (MODEL_ID)
;
alter table MODEL
  add foreign key (BRAND_ID)
  references BRAND (BRAND_ID);

prompt Creating VEHICLE...
create table VEHICLE
(
  vehicle_licensenumber NUMBER(8) not null,
  model_id              NUMBER(5) not null
)
;
alter table VEHICLE
  add primary key (VEHICLE_LICENSENUMBER)
;
alter table VEHICLE
  add foreign key (MODEL_ID)
  references MODEL (MODEL_ID);

prompt Creating RENT...
create table RENT
(
  rent_id               NUMBER(5) not null,
  rent_begindate        DATE not null,
  rent_enddate          DATE not null,
  client_id             NUMBER(5) not null,
  agent_id              NUMBER(5) not null,
  vehicle_licensenumber NUMBER(8) not null
)
;
alter table RENT
  add primary key (RENT_ID)
;
alter table RENT
  add foreign key (CLIENT_ID)
  references CLIENT (CLIENT_ID);
alter table RENT
  add foreign key (AGENT_ID)
  references AGENT_RATING (AGENT_ID);
alter table RENT
  add foreign key (VEHICLE_LICENSENUMBER)
  references VEHICLE (VEHICLE_LICENSENUMBER);

prompt Creating REPORT_...
create table REPORT_
(
  report_id         NUMBER(8) not null,
  report_returnmode VARCHAR2(20) not null,
  report_ispaid     VARCHAR2(4) not null,
  rent_id           NUMBER(5)
)
;
alter table REPORT_
  add primary key (REPORT_ID)
;
alter table REPORT_
  add constraint SSS foreign key (RENT_ID)
  references RENT (RENT_ID);

prompt Disabling triggers for AREA...
alter table AREA disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for AGENT_RATING...
alter table AGENT_RATING disable all triggers;
prompt Disabling triggers for BRAND...
alter table BRAND disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for MODEL...
alter table MODEL disable all triggers;
prompt Disabling triggers for VEHICLE...
alter table VEHICLE disable all triggers;
prompt Disabling triggers for RENT...
alter table RENT disable all triggers;
prompt Disabling triggers for REPORT_...
alter table REPORT_ disable all triggers;
prompt Disabling foreign key constraints for CITY...
alter table CITY disable constraint SYS_C007012;
prompt Disabling foreign key constraints for AGENT_RATING...
alter table AGENT_RATING disable constraint SYS_C007026;
alter table AGENT_RATING disable constraint SYS_C007027;
prompt Disabling foreign key constraints for CLIENT...
alter table CLIENT disable constraint SYS_C007018;
prompt Disabling foreign key constraints for MODEL...
alter table MODEL disable constraint SYS_C007007;
prompt Disabling foreign key constraints for VEHICLE...
alter table VEHICLE disable constraint SYS_C007031;
prompt Disabling foreign key constraints for RENT...
alter table RENT disable constraint SYS_C007040;
alter table RENT disable constraint SYS_C007041;
alter table RENT disable constraint SYS_C007043;
prompt Disabling foreign key constraints for REPORT_...
alter table REPORT_ disable constraint SSS;
prompt Deleting REPORT_...
delete from REPORT_;
commit;
prompt Deleting RENT...
delete from RENT;
commit;
prompt Deleting VEHICLE...
delete from VEHICLE;
commit;
prompt Deleting MODEL...
delete from MODEL;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Deleting BRAND...
delete from BRAND;
commit;
prompt Deleting AGENT_RATING...
delete from AGENT_RATING;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
prompt Deleting CITY...
delete from CITY;
commit;
prompt Deleting AREA...
delete from AREA;
commit;
prompt Loading AREA...
insert into AREA (area_id, area_name)
values (1, 'jerusalem area');
insert into AREA (area_id, area_name)
values (2, 'central area');
insert into AREA (area_id, area_name)
values (3, 'north area');
insert into AREA (area_id, area_name)
values (4, 'south area');
commit;
prompt 4 records loaded
prompt Loading CITY...
insert into CITY (city_name, city_id, area_id)
values ('jerusalem', 1, 1);
insert into CITY (city_name, city_id, area_id)
values ('central', 2, 2);
insert into CITY (city_name, city_id, area_id)
values ('north', 8, 3);
insert into CITY (city_name, city_id, area_id)
values ('south', 5, 4);
commit;
prompt 4 records loaded
prompt Loading DEPARTMENT...
insert into DEPARTMENT (department_id, department_name)
values (1, ' salers');
insert into DEPARTMENT (department_id, department_name)
values (2, ' manager');
insert into DEPARTMENT (department_id, department_name)
values (6, ' secratery');
insert into DEPARTMENT (department_id, department_name)
values (5, ' boss');
insert into DEPARTMENT (department_id, department_name)
values (3, ' service');
commit;
prompt 5 records loaded
prompt Loading AGENT_RATING...
insert into AGENT_RATING (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id)
values (6, ' yaakov', 2015, 20000, 1, 1);
insert into AGENT_RATING (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id)
values (7, ' meir', 2019, 18000, 1, 2);
insert into AGENT_RATING (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id)
values (8, ' daniel', 2015, 25000, 2, 1);
insert into AGENT_RATING (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id)
values (9, ' bat sheva', 2018, 9000, 3, 8);
commit;
prompt 4 records loaded
prompt Loading BRAND...
insert into BRAND (brand_id, brand_name)
values (1, 'kia');
insert into BRAND (brand_id, brand_name)
values (2, 'mercedes');
insert into BRAND (brand_id, brand_name)
values (3, 'honda');
insert into BRAND (brand_id, brand_name)
values (4, 'fiat');
commit;
prompt 4 records loaded
prompt Loading CLIENT...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0523666898', 111, 'chaim', 'rabbi benjyamin 11', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0526697854', 112, 'ayala', 'rabbi benjyamin 1', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0505559895', 114, 'chen', 'heliyhu hakoren1 3', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0556968741', 113, 'chanan', 'hazmaut 21', 8);
commit;
prompt 4 records loaded
prompt Loading MODEL...
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (13310, 7, 'yellow', 10000, 'true', 3);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (12110, 5, 'blue', 12000, 'no', 1);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (12220, 5, 'black', 20000, 'no', 2);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (18510, 4, 'blue', 9000, 'no', 4);
commit;
prompt 4 records loaded
prompt Loading VEHICLE...
insert into VEHICLE (vehicle_licensenumber, model_id)
values (111, 13310);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (112, 12220);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (113, 18510);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (114, 13310);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (115, 13310);
commit;
prompt 5 records loaded
prompt Loading RENT...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (211, to_date('07-07-2020', 'dd-mm-yyyy'), to_date('09-08-2020', 'dd-mm-yyyy'), 113, 6, 115);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (212, to_date('02-01-2021', 'dd-mm-yyyy'), to_date('02-10-2021', 'dd-mm-yyyy'), 112, 9, 113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (314, to_date('09-10-2020', 'dd-mm-yyyy'), to_date('10-01-2020', 'dd-mm-yyyy'), 111, 6, 112);
commit;
prompt 3 records loaded
prompt Loading REPORT_...
insert into REPORT_ (report_id, report_returnmode, report_ispaid, rent_id)
values (311, 'OKAY', 'Y', 212);
insert into REPORT_ (report_id, report_returnmode, report_ispaid, rent_id)
values (312, 'OKAY', 'Y', 212);
insert into REPORT_ (report_id, report_returnmode, report_ispaid, rent_id)
values (313, 'OKAY', 'Y', 211);
insert into REPORT_ (report_id, report_returnmode, report_ispaid, rent_id)
values (414, 'OKAY', 'Y', 314);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for CITY...
alter table CITY enable constraint SYS_C007012;
prompt Enabling foreign key constraints for AGENT_RATING...
alter table AGENT_RATING enable constraint SYS_C007026;
alter table AGENT_RATING enable constraint SYS_C007027;
prompt Enabling foreign key constraints for CLIENT...
alter table CLIENT enable constraint SYS_C007018;
prompt Enabling foreign key constraints for MODEL...
alter table MODEL enable constraint SYS_C007007;
prompt Enabling foreign key constraints for VEHICLE...
alter table VEHICLE enable constraint SYS_C007031;
prompt Enabling foreign key constraints for RENT...
alter table RENT enable constraint SYS_C007040;
alter table RENT enable constraint SYS_C007041;
alter table RENT enable constraint SYS_C007043;
prompt Enabling foreign key constraints for REPORT_...
alter table REPORT_ enable constraint SSS;
prompt Enabling triggers for AREA...
alter table AREA enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for AGENT_RATING...
alter table AGENT_RATING enable all triggers;
prompt Enabling triggers for BRAND...
alter table BRAND enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for MODEL...
alter table MODEL enable all triggers;
prompt Enabling triggers for VEHICLE...
alter table VEHICLE enable all triggers;
prompt Enabling triggers for RENT...
alter table RENT enable all triggers;
prompt Enabling triggers for REPORT_...
alter table REPORT_ enable all triggers;
set feedback on
set define on
prompt Done.
