prompt PL/SQL Developer import file
prompt Created on יום שלישי 15 יוני 2021 by Batsheva
set feedback off
set define off
prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  department_id   NUMBER(5) not null,
  department_name VARCHAR2(15) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEPARTMENT
  add primary key (DEPARTMENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AGENT...
create table AGENT
(
  agent_id       NUMBER(5) not null,
  agent_name     VARCHAR2(20) not null,
  agent_hireyear NUMBER(4) not null,
  agent_salary   NUMBER(8,2) not null,
  department_id  NUMBER(5) not null,
  city_id        NUMBER(3) not null,
  specialization VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AGENT
  add primary key (AGENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AGENT
  add foreign key (DEPARTMENT_ID)
  references DEPARTMENT (DEPARTMENT_ID);
grant select on AGENT to AVIYA;

prompt Creating CATEGORY...
create table CATEGORY
(
  category_id   NUMBER(2) not null,
  category_name VARCHAR2(100) not null,
  color         VARCHAR2(10) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CATEGORY
  add primary key (CATEGORY_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AUTHOR...
create table AUTHOR
(
  author_id   NUMBER(5) not null,
  author_name VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AUTHOR
  add primary key (AUTHOR_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BOOK...
create table BOOK
(
  b_id        NUMBER(5) not null,
  book_name   VARCHAR2(200) not null,
  picture     VARCHAR2(300),
  author_id   NUMBER(5) not null,
  category_id NUMBER(2) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BOOK
  add primary key (B_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BOOK
  add foreign key (CATEGORY_ID)
  references CATEGORY (CATEGORY_ID);
alter table BOOK
  add foreign key (AUTHOR_ID)
  references AUTHOR (AUTHOR_ID);

prompt Creating MADAF...
create table MADAF
(
  madaf_id    NUMBER(5) not null,
  category_id NUMBER(2) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MADAF
  add primary key (MADAF_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MADAF
  add foreign key (CATEGORY_ID)
  references CATEGORY (CATEGORY_ID);

prompt Creating STATUS...
create table STATUS
(
  status_id   NUMBER(5) not null,
  status_name VARCHAR2(100) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table STATUS
  add primary key (STATUS_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ALL_BOOKS...
create table ALL_BOOKS
(
  book_id   NUMBER(5) not null,
  status_id NUMBER(5) not null,
  b_id      NUMBER(5) not null,
  madaf_id  NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ALL_BOOKS
  add primary key (BOOK_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ALL_BOOKS
  add foreign key (MADAF_ID)
  references MADAF (MADAF_ID);
alter table ALL_BOOKS
  add foreign key (B_ID)
  references BOOK (B_ID);
alter table ALL_BOOKS
  add foreign key (STATUS_ID)
  references STATUS (STATUS_ID);

prompt Creating AREA...
create table AREA
(
  area_id   NUMBER(3) not null,
  area_name VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AREA
  add primary key (AREA_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BRAND...
create table BRAND
(
  brand_id   NUMBER(8) not null,
  brand_name VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BRAND
  add primary key (BRAND_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CITY...
create table CITY
(
  cityid   NUMBER(3) not null,
  cityname VARCHAR2(200) default 'moshe' not null,
  areaid   NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CITY
  add primary key (CITYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CLIENT...
create table CLIENT
(
  client_phonenr VARCHAR2(10) not null,
  client_id      NUMBER(5) not null,
  client_name    VARCHAR2(20),
  client_address VARCHAR2(25),
  city_id        NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLIENT
  add primary key (CLIENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HASHALA...
create table HASHALA
(
  hashala_id   NUMBER(5) not null,
  taken_date   DATE,
  recived_date DATE,
  recived      NUMBER(1),
  book_id      NUMBER(5),
  client_id    NUMBER(5),
  agent_id     NUMBER(5)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HASHALA
  add primary key (HASHALA_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HASHALA
  add foreign key (BOOK_ID)
  references ALL_BOOKS (BOOK_ID);

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
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MODEL
  add primary key (MODEL_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MODEL
  add foreign key (BRAND_ID)
  references BRAND (BRAND_ID);

prompt Creating VEHICLE...
create table VEHICLE
(
  vehicle_licensenumber NUMBER(8) not null,
  model_id              NUMBER(5) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VEHICLE
  add primary key (VEHICLE_LICENSENUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RENT
  add primary key (RENT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RENT
  add foreign key (CLIENT_ID)
  references CLIENT (CLIENT_ID);
alter table RENT
  add foreign key (AGENT_ID)
  references AGENT (AGENT_ID);
alter table RENT
  add foreign key (VEHICLE_LICENSENUMBER)
  references VEHICLE (VEHICLE_LICENSENUMBER);

prompt Creating REPORT...
create table REPORT
(
  report_id         NUMBER(5) not null,
  report_returnmode NVARCHAR2(20),
  report_ispaid     NVARCHAR2(20),
  rent_id           NUMBER(5)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REPORT
  add primary key (REPORT_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table REPORT
  add constraint SSSSSSS foreign key (RENT_ID)
  references RENT (RENT_ID);

prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for AGENT...
alter table AGENT disable all triggers;
prompt Disabling triggers for CATEGORY...
alter table CATEGORY disable all triggers;
prompt Disabling triggers for AUTHOR...
alter table AUTHOR disable all triggers;
prompt Disabling triggers for BOOK...
alter table BOOK disable all triggers;
prompt Disabling triggers for MADAF...
alter table MADAF disable all triggers;
prompt Disabling triggers for STATUS...
alter table STATUS disable all triggers;
prompt Disabling triggers for ALL_BOOKS...
alter table ALL_BOOKS disable all triggers;
prompt Disabling triggers for AREA...
alter table AREA disable all triggers;
prompt Disabling triggers for BRAND...
alter table BRAND disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
prompt Disabling triggers for CLIENT...
alter table CLIENT disable all triggers;
prompt Disabling triggers for HASHALA...
alter table HASHALA disable all triggers;
prompt Disabling triggers for MODEL...
alter table MODEL disable all triggers;
prompt Disabling triggers for VEHICLE...
alter table VEHICLE disable all triggers;
prompt Disabling triggers for RENT...
alter table RENT disable all triggers;
prompt Disabling triggers for REPORT...
alter table REPORT disable all triggers;
prompt Disabling foreign key constraints for AGENT...
alter table AGENT disable constraint SYS_C007149;
prompt Disabling foreign key constraints for BOOK...
alter table BOOK disable constraint SYS_C007558;
alter table BOOK disable constraint SYS_C007559;
prompt Disabling foreign key constraints for MADAF...
alter table MADAF disable constraint SYS_C007563;
prompt Disabling foreign key constraints for ALL_BOOKS...
alter table ALL_BOOKS disable constraint SYS_C007572;
alter table ALL_BOOKS disable constraint SYS_C007573;
alter table ALL_BOOKS disable constraint SYS_C007574;
prompt Disabling foreign key constraints for HASHALA...
alter table HASHALA disable constraint SYS_C007589;
prompt Disabling foreign key constraints for MODEL...
alter table MODEL disable constraint SYS_C007165;
prompt Disabling foreign key constraints for VEHICLE...
alter table VEHICLE disable constraint SYS_C007169;
prompt Disabling foreign key constraints for RENT...
alter table RENT disable constraint SYS_C007177;
alter table RENT disable constraint SYS_C007178;
alter table RENT disable constraint SYS_C007179;
prompt Disabling foreign key constraints for REPORT...
alter table REPORT disable constraint SSSSSSS;
prompt Deleting REPORT...
delete from REPORT;
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
prompt Deleting HASHALA...
delete from HASHALA;
commit;
prompt Deleting CLIENT...
delete from CLIENT;
commit;
prompt Deleting CITY...
delete from CITY;
commit;
prompt Deleting BRAND...
delete from BRAND;
commit;
prompt Deleting AREA...
delete from AREA;
commit;
prompt Deleting ALL_BOOKS...
delete from ALL_BOOKS;
commit;
prompt Deleting STATUS...
delete from STATUS;
commit;
prompt Deleting MADAF...
delete from MADAF;
commit;
prompt Deleting BOOK...
delete from BOOK;
commit;
prompt Deleting AUTHOR...
delete from AUTHOR;
commit;
prompt Deleting CATEGORY...
delete from CATEGORY;
commit;
prompt Deleting AGENT...
delete from AGENT;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
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
insert into DEPARTMENT (department_id, department_name)
values (11, 'QA');
insert into DEPARTMENT (department_id, department_name)
values (21, 'Payment');
insert into DEPARTMENT (department_id, department_name)
values (31, 'D');
insert into DEPARTMENT (department_id, department_name)
values (41, 'F');
insert into DEPARTMENT (department_id, department_name)
values (51, 'G');
insert into DEPARTMENT (department_id, department_name)
values (61, 'H');
insert into DEPARTMENT (department_id, department_name)
values (71, 'F');
commit;
prompt 12 records loaded
prompt Loading AGENT...
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (6, ' yaakov', 2015, 20000, 1, 1, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (7, ' meir', 2019, 18000, 1, 2, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (8, ' daniel', 2015, 25000, 2, 1, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (9, ' bat sheva', 2018, 13000, 3, 8, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (73237, 'Kylie', 2018, 25972.49, 21, 116, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (58234, 'Thelma', 2008, 10223.16, 21, 699, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (67788, 'Wallace', 2007, 23639.29, 3, 286, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (43839, 'Terri', 2015, 12612.42, 31, 292, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (36148, 'Bridget', 2020, 20203.61, 41, 628, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (65285, 'Russell', 2001, 35490.73, 2, 216, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (67718, 'Meredith', 2017, 14380.36, 3, 1, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (87483, 'Humberto', 2017, 11446.91, 3, 642, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (99835, 'Ray', 2021, 7651.68, 3, 262, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (23484, 'Julianne', 2021, 37409.95, 6, 698, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (33256, 'James', 2018, 6667.37, 11, 116, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (31194, 'Larenz', 2014, 36793.66, 31, 731, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (37792, 'Charlton', 2006, 37575.99, 41, 119, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (48819, 'Sissy', 2020, 39772.2, 3, 172, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (99923, 'Geoff', 2020, 4940.09, 5, 388, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (22231, 'Chet', 2001, 28967.68, 11, 849, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (95296, 'Ernest', 2017, 31266.59, 61, 734, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (77497, 'Gran', 2018, 17331.15, 21, 116, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (32422, 'Kitty', 2006, 12683.63, 11, 579, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (55331, 'Timothy', 2004, 8498.2, 5, 225, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (71864, 'Humberto', 2017, 5795.19, 3, 176, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (91753, 'Annie', 2003, 31400.39, 21, 919, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (23798, 'Marina', 2006, 24244.74, 61, 538, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (47969, 'Denise', 2015, 32413.85, 1, 276, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (59143, 'Kieran', 2004, 19018.99, 31, 579, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (19291, 'Lucy', 2007, 25826.14, 5, 699, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (97261, 'Catherine', 2008, 18023.3, 51, 664, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (11784, 'Kieran', 2016, 38902.81, 31, 225, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (82688, 'Delroy', 2005, 21959.64, 1, 225, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (17339, 'Mickey', 2017, 5334.82, 6, 677, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (96248, 'Annette', 2018, 24038.7, 11, 432, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (26284, 'Frederic', 2020, 36347.96, 41, 123, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (86171, 'James', 2007, 36557.11, 51, 172, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (22414, 'Stephen', 2001, 26255.79, 61, 323, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (72682, 'Frederic', 2007, 16871.23, 21, 699, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (52399, 'Nelly', 2012, 28737.03, 71, 426, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (82839, 'Cole', 2007, 12798.62, 41, 172, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (39662, 'Jose', 2007, 37618.96, 3, 153, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (98432, 'Kylie', 2006, 20978.52, 41, 733, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (78735, 'Howie', 2009, 19447.78, 21, 225, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (98482, 'Natasha', 2003, 11222.54, 6, 642, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (96931, 'Elisabeth', 2004, 28627.46, 51, 411, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (42865, 'Marc', 2008, 9386.88, 21, 919, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (12389, 'Joaquim', 2019, 17408.12, 61, 664, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (93474, 'Colm', 2012, 26797.27, 31, 858, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (69376, 'Joely', 2000, 26505.29, 11, 432, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (63711, 'Kurt', 2002, 13757.81, 41, 919, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (23932, 'Jamie', 2017, 7631.3, 71, 731, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (18581, 'Alex', 2010, 24175.2, 21, 432, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (66121, 'Ritchie', 2001, 20719.99, 31, 8, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (76821, 'Cloris', 2002, 27829.31, 51, 426, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (79115, 'Cameron', 2013, 38126.06, 5, 286, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (15868, 'Orlando', 2006, 32321.58, 21, 677, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (55519, 'Jean-Claude', 2011, 4580.27, 51, 318, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (54343, 'David', 2007, 8232.34, 21, 847, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (97911, 'Will', 2018, 5181.76, 6, 974, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (69417, 'Deborah', 2019, 32518.41, 2, 783, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (83126, 'Demi', 2008, 13208.7, 71, 649, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (68695, 'Albert', 2000, 10682.19, 71, 698, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (83753, 'Willie', 2014, 11028.57, 1, 849, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (23933, 'Albert', 2011, 19743.41, 11, 941, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (81766, 'Pelvic', 2003, 26889.33, 31, 461, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (88239, 'Moe', 2012, 5544.94, 51, 588, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (24794, 'Armin', 2002, 39872.62, 6, 638, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (98974, 'Jonny', 2012, 9423.83, 5, 699, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (66693, 'Ned', 2001, 8790.39, 5, 698, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (84241, 'Bridget', 2018, 18778.8, 71, 731, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (49347, 'Boz', 2006, 16306.13, 2, 734, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (65567, 'Daniel', 2020, 27565.47, 3, 461, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (79912, 'Adina', 2010, 36061.91, 41, 976, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (36383, 'Buffy', 2021, 28250.58, 11, 566, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (37652, 'Mac', 2006, 18092.59, 31, 538, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (49757, 'Jim', 2008, 8256.48, 21, 572, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (37416, 'Janice', 2002, 9308.37, 1, 388, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (45211, 'Melanie', 2003, 33427.04, 1, 697, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (51926, 'Rickie', 2016, 35326.92, 11, 116, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (77992, 'Lila', 2017, 16546.34, 71, 588, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (65682, 'Oded', 2015, 11436.4, 1, 688, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (82338, 'Adrien', 2003, 32441.34, 5, 733, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (98599, 'Geena', 2015, 35970.61, 31, 572, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (32932, 'Leo', 2018, 36699.74, 11, 225, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (25287, 'Ice', 2014, 22877.41, 11, 323, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (74937, 'Dan', 2012, 20534.41, 21, 286, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (84117, 'Lee', 2012, 33761.87, 71, 345, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (32374, 'Morgan', 2020, 9825.47, 31, 1, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (26944, 'Andre', 2020, 19185.21, 1, 276, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (49732, 'Frederic', 2001, 9871.39, 11, 237, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (57325, 'Glenn', 2015, 6500.84, 71, 345, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (44478, 'Bradley', 2016, 6880.34, 71, 432, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (42414, 'Beverley', 2019, 33008.76, 21, 688, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (79784, 'Tony', 2009, 32733.01, 3, 216, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (49477, 'Lee', 2000, 6709.65, 11, 919, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (83871, 'Mae', 2012, 5048.13, 71, 426, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (19848, 'Gwyneth', 2019, 28439.72, 5, 5, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (72683, 'Morgan', 2001, 14082.02, 3, 854, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (34594, 'Shirley', 2002, 8667.69, 51, 566, null);
commit;
prompt 100 records committed...
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (87325, 'Jeroen', 2010, 27493.4, 1, 849, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (48137, 'Ani', 2017, 5735.18, 71, 484, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (44258, 'Penelope', 2021, 7504.57, 21, 697, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (29621, 'Jean-Luc', 2012, 23821.66, 21, 1, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (20032, 'Shlomo Cohen', 2012, 2662.4, 1, 61, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (55987, 'Shmuel  Ventura', 2009, 691.2, 11, 61, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (56018, 'Moshe Suissa', 2014, 28800, 21, 31, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (56046, 'Moshe Cohen', 2000, 17408, 31, 64, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (56444, 'Yaacov Levy', 1996, 6681.6, 41, 57, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (56978, 'Ofer Tahar', 2001, 8780.8, 51, 36, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (58166, 'Gabriel Goldberg', 2004, 18867.2, 61, 48, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (59732, 'Moshe Amihud', 2006, 16563.2, 71, 52, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (59751, 'Yossef Gorodetski', 2000, 3712, 1, 67, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (60412, 'Shmuel  Bardaat', 1995, 1817.6, 11, 23, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (60797, 'Yehuda Azoulay', 2010, 21427.2, 21, 76, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (60900, 'Yoram Amichai', 2014, 21196.8, 31, 50, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (61599, 'Assaf Zalmanovitch', 2015, 9907.2, 41, 59, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (61879, 'Shimon Goldmann', 1995, 26291.2, 51, 64, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (62473, 'Gabriel Amichai', 2016, 7372.8, 61, 49, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (62659, 'Avishai Zalmanovitch', 2003, 24524.8, 71, 33, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (62733, 'Gabriel Cohen', 2015, 18944, 1, 62, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (64087, 'Assaf Levy', 2001, 20224, 11, 78, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (64819, 'Yoram Azoulay', 2004, 3123.2, 21, 29, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (65082, 'Jack Goldberg', 2011, 3481.6, 31, 30, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (65453, 'Yechiel Tahar', 2001, 17433.6, 41, 58, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (65802, 'Daniel Amihud', 2008, 19430.4, 51, 21, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (66008, 'Yaacov Amihud', 2014, 11801.6, 61, 80, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (66149, 'Yechiel Ventura', 1997, 3660.8, 71, 79, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (67188, 'Gabriel Suissa', 2005, 19660.8, 1, 72, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (67645, 'Yechiel Bardaat', 2006, 25728, 11, 15, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (67675, 'Yehuda Beneliyahu', 2008, 27852.8, 21, 25, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (68144, 'Ofer Beneliyahu', 1995, 7654.4, 31, 79, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (68373, 'Aharon Bouzaglo', 2002, 28851.2, 41, 37, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (70102, 'Ofer Zalmanovitch', 2013, 19020.8, 51, 30, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (72473, 'Yechiel Amihud', 2005, 28979.2, 61, 54, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (72529, 'Yehuda Benprat', 2001, 21632, 71, 61, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (72633, 'Daniel Cohen', 2009, 20659.2, 1, 25, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (72879, 'Amiel Gorodetski', 2001, 4096, 11, 65, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (72902, 'Avi Cohen', 2004, 14643.2, 21, 60, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (73636, 'Jack Suissa', 1995, 4838.4, 31, 65, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (73830, 'Amiel Goldberg', 2002, 4198.4, 41, 75, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (75230, 'Shimon Tahar', 2009, 7731.2, 51, 41, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (75236, 'Yoram Beneliyahu', 2001, 2252.8, 61, 59, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (75313, 'Zalman Bardaat', 1999, 6400, 71, 12, null);
insert into AGENT (agent_id, agent_name, agent_hireyear, agent_salary, department_id, city_id, specialization)
values (75679, 'Daniel Ventura', 2001, 23475.2, 1, 39, null);
commit;
prompt 145 records loaded
prompt Loading CATEGORY...
insert into CATEGORY (category_id, category_name, color)
values (1, 'פעוטות', 'לבן');
insert into CATEGORY (category_id, category_name, color)
values (2, 'ילדים', 'צהוב');
insert into CATEGORY (category_id, category_name, color)
values (3, 'נוער ומבוגרים', 'אדום');
insert into CATEGORY (category_id, category_name, color)
values (4, 'גדולי ישראל', 'ירוק');
insert into CATEGORY (category_id, category_name, color)
values (5, 'עיונית', 'סגול');
commit;
prompt 5 records loaded
prompt Loading AUTHOR...
insert into AUTHOR (author_id, author_name)
values (27, '׳׳‘׳¨׳”׳ ׳©׳•׳•׳¨׳¦׳‘׳׳•׳');
insert into AUTHOR (author_id, author_name)
values (28, '׳“׳™׳ ׳” ׳₪');
insert into AUTHOR (author_id, author_name)
values (29, '׳¨. ׳׳¨׳׳');
insert into AUTHOR (author_id, author_name)
values (30, '׳¨׳—׳ ׳©׳›׳˜׳¨');
insert into AUTHOR (author_id, author_name)
values (31, '׳¦׳‘׳™׳” ׳•׳™׳׳ ׳¡׳§׳™');
insert into AUTHOR (author_id, author_name)
values (32, '׳׳•׳¨׳™׳׳ ׳׳•׳₪׳§');
insert into AUTHOR (author_id, author_name)
values (33, '׳׳׳ ׳©׳ ׳׳׳”׳׳”');
insert into AUTHOR (author_id, author_name)
values (34, '׳׳ ׳—׳ ׳’׳¥');
insert into AUTHOR (author_id, author_name)
values (35, '׳.׳');
insert into AUTHOR (author_id, author_name)
values (36, '׳׳¨׳™׳ ׳‘׳¨׳׳');
insert into AUTHOR (author_id, author_name)
values (37, '׳¨. ׳•׳™׳ ׳’׳¨׳˜׳');
insert into AUTHOR (author_id, author_name)
values (38, '׳‘׳ ׳—׳');
insert into AUTHOR (author_id, author_name)
values (39, '׳™׳¢׳§׳‘ ׳™׳©׳¨׳׳ ׳”׳•׳₪׳§׳•׳‘׳™׳¥''');
insert into AUTHOR (author_id, author_name)
values (40, '׳™׳¢׳§׳‘ ׳§׳׳”׳');
insert into AUTHOR (author_id, author_name)
values (41, '׳ ׳×׳ ׳׳׳™ ׳¨׳•׳˜');
insert into AUTHOR (author_id, author_name)
values (42, '׳¦. ׳§׳׳™׳™׳');
insert into AUTHOR (author_id, author_name)
values (43, '׳׳›׳•׳ "׳‘׳™׳× ׳™׳—׳™׳׳"');
insert into AUTHOR (author_id, author_name)
values (44, '׳™׳•׳›׳‘׳“ ׳¡׳§׳¡');
insert into AUTHOR (author_id, author_name)
values (45, '׳. ׳¦. ׳׳₪׳¨׳×׳™');
insert into AUTHOR (author_id, author_name)
values (46, '׳׳™׳׳” ׳₪׳¨׳™׳“׳׳');
insert into AUTHOR (author_id, author_name)
values (47, '׳׳ ׳•׳—׳” ׳‘׳§׳¨׳׳');
insert into AUTHOR (author_id, author_name)
values (48, '׳™׳₪׳” ׳׳׳›׳”');
insert into AUTHOR (author_id, author_name)
values (50, '׳. ׳—׳ ׳”');
insert into AUTHOR (author_id, author_name)
values (51, '׳’. ׳§׳¦׳ ׳׳ ׳‘׳•׳’׳');
insert into AUTHOR (author_id, author_name)
values (52, '׳‘. ׳’׳•׳׳•׳׳‘׳•׳‘׳™׳¥');
insert into AUTHOR (author_id, author_name)
values (55, '׳¨. ׳₪׳¨׳™׳“׳׳');
insert into AUTHOR (author_id, author_name)
values (56, '׳׳”׳¨׳ ׳‘׳׳¨׳™');
insert into AUTHOR (author_id, author_name)
values (57, '׳¡׳₪׳¨׳™׳× ׳˜׳•׳¨');
insert into AUTHOR (author_id, author_name)
values (58, '׳–. ׳׳™׳™׳‘׳–׳•׳');
insert into AUTHOR (author_id, author_name)
values (59, '׳¨׳•׳× ׳‘׳¨׳׳•׳');
insert into AUTHOR (author_id, author_name)
values (60, '׳©.׳–. ׳–׳•׳ ׳ ׳₪׳׳“');
insert into AUTHOR (author_id, author_name)
values (61, '׳׳©׳” ׳¦׳‘׳™');
insert into AUTHOR (author_id, author_name)
values (62, '׳. ׳¦׳™׳₪׳•׳¨׳™');
insert into AUTHOR (author_id, author_name)
values (63, '׳”׳¨׳‘ ׳©׳׳¢׳•׳ ׳©׳¨ ׳©׳׳•׳');
insert into AUTHOR (author_id, author_name)
values (64, '׳.׳™. ׳”׳¨׳׳');
insert into AUTHOR (author_id, author_name)
values (65, '׳¨. ׳×׳”׳™׳׳”');
insert into AUTHOR (author_id, author_name)
values (66, '׳—. ׳“׳•׳™׳“׳•׳‘׳™׳¥');
insert into AUTHOR (author_id, author_name)
values (67, '׳™׳—׳™׳׳ ׳׳™׳›׳ ׳©׳˜׳¨׳');
insert into AUTHOR (author_id, author_name)
values (68, '׳™. ׳₪׳׳');
insert into AUTHOR (author_id, author_name)
values (69, '׳©. ׳‘׳¨׳“׳');
insert into AUTHOR (author_id, author_name)
values (70, '׳“׳•׳“ ׳”׳™׳—׳™׳׳׳™');
insert into AUTHOR (author_id, author_name)
values (71, '׳™. ׳‘׳ ׳™׳©׳™');
insert into AUTHOR (author_id, author_name)
values (72, '׳’. ׳™׳¢׳§׳‘׳™');
insert into AUTHOR (author_id, author_name)
values (73, '׳™׳©׳¨׳׳ ׳™׳¢׳§׳‘ ׳§׳׳₪׳”׳•׳׳¥');
insert into AUTHOR (author_id, author_name)
values (74, '׳’. ׳—׳ ׳•׳');
insert into AUTHOR (author_id, author_name)
values (75, '׳׳‘׳™׳¢׳–׳¨ ׳‘׳•׳¨׳©׳˜׳™׳™׳');
insert into AUTHOR (author_id, author_name)
values (76, '׳׳׳™׳¨׳” ׳׳•׳₪׳§');
insert into AUTHOR (author_id, author_name)
values (77, '׳™׳”׳•׳“׳” ׳ ׳—׳©׳•׳ ׳™');
insert into AUTHOR (author_id, author_name)
values (78, '׳”׳¨׳‘ ׳׳©׳” ׳“׳•׳¨׳•׳');
insert into AUTHOR (author_id, author_name)
values (79, '׳. ׳—׳¡׳™׳“');
insert into AUTHOR (author_id, author_name)
values (80, '׳”׳¨׳‘ ׳“. ׳׳©׳”');
insert into AUTHOR (author_id, author_name)
values (81, '׳׳©׳” ׳₪׳¨׳׳’׳¨');
insert into AUTHOR (author_id, author_name)
values (82, '׳—׳ ׳” ׳׳™׳¡׳§׳¨');
insert into AUTHOR (author_id, author_name)
values (83, '׳”׳¨׳‘ ׳’׳“׳׳™׳” ׳¡׳’׳');
insert into AUTHOR (author_id, author_name)
values (84, '׳ . ׳¡׳₪׳¨׳™׳׳');
insert into AUTHOR (author_id, author_name)
values (85, '׳¨. ׳”׳׳׳');
insert into AUTHOR (author_id, author_name)
values (86, '׳©׳׳•׳׳ ׳׳‘׳™׳©׳™ ׳©׳˜׳•׳§׳”׳•׳׳¨');
insert into AUTHOR (author_id, author_name)
values (87, '׳©׳׳׳” ׳‘׳ ׳“׳•׳“');
insert into AUTHOR (author_id, author_name)
values (88, '׳“. ׳“׳•׳‘׳™׳ ׳¡׳§׳™');
insert into AUTHOR (author_id, author_name)
values (89, '׳ ׳—׳׳” ׳—׳');
insert into AUTHOR (author_id, author_name)
values (90, '׳¨׳׳•׳‘׳ ׳¢׳׳׳¨');
insert into AUTHOR (author_id, author_name)
values (91, '׳©.׳. ׳•׳׳');
insert into AUTHOR (author_id, author_name)
values (92, '׳”׳׳ ׳׳׳‘׳¨׳˜');
insert into AUTHOR (author_id, author_name)
values (93, '׳’. ׳׳‘׳™ ׳™׳•׳¡׳£');
insert into AUTHOR (author_id, author_name)
values (94, '׳¦׳™׳¨׳” ׳§׳¨׳׳™׳ ׳©׳˜׳™׳™׳');
insert into AUTHOR (author_id, author_name)
values (95, '׳™׳¦׳—׳§ ׳׳¨׳™׳’׳•׳¨');
insert into AUTHOR (author_id, author_name)
values (96, '׳–. ׳©׳›׳ ׳•׳‘׳™׳¥');
insert into AUTHOR (author_id, author_name)
values (97, '׳. ׳¡׳•׳₪׳¨');
insert into AUTHOR (author_id, author_name)
values (98, '׳©׳•׳׳׳™׳× ׳׳–׳¨׳—׳™');
insert into AUTHOR (author_id, author_name)
values (99, '׳™׳—׳™׳׳ ׳’׳¨׳ ׳˜׳©׳˜׳™׳');
insert into AUTHOR (author_id, author_name)
values (100, '׳™׳”׳•׳“׳” ׳׳™׳‘ ׳׳•׳™׳');
insert into AUTHOR (author_id, author_name)
values (101, '׳©׳¨׳’׳ ׳•׳™׳™׳¡');
insert into AUTHOR (author_id, author_name)
values (103, '׳™׳§׳•׳×׳™׳׳ ׳™׳”׳•׳“׳” ׳’׳¨׳™׳ ׳•׳׳׳“');
insert into AUTHOR (author_id, author_name)
values (105, '׳™׳•׳›׳‘׳“ ׳¡׳’׳');
insert into AUTHOR (author_id, author_name)
values (106, '׳ ׳₪׳×׳׳™ ׳§׳¨׳׳•׳¡');
insert into AUTHOR (author_id, author_name)
values (107, '׳׳׳™׳¨ ׳׳•׳¨׳™׳™׳');
insert into AUTHOR (author_id, author_name)
values (108, '׳¨׳‘׳™ ׳©׳׳•׳׳ ׳™׳•׳¡׳£ ׳₪׳™׳');
insert into AUTHOR (author_id, author_name)
values (110, '׳׳”׳¨׳•׳ ׳¡׳•׳¨׳¡׳§׳™');
insert into AUTHOR (author_id, author_name)
values (111, '׳ . ׳׳”׳¨׳׳');
insert into AUTHOR (author_id, author_name)
values (112, '׳”׳¨׳‘ ׳¨׳׳•׳‘׳ ׳’׳¨׳•׳¡׳׳');
insert into AUTHOR (author_id, author_name)
values (113, '׳™׳¢׳§׳‘ ׳©׳׳•׳ ׳’׳₪׳ ׳¨');
insert into AUTHOR (author_id, author_name)
values (114, '׳™׳¢׳§׳‘ ׳’׳׳™׳¡');
insert into AUTHOR (author_id, author_name)
values (115, '׳”׳¨׳‘ ׳™׳׳™׳¨ ׳•׳™׳ ׳©׳˜׳•׳§');
insert into AUTHOR (author_id, author_name)
values (116, '׳©׳¨׳” ׳׳ ׳“׳׳¡׳•׳');
insert into AUTHOR (author_id, author_name)
values (117, '׳׳‘׳™׳©׳™ ׳©׳˜׳•׳§׳”׳׳¨');
insert into AUTHOR (author_id, author_name)
values (118, '׳. ׳׳•׳₪׳§');
insert into AUTHOR (author_id, author_name)
values (120, '׳”׳¨׳‘ ׳.׳. ׳™׳©׳¨');
insert into AUTHOR (author_id, author_name)
values (121, '׳₪׳ ׳—׳¡ ׳׳•׳¨');
insert into AUTHOR (author_id, author_name)
values (122, '׳©. ׳₪׳“׳');
insert into AUTHOR (author_id, author_name)
values (123, '׳‘. ׳›׳”׳');
insert into AUTHOR (author_id, author_name)
values (124, '׳‘׳ ׳™׳׳™׳ ׳׳™׳ ׳¥');
insert into AUTHOR (author_id, author_name)
values (125, '׳. ׳˜׳•׳§׳¨');
insert into AUTHOR (author_id, author_name)
values (126, '׳§׳•׳ ׳—׳•׳¦׳‘');
insert into AUTHOR (author_id, author_name)
values (127, '׳“. ׳“׳•׳‘׳™׳ ׳§׳™');
insert into AUTHOR (author_id, author_name)
values (128, '׳˜. ׳“׳•׳™׳˜׳©');
insert into AUTHOR (author_id, author_name)
values (129, '׳©. ׳‘׳¨׳™׳');
insert into AUTHOR (author_id, author_name)
values (130, '׳”׳¨׳‘ ׳. ׳©. ׳©׳׳•׳§׳׳¨');
insert into AUTHOR (author_id, author_name)
values (131, '׳׳‘׳¨׳”׳ ׳₪׳•׳§׳¡');
insert into AUTHOR (author_id, author_name)
values (132, '׳™׳§׳•׳×׳™׳׳ ׳׳¨׳™׳” ׳§׳׳׳¢׳׳”׳׳¨');
insert into AUTHOR (author_id, author_name)
values (133, '׳©׳׳•׳׳ ׳™׳¨׳•׳©׳׳׳™');
commit;
prompt 100 records committed...
insert into AUTHOR (author_id, author_name)
values (134, '׳׳™׳›׳׳ ׳‘׳¨׳׳•׳•׳¢׳¨');
insert into AUTHOR (author_id, author_name)
values (135, '׳©׳׳•׳ ׳‘׳׳•׳');
insert into AUTHOR (author_id, author_name)
values (136, '׳׳©׳” ׳©׳׳׳” ׳›׳©׳¨');
insert into AUTHOR (author_id, author_name)
values (137, '׳׳ ׳™׳“׳•׳¢');
insert into AUTHOR (author_id, author_name)
values (138, '׳׳©׳¨ ׳–׳™׳•');
insert into AUTHOR (author_id, author_name)
values (139, '׳׳׳™׳¨ ׳׳™׳™׳“׳׳‘׳•׳™׳');
insert into AUTHOR (author_id, author_name)
values (140, '׳׳¨׳™׳” ׳™׳”׳•׳“׳” ׳׳™׳‘ ׳׳™׳₪׳©׳™׳¥');
insert into AUTHOR (author_id, author_name)
values (141, '׳׳‘׳¨׳”׳ ׳‘׳¨׳¡׳׳¨');
insert into AUTHOR (author_id, author_name)
values (142, '׳¨׳‘׳™ ׳™׳§׳•׳×׳™׳׳ ׳׳¨׳™׳” ׳§׳׳׳¢׳׳”׳׳¨');
insert into AUTHOR (author_id, author_name)
values (143, '׳”׳¨׳‘ ׳ ׳×׳ ׳§׳׳ ׳¦׳§׳™');
insert into AUTHOR (author_id, author_name)
values (144, '׳׳™׳¨׳™ ׳₪׳׳¨');
insert into AUTHOR (author_id, author_name)
values (145, '׳§׳•׳¨׳׳ ׳¡׳§׳™');
insert into AUTHOR (author_id, author_name)
values (146, '׳”׳¨׳‘ ׳™. ׳׳‘׳¨׳”׳ ׳•׳•׳׳£');
insert into AUTHOR (author_id, author_name)
values (147, '׳׳©׳” ׳™׳—׳–׳§׳׳׳™');
insert into AUTHOR (author_id, author_name)
values (148, '׳“׳•׳“ ׳׳™׳‘ ׳¦׳™׳ ׳¥');
insert into AUTHOR (author_id, author_name)
values (149, '׳₪׳ ׳—׳¡ ׳₪׳¢׳¡׳™׳¡');
insert into AUTHOR (author_id, author_name)
values (150, '׳׳ ׳—׳ ׳׳ ׳“׳');
insert into AUTHOR (author_id, author_name)
values (151, '׳ ׳˜׳¢ ׳‘׳ ׳׳¨׳™');
insert into AUTHOR (author_id, author_name)
values (152, '׳׳ ׳—׳ ׳׳ ׳“׳ ׳ ׳₪׳×׳׳™ ׳¦׳‘׳™');
insert into AUTHOR (author_id, author_name)
values (154, '׳”׳¨׳‘ ׳‘׳ ׳™׳׳™׳ ׳׳₪׳¨׳×׳™');
insert into AUTHOR (author_id, author_name)
values (155, '׳‘׳×׳™׳” ׳©׳׳”׳‘');
insert into AUTHOR (author_id, author_name)
values (156, '׳–. ׳’׳•׳׳“');
insert into AUTHOR (author_id, author_name)
values (157, '׳™. ׳•׳™׳ ׳©׳˜׳•׳§');
insert into AUTHOR (author_id, author_name)
values (158, '׳¨. ׳‘׳¨׳׳•׳');
insert into AUTHOR (author_id, author_name)
values (159, '׳'' ׳‘׳ ׳©׳׳׳”');
insert into AUTHOR (author_id, author_name)
values (160, '׳”׳¨׳‘ ׳©׳׳׳” ׳›׳”׳');
insert into AUTHOR (author_id, author_name)
values (162, '׳—׳ ׳” ׳‘׳ ׳—׳™');
insert into AUTHOR (author_id, author_name)
values (163, '׳׳׳” ׳₪׳¨׳™׳“');
insert into AUTHOR (author_id, author_name)
values (165, '׳”. ׳×׳¨׳׳');
insert into AUTHOR (author_id, author_name)
values (166, '׳—׳™׳™׳ ׳׳׳™׳׳‘');
insert into AUTHOR (author_id, author_name)
values (167, '׳. ׳—׳“׳“');
insert into AUTHOR (author_id, author_name)
values (168, '׳™׳’׳™׳” ׳׳•׳¨');
insert into AUTHOR (author_id, author_name)
values (169, '׳׳‘׳™ ׳›׳×׳¨׳™׳׳');
insert into AUTHOR (author_id, author_name)
values (170, '׳©׳¨׳” ׳‘׳¨׳’׳׳');
insert into AUTHOR (author_id, author_name)
values (171, '׳—׳™׳” ׳”׳¨׳¦׳‘׳¨׳’');
insert into AUTHOR (author_id, author_name)
values (172, '׳™׳•׳ ׳” ׳ ׳•׳”');
insert into AUTHOR (author_id, author_name)
values (175, '׳©׳׳•׳׳ ׳׳¨׳’׳׳');
insert into AUTHOR (author_id, author_name)
values (176, '׳“׳‘׳•׳¨׳” ׳¦׳•׳£');
insert into AUTHOR (author_id, author_name)
values (177, '׳₪. ׳׳‘׳™׳’׳“׳•׳¨');
insert into AUTHOR (author_id, author_name)
values (180, '׳”׳“׳¡׳” ׳׳¨׳©׳×');
insert into AUTHOR (author_id, author_name)
values (181, '׳¢. ׳‘׳¨-׳›׳•׳›׳‘׳');
insert into AUTHOR (author_id, author_name)
values (182, '׳׳™׳ ׳“׳™ ׳©׳©');
insert into AUTHOR (author_id, author_name)
values (187, '׳™׳—׳™׳׳ ׳’׳¨׳™׳ ׳©׳˜׳™׳');
insert into AUTHOR (author_id, author_name)
values (188, '׳›׳×׳‘׳™ ׳ . ׳׳”׳¨׳׳');
insert into AUTHOR (author_id, author_name)
values (189, '׳™. ׳׳׳›׳”');
insert into AUTHOR (author_id, author_name)
values (190, '׳¦׳₪׳•׳¨׳” ׳׳“׳׳¨');
insert into AUTHOR (author_id, author_name)
values (191, '׳׳™׳›׳ ׳–׳™׳™׳‘׳׳“');
insert into AUTHOR (author_id, author_name)
values (192, '׳ . ׳©׳™׳™׳ ׳¨');
insert into AUTHOR (author_id, author_name)
values (193, '׳׳™׳¨׳™ ׳׳•׳™׳');
insert into AUTHOR (author_id, author_name)
values (194, '׳¨׳ ׳” ׳©׳™׳£');
insert into AUTHOR (author_id, author_name)
values (195, '׳—׳™׳™׳ ׳•׳׳“׳¨');
insert into AUTHOR (author_id, author_name)
values (196, '׳׳‘׳™׳’׳™׳ ׳©׳§׳•׳‘׳™׳¦׳§׳™');
insert into AUTHOR (author_id, author_name)
values (197, '׳¨׳—׳ ׳©׳•׳¨');
insert into AUTHOR (author_id, author_name)
values (198, '׳—׳ ׳” ׳¨׳’׳‘');
insert into AUTHOR (author_id, author_name)
values (199, '׳׳¨׳™׳ ׳›׳”׳');
insert into AUTHOR (author_id, author_name)
values (207, '׳“׳¨ ׳׳׳™׳¨ ׳•׳™׳§׳׳¨');
insert into AUTHOR (author_id, author_name)
values (208, '׳©׳׳¢׳•׳ ׳•׳׳ ׳•׳ ׳•');
insert into AUTHOR (author_id, author_name)
values (209, '׳™.׳‘׳ ׳¦׳‘׳™');
insert into AUTHOR (author_id, author_name)
values (210, '׳™׳•׳ ׳” ׳ ׳•׳•׳”');
insert into AUTHOR (author_id, author_name)
values (211, '׳₪׳ ׳—׳¡ ׳¡׳™׳¨׳§׳™׳¡');
insert into AUTHOR (author_id, author_name)
values (212, '׳™׳”׳•׳“׳™׳× ׳©׳¨׳™׳™׳‘׳¨');
insert into AUTHOR (author_id, author_name)
values (213, '׳©׳׳•׳׳ ׳¨׳•׳˜׳©׳˜׳™׳™׳');
insert into AUTHOR (author_id, author_name)
values (214, '׳™. ׳’׳¨׳ ׳˜׳©׳˜׳™׳™׳');
insert into AUTHOR (author_id, author_name)
values (215, '׳׳ ׳•׳—׳” ׳₪׳•׳§׳¡');
insert into AUTHOR (author_id, author_name)
values (216, '׳ ׳¢׳׳™ ׳¦׳•׳•׳‘׳ ׳¨');
insert into AUTHOR (author_id, author_name)
values (218, '׳. ׳‘׳× ׳׳׳');
insert into AUTHOR (author_id, author_name)
values (219, '׳’. ׳”׳׳׳™׳¨׳™');
insert into AUTHOR (author_id, author_name)
values (220, '׳™׳”׳•׳“׳™׳× ׳₪׳¨׳™׳™׳ ׳“');
insert into AUTHOR (author_id, author_name)
values (221, '׳׳”׳¨׳ ׳’׳¨׳ ׳‘׳™׳¥');
insert into AUTHOR (author_id, author_name)
values (222, '׳. ׳׳¨׳‘׳');
insert into AUTHOR (author_id, author_name)
values (223, '׳©׳¨׳” ׳§׳™׳¡׳ ׳¨');
insert into AUTHOR (author_id, author_name)
values (224, '׳׳©׳•׳׳׳™');
insert into AUTHOR (author_id, author_name)
values (226, '׳’׳™׳˜׳™ ׳”׳¨-׳˜׳•׳‘');
insert into AUTHOR (author_id, author_name)
values (227, '׳’׳׳׳™ ׳¨׳‘׳§׳”');
insert into AUTHOR (author_id, author_name)
values (228, '׳™׳”׳•׳“׳™׳× ׳’׳•׳׳');
insert into AUTHOR (author_id, author_name)
values (229, '׳—. ׳׳׳™׳׳‘');
insert into AUTHOR (author_id, author_name)
values (230, '׳©׳׳•׳׳ ׳׳‘׳™׳');
insert into AUTHOR (author_id, author_name)
values (231, '׳’. ׳”׳׳•׳™');
insert into AUTHOR (author_id, author_name)
values (232, '׳¨. ׳׳”׳¨׳•׳ ׳™');
insert into AUTHOR (author_id, author_name)
values (233, '׳—׳•׳” ׳¨׳•׳–׳ ׳‘׳¨׳’');
insert into AUTHOR (author_id, author_name)
values (234, '׳“׳‘׳•׳¨׳” ׳¨׳•׳–׳');
insert into AUTHOR (author_id, author_name)
values (236, '׳¨׳—׳ ׳©׳˜׳™׳’׳׳™׳¥');
insert into AUTHOR (author_id, author_name)
values (237, '׳™׳”׳•׳“׳™׳× ׳‘׳•׳’׳¥''');
insert into AUTHOR (author_id, author_name)
values (238, '׳׳©׳” ׳“׳•׳“ ׳₪׳׳׳•׳');
insert into AUTHOR (author_id, author_name)
values (239, '׳¨׳‘׳§׳” ׳’׳׳׳™');
insert into AUTHOR (author_id, author_name)
values (240, '׳—׳ ׳™ ׳¨׳•׳–׳');
insert into AUTHOR (author_id, author_name)
values (241, '׳”׳¨׳‘ ׳–׳׳‘ ׳’׳¨׳™׳ ׳•׳•׳׳“');
insert into AUTHOR (author_id, author_name)
values (243, '׳׳¨׳“׳›׳™ ׳—׳׳׳™׳©');
insert into AUTHOR (author_id, author_name)
values (244, '׳—׳™׳™׳ ׳•׳׳“׳¨ ׳. ׳¨׳¢׳ ׳');
insert into AUTHOR (author_id, author_name)
values (245, '׳׳׳™ ׳•׳’׳•׳׳“');
insert into AUTHOR (author_id, author_name)
values (247, ' ׳׳©׳” ׳‘׳ ׳¦׳‘׳™');
insert into AUTHOR (author_id, author_name)
values (248, '׳¦׳™׳•׳ ׳” ׳¨׳•׳™׳–׳™׳');
commit;
prompt 192 records loaded
prompt Loading BOOK...
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (52, 'עריסת הבמבוק', null, 27, 3);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (53, 'לילה של מתמיד', null, 28, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (54, 'שירת הבקר', null, 29, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (55, 'מעשה טוב', null, 30, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (56, 'הדב החמדן', null, 31, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (57, 'תפוח זהב', null, 32, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (58, 'נדרו של הפני יהושע', null, 28, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (59, 'עכשיו הוא אוהב את כולם', null, 33, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (60, 'בדרכי אבותינו ה''', null, 34, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (61, 'בדרכי אבותינו ד''', null, 34, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (62, 'הקושיה והתרוץ', null, 35, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (63, 'בדרכי אבותינו א''', null, 34, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (64, 'עולם של גדיים', null, 36, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (65, 'בדרכי אבותינו ג''', null, 34, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (66, 'האר"י הקדוש', null, 37, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (67, 'כצאת השמש', null, 38, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (68, 'הנשר הגדול', null, 39, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (69, 'רבי נחומקה', null, 40, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (70, 'נזר ישראל', null, 41, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (71, 'מרן הבית יוסף', null, 42, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (73, 'אדירי התורה א''', null, 43, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (75, 'אדירי התורה ה''', null, 43, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (76, 'האחים הקדושים', null, 37, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (77, 'אדירי התורה ג''', null, 43, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (78, 'אדירי התורה ח''', null, 43, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (79, 'בעקבות רבותינו ד''', null, 34, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (80, 'לכבוד שבת וחג', null, 44, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (81, 'רבי עקיבא', null, 45, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (82, 'בבי וצבי כבר לא רבים', null, 46, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (84, 'מיכאל הזהר!', null, 47, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (85, 'מקהלה במטבח', null, 48, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (87, 'אור של מצוה', null, 50, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (91, 'גדולי ישראל וחכמיה א''', null, 51, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (92, 'התפילין החמים', null, 52, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (95, 'בזכות כיבוד אב', null, 55, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (96, 'והאיש משה א''', null, 56, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (98, 'אליעזר העליז', null, 57, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (100, 'פרח מטה אהרן', null, 58, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (101, 'אורות חדשים', null, 52, 1);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (102, 'חכם הרזים', null, 37, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (103, 'רבי אליהו חיים מייזל', null, 59, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (104, 'האיש על החומה', null, 60, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (106, 'מרן הרש"ש', null, 55, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (107, 'ה"ישמח ישראל" מאלכסנדר', null, 61, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (109, 'חכמי מרוקו', null, 63, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (110, 'בדור תהפוכות', null, 60, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (111, 'האדמו"ר רבינו ישראל אביחצירא', null, 64, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (112, 'משה רבנו', null, 66, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (113, 'המלבי"ם', null, 65, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (114, 'מרן ראש הישיבה', null, 67, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (115, 'החידושי הרי"ם', null, 68, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (116, 'שלשה צדיקים מאי אחד', null, 69, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (117, 'שר התורה', null, 70, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (118, 'עם חכם ונבון ב''', null, 62, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (119, 'מאורי הדורות לילדי ישראל', null, 71, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (120, 'מי האיש', null, 40, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (121, 'עובדיה הנביא', null, 72, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (122, 'גדולי ישראל בילדותם', null, 73, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (123, 'מאמסטרדם לצפת', null, 55, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (124, 'אוהב עמו ישראל', null, 74, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (125, 'אדירי דעה', null, 75, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (127, 'מאורות ספורים על גדולי ישראל ב''', null, 76, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (128, 'מאורות ספורים על גדולי ישראל ג''', null, 76, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (129, 'רבנו משה סופר', null, 77, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (130, 'אליהו הנביא', null, 78, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (131, 'האריות שבחבורה', null, 62, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (132, 'שלושת הרועים', null, 79, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (133, 'דרכי נעם', null, 74, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (134, 'יונה הנביא', null, 72, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (136, 'כך התגלה הבעל שם טוב הקדוש', null, 81, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (137, 'גדולי ישראל בילדותם -ב''', null, 73, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (138, 'שמואל הנביא', null, 65, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (139, 'אגדת ה"סבא"', null, 82, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (140, '1000 ספורים קטנים על אנשים גדולים', null, 83, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (141, 'אדמו"רי בעלזא', null, 73, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (142, 'ה"אור החיים" הקדוש', null, 84, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (143, 'ה"לב שמחה"', null, 85, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (144, 'זהרי חמה', null, 86, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (145, 'אור במזרח', null, 87, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (146, 'יהושע שופטים', null, 88, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (147, 'רבי ישראל סלנטר', null, 89, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (148, 'מרן החיד"א הקדוש', null, 90, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (149, 'מעילו של שמואל', null, 91, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (150, 'גאון הדורות', null, 92, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (151, 'החכם צבי', null, 93, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (152, 'ר'' אריה', null, 94, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (153, 'באר מים חיים', null, 55, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (154, 'אדירי התורה ד''', null, 43, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (155, 'אדירי התורה ז''', null, 43, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (156, 'גדולי ישראל בשחרותם', null, 95, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (157, 'אור ממערב', null, 96, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (158, 'חומת אש', null, 97, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (159, 'זה האיש', null, 98, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (161, 'מנהיג של דור ב', null, 94, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (162, 'תלמידי הבעש"ט בארץ ישראל', null, 99, 4);
insert into BOOK (b_id, book_name, picture, author_id, category_id)
values (163, 'ר'' אייזל חריף', null, 100, 4);
commit;
prompt 96 records loaded
prompt Loading MADAF...
insert into MADAF (madaf_id, category_id)
values (1, 1);
insert into MADAF (madaf_id, category_id)
values (2, 1);
insert into MADAF (madaf_id, category_id)
values (3, 1);
insert into MADAF (madaf_id, category_id)
values (4, 1);
insert into MADAF (madaf_id, category_id)
values (5, 1);
insert into MADAF (madaf_id, category_id)
values (6, 2);
insert into MADAF (madaf_id, category_id)
values (7, 2);
insert into MADAF (madaf_id, category_id)
values (8, 2);
insert into MADAF (madaf_id, category_id)
values (9, 2);
insert into MADAF (madaf_id, category_id)
values (10, 1);
insert into MADAF (madaf_id, category_id)
values (11, 2);
insert into MADAF (madaf_id, category_id)
values (12, 2);
insert into MADAF (madaf_id, category_id)
values (13, 1);
insert into MADAF (madaf_id, category_id)
values (14, 2);
insert into MADAF (madaf_id, category_id)
values (15, 1);
insert into MADAF (madaf_id, category_id)
values (16, 2);
insert into MADAF (madaf_id, category_id)
values (17, 2);
insert into MADAF (madaf_id, category_id)
values (18, 2);
insert into MADAF (madaf_id, category_id)
values (19, 1);
insert into MADAF (madaf_id, category_id)
values (20, 2);
insert into MADAF (madaf_id, category_id)
values (21, 2);
insert into MADAF (madaf_id, category_id)
values (22, 2);
insert into MADAF (madaf_id, category_id)
values (23, 2);
insert into MADAF (madaf_id, category_id)
values (24, 2);
insert into MADAF (madaf_id, category_id)
values (25, 1);
insert into MADAF (madaf_id, category_id)
values (26, 2);
insert into MADAF (madaf_id, category_id)
values (27, 3);
insert into MADAF (madaf_id, category_id)
values (28, 3);
insert into MADAF (madaf_id, category_id)
values (29, 3);
insert into MADAF (madaf_id, category_id)
values (30, 3);
insert into MADAF (madaf_id, category_id)
values (31, 3);
insert into MADAF (madaf_id, category_id)
values (32, 3);
insert into MADAF (madaf_id, category_id)
values (33, 3);
insert into MADAF (madaf_id, category_id)
values (34, 2);
insert into MADAF (madaf_id, category_id)
values (35, 3);
insert into MADAF (madaf_id, category_id)
values (36, 3);
insert into MADAF (madaf_id, category_id)
values (37, 3);
insert into MADAF (madaf_id, category_id)
values (38, 2);
insert into MADAF (madaf_id, category_id)
values (39, 3);
insert into MADAF (madaf_id, category_id)
values (40, 3);
insert into MADAF (madaf_id, category_id)
values (41, 3);
insert into MADAF (madaf_id, category_id)
values (42, 3);
insert into MADAF (madaf_id, category_id)
values (43, 3);
insert into MADAF (madaf_id, category_id)
values (44, 3);
insert into MADAF (madaf_id, category_id)
values (45, 2);
insert into MADAF (madaf_id, category_id)
values (46, 3);
insert into MADAF (madaf_id, category_id)
values (47, 3);
insert into MADAF (madaf_id, category_id)
values (48, 3);
insert into MADAF (madaf_id, category_id)
values (49, 3);
insert into MADAF (madaf_id, category_id)
values (50, 3);
insert into MADAF (madaf_id, category_id)
values (51, 3);
insert into MADAF (madaf_id, category_id)
values (52, 2);
insert into MADAF (madaf_id, category_id)
values (53, 4);
insert into MADAF (madaf_id, category_id)
values (54, 4);
insert into MADAF (madaf_id, category_id)
values (55, 4);
insert into MADAF (madaf_id, category_id)
values (56, 4);
insert into MADAF (madaf_id, category_id)
values (57, 3);
insert into MADAF (madaf_id, category_id)
values (58, 3);
insert into MADAF (madaf_id, category_id)
values (59, 2);
insert into MADAF (madaf_id, category_id)
values (60, 3);
insert into MADAF (madaf_id, category_id)
values (61, 4);
commit;
prompt 61 records loaded
prompt Loading STATUS...
insert into STATUS (status_id, status_name)
values (1, '׳‘׳׳“׳£');
insert into STATUS (status_id, status_name)
values (2, '׳׳•׳©׳׳');
insert into STATUS (status_id, status_name)
values (3, '׳׳ ׳₪׳¢׳™׳');
commit;
prompt 3 records loaded
prompt Loading ALL_BOOKS...
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (1, 1, 85, 55);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (2, 3, 92, 52);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (3, 3, 116, 48);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (4, 3, 96, 47);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (5, 1, 118, 2);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (6, 1, 62, 8);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (7, 2, 142, 24);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (8, 3, 110, 24);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (9, 1, 103, 14);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (10, 1, 129, 5);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (11, 2, 56, 13);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (12, 3, 61, 13);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (13, 1, 100, 19);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (14, 2, 59, 39);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (15, 3, 77, 21);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (16, 2, 58, 1);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (17, 1, 63, 58);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (18, 2, 142, 10);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (19, 1, 54, 37);
insert into ALL_BOOKS (book_id, status_id, b_id, madaf_id)
values (20, 1, 118, 53);
commit;
prompt 20 records loaded
prompt Loading AREA...
insert into AREA (area_id, area_name)
values (1, 'jerusalem area');
insert into AREA (area_id, area_name)
values (2, 'central area');
insert into AREA (area_id, area_name)
values (3, 'north area');
insert into AREA (area_id, area_name)
values (4, 'south area');
insert into AREA (area_id, area_name)
values (69, 'Bristol');
insert into AREA (area_id, area_name)
values (40, 'Mnster');
insert into AREA (area_id, area_name)
values (49, 'Santa Clarita');
insert into AREA (area_id, area_name)
values (21, 'Northampton');
insert into AREA (area_id, area_name)
values (54, 'Green bay');
insert into AREA (area_id, area_name)
values (18, 'Albuquerque');
insert into AREA (area_id, area_name)
values (27, 'Protvino');
insert into AREA (area_id, area_name)
values (76, 'San Jose');
insert into AREA (area_id, area_name)
values (65, 'Monterrey');
insert into AREA (area_id, area_name)
values (81, 'St Kilda');
insert into AREA (area_id, area_name)
values (17, 'Charleston');
insert into AREA (area_id, area_name)
values (25, 'Essex');
insert into AREA (area_id, area_name)
values (51, 'Borger');
insert into AREA (area_id, area_name)
values (74, 'Mississauga');
insert into AREA (area_id, area_name)
values (22, 'Coppell');
insert into AREA (area_id, area_name)
values (15, 'Oakland');
insert into AREA (area_id, area_name)
values (32, 'Bellevue');
insert into AREA (area_id, area_name)
values (45, 'Velizy Villacoublay');
insert into AREA (area_id, area_name)
values (82, 'Oak Park');
insert into AREA (area_id, area_name)
values (39, 'Bozeman');
insert into AREA (area_id, area_name)
values (5, 'Judea-Samaria');
insert into AREA (area_id, area_name)
values (8, 'South');
insert into AREA (area_id, area_name)
values (9, 'HaSharon');
commit;
prompt 27 records loaded
prompt Loading BRAND...
insert into BRAND (brand_id, brand_name)
values (1, 'kia');
insert into BRAND (brand_id, brand_name)
values (2, 'mercedes');
insert into BRAND (brand_id, brand_name)
values (3, 'honda');
insert into BRAND (brand_id, brand_name)
values (4, 'fiat');
insert into BRAND (brand_id, brand_name)
values (78, 'Volkswagen');
insert into BRAND (brand_id, brand_name)
values (16, 'Volkswagen');
insert into BRAND (brand_id, brand_name)
values (14, 'Daimler');
insert into BRAND (brand_id, brand_name)
values (62, 'BMW');
insert into BRAND (brand_id, brand_name)
values (17, 'Kia');
insert into BRAND (brand_id, brand_name)
values (65, 'Fiat');
insert into BRAND (brand_id, brand_name)
values (28, 'BMW');
insert into BRAND (brand_id, brand_name)
values (89, 'Fiat');
insert into BRAND (brand_id, brand_name)
values (52, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (20, 'Honda ');
insert into BRAND (brand_id, brand_name)
values (37, 'BMW');
insert into BRAND (brand_id, brand_name)
values (84, 'Daimler');
insert into BRAND (brand_id, brand_name)
values (57, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (74, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (26, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (54, 'Fiat');
insert into BRAND (brand_id, brand_name)
values (9, 'Fiat');
insert into BRAND (brand_id, brand_name)
values (98, 'Fiat');
insert into BRAND (brand_id, brand_name)
values (82, 'Toyota');
insert into BRAND (brand_id, brand_name)
values (18, 'Kia');
insert into BRAND (brand_id, brand_name)
values (943, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (483, 'Kia');
insert into BRAND (brand_id, brand_name)
values (160, 'Volkswagen');
insert into BRAND (brand_id, brand_name)
values (640, 'Volkswagen');
insert into BRAND (brand_id, brand_name)
values (335, 'BMW');
insert into BRAND (brand_id, brand_name)
values (167, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (850, 'Daimler');
insert into BRAND (brand_id, brand_name)
values (908, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (513, 'Honda ');
insert into BRAND (brand_id, brand_name)
values (494, 'Daimler');
insert into BRAND (brand_id, brand_name)
values (916, 'Honda ');
insert into BRAND (brand_id, brand_name)
values (912, 'Honda ');
insert into BRAND (brand_id, brand_name)
values (414, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (575, 'BMW');
insert into BRAND (brand_id, brand_name)
values (725, 'Kia');
insert into BRAND (brand_id, brand_name)
values (286, 'Daimler');
insert into BRAND (brand_id, brand_name)
values (359, 'Honda ');
insert into BRAND (brand_id, brand_name)
values (540, 'BMW');
insert into BRAND (brand_id, brand_name)
values (649, 'Ford ');
insert into BRAND (brand_id, brand_name)
values (309, 'Kia');
insert into BRAND (brand_id, brand_name)
values (824, 'Fiat');
insert into BRAND (brand_id, brand_name)
values (431, 'Volkswagen');
insert into BRAND (brand_id, brand_name)
values (253, 'Toyota');
commit;
prompt 47 records loaded
prompt Loading CITY...
insert into CITY (cityid, cityname, areaid)
values (1, 'Acre', 4);
insert into CITY (cityid, cityname, areaid)
values (2, 'Afula', 4);
insert into CITY (cityid, cityname, areaid)
values (3, 'Arad', 8);
insert into CITY (cityid, cityname, areaid)
values (4, 'Ariel', 5);
insert into CITY (cityid, cityname, areaid)
values (5, 'Ashdod', 8);
insert into CITY (cityid, cityname, areaid)
values (6, 'Ashkelon', 8);
insert into CITY (cityid, cityname, areaid)
values (7, 'Baqa-Jatt', 4);
insert into CITY (cityid, cityname, areaid)
values (8, 'Bat Yam', 3);
insert into CITY (cityid, cityname, areaid)
values (9, 'BeerSheba', 8);
insert into CITY (cityid, cityname, areaid)
values (10, 'Beit Shean', 4);
insert into CITY (cityid, cityname, areaid)
values (11, 'Beit Shemesh', 2);
insert into CITY (cityid, cityname, areaid)
values (12, 'Beitar Illit', 5);
insert into CITY (cityid, cityname, areaid)
values (13, 'Bnei Brak', 3);
insert into CITY (cityid, cityname, areaid)
values (14, 'Dimona', 8);
insert into CITY (cityid, cityname, areaid)
values (15, 'Efrath', 5);
insert into CITY (cityid, cityname, areaid)
values (16, 'Eilat', 8);
insert into CITY (cityid, cityname, areaid)
values (17, 'Elad', 3);
insert into CITY (cityid, cityname, areaid)
values (18, 'Even Yehuda', 9);
insert into CITY (cityid, cityname, areaid)
values (19, 'Gan Yavne', 8);
insert into CITY (cityid, cityname, areaid)
values (20, 'Gedera', 8);
insert into CITY (cityid, cityname, areaid)
values (21, 'Givat Shmuel', 3);
insert into CITY (cityid, cityname, areaid)
values (22, 'Givatayim', 3);
insert into CITY (cityid, cityname, areaid)
values (23, 'Hadera', 4);
insert into CITY (cityid, cityname, areaid)
values (24, 'Haifa', 4);
insert into CITY (cityid, cityname, areaid)
values (25, 'Hertzliya', 9);
insert into CITY (cityid, cityname, areaid)
values (26, 'Hod HaSharon', 9);
insert into CITY (cityid, cityname, areaid)
values (27, 'Holon', 3);
insert into CITY (cityid, cityname, areaid)
values (28, 'Jerusalem', 2);
insert into CITY (cityid, cityname, areaid)
values (29, 'Kafr Qasim', 3);
insert into CITY (cityid, cityname, areaid)
values (30, 'Karmiel', 4);
insert into CITY (cityid, cityname, areaid)
values (31, 'Kfar Saba', 9);
insert into CITY (cityid, cityname, areaid)
values (32, 'Kfar Witkin', 9);
insert into CITY (cityid, cityname, areaid)
values (33, 'Kfar Yona', 9);
insert into CITY (cityid, cityname, areaid)
values (34, 'Kiryat Ata', 4);
insert into CITY (cityid, cityname, areaid)
values (35, 'Kiryat Bialik', 4);
insert into CITY (cityid, cityname, areaid)
values (36, 'Kiryat Gat', 8);
insert into CITY (cityid, cityname, areaid)
values (37, 'Kiryat Malakhi', 8);
insert into CITY (cityid, cityname, areaid)
values (38, 'Kiryat Motzkin', 4);
insert into CITY (cityid, cityname, areaid)
values (39, 'Kiryat Ono', 3);
insert into CITY (cityid, cityname, areaid)
values (40, 'Kiryat Shmona', 4);
insert into CITY (cityid, cityname, areaid)
values (41, 'Kiryat Yam', 4);
insert into CITY (cityid, cityname, areaid)
values (42, 'Lod', 8);
insert into CITY (cityid, cityname, areaid)
values (43, 'Maale Adumim', 5);
insert into CITY (cityid, cityname, areaid)
values (44, 'Maalot-Tarshiha', 4);
insert into CITY (cityid, cityname, areaid)
values (45, 'Migdal HaEmek', 4);
insert into CITY (cityid, cityname, areaid)
values (46, 'Modiin Illit', 5);
insert into CITY (cityid, cityname, areaid)
values (47, 'Modiin-Maccabim-Reut', 3);
insert into CITY (cityid, cityname, areaid)
values (48, 'Nahariya', 4);
insert into CITY (cityid, cityname, areaid)
values (49, 'Nazareth', 4);
insert into CITY (cityid, cityname, areaid)
values (50, 'Nazareth Illit', 4);
insert into CITY (cityid, cityname, areaid)
values (51, 'Nesher', 4);
insert into CITY (cityid, cityname, areaid)
values (52, 'Ness Tziona', 3);
insert into CITY (cityid, cityname, areaid)
values (53, 'Netanya', 9);
insert into CITY (cityid, cityname, areaid)
values (54, 'Netivot', 8);
insert into CITY (cityid, cityname, areaid)
values (55, 'Ofakim', 8);
insert into CITY (cityid, cityname, areaid)
values (56, 'Or Akiva', 4);
insert into CITY (cityid, cityname, areaid)
values (57, 'Or Yehuda', 3);
insert into CITY (cityid, cityname, areaid)
values (58, 'Petah Tikva', 3);
insert into CITY (cityid, cityname, areaid)
values (59, 'Qalansawe', 3);
insert into CITY (cityid, cityname, areaid)
values (60, 'Raanana', 9);
insert into CITY (cityid, cityname, areaid)
values (61, 'Rahat', 8);
insert into CITY (cityid, cityname, areaid)
values (62, 'Ramat Gan', 3);
insert into CITY (cityid, cityname, areaid)
values (63, 'Ramat HaSharon', 3);
insert into CITY (cityid, cityname, areaid)
values (64, 'Ramla', 8);
insert into CITY (cityid, cityname, areaid)
values (65, 'Rehovot', 8);
insert into CITY (cityid, cityname, areaid)
values (66, 'Rishon LeTzion', 3);
insert into CITY (cityid, cityname, areaid)
values (67, 'Rosh HaAyin', 3);
insert into CITY (cityid, cityname, areaid)
values (68, 'Safed', 4);
insert into CITY (cityid, cityname, areaid)
values (69, 'Sakhnin', 4);
insert into CITY (cityid, cityname, areaid)
values (70, 'Shderot', 8);
insert into CITY (cityid, cityname, areaid)
values (71, 'Shfar-am', 4);
insert into CITY (cityid, cityname, areaid)
values (72, 'Tamra', 4);
insert into CITY (cityid, cityname, areaid)
values (73, 'Tayibe', 9);
insert into CITY (cityid, cityname, areaid)
values (74, 'Tel Aviv', 3);
insert into CITY (cityid, cityname, areaid)
values (75, 'Tel Mond', 9);
insert into CITY (cityid, cityname, areaid)
values (76, 'Tiberias', 4);
insert into CITY (cityid, cityname, areaid)
values (77, 'Tira', 9);
insert into CITY (cityid, cityname, areaid)
values (78, 'Tirat Carmel', 4);
insert into CITY (cityid, cityname, areaid)
values (79, 'Umm al-Fahm', 4);
insert into CITY (cityid, cityname, areaid)
values (80, 'Yavne', 8);
insert into CITY (cityid, cityname, areaid)
values (81, 'Yehud', 3);
insert into CITY (cityid, cityname, areaid)
values (82, 'Yokneam', 4);
commit;
prompt 82 records loaded
prompt Loading CLIENT...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2267954367', 84867, 'April', '6 Staten Island Drive', 566);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9869675422', 83966, 'Belinda', '19 Nik Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5745119483', 12790, 'Sophie', '24 Charlize Drive', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4843568219', 42541, 'Don', '86 Solon Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8562316753', 52269, 'Lila', '94 Martin Blvd', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2489673838', 80112, 'Lloyd', '18 Tippe Street', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4454278247', 25806, 'Cliff', '83rd Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4778599348', 25211, 'Gilberto', '14 Dalton Drive', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8683861382', 18048, 'Miranda', '49 Lincoln Road', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2263169964', 17972, 'CeCe', '961 Orlando Ave', 698);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2743421116', 57648, 'Delroy', '62 Hannah Street', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7949841921', 76548, 'Simon', '22nd Street', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6443933512', 79975, 'Jack', '60 Pryce Street', 638);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7458616631', 83149, 'Melanie', '8 Cook Drive', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6778317622', 86405, 'Glenn', '7 Bonn Street', 847);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3539956951', 63831, 'Dabney', '36 Joshua Drive', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3236451879', 550, 'Bernie', '115 Gough', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7789673148', 16001, 'Matthew', '36 Tori Road', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2791316395', 84649, 'Glenn', '74 Kagoshima Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9842729927', 75873, 'Allison', '25 Seatle Street', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7433889339', 3759, 'Azucar', '6 Paal Beringen Drive', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2985958186', 4154, 'Jackson', '859 Mollard Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7236619819', 48053, 'Al', '41st Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2356184142', 52095, 'Eliza', '90 Breckin Street', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2483976355', 45684, 'Tanya', '15 Richter Blvd', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2283277312', 8273, 'Robbie', '9 Sanders Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7614688825', 99858, 'Debi', '93 Kate Road', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1218442313', 27522, 'Gino', '72nd Street', 461);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2858323526', 50305, 'Lin', '51st Street', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5467478928', 31383, 'Miko', '27 Campbell Road', 649);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6639894245', 37014, 'Gerald', '321 Vondie Drive', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6464118249', 715, 'Christian', '68 Washington Blvd', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7224661671', 80642, 'Buddy', '36 St-laurent Drive', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6834572511', 81738, 'Andie', '51 Lemmon Blvd', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4299324568', 36532, 'Azucar', '86 Ermey Ave', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2864774122', 99779, 'Burt', '1 Butler', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3975129951', 14318, 'Geraldine', '35 Blair Road', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1124543457', 13907, 'Yaphet', '63rd Street', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2371824429', 56071, 'Rita', '12nd Street', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5164916174', 62167, 'Night', '357 Tea Ave', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6126699882', 88363, 'Sarah', '42nd Street', 974);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1621223321', 60632, 'Meredith', '37 Noah Street', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8643216998', 39513, 'Shawn', '88 Birmingham Blvd', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7263775844', 45392, 'Benjamin', '71 Alpharetta Blvd', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7558467815', 34937, 'Juan', '28 Orton Road', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1811697136', 33624, 'Horace', '653 Tanon Road', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6687758582', 63746, 'Kelli', '21st Street', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1666488312', 24149, 'Liv', '77 England Drive', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9747113158', 84601, 'Jeroen', '68 Clea Ave', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2582616998', 92372, 'Bridgette', '86 McGoohan Ave', 733);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6419711536', 68683, 'Scott', '93 Olyphant Road', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7761232725', 60781, 'Cathy', '58 Joinville Road', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2794278779', 31286, 'Julio', '72 Huston Drive', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9688252987', 19061, 'Catherine', '92 Bridget Drive', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5712476834', 96161, 'Mekhi', '94 Jet Ave', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5536554841', 68755, 'Maggie', '86 Kaohsiung Blvd', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2649713993', 54480, 'Peter', '414 Crystal Street', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6724454336', 22479, 'Kevin', '90 New orleans Street', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9297772553', 14331, 'Jodie', '61 Gibson Drive', 698);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5494428511', 65872, 'Charlize', '54 Benet Drive', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5214418829', 93335, 'Cheech', '48 Channing Street', 688);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4796592117', 53776, 'Dylan', '827 Milano Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2738825937', 24506, 'Nicholas', '91 Leigh Street', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4727774917', 66514, 'Roberta', '82 Cledus Road', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1128656146', 95330, 'Carolyn', '91 Heslov Road', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3844311316', 68592, 'Rupert', '73 Brando Road', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7583379385', 41736, 'Mae', '823 Blades Road', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3892118545', 35715, 'Lou', '26 Spader Street', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1613735512', 59992, 'Kasey', '58 Mindy Street', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8136214332', 40848, 'Sydney', '435 Baker Drive', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7931421741', 83681, 'Aaron', '81 Basinger Drive', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8239248728', 79135, 'Rhett', '19 Laura Drive', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6648731181', 66661, 'Kris', '51 Bethesda Street', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7777341138', 32124, 'Geggy', '92 Derek Drive', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4957761968', 32371, 'King', '71 Elijah Street', 649);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9535726632', 46033, 'Chazz', '60 Eat World Road', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3635713233', 80131, 'Nicolas', '33 Ojeda Road', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2429925211', 32423, 'Clint', '33rd Street', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1734857734', 60246, 'Hope', '38 Eiksmarka Road', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5357116281', 64147, 'Armin', '21 Short Drive', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8878118267', 75050, 'Mandy', '36 Paymer Road', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1637958545', 71347, 'Davy', '593 Belles Drive', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6187133539', 42703, 'Mae', '71 Blades Street', 588);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1646471599', 73189, 'Drew', '31 Carr Street', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2457436941', 44625, 'Dennis', '19 Wesley Street', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7721127218', 23382, 'Red', '79 Bonnie Drive', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6765947833', 64309, 'Jay', '53rd Street', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1829849787', 75874, 'Natacha', '51st Street', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3898189571', 58610, 'Cherry', '1 Niven Blvd', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3915488374', 70927, 'Vern', '42nd Street', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4968472525', 60396, 'Dean', '45 Shue Street', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5418788414', 94254, 'Dwight', '97 Parker Road', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4277497654', 65493, 'Roberta', '723 Kurtwood Ave', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9443242755', 78263, 'Spike', '91 Brolin Street', 698);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9587754492', 27897, 'Pat', '87 Leslie Road', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7643361498', 48952, 'Alex', '50 Negbaur Drive', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8977587146', 86242, 'Keanu', '67 Kyunnam Street', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4621147236', 43362, 'George', '73 Treat Road', 649);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3584882324', 52309, 'Jose', '34 Blanchett Road', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4718591736', 79566, 'Demi', '71 Gailard Street', 123);
commit;
prompt 100 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8768426666', 58253, 'Katie', '27 Reynolds Road', 847);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5468822354', 63976, 'Elizabeth', '84 Lucy Road', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8152646154', 67184, 'Madeleine', '48 Englund Drive', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1328265196', 64549, 'Marley', '33rd Street', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5592391318', 46796, 'Sander', '76 McIntyre', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6468465222', 40462, 'Cledus', '62 Tilst Road', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4399692459', 72558, 'Laurie', '47 Gambon Ave', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7165299172', 93163, 'Gates', '45 Badalucco Drive', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6795312665', 78708, 'Leelee', '80 Soul Drive', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9248661189', 98158, 'Lloyd', '4 Schock Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4545969358', 20093, 'Tony', '833 Fehr Road', 976);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1935172835', 12274, 'Elle', '83 Wiedlin Drive', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7882273295', 87578, 'Ritchie', '92 Dench Street', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8724487438', 86989, 'Arturo', '89 Allison Drive', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6165145835', 20488, 'Emily', '85 Berry Drive', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9797441873', 52949, 'Ike', '6 Gהvle Road', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8568214735', 93389, 'Stevie', '14 Morales Blvd', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1741319665', 48806, 'Clay', '40 Hatchet Ave', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4158734791', 89743, 'Geoff', '11st Street', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4797571973', 57346, 'Juliet', '40 Salonga Drive', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2894736789', 80452, 'Liv', '80 Munich Road', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1349765277', 65950, 'Pelvic', '13 Carrington Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7987274175', 37406, 'Cloris', '33rd Street', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2361454152', 10821, 'Arturo', '19 Wahlberg Ave', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5246485129', 12269, 'Xander', '46 West Chester Street', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4164233326', 22006, 'Nancy', '829 Child Street', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2354895234', 29715, 'Juice', '33 Horace', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5843811979', 99132, 'Breckin', '100 California Ave', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2275579487', 14783, 'Kitty', '724 Hersh Road', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5298528844', 69512, 'Juliana', '24 Bloch Drive', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9676263599', 41114, 'Rhona', '453 Orlando Drive', 538);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6511945382', 43240, 'Xander', '74 Cypress Road', 699);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9298984963', 36255, 'Tobey', '73rd Street', 664);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9889389612', 72531, 'Teena', '626 Clinton Road', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4864894277', 42776, 'Meg', '40 Jean-Luc', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5993815156', 34767, 'Jonatha', '38 Kattan Drive', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9287625399', 55394, 'Andrae', '747 White Ave', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7413853315', 95075, 'Emmylou', '6 Juice Drive', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1311829612', 29111, 'Maria', '973 Miko Road', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4466926245', 99788, 'Nikki', '12 Eschen Blvd', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('844631277', 87938, 'Eric', '55 Oshkosh Road', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('229932611', 65145, 'Mili', '95 Warren Ave', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('144173354', 94229, 'Nastassja', '36 Galecki Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('448736547', 58749, 'Gordon', '383 Christie Street', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('518994981', 28586, 'Guy', '75 Fionnula Blvd', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('216857296', 57161, 'Will', '92 Emm Ave', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('295519645', 72127, 'Natasha', '660 Winter', 461);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('292934196', 19525, 'Humberto', '41st Street', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('244259112', 94651, 'Betty', '63 Di Savigliano Ave', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('413471282', 36539, 'Night', '32 New Delhi Drive', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('113782636', 56199, 'Olga', '754 Mac Street', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('655142561', 22161, 'Trick', '15 Brooke Drive', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('842522269', 82796, 'Devon', '77 Carr Street', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('133626443', 64481, 'Cevin', '20 El-Saher Road', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('393693419', 55699, 'Gil', '2 Osmond Street', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('536924484', 59554, 'Juliette', '91 Scarlett Blvd', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('111867172', 73998, 'Uma', '11 Zevon Drive', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('657558895', 38848, 'Ali', '97 Palo Alto Blvd', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('472822313', 42281, 'Pamela', '82 Courbevoie Street', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('136156237', 38599, 'Lionel', '57 Liu Road', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('718181748', 19512, 'Red', '31 Reubens Street', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('161945558', 28266, 'Kieran', '12 Torn Road', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('121472218', 55266, 'Edie', '84 Shreveport', 698);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('498544591', 99616, 'Fisher', '9 Mandrell Road', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('494471416', 16519, 'Lily', '573 Secada Drive', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('128244197', 75423, 'Michael', '9 Xander Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8645383172', 12599, 'Ralph', '226 Warren Road', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2844975589', 19581, 'Pat', '8 Geneve Street', 566);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1481585537', 29911, 'Marisa', '18 Whitford Street', 414);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4148644899', 31571, 'Rene', '37 Naestved Street', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8625977274', 22432, 'Wayne', '21 Meryl Street', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8927317117', 71845, 'Carrie-Anne', '95 Kozani Ave', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2966516286', 24416, 'Cornell', '610 Belmont Street', 414);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8444141152', 34573, 'Giancarlo', '764 Gordie Street', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4313335598', 74413, 'Raymond', '62 Foster City Street', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4831214359', 92359, 'Claire', '37 Craig Road', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2465335528', 92863, 'Davy', '17 Myers Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1967168117', 19568, 'Randall', '47 Scaggs Road', 976);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3117644959', 49213, 'Martin', '92 Roth Drive', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4254563723', 28937, 'Sissy', '132 Neville Road', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4177196457', 47728, 'Rosanne', '944 Mathis Drive', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8854425914', 23842, 'Eddie', '58 Drive Road', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6164113121', 43366, 'Whoopi', '53rd Street', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3681764354', 34575, 'Sigourney', '917 Zellweger Ave', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6855686546', 17255, 'Benicio', '49 Popper Drive', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9338226971', 16862, 'Anthony', '225 Gilbert Road', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2997843616', 68484, 'Brian', '46 Christina Blvd', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5889914211', 54848, 'Loren', '94 Shenzhen Drive', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6377395945', 76459, 'Karon', '69 McNeice Blvd', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7531395662', 59481, 'Anna', '48 Wayans Road', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8617636677', 89246, 'Buddy', '93rd Street', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7783231875', 36353, 'Marie', '29 Cole Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6588148958', 69381, 'Rhett', '49 Yolanda Road', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9499922237', 79656, 'Dabney', '73 Middletown Drive', 414);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3551817452', 16359, 'Gin', '684 Raymond Blvd', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9574574853', 52897, 'Debra', '95 Alessandria Road', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9431535538', 98348, 'Daniel', '107 Serbedzija Road', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4221266752', 49739, 'Chantי', '67 Del Toro Road', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4815513561', 93348, 'Sander', '27 Lathrop Drive', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5654226876', 14861, 'Maury', '71 Keen Blvd', 572);
commit;
prompt 200 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9385192249', 75975, 'Daryle', '79 Lemmon Road', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3483656934', 95619, 'Pete', '83rd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3581597793', 93681, 'Lili', '98 Fairuza Drive', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4999931526', 87196, 'Lena', '23 Brasםlia Road', 638);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6862539366', 34630, 'Quentin', '18 Remar Street', 588);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1375796873', 85441, 'Jeffrey', '10 Adkins Drive', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5688618331', 75265, 'Daniel', '45 Mifune Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4557967498', 66153, 'Larnelle', '63rd Street', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9466834551', 48551, 'Omar', '87 Mel Street', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5453835538', 54780, 'Tanya', '44 Lizzy Drive', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1914444474', 46325, 'Clive', '39 Diamond Drive', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4187668762', 23812, 'Ty', '7 Dubai Drive', 925);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1964567331', 62896, 'Rosie', '64 Nolte Street', 733);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4862428741', 81722, 'Whoopi', '938 Bracknell Street', 925);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7212594714', 62159, 'Alannah', '73rd Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4638367761', 27353, 'Brian', '63 Auckland Street', 588);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2719679386', 34367, 'Anna', '71st Street', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5155314311', 14627, 'Udo', '52nd Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8561758222', 81533, 'Marty', '224 Joshua Drive', 974);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7794882928', 99932, 'Hazel', '9 Puckett Street', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7317228612', 15815, 'Gran', '12nd Street', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2731372631', 39336, 'Carrie', '19 Chan Road', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8211953613', 71266, 'Tilda', '32nd Street', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3892367399', 66240, 'Kenny', '75 Auckland Blvd', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5593739465', 73946, 'Laurie', '21st Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9639534599', 37057, 'Marie', '22nd Street', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7938112977', 42310, 'Jodie', '18 Lake Forest Street', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2192616349', 69459, 'Armand', '2 Flatts Road', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7657312264', 2074, 'Merrilee', '12 Santa Clarat Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3556622494', 22656, 'Toni', '51 Conroy Ave', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6763934765', 51907, 'Cyndi', '25 Arkenstone', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8453593441', 44772, 'Lea', '48 Vendetta Ave', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8996587754', 48902, 'Yolanda', '4 Makowicz Road', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7269165664', 98643, 'Dennis', '882 Nynהshamn Street', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4787232872', 3856, 'Suzanne', '111 Mould Street', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2783595981', 85202, 'Seth', '36 Turku Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6523671928', 89107, 'Maceo', '14 Nelligan Street', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8622512468', 7488, 'Clive', '61 Cobham Ave', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1335821256', 27518, 'Brendan', '64 Jackman Street', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3375388319', 19182, 'Ann', '46 Emm Drive', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8531644622', 35168, 'Eric', '66 Ice Ave', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2584592842', 39484, 'Carla', '9 Joely Blvd', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2157641899', 38843, 'Debra', '41 Blackmore Road', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6944266152', 96586, 'Sal', '53 Akron Street', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8671721573', 33204, 'Horace', '663 Meredith Drive', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1514382878', 57721, 'Harry', '60 Swayze Road', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4977774998', 24919, 'Wesley', '34 Sapporo Street', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5239894249', 46345, 'Praga', '69 Supernaw Road', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4772799828', 43629, 'Colin', '52nd Street', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4472458368', 69082, 'Brooke', '49 Richards Drive', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7694178213', 7716, 'Marisa', '67 Jimmy Street', 766);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8525958497', 26052, 'Richard', '36 Hong Blvd', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4476188994', 99476, 'Michelle', '82 Cotton Ave', 292);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7431176442', 55188, 'Stephen', '51 Fierstein Road', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9555891544', 45923, 'Howard', '27 Tyler Street', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5115461634', 37937, 'Jonatha', '92nd Street', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6174756732', 62867, 'Tramaine', '84 Swarthmore Blvd', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2188982819', 33523, 'Eliza', '91 O''Keefe Drive', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6263455171', 15071, 'Wally', '227 Penelope Street', 538);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9135371353', 33408, 'Daniel', '355 Molly Street', 292);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5697192291', 82039, 'Penelope', '96 Boone Drive', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9731798952', 71209, 'Dom', '81st Street', 925);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2577473853', 31118, 'Emily', '875 Nathan Drive', 976);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8813682638', 46483, 'Al', '93rd Street', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2375784176', 32473, 'Trick', '343 Mellencamp Road', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7668468615', 45679, 'Joan', '6 Tah', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4624476995', 63191, 'Ned', '61 Walker Street', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3713726166', 67496, 'Colin', '944 Fariq Street', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8347146893', 36913, 'Praga', '27 McDowell Road', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3842881176', 32271, 'Sander', '69 Chao Ave', 664);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3612621482', 34763, 'Rene', '63 Gene', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4325373495', 34403, 'Anita', '46 Sara', 688);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7567979681', 33219, 'Parker', '58 De Almeida Ave', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3628827146', 46869, 'Maggie', '79 Close Street', 649);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8719837788', 34491, 'Jamie', '11st Street', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7473278447', 23097, 'Sheena', '74 Dempsey Ave', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2952585943', 53872, 'Oded', '1 Orton Road', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6477871845', 88635, 'Kurt', '71st Street', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4427121499', 20814, 'Seth', '32nd Street', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2496185864', 99910, 'Suzi', '55 Framingaham Street', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6855579857', 2502, 'Jackie', '58 Ferrell Street', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8216295687', 81463, 'Omar', '2 Alexander Blvd', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2121337271', 18503, 'Kazem', '99 LeVar Street', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6332855453', 36787, 'Alannah', '539 New Delhi', 699);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6552495385', 40163, 'Jena', '31 Suvari Street', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6679915275', 26978, 'Rory', '40 Campbell Street', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7477361145', 56065, 'Gilbert', '81 Depp Blvd', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8421225948', 89915, 'Vonda', '28 Henry Blvd', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8282899439', 97594, 'Thora', '71 Paramus Road', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1726462896', 35571, 'Dianne', '96 Balthazar Street', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5181372641', 26817, 'Al', '92 Fukuoka Street', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4135958618', 350, 'Hookah', '31 Laurel Drive', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3463682198', 28338, 'Willem', '80 Webb Blvd', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6986133737', 62428, 'Stephen', '13 Hounslow Ave', 588);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4456188336', 54665, 'Shelby', '99 Rotterdam Blvd', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('749227549', 53188, 'Charles', '12 Carrere', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('482693333', 97422, 'Ashton', '423 Quinlan Road', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('651834832', 93144, 'Buffy', '30 Merchant Road', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('585252971', 39795, 'Brenda', '71 Peet', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('585458993', 76134, 'Nikka', '12 Frost Drive', 262);
commit;
prompt 300 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('734666162', 72463, 'Rob', '87 Waldorf Ave', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('259724266', 15639, 'Suzanne', '72nd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('646469147', 83972, 'Mary', '688 Lee Street', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('215475525', 31521, 'Lindsey', '22nd Street', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('137753356', 67278, 'Hugo', '57 Kimberly Blvd', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('431364569', 97218, 'Brittany', '82 Carradine Street', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('427333568', 84518, 'Ty', '24 Brendan Road', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('367647219', 54531, 'Cathy', '8 Satriani Drive', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('777563739', 32362, 'Cesar', '19 Vista Road', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('132897167', 72924, 'Kevn', '618 Herzogenrath Street', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('114536428', 16841, 'Toni', '44 Hopkins Road', 292);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('796874149', 14899, 'Tanya', '3 Winger Drive', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('146682251', 86966, 'Val', '48 Rush', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('755199832', 18987, 'Cesar', '79 Neuwirth Street', 414);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('885779187', 79196, 'Scarlett', '71st Street', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('874712832', 45628, 'Jay', '22nd Street', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('111215276', 69923, 'Johnnie', '259 Melrose park Blvd', 638);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('875165486', 53567, 'Corey', '2 Wilson Road', 638);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('373962411', 48695, 'Lou', '69 Weisz Street', 698);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('692468414', 11878, 'Lily', '87 McLean Road', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('684678248', 37299, 'Vickie', '98 Waite Park Road', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('451476576', 85433, 'Cameron', '41 Aiken Road', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('343385328', 78181, 'Mekhi', '12nd Street', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('698689656', 84941, 'Rose', '12 Bean Drive', 588);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('935648987', 54582, 'Fionnula', '793 Dourif', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('811126464', 56166, 'Jeff', '60 Warwick Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('216499782', 71766, 'Rose', '53rd Street', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('461949225', 32844, 'Colleen', '42nd Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('656513648', 17553, 'Carl', '781 Cumming Road', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('263287121', 52326, 'Victoria', '891 Aurora Ave', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('634145411', 26123, 'Natascha', '669 Ledger Street', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('825652357', 55562, 'David', '84 Gosdin Road', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('665459297', 92164, 'Miriam', '79 Ceasar Blvd', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('988956936', 73249, 'Laura', '16 Gyllenhaal Street', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('848553852', 94378, 'Rachael', '80 Cesena Street', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('161437561', 54192, 'Marie', '52nd Street', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('178113226', 54163, 'Buffy', '45 Baranski', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('993598549', 21359, 'Raul', '71 Lang Road', 847);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('549459875', 95447, 'Jackson', '20 Sepulveda Street', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('179717382', 33249, 'Franz', '95 Coltrane Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('311546251', 36724, 'Madeline', '86 Pulheim-brauweiler Roa', 566);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('877138971', 57166, 'Jackson', '57 MacNeil Road', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('197653719', 42781, 'Charles', '65 Cervine Drive', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('668821456', 99273, 'Mary', '18 Emm Road', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('179737542', 44938, 'Jean-Luc', '78 Weaving Drive', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('457329155', 75527, 'Corey', '75 Holliston Street', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('651663753', 65873, 'Christmas', '41 Witt Road', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('586944957', 75415, 'Lenny', '78 Scott Street', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('532595821', 13217, 'Toshiro', '72 Sinead Drive', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('811297938', 43835, 'Gordon', '99 Numan Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('821411262', 44768, 'Rip', '33rd Street', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('363894181', 27539, 'James', '6 Mena Drive', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('729968663', 52432, 'Tyrone', '20 Vaughn Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('351621889', 48566, 'Lucy', '45 Maureen Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('553169126', 52212, 'Casey', '30 Rade Drive', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('389666881', 77897, 'Kathleen', '75 Quinn Street', 974);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('233588532', 25969, 'Maura', '50 Robin Blvd', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('737724412', 76438, 'Tom', '71st Street', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('739262668', 93812, 'Claude', '41st Street', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('793117659', 57914, 'Joe', '358 Auckland Blvd', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('662923351', 59626, 'Anjelica', '24 Rueben Street', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('478995736', 18751, 'Bruce', '165 Serbedzija Ave', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('515179274', 69566, 'Minnie', '29 Colton Blvd', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('769121514', 88684, 'Peter', '76 Orbit Drive', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('413189489', 75142, 'Sheryl', '88 Heald Blvd', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('616116289', 18833, 'Bernie', '97 Lattimore Road', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('529721258', 71718, 'Jody', '16 Avril Street', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('664239839', 36714, 'Al', '1 Ted Street', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('576255484', 82394, 'Thelma', '48 Gaines Street', 566);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('446945225', 64561, 'Millie', '88 Irvine Street', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('957436352', 76394, 'Gran', '99 Larenz', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('693257243', 21154, 'Gladys', '119 Li Road', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('815835223', 37355, 'Miles', '35 McCain Street', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('319745638', 18125, 'Spencer', '639 Adam', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('341831787', 48828, 'Suzi', '47 Candice Road', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('379256964', 38771, 'Brent', '475 Teena Street', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('296868818', 25384, 'Nicholas', '256 Satriani Street', 698);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('214772269', 26725, 'Bonnie', '21 Cle Elum Street', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('952562926', 48937, 'Suzi', '73 Wakeling Blvd', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('792397916', 67113, 'Hal', '12 Hiatt Drive', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('512453241', 62362, 'Miranda', '235 Domingo Blvd', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('421671339', 44125, 'George', '251 Kelly Street', 974);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('127738233', 79795, 'Kazem', '76 Albright Road', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('964821495', 74882, 'Eddie', '82nd Street', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('835297194', 39997, 'Chazz', '48 Gracie Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('971579925', 59988, 'Kim', '6 Bugnon Road', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('668932251', 18379, 'Suzanne', '8 Pollak Drive', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('147928435', 44434, 'Mary Beth', '524 Bello Ave', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('746283713', 43246, 'Katie', '21st Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('576397655', 12261, 'Josh', '22 Orton Road', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('754814897', 36674, 'France', '93 Fariq Drive', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('418179695', 94452, 'Teri', '44 Fisher', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('263648539', 35772, 'Orlando', '71 McGinley Drive', 588);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('537434713', 12587, 'Kenneth', '730 Carter Ave', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('959713177', 18865, 'Quentin', '10 Wopat Ave', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('789685545', 35751, 'Will', '12 Michael Blvd', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('276778171', 84398, 'Temuera', '46 Samuel', 733);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('158474976', 72518, 'Juice', '68 Suzi Road', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('538725748', 76787, 'Burt', '65 Franklin Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('247642243', 36866, 'Ted', '42nd Street', 699);
commit;
prompt 400 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('883745486', 96941, 'Leelee', '52 Richards Drive', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('457421657', 69755, 'Milla', '37 Wolf Street', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('486417199', 67993, 'Noah', '70 Summerside', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('433993581', 12791, 'Aimee', '11 Fairuza Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('283368222', 34833, 'Christina', '62 Pfeiffer Blvd', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('882763184', 76529, 'Marc', '40 Fiorentino Street', 664);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('528625926', 85174, 'Juan', '72 Niven', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('629147641', 38694, 'Cary', '84 Dench Ave', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('564697751', 75229, 'David', '87 Marina Ave', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('344881399', 23923, 'Veruca', '703 Melba Street', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('881853515', 62197, 'Noah', '92 Tempe Drive', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('631911548', 99624, 'George', '82 Guzman Blvd', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('245196358', 53215, 'Rhett', '324 Sarsgaard Road', 766);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('946845865', 53562, 'Malcolm', '91 Winter Street', 733);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('177278914', 81691, 'Gerald', '70 De Niro Ave', 538);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('111817766', 16165, 'Jonathan', '9 Broderick Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('292172346', 51676, 'Larnelle', '67 Marin Street', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('986511872', 67536, 'Halle', '117 Schwarzenegger Drive', 698);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('715322672', 19746, 'Petula', '63rd Street', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('112245191', 11579, 'Jake', '78 Braugher Drive', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('668573557', 58187, 'Roberta', '28 Fremont', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('153932354', 15585, 'Robert', '671 Squier Ave', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('799989572', 64767, 'Juliet', '98 Landau Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('572875727', 53374, 'Reese', '317 Hunter Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('918321468', 17954, 'Courtney', '91 Redford Drive', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('242639747', 98598, 'Gran', '85 East Providence Road', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('395662872', 13832, 'Patty', '19 Reading Blvd', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('511445149', 87861, 'Nanci', '2 Sizemore Drive', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('666673198', 68762, 'Howard', '59 Pullman Street', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('156144383', 62379, 'Vickie', '98 Okayama Drive', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('828866755', 18519, 'Jann', '60 O''Hara Drive', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('666694158', 52834, 'Charlton', '95 Curtis Street', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('624678315', 35885, 'Jane', '14 Mattea Blvd', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('276688657', 44933, 'Isaac', '94 Max Drive', 766);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('969571589', 34658, 'Miguel', '74 Toronto Road', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('467498694', 62213, 'Debby', '668 Vantaa Road', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('825973826', 45182, 'Helen', '607 Steve Street', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('962823779', 68672, 'Marina', '19 Delroy Drive', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('962222872', 61822, 'Martin', '31st Street', 699);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('713745759', 75356, 'Daniel', '77 Maceo Drive', 699);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('579443556', 54459, 'Javon', '58 Neill Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('937641568', 25885, 'Gordon', '635 Rollins', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('141681183', 83556, 'Victoria', '68 DeVita', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('255363668', 74954, 'Tea', '80 Rachel Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('581126278', 66396, 'Chi', '28 Claire Road', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('945596413', 99834, 'Carol', '63 Plimpton Street', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('876549736', 91778, 'Annie', '43 Freda Street', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('568457779', 67953, 'Helen', '67 Middletown Drive', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('879686327', 49929, 'Loretta', '889 Cruise Road', 974);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('317915872', 41513, 'Thelma', '32 Quatro Ave', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('764189724', 31139, 'Gordon', '81 Dillon Street', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('462219823', 73977, 'Gilberto', '615 Millie Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('725468213', 24497, 'Natascha', '9 John Road', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3374851217', 78797, 'Aaron', '37 Mainz-kastel Street', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5146528373', 52172, 'Hilton', '79 Holliston Blvd', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7659896445', 58725, 'Shannon', '70 Sheryl Drive', 292);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4253598818', 95963, 'Jane', '68 Mac Drive', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7552976633', 33362, 'Cornell', '90 Fuerth Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3378556192', 11985, 'Famke', '41 Kieran Blvd', 649);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8848891315', 58496, 'Ted', '60 Tisdale Street', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5161771885', 22618, 'Breckin', '20 Redwood City Drive', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4773824952', 39232, 'Armand', '32 Kreuzau Road', 664);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6264717269', 79424, 'Ann', '672 Wells Blvd', 588);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7527192193', 56622, 'Thin', '37 Strong Road', 688);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4379329733', 19989, 'Jerry', '32 Genטve Street', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1894567889', 14171, 'Ralph', '44 Apple Road', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4793717554', 82299, 'Sylvester', '39 West Chester Road', 292);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5328126784', 44483, 'Luke', '74 Rozenburg Street', 638);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7156478436', 21997, 'Albertina', '65 Denny Ave', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9227733645', 81391, 'Curt', '32 Dorval Blvd', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4384178144', 36998, 'Cuba', '35 Spike Blvd', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9691119338', 62816, 'Kenny', '69 McGinley Road', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1575376199', 56316, 'Javon', '21 Batavia Drive', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3353824842', 63763, 'Dianne', '49 Javon Road', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7844848537', 63692, 'Seth', '661 Marietta Street', 974);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9683215366', 69332, 'Lea', '41 Emma Street', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7425964519', 15917, 'Nelly', '34 Stone Mountain Drive', 699);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4897458885', 75672, 'Candice', '718 Fehr Street', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7729394767', 92866, 'George', '76 Williamson Drive', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4924811812', 44322, 'Ian', '19 Rippy Drive', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8549225847', 16314, 'Solomon', '1 Julio Road', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8744377814', 11727, 'Vienna', '64 Stoltz Drive', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9752418362', 19478, 'Peter', '801 Fariq Road', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2425741839', 86994, 'Casey', '46 Koufu Ave', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3973298875', 84125, 'Seth', '61st Street', 976);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4572382929', 36159, 'Ashley', '784 Appenzell Drive', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5959972463', 35956, 'Steve', '81 Gore Road', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6944314553', 71149, 'Marc', '80 Bristol Street', 733);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2199235398', 56685, 'Dwight', '73 Herndon Drive', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9867714388', 19557, 'Kelli', '96 Noseworthy', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1596143682', 19763, 'Cheryl', '293 Porter Drive', 766);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6563545742', 46946, 'Breckin', '83 Takamatsu Street', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5372146749', 92583, 'Ramsey', '40 Gabrielle Blvd', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5734925463', 75287, 'Raymond', '48 Scott Drive', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1653586746', 84119, 'Albertina', '89 Vince Street', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5642248668', 43464, 'Cole', '53 Tom Street', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1392632624', 37599, 'Roscoe', '23 Millie', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4132332686', 98173, 'Wendy', '93 Mary-Louise Drive', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2733646673', 74191, 'Mary-Louise', '2 Baez Blvd', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1988688458', 61781, 'Alicia', '81st Street', 538);
commit;
prompt 500 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4373742538', 72781, 'Bret', '84 Forrest Street', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4748134249', 48133, 'Lea', '92nd Street', 766);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1176293192', 22239, 'Roberta', '42 Seattle', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2526766656', 75643, 'Grant', '16 Janice Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7166727745', 58713, 'Nikki', '91st Street', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9328168864', 51957, 'Milla', '906 Elizondo Drive', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9942391372', 94977, 'Pamela', '69 Rich Road', 974);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5289115668', 26654, 'Liquid', '26 Davey Road', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8762599566', 91946, 'First', '973 Kanazawa Drive', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5559675318', 82357, 'Bret', '66 Barrymore Blvd', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3533949196', 51268, 'Cole', '96 Sainte-foy Drive', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2524719774', 67763, 'Ralph', '32 Mablethorpe Street', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8547987938', 25748, 'Christopher', '40 Freddie Blvd', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6876887961', 72734, 'Bret', '43 Hunter Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4377789345', 64924, 'Miko', '284 Stuermer Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('657476735', 35577, 'Elias', '57 Andy Road', 664);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('671526934', 56861, 'Chi', '613 Nicholas Drive', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('926752749', 92714, 'Chloe', '92 Waldbronn Ave', 237);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('268396477', 25936, 'Madeline', '5 Chad Blvd', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('144251171', 42515, 'Gloria', '13rd Street', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('665667641', 17653, 'Donal', '25 Uetikon am See Ave', 461);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('796389986', 27623, 'Dianne', '32 Freeman Drive', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('593515144', 57942, 'Kid', '9 McDonald', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('868361271', 58699, 'Jean', '56 Holland Ave', 766);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('421481218', 35753, 'Seth', '885 Emerson Street', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('388835853', 85118, 'Gloria', '457 Pierce Street', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('473283984', 89212, 'Christina', '52 Ruffalo Drive', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('299121677', 32262, 'Coley', '22 Skarsgard Street', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('253289153', 26766, 'Crystal', '23 Duisburg Drive', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('834563511', 58667, 'Lionel', '29 Oro Blvd', 292);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('851812654', 75939, 'Alfie', '15 Navarro Road', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('892994847', 47534, 'Geggy', '23 Redgrave', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('237819553', 79594, 'Jodie', '84 Charlie Blvd', 664);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('816629747', 36879, 'Bebe', '147 Alicia Street', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('455124765', 94538, 'Lindsay', '77 Wen Street', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('735224461', 15734, 'Gailard', '33 Chestnut Street', 925);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('547859878', 19672, 'Martin', '63 Coley Drive', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('345492552', 67552, 'Penelope', '43 Parm Road', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('832741172', 89319, 'Reese', '92 Chloe Blvd', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('851975131', 67189, 'Clarence', '320 Kristin Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('729846364', 85596, 'Oro', '48 Gina Road', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('316193989', 86947, 'Geraldine', '63 Daniel Street', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('363526147', 65431, 'Arnold', '12 Larry Road', 976);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('549154548', 83739, 'Simon', '93rd Street', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('327237882', 81755, 'Sammy', '4 Glenn Drive', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('768399273', 37557, 'Maura', '100 Kilmer Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('153765977', 79871, 'Robby', '90 Barcelona Street', 783);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('626282315', 48522, 'Kiefer', '33 Lyonne Blvd', 292);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('247289763', 41477, 'Michael', '93 LaMond Street', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('327323549', 62829, 'Claire', '72 Williamstown Road', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('958715941', 32257, 'Elizabeth', '61st Street', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('782924325', 99112, 'Buddy', '54 Oosterhout Drive', 638);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('811622824', 15193, 'Sara', '83 Hearst Street', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('875639587', 99685, 'Saul', '75 Price Street', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('716944263', 96396, 'Burton', '97 Reno Blvd', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('412656737', 92662, 'Maury', '25 New Hope Road', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('932582286', 98196, 'Robert', '89 Serbedzija Road', 638);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('453296223', 11521, 'Vincent', '800 Chesnutt Road', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('226299563', 37672, 'Ned', '64 Reading Street', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('579393147', 48765, 'Anna', '829 Payton Road', 638);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('431762768', 65336, 'Joy', '91 Keen Drive', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('293741871', 65534, 'Ernie', '58 Anthony Road', 688);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('562585786', 73234, 'Ashley', '12nd Street', 766);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('326148134', 59646, 'Roddy', '12 Warren Road', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('276392648', 14852, 'Danny', '5 Del Toro Road', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('993432783', 57289, 'Mena', '86 Nelly Road', 432);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('675687437', 62842, 'Casey', '23 Belp Drive', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('863733186', 92448, 'Larnelle', '13 Plimpton Drive', 116);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('884561779', 87188, 'Wang', '41 Palo Alto', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('728342748', 12173, 'Maura', '8 Keith Street', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('376333527', 62597, 'Andre', '100 Jeffreys Road', 925);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('666163371', 99424, 'Wade', '331 McConaughey Drive', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('143932822', 13943, 'Rosco', '89 Sandler Drive', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('536918883', 62698, 'Adina', '71 Viterelli', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('816774532', 29447, 'Harriet', '6 Research Triangle Stree', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('425883123', 69212, 'Austin', '12 Villata Road', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('799841495', 62657, 'Jonny Lee', '21 Nigel Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('387252427', 66859, 'Samantha', '90 Barcelona', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('576126279', 77445, 'Brothers', '79 Blades Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('934166935', 29395, 'Collective', '76 Erlangen', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('864116937', 49781, 'Stephen', '878 Greenville Drive', 847);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('141385338', 85589, 'Max', '92 Harary Ave', 461);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('553125419', 77463, 'Ice', '68 Dortmund Drive', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('536133582', 13546, 'Cesar', '84 Dupree', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('412442987', 51819, 'Denny', '44 Ponty', 698);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('766893638', 16542, 'Tori', '858 Suzy Road', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('626679384', 81546, 'Karon', '48 Carson City Drive', 649);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('284732198', 18279, 'Emerson', '42nd Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('913223661', 79744, 'Davis', '66 Rachel Road', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('441562394', 52469, 'Dionne', '90 Jamal Street', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('482558995', 23315, 'Elvis', '591 Ryder Street', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('795339569', 97544, 'Mika', '63 Natascha Road', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('412895199', 62444, 'Gin', '14 Moffat Road', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('117238837', 37548, 'Hookah', '36 Donelly Drive', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('166331437', 47569, 'Tramaine', '123 Flanagan Ave', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('288684155', 27947, 'Cheryl', '65 Earl Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('543651459', 14911, 'Mira', '869 Farrow Road', 847);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('772633556', 97775, 'Marina', '82 Rufus Blvd', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('344872296', 79633, 'George', '29 Griggs Ave', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('512124368', 88675, 'Geoffrey', '75 Lisbon Road', 123);
commit;
prompt 600 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('539927649', 83996, 'Amanda', '49 Osment Street', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('415425523', 88817, 'Meredith', '34 Coldmeece Street', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('793848189', 34141, 'Edward', '48 Riverdale Road', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('424726523', 73396, 'Madeleine', '825 Fiorentino', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('662914999', 74936, 'Natacha', '925 Nunn Ave', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('268291251', 28947, 'Charlton', '13 Kline', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('137393237', 38419, 'Gloria', '66 Gailard Street', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4296664291', 79466, 'Red', '72 Rocklin Blvd', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5243174595', 61613, 'Cherry', '98 Pasadena Road', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5431571217', 92999, 'Ben', '87 Ittigen Drive', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7479433931', 72579, 'Lesley', '94 Avenged Road', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4139684779', 64179, 'Will', '85 Cheshire Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4754684667', 46558, 'Dabney', '373 Rockford Drive', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1795956547', 83845, 'Gabrielle', '83rd Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3769282168', 94266, 'Mary Beth', '69 Douglas Ave', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2668441569', 95882, 'Louise', '33 Carradine Street', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8188541232', 21882, 'Tom', '810 Micky', 547);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2897849347', 51473, 'Oded', '83 Burstyn Drive', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1688829752', 17868, 'Jane', '365 Griffiths Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1787245871', 77623, 'Tramaine', '247 Monument Drive', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9416131845', 98423, 'Robin', '62 Liquid Blvd', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9862482491', 95282, 'Morris', '75 Judge Road', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3433988495', 94974, 'Taryn', '471 Butner Street', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4166114792', 71886, 'Philip', '55 McKennitt Road', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9425446591', 15631, 'Marie', '53 Alessandria Blvd', 688);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3134686785', 67764, 'Terry', '61 Danni Road', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3686349586', 49779, 'Harvey', '4 Richter', 766);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9786761116', 98711, 'Rowan', '5 Schock Road', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8211759652', 53378, 'Sissy', '46 Todd Road', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1996931161', 77628, 'Buffy', '61 Burmester Drive', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4366555256', 54515, 'Murray', '24 Annie Road', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4273122599', 72232, 'Chris', '84 Benson Road', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5944225283', 23575, 'Roberta', '1 Gallagher Road', 982);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5362273782', 14979, 'Jeffrey', '51 Pepper', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2643858685', 18411, 'Claire', '68 Petach-Tikva Ave', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1877448513', 22224, 'Sean', '42 Williams Road', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4638781835', 26972, 'Gailard', '53 Tomlin Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8527251753', 24661, 'Chalee', '25 Eileen Road', 847);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4281985213', 75114, 'Lili', '42nd Street', 649);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7779157775', 71892, 'Tobey', '81 Derringer Street', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8548375211', 62826, 'Elisabeth', '39 Akins Road', 461);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8158943855', 15759, 'Jim', '35 Jackson Street', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9843416295', 97217, 'Benicio', '93 Boulogne', 925);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8834526238', 67571, 'George', '72 Cyndi Blvd', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8136742263', 93917, 'Rip', '91 Theron Blvd', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7773781898', 56153, 'Randy', '64 Claude Street', 791);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4773336526', 85671, 'Darius', '62 Bush Drive', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6283795984', 74121, 'Graham', '282 Rush Road', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4586384752', 26926, 'Danny', '718 Paxton Road', 119);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2463438168', 73532, 'Breckin', '82 McGovern Drive', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7851182811', 19696, 'Martin', '62nd Street', 172);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2278516893', 65997, 'Gran', '62nd Street', 857);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3778133263', 92355, 'Martha', '32 Crystal Street', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7222312645', 19861, 'Nik', '57 Toshiro Blvd', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6457773678', 77197, 'Ruth', '9 Spencer Drive', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5296261851', 26746, 'Jamie', '100 Kejae City Street', 538);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1733635832', 87716, 'Brent', '80 Azucar Road', 411);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8885988665', 57653, 'Horace', '26 Edenbridge Street', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2258289413', 55873, 'Juliana', '25 Armand Street', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9371736424', 82923, 'Holly', '32 Butler Drive', 414);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5233761127', 59244, 'Mae', '11 Rocklin Blvd', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2486629214', 97375, 'Javon', '6 Carson City Road', 974);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7654916552', 41384, 'Cuba', '74 Michael Ave', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8313693452', 81987, 'Jeroen', '321 Harrison Street', 677);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8665627314', 73148, 'Scott', '19 Terri Street', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9869478529', 31496, 'Kay', '21st Street', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3485791776', 79249, 'Nancy', '841 Marin Drive', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2787239929', 69669, 'Tara', '1000 Mary Drive', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1866683332', 25764, 'Tobey', '3 Khan Road', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6159553334', 82911, 'Jamie', '61 Shirley Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7796251884', 79748, 'Rene', '43 Reynolds', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3626319457', 76245, 'Anjelica', '23 Oslo Street', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4634574517', 73321, 'Milla', '60 Avital Blvd', 854);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7344754641', 47283, 'Micky', '488 Tara', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3862579613', 42839, 'Buddy', '99 Englewood Road', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9773588895', 79921, 'Hex', '83 Pigott-Smith', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1863674461', 75621, 'Jimmie', '6 Debby Road', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9588457511', 91717, 'Terry', '95 Ismaning Road', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8469153351', 52715, 'Carlene', '31 Overstreet Street', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6214287666', 58835, 'Dermot', '42 Witherspoon Blvd', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8962941268', 46755, 'Lorraine', '90 Bancroft Ave', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8678167183', 41221, 'Belinda', '814 Stills Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1475561221', 96385, 'Harold', '13 Clinton Street', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7465688763', 38463, 'Ruth', '287 Lipnicki', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4649952754', 15723, 'Chuck', '10 Van Der Beek Ave', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5473414822', 23772, 'Nicole', '39 Lima Street', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9126219128', 26169, 'Fred', '52 Galecki Road', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7696456775', 69361, 'Daniel', '42 Klein Street', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1299653629', 54244, 'Maura', '85 Pasadena Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4782235142', 16648, 'Mike', '86 Green', 642);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4389133894', 48875, 'Saul', '55 Rucker Drive', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7854111166', 62248, 'Cheryl', '174 Carlyle Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3245359592', 84539, 'Rhea', '42 Oded Road', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1619798766', 99743, 'Alessandro', '72 Marie Road', 318);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6157652118', 18874, 'Robert', '73 Ankara Blvd', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6565868354', 46918, 'Holly', '99 Shaw Street', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4316394927', 13568, 'Warren', '81st Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3871681371', 33975, 'Toni', '52nd Street', 628);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4948257459', 48731, 'Cherry', '66 Warsaw', 538);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5313999617', 62148, 'Jean-Luc', '48 Alexandria Street', 699);
commit;
prompt 700 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5471453661', 19131, 'Brothers', '43 Tanya Road', 579);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2127251989', 76672, 'Nancy', '37 Barueri Street', 483);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1136252545', 93216, 'Bernard', '941 Kinnear Road', 484);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2786165676', 15656, 'Ice', '29 Wuerzburg Street', 566);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2625562785', 77871, 'Marie', '36 Nelligan Road', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5685558678', 71344, 'Josh', '81 Roger Road', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3253621295', 97445, 'Minnie', '4 Marx Drive', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7373845143', 55447, 'Julio', '23 New boston', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8714624978', 19891, 'Tim', '21 Fariq', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3928987685', 21655, 'Scott', '73 Chiba Street', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9935265823', 48714, 'Red', '43 Waite Drive', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5891441993', 17138, 'Sydney', '35 Midler Road', 414);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1552846751', 85629, 'Carrie', '73 Cerritos Street', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9749875974', 36681, 'Richard', '5 Paige', 734);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4184718121', 82172, 'Kirk', '396 Mitchell Street', 852);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4478768158', 47433, 'Teri', '41st Street', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3158986312', 13985, 'Pam', '15 Sinise Road', 919);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7523137597', 65837, 'Dar', '4 Springville Drive', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3913621237', 83761, 'Freddie', '39 Augsburg Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2522587677', 63737, 'George', '74 Cassidy Street', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5774118598', 69629, 'Lauren', '23 Eder Blvd', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6671667943', 56892, 'Giancarlo', '942 Davis Road', 731);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3695361491', 94243, 'Cloris', '599 Arden Street', 216);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2784975714', 54758, 'Martin', '85 Takamatsu Road', 588);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5499894687', 28179, 'Forest', '22 San Francisco Road', 849);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5468615465', 99783, 'Rosanna', '19 Janssen Street', 461);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7353335513', 53686, 'Ewan', '57 Hilton Street', 572);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9525645722', 46574, 'Maxine', '18 Bkk Drive', 225);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8827844251', 65271, 'Jackson', '41 Quinn Street', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1417555157', 22335, 'Freda', '83 Alessandria Street', 313);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7331545656', 46793, 'Saul', '551 Warburton Drive', 858);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9713198546', 91572, 'Isaac', '329 O''Donnell Drive', 847);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8213283564', 54561, 'Illeana', '67 Bates Road', 323);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4533884612', 12971, 'Ron', '22 Fonda Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9835356417', 12888, 'Larry', '50 Numan Drive', 345);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8434898244', 74835, 'Vincent', '26 Randal Ave', 181);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4413495389', 94426, 'Albert', '49 Stanley', 286);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7626846833', 41612, 'Geoffrey', '63 Canal Winchester Stree', 699);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1559617866', 83386, 'Chris', '85 Kyle Road', 388);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1951941764', 81148, 'Derrick', '110 Brooke Street', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8918237612', 67117, 'Juan', '96 Gordon', 461);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8388329841', 85724, 'Buddy', '96 Rucker Blvd', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7888469372', 17127, 'Vickie', '55 Christmas Street', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9644871452', 68172, 'Raymond', '18 Brendan Street', 941);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5471174264', 35857, 'Alicia', '802 Tucci Street', 262);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5957932493', 67726, 'Rachid', '82 Elizabeth Blvd', 461);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3986166328', 16652, 'Illeana', '82 Jun-nam Street', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1645225237', 51425, 'Mike', '32nd Street', 699);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4628677173', 35233, 'Kylie', '69 Yulin Road', 566);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6587951682', 34855, 'Jennifer', '919 Savage Road', 649);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1841553359', 57256, 'Nastassja', '54 Mattea Blvd', 176);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4996952496', 22463, 'Aida', '58 Stevens', 276);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7383597485', 11593, 'Sam', '33 Hoffman Road', 426);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3591975417', 33829, 'Geggy', '44 Irene', 153);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6935241411', 73751, 'Franz', '88 Genטve', 688);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6487495161', 53433, 'Thora', '230 Mnster Ave', 123);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3417655145', 24723, 'Irene', '8 Shepard Drive', 697);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6588773733', 18268, 'Graham', '55 Aberdeen Drive', 381);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3262514546', 14278, 'Allan', '3 Hiatt Road', 544);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9968156114', 52457, 'Anita', '98 MacDonald Street', 292);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1653642873', 24117, 'Hilton', '65 Fierstein Ave', 925);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9176752437', 53522, 'Lauren', '74 Graz Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3165988382', 77434, 'Debby', '18 Hawke Ave', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8611883823', 79717, 'Petula', '47 Kathy Ave', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5478941516', 61253, 'Ethan', '17 Trejo Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2437132392', 87632, 'Joseph', '93 April Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3735862592', 96442, 'Meryl', '85 Cocker Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4474375523', 65779, 'Brian', '569 Taoyuan Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3398645115', 68856, 'Joey', '12 Salem Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3367257834', 42911, 'Madeleine', '29 Horb Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7371288542', 49877, 'Derrick', '35 Vega Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9832858398', 27888, 'Marianne', '976 Harrisburg Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6225312774', 77211, 'Quentin', '234 Waalwijk Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8829149638', 18139, 'Jaime', '53rd Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6661344854', 61336, 'Diane', '211 Close Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5845598896', 33699, 'Donna', '735 Vendetta Ave', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6394355332', 22619, 'Gavin', '81 Gloria Blvd', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1695384786', 18653, 'Vonda', '36 St. Petersburg Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7762554585', 56857, 'Cherry', '25 Elizondo', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2731468511', 77995, 'Gilbert', '69 Stamp Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7368611978', 47341, 'Carrie-Anne', '242 Eat World Blvd', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3452265397', 98224, 'Ritchie', '997 Coimbra Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2512693235', 31991, 'Milla', '63 Goldie Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7138272463', 35113, 'Max', '78 Beth Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7268659635', 93211, 'Delroy', '13 Dalley Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1279564436', 65586, 'Gary', '73 Dillon', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7675741133', 11843, 'Steven', '24 Shannyn Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1919895524', 69714, 'Parker', '634 Buffalo Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5258669772', 44135, 'Mena', '71st Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4337656698', 69415, 'Merillee', '40 Lovitz Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3921419164', 92478, 'Rade', '743 Rebhorn Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1154292746', 92459, 'Carolyn', '30 Devine Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1426276859', 85786, 'Peabo', '3 Ving Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5572578284', 85726, 'Greg', '90 Angelina Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7669799582', 57278, 'Gord', '17 Guinness Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4392449598', 48441, 'Harvey', '33rd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4617596326', 83771, 'Meredith', '76 Lily Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6788887377', 68267, 'Laurie', '90 Armstrong Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7897314662', 32339, 'Neil', '57 Grant Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7299165299', 42746, 'Regina', '350 Gary Street', 8);
commit;
prompt 800 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8163774638', 97946, 'Holly', '939 Saxon', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6379143321', 68973, 'Nicky', '70 Hawkins Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4191917213', 91221, 'Bette', '45 Dick Blvd', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5495521923', 42215, 'John', '73 Max Ave', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8758698349', 15322, 'Rik', '21st Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9884212239', 33582, 'Pam', '550 Geggy Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4438359316', 42526, 'Delroy', '63rd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4564452672', 56819, 'Davis', '99 Stellan Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2675572723', 64445, 'Lionel', '80 Margulies Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2852377347', 78121, 'Sydney', '576 Diesel Blvd', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5445757538', 45413, 'Javon', '48 Landau Blvd', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6535869373', 12197, 'Ivan', '63 Pete Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2971145991', 96816, 'Jeff', '32 Neuquen Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4678891535', 85391, 'Shirley', '45 Raye Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2545564869', 31719, 'Cesar', '27 Klugh Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6624479864', 88458, 'Anjelica', '21st Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8591316241', 87162, 'Sophie', '758 Harper Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1659584135', 59845, 'Woody', '67 Moriarty', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6727762231', 88781, 'Mary', '294 Jolie Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3992364717', 93828, 'Anjelica', '61 Randall Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5375346353', 68969, 'Bruce', '29 Holland Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5139343971', 58845, 'Tara', '33rd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9212936721', 92727, 'Will', '25 Eddie', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4271392848', 12194, 'Julie', '53 Hillerרd Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8752148672', 18597, 'Roscoe', '72 Waltham Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2319714656', 43655, 'Chloe', '39 Whitwam Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7716287467', 62126, 'Rhett', '91 Woody Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6819242558', 82651, 'Hugh', '20 Del Toro Blvd', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8321863543', 41486, 'Harris', '68 Presley Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9418936471', 55691, 'Benicio', '32nd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9264919637', 63968, 'Rip', '91 Schwimmer Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2341891111', 49145, 'Sheryl', '57 Brooke Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1768385324', 77312, 'Aimee', '27 Gleeson Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6661361591', 79455, 'Liev', '1 Van Helden Blvd', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7432239712', 33821, 'Avril', '22nd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3376475159', 34792, 'Gladys', '63 Rebecca Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2814156817', 56121, 'Lauren', '33 Yavne Blvd', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7249393851', 32531, 'Brendan', '36 Niven Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6754287758', 69835, 'Ethan', '100 Jennifer Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2645715793', 31537, 'Tara', '92 Ronny Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3121479941', 85337, 'Arnold', '660 Cedar Park Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5632419782', 73324, 'Wendy', '22 Sarah Ave', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4711267217', 68742, 'Ethan', '43 Dalmine Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7442858374', 85761, 'Parker', '35 Waltham Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3682993351', 42575, 'Marie', '567 Shannon Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7995152416', 44617, 'Melba', '82nd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4425217569', 73617, 'Lydia', '55 Hayes Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6592768943', 12559, 'Miranda', '12nd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8346579142', 14632, 'Juliana', '87 Davison Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7573331994', 36893, 'Colleen', '453 Bellevue Blvd', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5227736181', 17449, 'Claire', '97 Secada Blvd', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3827962419', 91977, 'Saffron', '23rd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6367437857', 87665, 'Wang', '40 East sussex Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9119983527', 79445, 'Ivan', '71st Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3874847128', 14939, 'Clint', '88 Campbell Blvd', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1521535827', 88157, 'Garth', '55 Rauhofer Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1739151733', 59981, 'Rhett', '40 Tilda Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8642177478', 93634, 'Vivica', '207 Pirapora bom Jesus St', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3817779733', 99297, 'Geena', '6 Tustin Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5162722551', 87916, 'Rade', '22nd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7174589269', 66512, 'Glenn', '44 Carrington Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1669447463', 82648, 'Beth', '25 Cetera Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8835413811', 26637, 'Cheech', '79 Field', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5524828784', 45567, 'Vondie', '38 Gord Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5283261497', 59148, 'Rip', '54 Rhymes Blvd', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2588719551', 94554, 'Jody', '16 Jann Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8918582593', 26995, 'Ossie', '52nd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4493864451', 48998, 'Bridget', '83rd Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2967551197', 67842, 'Boz', '925 Arquette Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9223479174', 68873, 'Arnold', '38 Mould Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8684683732', 15678, 'Connie', '655 MacDonald Ave', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4936842543', 98847, 'Rose', '25 Nagano Blvd', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7493962624', 84143, 'Radney', '33 Auckland Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1972696427', 16883, 'Gene', '88 Mel', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5294525145', 91369, 'Dermot', '24 Thames Ditton Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9545963225', 31268, 'Denis', '48 Rock Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8234117851', 19585, 'Hal', '564 Voight Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6615135832', 58666, 'Vivica', '767 Stuermer Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9265745198', 25332, 'Bob', '56 Guadalajara Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8162895776', 16192, 'Davy', '82nd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1552176745', 55461, 'Tamala', '90 Beckham Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3699449354', 39749, 'Carole', '136 Holbrook Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5119925911', 36523, 'Carla', '50 Istanbul Ave', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1595363523', 14457, 'Frances', '13rd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6973444811', 64959, 'Julianna', '23rd Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2544448156', 34618, 'Bonnie', '35 Lance Blvd', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2948282149', 57137, 'Sal', '68 Madeleine', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4413529937', 74567, 'Ellen', '14 Weiss Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6427182855', 75632, 'Rolando', '78 Scaggs Blvd', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2474796874', 41638, 'Harold', '49 Zagreb Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1376166343', 81926, 'Jonatha', '915 Chan Blvd', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8639796783', 53881, 'Gloria', '33 Mitchell Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5455515387', 85332, 'Grant', '22 New York Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3921276813', 67831, 'Daryle', '42 Fairuza Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3237982385', 51687, 'Delroy', '73 South Weber Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7328938465', 15243, 'Chalee', '31st Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4957794221', 42139, 'Caroline', '50 Stowe Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1341883254', 72893, 'Roddy', '16 Wageningen Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4634591521', 72159, 'Jon', '206 Holland Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1773248368', 22449, 'Winona', '92 Pat Street', 8);
commit;
prompt 900 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6221997747', 58465, 'Ali', '6 Horton', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9292638721', 93569, 'Joshua', '13 Downey Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1345682861', 63362, 'Kate', '65 Hackensack Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1444563319', 97299, 'Gates', '32 Barry Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1232197168', 15136, 'Trace', '8 Russo', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9398985884', 56167, 'Sissy', '16 Nelligan Ave', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7387145978', 19877, 'Leslie', '675 Roberta Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6251393283', 93824, 'Liv', '3 Bronx Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7182815158', 61796, 'Raymond', '13 Hewitt Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2933799583', 14878, 'Remy', '84 Colin Young Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7386912118', 14956, 'Queen', '41 Rhodes Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7383699966', 38868, 'Kirsten', '81 Derwood Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6825269657', 16986, 'Thora', '28 Hהssleholm', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1359862163', 96636, 'Roddy', '93 Shepherd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4364976145', 65398, 'Domingo', '62nd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6349422977', 79357, 'Lauren', '29 Sao roque Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2985177545', 73561, 'Warren', '47 Maguire Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2822833839', 16941, 'Lynn', '49 Arnold Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2929315533', 26387, 'Benjamin', '20 Julio', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0523666898', 111, 'chaim', 'rabbi benjyamin 11', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0526697854', 112, 'ayala', 'rabbi benjyamin 1', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0505559895', 114, 'chen', 'heliyhu hakoren1 3', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0556968741', 113, 'chanan', 'hazmaut 21', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1434218172', 97624, 'Night', '86 Holiday Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5356976321', 45666, 'Lloyd', '19 Connie Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7632927281', 12424, 'Jeff', '22 Balaban Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6981928136', 18795, 'Clive', '668 Patricia Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8941243829', 36655, 'Milla', '59 Des Plaines Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1781624352', 13649, 'Chrissie', '64 Glover Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8686692111', 14562, 'Sigourney', '78 Avril Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6284247867', 42454, 'Susan', '534 Dave Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5244877523', 91925, 'Nanci', '53 Paltrow Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8155868855', 68472, 'Grant', '64 Huntington Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2742994836', 84148, 'Andy', '77 Gayle Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5516441195', 96588, 'Charlton', '617 Lemmon Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9914339894', 16966, 'Clarence', '54 Wen Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4265195898', 74792, 'Marina', '93 Steagall Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1518931434', 34928, 'Udo', '12 Garcia Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4962359575', 23188, 'Isabella', '88 Madsen Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7542863284', 35265, 'Thelma', '12 Damon Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7741254824', 86986, 'Wayman', '98 Botti Ave', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5312611619', 16763, 'Jeff', '48 Manchester Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4183256946', 34696, 'Solomon', '56 Esposito Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1995716991', 15263, 'Lily', '27 Shannon Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3194438187', 41256, 'Diane', '81 Spring City Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7275177663', 21781, 'Gary', '97 Macht Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6961271321', 88792, 'Cheryl', '9 Colon Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5928599998', 38325, 'Jesse', '58 Harper', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1722384635', 95126, 'Lee', '263 McCann Blvd', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9455232171', 23326, 'Jerry', '60 Oakenfold Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2498885676', 65168, 'Emma', '722 Brock', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2111176131', 61965, 'Joey', '42nd Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1338676692', 79615, 'Anthony', '64 Vaduz Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1989257753', 96311, 'Cloris', '5 Costner Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5297728152', 18584, 'Alfie', '2 Harvey Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8389328251', 22755, 'Harris', '2 Kinnear Blvd', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3192826296', 76427, 'Donald', '44 Guzman Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9615274415', 52216, 'Latin', '36 Rick Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3143984288', 24128, 'Gladys', '83 Maura Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7584115584', 95981, 'Kim', '51 Hawkins Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7241779134', 65862, 'Sally', '54 Portland Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9245252367', 62414, 'Rosie', '1 Heslov Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2499863167', 85452, 'Pamela', '29 Stephanie Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5352268765', 54563, 'Wes', '61 Herbie Blvd', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2761282745', 62825, 'Tim', '43 Giessen Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5279555454', 76583, 'Gloria', '72nd Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3936757796', 26824, 'Jimmie', '47 Northam Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7755896194', 76234, 'Teena', '1 Cheshire Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1366433176', 43611, 'Jessica', '227 Antonio Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4321386763', 78461, 'Kiefer', '2 urban Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4921874144', 47449, 'Gerald', '21 Pigott-Smith Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1467386631', 31135, 'Darren', '7 Cobham Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8666571656', 25266, 'Brendan', '23rd Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8868567747', 58634, 'Nile', '725 Laws Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3127982496', 64794, 'Rachael', '7 Sellers Blvd', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1935766743', 58673, 'Mos', '72 Beckinsale Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7764755643', 57959, 'Rosie', '61 Pat Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4133547114', 92281, 'Kay', '82 Conners Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4376713369', 81562, 'Madeline', '39 Mary Beth Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5231825866', 13489, 'Julia', '2 Connick Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7774919673', 56162, 'Daryle', '55 Ontiveros Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3349744791', 81281, 'Omar', '17 Ljubljana Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3835573735', 57141, 'Lonnie', '97 Murray Blvd', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4736666821', 93349, 'Lois', '71st Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8535295136', 46831, 'Kay', '42nd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2132913886', 26867, 'Buddy', '96 Sanchez Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1847254394', 28538, 'Joey', '84 Copeland Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6983813742', 76356, 'Isabella', '15 Butler Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6279143243', 17577, 'Ian', '45 Cantrell Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1432736741', 97676, 'Timothy', '71st Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7448971952', 66666, 'Dabney', '1 Allen Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3184146825', 54769, 'Gary', '16 Hannover', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1412625415', 95916, 'Reese', '836 Willis Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9229916433', 36223, 'Rhona', '91st Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6362931129', 67724, 'Angelina', '58 Jenkins Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8836137563', 64426, 'King', '62nd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3822183261', 22176, 'George', '48 Jude Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5143178789', 45314, 'Latin', '62 Altamonte Springs Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9981724245', 99181, 'Julie', '92nd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6647955754', 35289, 'Madeleine', '74 Yulin Blvd', 1);
commit;
prompt 1000 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2571156674', 39652, 'Chalee', '10 Blanchett Ave', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5667525114', 99516, 'Art', '409 Finn Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8968892696', 95435, 'Ani', '73 Anderson', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3933963862', 34284, 'Daryle', '14 Solido Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5712933739', 41585, 'Trick', '16 Huntsville Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5267614388', 13299, 'Nils', '93 Whitley Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7186114224', 72977, 'Dylan', '10 Maryville Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4237794471', 27661, 'Neil', '54 Pam Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4476496389', 81456, 'Liv', '4 Sorvino Ave', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8114447728', 62776, 'Aimee', '486 Ian Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3834131436', 83361, 'Alicia', '54 Bedfordshire Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6312243438', 41653, 'Roy', '89 Stockard Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2686379884', 22191, 'Jaime', '2 Fox Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4666747448', 58337, 'Dom', '32 Gwyneth Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6981195961', 22138, 'Geraldine', '93rd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3777575834', 53113, 'Kirk', '281 Caan Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3792768134', 63935, 'Rhett', '82nd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8251292148', 53823, 'Wang', '82nd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1378895843', 35468, 'Embeth', '16 Teng', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4671193626', 73724, 'Daryl', '83 Suffern Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7337518411', 97184, 'Jean-Claude', '63rd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5333542244', 61113, 'Jay', '46 Bracco Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4246259673', 97665, 'Doug', '89 Salvador Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7528159588', 89353, 'Gran', '55 Miles Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1977623315', 14453, 'Yolanda', '85 Paxton', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6369389177', 13548, 'Marty', '66 Sara Ave', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7264752969', 63474, 'Bobby', '302 Bale Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9621811828', 28284, 'Rosco', '54 Chet Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6793915745', 49651, 'Marina', '52 David Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2245565224', 84141, 'Ashton', '17 Freising Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1393973888', 88944, 'Suzanne', '34 Berkoff Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2683312229', 49986, 'Tobey', '72 Natacha Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6795351784', 34579, 'Malcolm', '100 Weisberg Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6855265477', 69535, 'Winona', '50 Hornsby Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1983239659', 37925, 'Olga', '60 White Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5226796722', 94964, 'Mike', '1 O''fallon Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4761111674', 22348, 'Jeffery', '23 Cross Road', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8984367998', 52419, 'Norm', '43rd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5466655127', 52852, 'Loren', '24 Baltimore', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3554739263', 31134, 'Barbara', '61 Germantown Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8664694229', 27361, 'Vertical', '98 Carson City Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2837199619', 98342, 'Toni', '14 Ryan Ave', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6482213684', 62547, 'Rickie', '83rd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1585245453', 37517, 'Donna', '86 Whoopi Ave', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6266423648', 28973, 'Rawlins', '42 Derrick Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5761898432', 76343, 'Sigourney', '451 Cochran Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9954478874', 94956, 'Rupert', '13 Jackman Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3554172881', 74449, 'Joanna', '57 Antwerpen Road', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5742144325', 42551, 'Judi', '84 Marisa Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5527115472', 65451, 'Hank', '8 Chicago', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6392324795', 14655, 'Gates', '56 Hex Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6359176437', 48574, 'Bridget', '50 Delroy Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7353317998', 61694, 'Rueben', '36 Lisbon Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('1321861161', 83193, 'Freddy', '53 Carrington Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('7169925362', 82128, 'Helen', '92nd Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3661987463', 37694, 'Emilio', '77 Henriksen Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4696859441', 92855, 'Fats', '50 Hong Ave', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4163185327', 47488, 'Nelly', '57 Stigers Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6629361643', 76115, 'Lisa', '70 Wolf Drive', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4121373778', 48739, 'Forest', '433 Kinney Drive', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4541844423', 44498, 'Vanessa', '44 Edgar Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5379729616', 62786, 'Alana', '220 Pretoria Street', 2);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8377865443', 91844, 'Geggy', '65 Rush Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4256318435', 32549, 'Teri', '12nd Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9779637622', 55347, 'Hazel', '34 McDormand Road', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4493614764', 47696, 'Humberto', '1 Albright Road', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('3429161194', 16978, 'Orlando', '73rd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2891558296', 62486, 'Brendan', '63 Perry', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6855425649', 21172, 'Clay', '87 Robinson Blvd', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('6636144545', 39545, 'Robert', '22 Hilary Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('9245785982', 44557, 'Chubby', '25 Christopher Street', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2924826715', 22353, 'Stanley', '33rd Street', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('4514197485', 36747, 'Bonnie', '25 Hartnett Drive', 8);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2194629785', 36852, 'Richie', '82 Lewin Ave', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('8698394988', 25997, 'Jean-Luc', '15 Austin Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('5965376163', 54143, 'Laurence', '81st Street', 1);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('2722794177', 85265, 'Darius', '61 Seatle Drive', 5);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0503353848', 10305, 'Zalman Benprat', null, 61);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0505353020', 11056, 'Amiel Zalmanovitch', null, 22);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0537904299', 11512, 'Yehuda Gorodetski', null, 70);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0525806044', 11564, 'Assaf Tahar', null, 30);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0509588429', 11710, 'Yaacov Tahar', null, 53);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0503355905', 12105, 'Yehuda Ventura', null, 21);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0540122208', 12314, 'Jack Tahar', null, 28);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0534474546', 12479, 'Shimon Azoulay', null, 47);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0501658904', 13121, 'Yoram Zalmanovitch', null, 45);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0501702132', 13255, 'Jack Amihud', null, 19);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0529315606', 13279, 'Yehuda Levy', null, 55);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0504350284', 13604, 'Ofer Zehavi', null, 43);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0549081543', 14531, 'Moshe Zehavi', null, 35);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0548217847', 15368, 'Jack Zalmanovitch', null, 48);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0523905792', 15637, 'Gabriel BarAsher', null, 27);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0524311369', 15914, 'Yehuda Bouzaglo', null, 56);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0588596031', 15967, 'Yehuda Cohen', null, 9);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0543920339', 16871, 'Yechiel Benprat', null, 78);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0544251072', 18200, 'Yoram Goldberg', null, 61);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0524516723', 19249, 'Amiel Goldmann', null, 9);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0506419080', 19436, 'Assaf Gorodetski', null, 20);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0534608162', 21012, 'Jack Zehavi', null, 49);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0507666934', 21285, 'Ofer Bouzaglo', null, 26);
commit;
prompt 1100 records committed...
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0535263354', 21943, 'Yossef BarAsher', null, 49);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0587127127', 23498, 'Yoram Goldmann', null, 51);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0504790092', 24839, 'Shimon Amichai', null, 66);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0534994416', 24966, 'Avishai Cohen', null, 28);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0509256376', 25968, 'Yossef Goldenberg', null, 29);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0581868333', 26497, 'Yehuda Suissa', null, 53);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0546107099', 26519, 'Yossef Bouzaglo', null, 64);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0582225064', 27203, 'Amiel Amihud', null, 42);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0528133488', 27832, 'Avi Azoulay', null, 57);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0531541986', 28071, 'Yaacov Suissa', null, 10);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0585933508', 28924, 'Assaf Beneliyahu', null, 12);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0540643940', 31007, 'Assaf Bardaat', null, 13);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0547153838', 31046, 'Daniel Zehavi', null, 38);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0524280026', 32292, 'Moshe Azoulay', null, 78);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0542366045', 33227, 'Avi Tahar', null, 70);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0502603812', 33519, 'Aharon Amichai', null, 76);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0509733243', 33886, 'Shimon Amihud', null, 34);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0586628774', 34185, 'Daniel BarAsher', null, 31);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0582162179', 34493, 'Zalman Amihud', null, 12);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0527197240', 35040, 'Yoram Zehavi', null, 62);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0589442688', 35436, 'Shmuel  Tahar', null, 22);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0505951586', 36434, 'Amiel Bardaat', null, 38);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0586275406', 37875, 'Daniel Tahar', null, 40);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0539508550', 38238, 'Shimon Ventura', null, 67);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0507745709', 38246, 'Daniel Zalmanovitch', null, 44);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0523361053', 38348, 'Yoram Bardaat', null, 11);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0585704678', 38867, 'Assaf Benprat', null, 31);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0502911562', 39333, 'Yechiel Cohen', null, 54);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0545447309', 39423, 'Gabriel Gorodetski', null, 49);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0580083074', 40301, 'Avi Levy', null, 27);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0547170731', 41048, 'Daniel Goldberg', null, 44);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0500916026', 42048, 'Yoram Gorodetski', null, 75);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0503120913', 43564, 'Daniel Bardaat', null, 31);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0501018170', 43592, 'Yossef Bardaat', null, 80);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0528985061', 43622, 'Avi Zalmanovitch', null, 17);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0508394164', 44091, 'Shmuel  Amichai', null, 50);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0540086806', 44187, 'Zalman Ventura', null, 26);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0587037421', 44471, 'Avi Amichai', null, 76);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0526941984', 44559, 'Yaacov Beneliyahu', null, 61);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0530470493', 45031, 'Moshe Benprat', null, 23);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0526101663', 45174, 'Jack Ventura', null, 46);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0538773838', 45373, 'Yehuda Bardaat', null, 22);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0532711588', 45614, 'Shmuel  Benprat', null, 58);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0506001842', 45694, 'Yechiel Amichai', null, 72);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0588481532', 45756, 'Moshe Amichai', null, 32);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0506066808', 45902, 'Yossef Zehavi', null, 36);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0544675507', 46141, 'Yehuda Zalmanovitch', null, 22);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0531909674', 46359, 'Jack Amichai', null, 10);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0540580131', 46999, 'Yehuda Goldmann', null, 31);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0501980830', 48635, 'Yechiel Zehavi', null, 80);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0503502683', 48992, 'Yaacov Azoulay', null, 42);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0526150054', 49216, 'Assaf Amihud', null, 22);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0545871526', 49290, 'Aharon Suissa', null, 48);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0537405971', 49624, 'Zalman Goldberg', null, 80);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0536690611', 49899, 'Yehuda Zehavi', null, 12);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0539653189', 50206, 'Yaacov Bouzaglo', null, 12);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0541748967', 50723, 'Moshe Zalmanovitch', null, 53);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0549884675', 51895, 'Avishai Goldmann', null, 17);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0581941351', 51994, 'Zalman Azoulay', null, 73);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0547990653', 51998, 'Daniel Suissa', null, 69);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0539694675', 52131, 'Yechiel Zalmanovitch', null, 72);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0520430818', 53200, 'Aharon Zehavi', null, 27);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0506568515', 53507, 'Yossef Beneliyahu', null, 35);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0540571861', 53830, 'Shmuel  BarAsher', null, 79);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0536437716', 53960, 'Jack Benprat', null, 9);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0539325488', 54154, 'Yossef Goldmann', null, 20);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0533133558', 1580, 'Amiel Levy', null, 69);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0507775534', 1917, 'Jack Bouzaglo', null, 23);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0539205889', 1936, 'Amiel Benprat', null, 64);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0548498688', 2076, 'Zalman Levy', null, 66);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0537559178', 2294, 'Shimon Benprat', null, 66);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0525456700', 2460, 'Yoram Ventura', null, 51);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0507675775', 2787, 'Yaacov Benprat', null, 38);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0523925652', 4464, 'Assaf Goldberg', null, 71);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0544609576', 4543, 'Yaacov Zehavi', null, 21);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0503926479', 6387, 'Ofer Bardaat', null, 38);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0500188715', 6921, 'Aharon Goldmann', null, 28);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0526817348', 7236, 'Yechiel Goldmann', null, 68);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0546638111', 7300, 'Assaf Ventura', null, 71);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0585192626', 7365, 'Yaacov Bardaat', null, 21);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0508383451', 7811, 'Avi Benprat', null, 20);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0509143627', 8019, 'Aharon Ventura', null, 44);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0501171372', 8810, 'Moshe Gorodetski', null, 14);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0583458002', 8853, 'Avishai BarAsher', null, 51);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0548145990', 8863, 'Shmuel  Goldmann', null, 54);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0542158959', 9146, 'Shmuel  Goldenberg', null, 38);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0520880351', 9274, 'Aharon Goldenberg', null, 60);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0585623741', 9842, 'Avishai Beneliyahu', null, 27);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0535461602', 9894, 'Yehuda Amichai', null, 34);
insert into CLIENT (client_phonenr, client_id, client_name, client_address, city_id)
values ('0537641907', 55763, 'Zalman BarAsher', null, 55);
commit;
prompt 1190 records loaded
prompt Loading HASHALA...
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (1, to_date('16-08-2015', 'dd-mm-yyyy'), to_date('24-10-2015', 'dd-mm-yyyy'), 5, 19, 18200, 56018);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (2, to_date('21-09-2014', 'dd-mm-yyyy'), to_date('29-04-2014', 'dd-mm-yyyy'), 9, 9, 2294, 67188);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (3, to_date('31-10-2013', 'dd-mm-yyyy'), to_date('04-10-2008', 'dd-mm-yyyy'), 2, 20, 26497, 75236);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (4, to_date('09-01-2020', 'dd-mm-yyyy'), to_date('05-04-2003', 'dd-mm-yyyy'), 7, 3, 15967, 67645);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (5, to_date('01-12-2008', 'dd-mm-yyyy'), to_date('18-05-2020', 'dd-mm-yyyy'), 9, 7, 8863, 72879);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (6, to_date('23-05-2005', 'dd-mm-yyyy'), to_date('25-12-2012', 'dd-mm-yyyy'), 8, 17, 16871, 72633);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (7, to_date('11-04-2015', 'dd-mm-yyyy'), to_date('11-09-2010', 'dd-mm-yyyy'), 6, 7, 45614, 64087);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (8, to_date('17-10-2001', 'dd-mm-yyyy'), to_date('22-09-2013', 'dd-mm-yyyy'), 5, 9, 33227, 64087);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (9, to_date('08-07-2006', 'dd-mm-yyyy'), to_date('12-04-2020', 'dd-mm-yyyy'), 8, 16, 9274, 60900);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (10, to_date('06-06-2006', 'dd-mm-yyyy'), to_date('30-10-2006', 'dd-mm-yyyy'), 8, 17, 19436, 73636);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (11, to_date('06-08-2011', 'dd-mm-yyyy'), to_date('13-07-2002', 'dd-mm-yyyy'), 5, 6, 49216, 65082);
insert into HASHALA (hashala_id, taken_date, recived_date, recived, book_id, client_id, agent_id)
values (12, to_date('08-02-2014', 'dd-mm-yyyy'), to_date('01-06-2004', 'dd-mm-yyyy'), 3, 17, 15914, 56046);
commit;
prompt 12 records loaded
prompt Loading MODEL...
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (13310, 7, 'yellow', 10000, 'true', 3);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (12110, 5, 'blue', 12000, 'no', 1);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (12220, 5, 'black', 20000, 'no', 2);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (18510, 4, 'blue', 9000, 'no', 4);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (13302, 98, 'blue', 130, 'no', 89);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (69355, 49, 'black', 129, 'no', 160);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (82430, 48, 'white', 29, 'no', 431);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (36901, 23, 'red', 3, 'true', 916);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (26441, 39, 'red', 47, 'no', 4);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (39633, 35, 'black', 118, 'true', 540);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (77809, 95, 'red', 369, 'true', 253);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (93397, 50, 'blue', 79, 'true', 82);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (12099, 34, 'blue', 49, 'true', 912);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (51259, 79, 'white', 269, 'true', 167);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (31352, 91, 'red', 285, 'no', 824);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (40501, 29, 'blue', 245, 'true', 431);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (91592, 40, 'black', 156, 'no', 74);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (31001, 73, 'white', 285, 'no', 414);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (75233, 12, 'blue', 79, 'true', 575);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (10134, 85, 'red', 269, 'true', 9);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (44776, 18, 'white', 55, 'no', 575);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (11874, 65, 'black', 595, 'no', 943);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (16720, 37, 'white', 69, 'true', 309);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (31123, 19, 'white', 125, 'true', 640);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (29396, 95, 'white', 115, 'true', 575);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (41569, 82, 'white', 74, 'no', 3);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (51600, 70, 'green', 71, 'true', 540);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (89446, 83, 'white', 20, 'true', 850);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (33559, 76, 'white', 48, 'true', 1);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (22267, 90, 'black', 267, 'true', 431);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (39015, 50, 'white', 269, 'true', 18);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (41951, 29, 'red', 769, 'true', 335);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (37144, 58, 'black', 319, 'no', 850);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (47172, 53, 'black', 189, 'no', 494);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (60815, 57, 'black', 239, 'true', 253);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (18411, 42, 'blue', 200, 'true', 26);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (79103, 33, 'red', 29, 'true', 414);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (13922, 38, 'blue', 69, 'true', 253);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (80491, 13, 'red', 69, 'true', 82);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (14256, 14, 'green', 198, 'true', 82);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (75635, 40, 'green', 75, 'no', 575);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (55510, 98, 'red', 136, 'no', 431);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (21133, 26, 'white', 69, 'true', 4);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (33952, 47, 'green', 229, 'true', 575);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (48170, 42, 'blue', 356, 'no', 17);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (27177, 53, 'white', 7, 'no', 160);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (52477, 29, 'red', 134, 'no', 89);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (19458, 92, 'black', 23, 'true', 253);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (64484, 81, 'blue', 22, 'no', 98);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (11434, 31, 'red', 105, 'no', 640);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (51086, 43, 'green', 129, 'true', 98);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (76809, 95, 'black', 1, 'true', 14);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (72937, 79, 'red', 87, 'no', 431);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (41203, 77, 'blue', 198, 'no', 359);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (33648, 10, 'black', 179, 'no', 2);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (10821, 98, 'green', 18, 'no', 824);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (79837, 10, 'red', 90, 'true', 37);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (31091, 76, 'white', 54, 'true', 850);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (33399, 73, 'black', 7, 'no', 17);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (57928, 35, 'blue', 329, 'true', 4);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (39927, 63, 'white', 356, 'true', 649);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (96782, 91, 'blue', 59, 'no', 65);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (49679, 52, 'black', 69, 'no', 253);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (27131, 25, 'blue', 209, 'true', 286);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (90000, 19, 'blue', 169, 'true', 540);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (92556, 33, 'black', 115, 'no', 78);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (70606, 11, 'white', 16, 'no', 575);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (89086, 90, 'green', 49, 'no', 824);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (45636, 61, 'black', 77, 'true', 540);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (76934, 96, 'black', 285, 'true', 16);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (78875, 14, 'green', 399, 'true', 483);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (63311, 97, 'blue', 109, 'no', 4);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (51064, 60, 'red', 115, 'true', 253);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (86449, 77, 'red', 519, 'true', 52);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (40685, 71, 'blue', 519, 'no', 908);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (83514, 29, 'black', 165, 'true', 649);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (42153, 48, 'red', 45, 'true', 414);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (27539, 98, 'red', 125, 'no', 74);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (57791, 87, 'blue', 15, 'true', 84);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (31055, 30, 'green', 275, 'true', 483);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (92524, 50, 'red', 1, 'true', 28);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (46566, 20, 'white', 72, 'true', 640);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (52676, 90, 'red', 159, 'true', 17);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (76524, 53, 'green', 3, 'no', 9);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (22788, 26, 'green', 165, 'true', 912);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (27963, 90, 'white', 58, 'true', 18);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (66858, 11, 'red', 165, 'no', 167);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (79449, 99, 'red', 72, 'true', 414);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (72911, 81, 'black', 69, 'true', 850);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (20500, 99, 'green', 265, 'no', 74);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (92310, 10, 'green', 319, 'true', 82);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (96131, 57, 'blue', 219, 'true', 160);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (27699, 51, 'red', 269, 'true', 414);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (61684, 35, 'blue', 165, 'no', 20);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (66012, 92, 'red', 1, 'no', 513);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (15597, 40, 'white', 88, 'true', 483);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (35415, 90, 'green', 5, 'true', 62);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (30271, 67, 'black', 54, 'no', 74);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (27630, 83, 'white', 169, 'true', 82);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (33683, 60, 'blue', 69, 'no', 160);
commit;
prompt 100 records committed...
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (59513, 82, 'blue', 85, 'true', 483);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (66916, 33, 'white', 18, 'true', 82);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (80313, 64, 'white', 8.95, 'no', 28);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (75244, 18, 'white', 10, 'true', 4);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (33506, 64, 'red', 330, 'no', 82);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (32944, 70, 'red', 28, 'true', 725);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (64621, 92, 'red', 168, 'no', 649);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (54482, 13, 'green', 89, 'no', 575);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (88951, 97, 'white', 12, 'true', 28);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (77236, 25, 'black', 269, 'true', 2);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (25574, 14, 'white', 118, 'no', 575);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (73404, 78, 'blue', 149, 'no', 18);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (46565, 70, 'white', 349, 'no', 65);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (61260, 93, 'white', 159, 'true', 98);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (32831, 97, 'blue', 199, 'true', 359);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (18408, 50, 'green', 1, 'no', 26);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (60459, 34, 'white', 29, 'true', 850);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (92205, 58, 'white', 38, 'no', 4);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (73986, 49, 'white', 125, 'true', 18);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (84984, 35, 'white', 29, 'true', 98);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (75505, 13, 'green', 175, 'no', 14);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (94258, 34, 'blue', 179, 'true', 52);
insert into MODEL (model_id, model_seats, model_color, model_price, model_hasbooster, brand_id)
values (20998, 15, 'black', 109, 'true', 98);
commit;
prompt 123 records loaded
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
insert into VEHICLE (vehicle_licensenumber, model_id)
values (1, 82430);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (2, 12110);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (3, 13310);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (4, 11874);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (5, 10134);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (6, 31352);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (7, 16720);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (8, 12220);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (9, 16720);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (10, 13302);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (11, 16720);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (12, 93397);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (13, 93397);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (14, 26441);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (15, 77809);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (16, 31352);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (17, 16720);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (18, 36901);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (61167848, 25574);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (37252525, 11874);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (98548123, 39927);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (52349614, 27699);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (47529738, 92205);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (61495641, 72937);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (18789792, 76524);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (51759376, 77809);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (31953698, 89086);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (35982335, 94258);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (39846413, 27131);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (56927789, 76934);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (39846331, 32831);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (67725578, 76934);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (48986472, 76524);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (47127676, 41203);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (16182935, 84984);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (36283787, 31055);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (84312545, 10134);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (87556685, 13922);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (71686597, 46565);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (59282125, 18411);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (43373513, 73986);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (84699689, 64484);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (65394313, 61260);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (55689777, 94258);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (44142435, 72911);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (56977482, 48170);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (22788535, 35415);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (99181387, 89446);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (69774122, 72937);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (83248218, 91592);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (14813658, 12099);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (63832548, 46566);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (57127317, 46565);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (97359492, 18510);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (34887941, 76934);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (91922595, 40501);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (34533386, 92556);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (46879551, 48170);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (52131513, 14256);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (49296536, 57928);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (31839511, 54482);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (84411282, 48170);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (77737128, 31123);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (44849415, 13922);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (34972883, 46566);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (67428652, 31055);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (61959199, 27539);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (32681299, 32944);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (76237121, 27177);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (13787177, 11874);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (61523464, 39927);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (91944651, 57791);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (93667714, 76524);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (68511494, 86449);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (36291759, 20500);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (71944274, 60815);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (67419271, 52477);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (37874639, 40685);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (19649366, 66858);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (69923664, 72937);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (69828852, 41951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (73143256, 32831);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (14438592, 32831);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (57637489, 88951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (65121925, 73404);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (84881439, 70606);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (98347945, 10134);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (23965441, 92310);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (86494619, 20500);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (34666769, 48170);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (29845241, 88951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (58747241, 30271);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (63315843, 80491);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (12684866, 31123);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (57985566, 75635);
commit;
prompt 100 records committed...
insert into VEHICLE (vehicle_licensenumber, model_id)
values (77651851, 92310);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (31121978, 32944);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (48696698, 64484);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (94558835, 37144);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (73928971, 63311);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (65918254, 27630);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (56689312, 52477);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (91322455, 33683);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (54539963, 79837);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (46328589, 22267);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (61134559, 45636);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (87814169, 66012);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (87811817, 76524);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (37644767, 47172);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (48122127, 66012);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (71945123, 33683);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (27367712, 31055);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (19977314, 63311);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (61962852, 92556);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (87145958, 73404);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (41879417, 83514);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (66169498, 92205);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (12998387, 64484);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (39353749, 29396);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (45314931, 33399);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (46151364, 46565);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (63286759, 45636);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (33496191, 89086);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (46263931, 27539);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (83623371, 76934);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (94229953, 89086);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (78538649, 72911);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (34338321, 27630);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (89253324, 31091);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (11495212, 11874);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (85196743, 69355);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (32878338, 47172);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (84456489, 60815);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (85648914, 88951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (25172694, 41203);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (67263928, 82430);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (19241945, 72911);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (54442487, 96131);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (62479178, 18510);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (45646399, 12110);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (51969257, 76524);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (99513467, 31055);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (76884387, 52477);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (29818936, 18411);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (34766568, 73986);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (57471452, 11874);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (39853517, 66916);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (25155176, 75233);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (63722518, 92205);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (81316259, 27699);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (89972635, 55510);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (89611861, 10821);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (69181511, 89086);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (22112742, 40685);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (99458773, 80313);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (62365835, 88951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (59526612, 63311);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (52936598, 27131);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (11862857, 92556);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (15924254, 66012);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (21146846, 69355);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (85915935, 66858);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (92969828, 14256);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (35179913, 77236);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (55445293, 92556);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (81269834, 79449);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (79115231, 22267);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (75443212, 16720);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (58759211, 92556);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (29272161, 33952);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (77165484, 51600);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (33456381, 27539);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (83299428, 22788);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (68814298, 37144);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (28847179, 33506);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (73817326, 75244);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (92986276, 39927);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (54515892, 41203);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (55369266, 26441);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (72774815, 51600);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (29415222, 52477);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (97635136, 31091);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (36251212, 44776);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (87467891, 91592);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (32499819, 18408);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (23769387, 69355);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (41857774, 55510);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (47643779, 92524);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (43149369, 26441);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (66464862, 14256);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (51575582, 31055);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (82527286, 10821);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (29261328, 20500);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (55592359, 66916);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (26512429, 20998);
commit;
prompt 200 records committed...
insert into VEHICLE (vehicle_licensenumber, model_id)
values (64583677, 27131);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (24472763, 80313);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (38815826, 75505);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (88875579, 41951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (21377498, 41951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (66298675, 31001);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (94948578, 79837);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (74162997, 18411);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (45585767, 31123);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (62232168, 92556);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (86795563, 27539);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (56777364, 59513);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (39171226, 60459);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (83615625, 60815);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (57322122, 92310);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (71513138, 88951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (33512225, 11434);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (38469744, 61684);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (51645252, 27630);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (92681188, 75233);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (27952443, 41951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (85636881, 51600);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (87364494, 92205);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (21745437, 16720);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (42376146, 30271);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (93624858, 70606);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (57396459, 55510);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (47659666, 31001);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (51594664, 89446);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (64525236, 41951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (27638892, 10134);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (59238419, 18408);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (34129523, 11434);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (94197881, 83514);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (17937991, 60815);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (77157355, 52676);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (34781111, 30271);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (46134653, 69355);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (49968778, 10134);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (84655373, 22267);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (21326952, 45636);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (25595898, 92310);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (36698269, 12220);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (59626673, 27539);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (14186931, 18411);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (15975426, 57791);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (49248963, 22267);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (35317388, 18408);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (18248815, 59513);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (67189854, 12220);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (95994968, 12220);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (44821479, 64484);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (27419676, 39633);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (72118325, 42153);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (29636418, 20998);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (83987279, 54482);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (57143634, 79449);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (81477344, 10821);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (15129862, 75244);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (57235855, 41951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (58819249, 10134);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (17729142, 73986);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (26782667, 37144);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (21383172, 79449);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (59798994, 32944);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (42714677, 66858);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (39146534, 92556);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (58987191, 27131);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (32643411, 33506);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (58942594, 18408);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (48138574, 75244);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (91824968, 20998);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (91466594, 22267);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (12874949, 41203);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (67431562, 30271);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (38789282, 83514);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (33384713, 59513);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (14973237, 77236);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (51552331, 49679);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (72628196, 75244);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (72528849, 41951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (29441693, 66858);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (47347838, 33648);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (73784175, 78875);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (79853819, 13302);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (61822711, 79103);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (95279333, 63311);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (26462311, 31001);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (75914197, 92524);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (98457755, 40501);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (95554736, 75635);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (96766481, 31001);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (96534397, 82430);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (82243612, 33683);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (49937262, 40685);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (52385335, 79103);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (74628867, 78875);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (63855668, 84984);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (83347685, 88951);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (97895962, 41203);
commit;
prompt 300 records committed...
insert into VEHICLE (vehicle_licensenumber, model_id)
values (51683638, 89446);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (43834893, 20500);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (22999597, 33399);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (69864674, 66916);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (56194188, 96131);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (52682627, 30271);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (63151798, 31123);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (62894113, 26441);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (16285986, 36901);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (53199867, 11434);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (46253661, 29396);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (69359165, 39927);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (14419582, 39015);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (75592485, 39927);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (19971565, 29396);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (13612611, 30271);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (88921152, 21133);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (71546176, 39633);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (81225789, 13922);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (78341231, 59513);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (47135816, 13922);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (68367174, 75635);
insert into VEHICLE (vehicle_licensenumber, model_id)
values (96644292, 79837);
commit;
prompt 323 records loaded
prompt Loading RENT...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83629, to_date('24-10-2009', 'dd-mm-yyyy'), to_date('29-11-2004', 'dd-mm-yyyy'), 32362, 48819, 34781111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31682, to_date('26-05-2020', 'dd-mm-yyyy'), to_date('09-04-2009', 'dd-mm-yyyy'), 93216, 49732, 69181511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16812, to_date('04-02-2003', 'dd-mm-yyyy'), to_date('26-07-2005', 'dd-mm-yyyy'), 99297, 32374, 67428652);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87956, to_date('23-06-2012', 'dd-mm-yyyy'), to_date('24-04-2012', 'dd-mm-yyyy'), 11579, 97261, 63722518);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99844, to_date('12-10-2012', 'dd-mm-yyyy'), to_date('11-08-2008', 'dd-mm-yyyy'), 64147, 34594, 16);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95447, to_date('18-07-2002', 'dd-mm-yyyy'), to_date('18-09-2013', 'dd-mm-yyyy'), 87861, 69417, 34781111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37379, to_date('06-05-2000', 'dd-mm-yyyy'), to_date('09-05-2010', 'dd-mm-yyyy'), 95963, 29621, 73784175);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (54515, to_date('15-09-2013', 'dd-mm-yyyy'), to_date('16-10-2004', 'dd-mm-yyyy'), 62826, 74937, 29845241);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93781, to_date('09-05-2016', 'dd-mm-yyyy'), to_date('12-12-2010', 'dd-mm-yyyy'), 68484, 98974, 71945123);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19113, to_date('19-05-2002', 'dd-mm-yyyy'), to_date('06-06-2004', 'dd-mm-yyyy'), 80452, 69417, 91944651);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96483, to_date('17-03-2003', 'dd-mm-yyyy'), to_date('31-08-2008', 'dd-mm-yyyy'), 28266, 32932, 41879417);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94392, to_date('08-02-2008', 'dd-mm-yyyy'), to_date('01-02-2014', 'dd-mm-yyyy'), 86242, 29621, 22999597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56712, to_date('23-01-2012', 'dd-mm-yyyy'), to_date('12-10-2006', 'dd-mm-yyyy'), 13489, 8, 18);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29657, to_date('24-04-2003', 'dd-mm-yyyy'), to_date('19-07-2005', 'dd-mm-yyyy'), 93812, 23932, 59282125);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (12676, to_date('13-10-2015', 'dd-mm-yyyy'), to_date('20-11-2016', 'dd-mm-yyyy'), 72579, 99835, 11);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56922, to_date('19-02-2003', 'dd-mm-yyyy'), to_date('27-12-2011', 'dd-mm-yyyy'), 56622, 98482, 84456489);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85321, to_date('09-04-2017', 'dd-mm-yyyy'), to_date('10-12-2005', 'dd-mm-yyyy'), 76672, 83126, 75443212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85618, to_date('01-09-2013', 'dd-mm-yyyy'), to_date('07-02-2020', 'dd-mm-yyyy'), 81148, 95296, 14419582);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48969, to_date('08-08-2002', 'dd-mm-yyyy'), to_date('11-05-2012', 'dd-mm-yyyy'), 84119, 77497, 87145958);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98311, to_date('22-03-2011', 'dd-mm-yyyy'), to_date('01-06-2017', 'dd-mm-yyyy'), 79424, 71864, 67263928);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81922, to_date('14-09-2007', 'dd-mm-yyyy'), to_date('15-11-2010', 'dd-mm-yyyy'), 88157, 7, 58987191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (86185, to_date('27-06-2003', 'dd-mm-yyyy'), to_date('31-12-2007', 'dd-mm-yyyy'), 99424, 47969, 12684866);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23458, to_date('28-07-2005', 'dd-mm-yyyy'), to_date('29-01-2014', 'dd-mm-yyyy'), 79249, 48137, 85648914);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15186, to_date('12-09-2018', 'dd-mm-yyyy'), to_date('08-03-2004', 'dd-mm-yyyy'), 49877, 44478, 96766481);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79933, to_date('14-04-2019', 'dd-mm-yyyy'), to_date('01-11-2000', 'dd-mm-yyyy'), 76529, 98599, 22999597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62914, to_date('16-02-2000', 'dd-mm-yyyy'), to_date('25-01-2007', 'dd-mm-yyyy'), 95075, 6, 39853517);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97425, to_date('19-03-2010', 'dd-mm-yyyy'), to_date('05-12-2001', 'dd-mm-yyyy'), 26123, 72682, 12684866);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56134, to_date('31-07-2008', 'dd-mm-yyyy'), to_date('27-10-2014', 'dd-mm-yyyy'), 98342, 26284, 51683638);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89643, to_date('17-04-2020', 'dd-mm-yyyy'), to_date('09-09-2006', 'dd-mm-yyyy'), 85202, 49732, 34781111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15713, to_date('09-09-2006', 'dd-mm-yyyy'), to_date('25-02-2019', 'dd-mm-yyyy'), 84941, 49477, 98347945);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77131, to_date('18-03-2002', 'dd-mm-yyyy'), to_date('24-06-2010', 'dd-mm-yyyy'), 62362, 32932, 12998387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29863, to_date('24-02-2016', 'dd-mm-yyyy'), to_date('05-06-2018', 'dd-mm-yyyy'), 69714, 87483, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19834, to_date('01-11-2015', 'dd-mm-yyyy'), to_date('21-03-2003', 'dd-mm-yyyy'), 15243, 69417, 83623371);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94167, to_date('31-03-2016', 'dd-mm-yyyy'), to_date('08-04-2018', 'dd-mm-yyyy'), 61694, 39662, 85648914);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (12243, to_date('25-04-2004', 'dd-mm-yyyy'), to_date('12-03-2014', 'dd-mm-yyyy'), 27947, 84241, 51969257);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63976, to_date('14-12-2020', 'dd-mm-yyyy'), to_date('02-09-2006', 'dd-mm-yyyy'), 87938, 47969, 69923664);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49678, to_date('07-12-2013', 'dd-mm-yyyy'), to_date('12-02-2014', 'dd-mm-yyyy'), 92727, 11784, 65121925);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (54298, to_date('07-04-2015', 'dd-mm-yyyy'), to_date('19-03-2011', 'dd-mm-yyyy'), 67189, 83871, 57143634);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93855, to_date('30-09-2015', 'dd-mm-yyyy'), to_date('13-09-2009', 'dd-mm-yyyy'), 16519, 26944, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13253, to_date('14-06-2012', 'dd-mm-yyyy'), to_date('07-08-2011', 'dd-mm-yyyy'), 45666, 6, 19971565);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91851, to_date('29-03-2020', 'dd-mm-yyyy'), to_date('04-12-2010', 'dd-mm-yyyy'), 7716, 63711, 33384713);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72416, to_date('30-08-2004', 'dd-mm-yyyy'), to_date('09-07-2017', 'dd-mm-yyyy'), 85391, 37416, 72528849);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18383, to_date('07-06-2002', 'dd-mm-yyyy'), to_date('20-01-2003', 'dd-mm-yyyy'), 24497, 19848, 71513138);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39958, to_date('01-09-2018', 'dd-mm-yyyy'), to_date('25-10-2001', 'dd-mm-yyyy'), 96586, 39662, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46935, to_date('27-03-2012', 'dd-mm-yyyy'), to_date('25-03-2009', 'dd-mm-yyyy'), 94254, 74937, 63286759);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95312, to_date('12-11-2008', 'dd-mm-yyyy'), to_date('08-08-2020', 'dd-mm-yyyy'), 52269, 51926, 77165484);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49873, to_date('16-06-2008', 'dd-mm-yyyy'), to_date('26-10-2006', 'dd-mm-yyyy'), 42703, 57325, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17538, to_date('17-01-2019', 'dd-mm-yyyy'), to_date('21-08-2007', 'dd-mm-yyyy'), 62547, 49757, 52131513);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45181, to_date('29-10-2013', 'dd-mm-yyyy'), to_date('23-12-2018', 'dd-mm-yyyy'), 52309, 63711, 2);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85826, to_date('02-04-2009', 'dd-mm-yyyy'), to_date('26-07-2006', 'dd-mm-yyyy'), 34855, 48819, 36291759);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13664, to_date('17-09-2009', 'dd-mm-yyyy'), to_date('26-11-2003', 'dd-mm-yyyy'), 64481, 22414, 81477344);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93362, to_date('20-09-2000', 'dd-mm-yyyy'), to_date('09-02-2006', 'dd-mm-yyyy'), 52715, 17339, 55689777);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68856, to_date('16-05-2004', 'dd-mm-yyyy'), to_date('29-07-2018', 'dd-mm-yyyy'), 52172, 72683, 72118325);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97484, to_date('23-09-2002', 'dd-mm-yyyy'), to_date('22-06-2003', 'dd-mm-yyyy'), 57141, 36148, 72774815);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44977, to_date('23-07-2002', 'dd-mm-yyyy'), to_date('24-01-2007', 'dd-mm-yyyy'), 53188, 25287, 92969828);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82468, to_date('23-07-2013', 'dd-mm-yyyy'), to_date('21-03-2008', 'dd-mm-yyyy'), 81148, 95296, 73784175);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99176, to_date('27-10-2002', 'dd-mm-yyyy'), to_date('17-01-2020', 'dd-mm-yyyy'), 33249, 22414, 61167848);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21356, to_date('02-07-2011', 'dd-mm-yyyy'), to_date('08-01-2017', 'dd-mm-yyyy'), 36223, 77992, 77737128);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52229, to_date('16-04-2004', 'dd-mm-yyyy'), to_date('04-11-2005', 'dd-mm-yyyy'), 98643, 58234, 43149369);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25798, to_date('12-03-2006', 'dd-mm-yyyy'), to_date('28-12-2016', 'dd-mm-yyyy'), 22479, 26284, 9);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21742, to_date('07-01-2006', 'dd-mm-yyyy'), to_date('20-04-2005', 'dd-mm-yyyy'), 99297, 83871, 29261328);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93274, to_date('26-10-2010', 'dd-mm-yyyy'), to_date('05-05-2013', 'dd-mm-yyyy'), 94426, 42865, 62232168);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93884, to_date('08-01-2009', 'dd-mm-yyyy'), to_date('07-04-2003', 'dd-mm-yyyy'), 62786, 98974, 52349614);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28732, to_date('04-12-2010', 'dd-mm-yyyy'), to_date('17-04-2019', 'dd-mm-yyyy'), 85671, 66121, 34338321);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16376, to_date('06-07-2015', 'dd-mm-yyyy'), to_date('17-10-2017', 'dd-mm-yyyy'), 56153, 59143, 15975426);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37999, to_date('04-01-2011', 'dd-mm-yyyy'), to_date('07-07-2014', 'dd-mm-yyyy'), 67763, 12389, 56777364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92462, to_date('23-11-2003', 'dd-mm-yyyy'), to_date('14-07-2005', 'dd-mm-yyyy'), 59554, 83871, 32499819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35215, to_date('19-01-2014', 'dd-mm-yyyy'), to_date('03-08-2009', 'dd-mm-yyyy'), 60246, 44478, 84456489);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44462, to_date('02-08-2010', 'dd-mm-yyyy'), to_date('01-10-2006', 'dd-mm-yyyy'), 36532, 55519, 71546176);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36353, to_date('12-08-2004', 'dd-mm-yyyy'), to_date('12-03-2002', 'dd-mm-yyyy'), 63746, 32374, 52349614);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55747, to_date('28-08-2013', 'dd-mm-yyyy'), to_date('16-12-2013', 'dd-mm-yyyy'), 13217, 18581, 21326952);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95641, to_date('18-04-2011', 'dd-mm-yyyy'), to_date('05-01-2015', 'dd-mm-yyyy'), 34928, 49347, 67263928);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74287, to_date('22-11-2011', 'dd-mm-yyyy'), to_date('06-04-2019', 'dd-mm-yyyy'), 26817, 19848, 67263928);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15851, to_date('24-07-2014', 'dd-mm-yyyy'), to_date('10-08-2011', 'dd-mm-yyyy'), 33204, 68695, 47643779);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89992, to_date('21-10-2004', 'dd-mm-yyyy'), to_date('04-09-2007', 'dd-mm-yyyy'), 99112, 17339, 47643779);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59623, to_date('10-04-2017', 'dd-mm-yyyy'), to_date('22-09-2016', 'dd-mm-yyyy'), 67763, 49477, 33456381);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27864, to_date('13-08-2004', 'dd-mm-yyyy'), to_date('05-03-2005', 'dd-mm-yyyy'), 97299, 65682, 49937262);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61879, to_date('10-06-2012', 'dd-mm-yyyy'), to_date('21-10-2016', 'dd-mm-yyyy'), 15815, 83871, 47529738);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11754, to_date('23-04-2006', 'dd-mm-yyyy'), to_date('14-03-2001', 'dd-mm-yyyy'), 83845, 83753, 58759211);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35245, to_date('11-01-2008', 'dd-mm-yyyy'), to_date('11-08-2019', 'dd-mm-yyyy'), 56065, 99835, 55369266);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85452, to_date('24-03-2015', 'dd-mm-yyyy'), to_date('21-10-2011', 'dd-mm-yyyy'), 64561, 81766, 36283787);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74949, to_date('24-10-2000', 'dd-mm-yyyy'), to_date('11-04-2006', 'dd-mm-yyyy'), 58699, 26944, 61523464);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16134, to_date('11-11-2005', 'dd-mm-yyyy'), to_date('13-10-2008', 'dd-mm-yyyy'), 99788, 68695, 22999597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (75653, to_date('23-08-2006', 'dd-mm-yyyy'), to_date('04-04-2018', 'dd-mm-yyyy'), 81926, 18581, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95474, to_date('07-10-2005', 'dd-mm-yyyy'), to_date('28-05-2012', 'dd-mm-yyyy'), 63191, 11784, 56777364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15749, to_date('07-08-2007', 'dd-mm-yyyy'), to_date('02-11-2017', 'dd-mm-yyyy'), 48551, 57325, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19793, to_date('27-09-2020', 'dd-mm-yyyy'), to_date('30-07-2020', 'dd-mm-yyyy'), 32423, 82688, 15924254);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82152, to_date('20-11-2017', 'dd-mm-yyyy'), to_date('18-04-2006', 'dd-mm-yyyy'), 84143, 23484, 76884387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35358, to_date('25-09-2005', 'dd-mm-yyyy'), to_date('23-07-2019', 'dd-mm-yyyy'), 79717, 26944, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97278, to_date('03-07-2013', 'dd-mm-yyyy'), to_date('10-11-2006', 'dd-mm-yyyy'), 48739, 98432, 81225789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63343, to_date('02-03-2007', 'dd-mm-yyyy'), to_date('16-08-2011', 'dd-mm-yyyy'), 81148, 26944, 98457755);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61864, to_date('11-12-2000', 'dd-mm-yyyy'), to_date('01-01-2008', 'dd-mm-yyyy'), 75415, 77497, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (73893, to_date('30-06-2019', 'dd-mm-yyyy'), to_date('30-03-2000', 'dd-mm-yyyy'), 34696, 44258, 89253324);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91155, to_date('19-07-2001', 'dd-mm-yyyy'), to_date('13-10-2009', 'dd-mm-yyyy'), 19763, 88239, 44821479);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (86186, to_date('20-04-2007', 'dd-mm-yyyy'), to_date('24-08-2004', 'dd-mm-yyyy'), 35113, 26284, 87814169);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95485, to_date('19-03-2006', 'dd-mm-yyyy'), to_date('26-03-2006', 'dd-mm-yyyy'), 41638, 72682, 35982335);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22467, to_date('10-04-2003', 'dd-mm-yyyy'), to_date('10-11-2012', 'dd-mm-yyyy'), 97184, 19291, 37644767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66561, to_date('14-08-2002', 'dd-mm-yyyy'), to_date('25-12-2014', 'dd-mm-yyyy'), 28947, 8, 85636881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93768, to_date('28-09-2008', 'dd-mm-yyyy'), to_date('29-08-2018', 'dd-mm-yyyy'), 56316, 32422, 57127317);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11781, to_date('20-02-2014', 'dd-mm-yyyy'), to_date('07-09-2018', 'dd-mm-yyyy'), 45413, 98482, 96766481);
commit;
prompt 100 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35146, to_date('22-09-2016', 'dd-mm-yyyy'), to_date('06-12-2019', 'dd-mm-yyyy'), 99788, 52399, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71483, to_date('08-02-2011', 'dd-mm-yyyy'), to_date('23-11-2002', 'dd-mm-yyyy'), 14979, 42414, 47659666);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61361, to_date('17-08-2020', 'dd-mm-yyyy'), to_date('20-05-2008', 'dd-mm-yyyy'), 15193, 98432, 63286759);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34967, to_date('17-02-2001', 'dd-mm-yyyy'), to_date('12-06-2007', 'dd-mm-yyyy'), 88792, 6, 29415222);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24769, to_date('12-01-2003', 'dd-mm-yyyy'), to_date('15-09-2006', 'dd-mm-yyyy'), 111, 32932, 87814169);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99532, to_date('06-08-2001', 'dd-mm-yyyy'), to_date('04-07-2008', 'dd-mm-yyyy'), 61965, 36383, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18485, to_date('04-04-2009', 'dd-mm-yyyy'), to_date('25-06-2004', 'dd-mm-yyyy'), 67763, 97911, 61523464);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24518, to_date('20-07-2001', 'dd-mm-yyyy'), to_date('14-11-2020', 'dd-mm-yyyy'), 95619, 59143, 14);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63211, to_date('31-07-2016', 'dd-mm-yyyy'), to_date('22-07-2006', 'dd-mm-yyyy'), 18519, 17339, 26462311);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28437, to_date('17-08-2004', 'dd-mm-yyyy'), to_date('15-02-2017', 'dd-mm-yyyy'), 44933, 87325, 52385335);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26219, to_date('28-04-2008', 'dd-mm-yyyy'), to_date('10-08-2013', 'dd-mm-yyyy'), 37672, 91753, 63722518);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11489, to_date('22-09-2018', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 92866, 7, 44142435);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62879, to_date('19-03-2016', 'dd-mm-yyyy'), to_date('28-02-2012', 'dd-mm-yyyy'), 84601, 83126, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29264, to_date('06-07-2010', 'dd-mm-yyyy'), to_date('18-06-2008', 'dd-mm-yyyy'), 46345, 98974, 93667714);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71365, to_date('04-09-2004', 'dd-mm-yyyy'), to_date('03-04-2014', 'dd-mm-yyyy'), 55347, 65285, 2);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44559, to_date('25-01-2016', 'dd-mm-yyyy'), to_date('26-11-2010', 'dd-mm-yyyy'), 72531, 82839, 34129523);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31737, to_date('14-03-2016', 'dd-mm-yyyy'), to_date('22-01-2002', 'dd-mm-yyyy'), 67536, 12389, 45585767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36938, to_date('11-05-2019', 'dd-mm-yyyy'), to_date('03-04-2015', 'dd-mm-yyyy'), 37925, 51926, 62894113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99435, to_date('19-11-2010', 'dd-mm-yyyy'), to_date('17-04-2016', 'dd-mm-yyyy'), 31537, 57325, 62894113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (57349, to_date('08-12-2008', 'dd-mm-yyyy'), to_date('01-12-2018', 'dd-mm-yyyy'), 18139, 19848, 48138574);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36398, to_date('22-06-2009', 'dd-mm-yyyy'), to_date('16-09-2020', 'dd-mm-yyyy'), 82648, 11784, 51759376);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61456, to_date('23-09-2009', 'dd-mm-yyyy'), to_date('01-05-2011', 'dd-mm-yyyy'), 26978, 44478, 92969828);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94471, to_date('17-08-2009', 'dd-mm-yyyy'), to_date('10-01-2014', 'dd-mm-yyyy'), 21655, 79115, 42376146);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89843, to_date('19-11-2008', 'dd-mm-yyyy'), to_date('05-09-2008', 'dd-mm-yyyy'), 42575, 29621, 73784175);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38441, to_date('31-07-2017', 'dd-mm-yyyy'), to_date('02-12-2011', 'dd-mm-yyyy'), 112, 55331, 75592485);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23766, to_date('09-01-2006', 'dd-mm-yyyy'), to_date('02-08-2003', 'dd-mm-yyyy'), 34763, 9, 59798994);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67634, to_date('08-08-2001', 'dd-mm-yyyy'), to_date('31-05-2000', 'dd-mm-yyyy'), 34403, 49347, 57322122);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82516, to_date('07-11-2010', 'dd-mm-yyyy'), to_date('10-08-2009', 'dd-mm-yyyy'), 63474, 18581, 94229953);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (75573, to_date('26-08-2016', 'dd-mm-yyyy'), to_date('04-02-2017', 'dd-mm-yyyy'), 22463, 83126, 57396459);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47362, to_date('30-11-2010', 'dd-mm-yyyy'), to_date('31-07-2019', 'dd-mm-yyyy'), 54143, 23932, 81269834);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41943, to_date('16-08-2007', 'dd-mm-yyyy'), to_date('17-05-2011', 'dd-mm-yyyy'), 94426, 23484, 39353749);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98756, to_date('17-10-2020', 'dd-mm-yyyy'), to_date('17-11-2013', 'dd-mm-yyyy'), 99181, 87483, 84411282);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43238, to_date('18-08-2003', 'dd-mm-yyyy'), to_date('20-09-2000', 'dd-mm-yyyy'), 2502, 63711, 39846413);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15641, to_date('24-02-2014', 'dd-mm-yyyy'), to_date('21-02-2013', 'dd-mm-yyyy'), 13568, 82338, 85636881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97246, to_date('31-10-2013', 'dd-mm-yyyy'), to_date('30-10-2015', 'dd-mm-yyyy'), 84867, 83126, 71944274);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47966, to_date('19-05-2007', 'dd-mm-yyyy'), to_date('08-01-2007', 'dd-mm-yyyy'), 95435, 95296, 62365835);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32119, to_date('26-09-2011', 'dd-mm-yyyy'), to_date('29-12-2004', 'dd-mm-yyyy'), 18048, 97261, 68511494);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22935, to_date('21-11-2001', 'dd-mm-yyyy'), to_date('07-12-2015', 'dd-mm-yyyy'), 55188, 77497, 27638892);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21638, to_date('18-01-2001', 'dd-mm-yyyy'), to_date('16-05-2020', 'dd-mm-yyyy'), 97218, 37416, 32499819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56921, to_date('13-03-2001', 'dd-mm-yyyy'), to_date('30-12-2001', 'dd-mm-yyyy'), 31139, 39662, 68367174);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22934, to_date('15-06-2014', 'dd-mm-yyyy'), to_date('26-09-2005', 'dd-mm-yyyy'), 54665, 37652, 47347838);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22163, to_date('30-04-2009', 'dd-mm-yyyy'), to_date('17-07-2001', 'dd-mm-yyyy'), 45392, 82839, 62894113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35857, to_date('26-11-2006', 'dd-mm-yyyy'), to_date('14-12-2001', 'dd-mm-yyyy'), 57278, 44478, 49248963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63567, to_date('18-04-2006', 'dd-mm-yyyy'), to_date('11-11-2016', 'dd-mm-yyyy'), 65493, 49757, 67189854);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46894, to_date('27-04-2009', 'dd-mm-yyyy'), to_date('11-05-2016', 'dd-mm-yyyy'), 54758, 86171, 63286759);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15216, to_date('08-08-2006', 'dd-mm-yyyy'), to_date('07-03-2008', 'dd-mm-yyyy'), 52432, 91753, 49968778);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88981, to_date('12-10-2010', 'dd-mm-yyyy'), to_date('16-08-2004', 'dd-mm-yyyy'), 14318, 79784, 71945123);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31281, to_date('04-01-2018', 'dd-mm-yyyy'), to_date('13-12-2016', 'dd-mm-yyyy'), 22755, 98482, 41857774);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91158, to_date('18-07-2008', 'dd-mm-yyyy'), to_date('01-12-2019', 'dd-mm-yyyy'), 56071, 79115, 13612611);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91247, to_date('25-01-2017', 'dd-mm-yyyy'), to_date('03-12-2015', 'dd-mm-yyyy'), 47283, 82839, 87811817);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17157, to_date('03-08-2019', 'dd-mm-yyyy'), to_date('12-05-2001', 'dd-mm-yyyy'), 49145, 72683, 88875579);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49725, to_date('17-02-2000', 'dd-mm-yyyy'), to_date('31-08-2010', 'dd-mm-yyyy'), 96636, 97261, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65769, to_date('30-05-2020', 'dd-mm-yyyy'), to_date('09-03-2002', 'dd-mm-yyyy'), 91946, 59143, 34666769);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98932, to_date('06-11-2005', 'dd-mm-yyyy'), to_date('25-06-2019', 'dd-mm-yyyy'), 32531, 87325, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13197, to_date('02-05-2018', 'dd-mm-yyyy'), to_date('15-12-2003', 'dd-mm-yyyy'), 22449, 77992, 22999597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74684, to_date('14-05-2010', 'dd-mm-yyyy'), to_date('20-10-2004', 'dd-mm-yyyy'), 59148, 72683, 56194188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4365, to_date('24-10-2013', 'dd-mm-yyyy'), to_date('17-09-2000', 'dd-mm-yyyy'), 24919, 77497, 56194188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5968, to_date('07-12-2000', 'dd-mm-yyyy'), to_date('20-03-2009', 'dd-mm-yyyy'), 92372, 84241, 58942594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1216, to_date('14-02-2012', 'dd-mm-yyyy'), to_date('15-06-2008', 'dd-mm-yyyy'), 83972, 36383, 53199867);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5232, to_date('25-11-2018', 'dd-mm-yyyy'), to_date('09-11-2003', 'dd-mm-yyyy'), 52469, 83126, 58987191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5112, to_date('01-06-2010', 'dd-mm-yyyy'), to_date('09-07-2013', 'dd-mm-yyyy'), 26978, 23798, 115);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5251, to_date('10-02-2013', 'dd-mm-yyyy'), to_date('16-05-2014', 'dd-mm-yyyy'), 79566, 15868, 83987279);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6244, to_date('10-12-2007', 'dd-mm-yyyy'), to_date('13-02-2011', 'dd-mm-yyyy'), 49779, 12389, 16285986);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1536, to_date('28-11-2001', 'dd-mm-yyyy'), to_date('22-05-2006', 'dd-mm-yyyy'), 66240, 23932, 42376146);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6568, to_date('26-05-2000', 'dd-mm-yyyy'), to_date('12-07-2009', 'dd-mm-yyyy'), 49779, 44258, 75592485);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2675, to_date('23-04-2001', 'dd-mm-yyyy'), to_date('05-03-2006', 'dd-mm-yyyy'), 69415, 49757, 113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4942, to_date('10-10-2006', 'dd-mm-yyyy'), to_date('20-06-2020', 'dd-mm-yyyy'), 35753, 49732, 87814169);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2667, to_date('13-06-2014', 'dd-mm-yyyy'), to_date('16-05-2007', 'dd-mm-yyyy'), 64924, 99923, 34666769);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7544, to_date('19-10-2006', 'dd-mm-yyyy'), to_date('19-08-2002', 'dd-mm-yyyy'), 79357, 19291, 52936598);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4918, to_date('29-01-2002', 'dd-mm-yyyy'), to_date('07-03-2013', 'dd-mm-yyyy'), 47569, 25287, 83615625);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1269, to_date('06-03-2016', 'dd-mm-yyyy'), to_date('26-04-2016', 'dd-mm-yyyy'), 56819, 71864, 23965441);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6354, to_date('12-07-2019', 'dd-mm-yyyy'), to_date('25-01-2004', 'dd-mm-yyyy'), 89353, 23932, 32681299);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4122, to_date('15-11-2013', 'dd-mm-yyyy'), to_date('30-12-2008', 'dd-mm-yyyy'), 44557, 67718, 29818936);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10070, to_date('11-03-2001', 'dd-mm-yyyy'), to_date('15-10-2008', 'dd-mm-yyyy'), 21172, 26944, 47529738);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10075, to_date('07-05-2019', 'dd-mm-yyyy'), to_date('09-08-2017', 'dd-mm-yyyy'), 95447, 19291, 22788535);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10080, to_date('10-02-2002', 'dd-mm-yyyy'), to_date('20-06-2006', 'dd-mm-yyyy'), 73751, 15868, 17);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10085, to_date('24-11-2014', 'dd-mm-yyyy'), to_date('25-04-2003', 'dd-mm-yyyy'), 46558, 6, 12684866);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10090, to_date('24-06-2010', 'dd-mm-yyyy'), to_date('07-11-2009', 'dd-mm-yyyy'), 62444, 34594, 73817326);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10095, to_date('02-12-2000', 'dd-mm-yyyy'), to_date('12-04-2020', 'dd-mm-yyyy'), 53823, 91753, 91944651);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10100, to_date('05-01-2015', 'dd-mm-yyyy'), to_date('06-10-2000', 'dd-mm-yyyy'), 98711, 31194, 46151364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10105, to_date('04-12-2013', 'dd-mm-yyyy'), to_date('19-10-2014', 'dd-mm-yyyy'), 99297, 98974, 25595898);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10110, to_date('20-01-2007', 'dd-mm-yyyy'), to_date('07-11-2020', 'dd-mm-yyyy'), 78708, 54343, 12998387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10115, to_date('31-08-2013', 'dd-mm-yyyy'), to_date('01-07-2007', 'dd-mm-yyyy'), 76529, 55519, 47659666);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10120, to_date('03-03-2017', 'dd-mm-yyyy'), to_date('02-07-2016', 'dd-mm-yyyy'), 3856, 37416, 13612611);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10125, to_date('19-07-2012', 'dd-mm-yyyy'), to_date('10-11-2003', 'dd-mm-yyyy'), 96636, 48137, 59282125);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10130, to_date('09-07-2020', 'dd-mm-yyyy'), to_date('18-05-2020', 'dd-mm-yyyy'), 12791, 32422, 19649366);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10135, to_date('06-09-2000', 'dd-mm-yyyy'), to_date('17-07-2018', 'dd-mm-yyyy'), 95981, 79115, 95279333);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10140, to_date('05-02-2012', 'dd-mm-yyyy'), to_date('26-12-2008', 'dd-mm-yyyy'), 16966, 23932, 12998387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10145, to_date('19-02-2017', 'dd-mm-yyyy'), to_date('27-04-2000', 'dd-mm-yyyy'), 69669, 23484, 58747241);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10150, to_date('03-12-2016', 'dd-mm-yyyy'), to_date('07-09-2002', 'dd-mm-yyyy'), 81456, 58234, 49937262);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10155, to_date('13-03-2019', 'dd-mm-yyyy'), to_date('13-06-2003', 'dd-mm-yyyy'), 92863, 32932, 72628196);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10160, to_date('11-12-2017', 'dd-mm-yyyy'), to_date('11-07-2003', 'dd-mm-yyyy'), 47449, 37792, 82527286);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10165, to_date('17-10-2013', 'dd-mm-yyyy'), to_date('29-01-2015', 'dd-mm-yyyy'), 65837, 82688, 87467891);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10170, to_date('07-01-2000', 'dd-mm-yyyy'), to_date('27-12-2004', 'dd-mm-yyyy'), 15639, 79784, 21377498);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10175, to_date('28-05-2011', 'dd-mm-yyyy'), to_date('08-02-2020', 'dd-mm-yyyy'), 77197, 17339, 87467891);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10180, to_date('03-12-2009', 'dd-mm-yyyy'), to_date('23-12-2010', 'dd-mm-yyyy'), 47283, 96931, 51552331);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10185, to_date('16-07-2014', 'dd-mm-yyyy'), to_date('21-03-2007', 'dd-mm-yyyy'), 78263, 49732, 33384713);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10190, to_date('24-12-2012', 'dd-mm-yyyy'), to_date('05-12-2014', 'dd-mm-yyyy'), 37057, 9, 56689312);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10195, to_date('04-06-2010', 'dd-mm-yyyy'), to_date('17-07-2002', 'dd-mm-yyyy'), 46558, 72682, 59626673);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10200, to_date('14-06-2008', 'dd-mm-yyyy'), to_date('20-11-2020', 'dd-mm-yyyy'), 59244, 84241, 78538649);
commit;
prompt 200 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10205, to_date('06-01-2014', 'dd-mm-yyyy'), to_date('28-10-2012', 'dd-mm-yyyy'), 47341, 97911, 94229953);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10210, to_date('26-11-2017', 'dd-mm-yyyy'), to_date('31-12-2001', 'dd-mm-yyyy'), 88635, 98974, 44821479);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10215, to_date('10-04-2001', 'dd-mm-yyyy'), to_date('07-08-2009', 'dd-mm-yyyy'), 51819, 78735, 88875579);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10220, to_date('23-06-2009', 'dd-mm-yyyy'), to_date('27-07-2003', 'dd-mm-yyyy'), 34403, 59143, 46134653);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10225, to_date('05-06-2003', 'dd-mm-yyyy'), to_date('20-09-2013', 'dd-mm-yyyy'), 19512, 45211, 57235855);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10230, to_date('13-09-2013', 'dd-mm-yyyy'), to_date('10-01-2007', 'dd-mm-yyyy'), 32362, 58234, 89972635);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10235, to_date('01-04-2006', 'dd-mm-yyyy'), to_date('19-06-2020', 'dd-mm-yyyy'), 26978, 82839, 36698269);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10240, to_date('21-09-2004', 'dd-mm-yyyy'), to_date('18-10-2004', 'dd-mm-yyyy'), 96588, 31194, 29441693);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10245, to_date('17-07-2004', 'dd-mm-yyyy'), to_date('19-10-2011', 'dd-mm-yyyy'), 66666, 66693, 62894113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10250, to_date('12-04-2002', 'dd-mm-yyyy'), to_date('27-11-2018', 'dd-mm-yyyy'), 64767, 67788, 46151364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10255, to_date('20-03-2003', 'dd-mm-yyyy'), to_date('11-11-2007', 'dd-mm-yyyy'), 77628, 24794, 87556685);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10260, to_date('17-11-2008', 'dd-mm-yyyy'), to_date('09-02-2002', 'dd-mm-yyyy'), 26654, 22414, 89972635);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10265, to_date('16-01-2008', 'dd-mm-yyyy'), to_date('05-11-2002', 'dd-mm-yyyy'), 80112, 79115, 78341231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10270, to_date('24-01-2006', 'dd-mm-yyyy'), to_date('01-04-2003', 'dd-mm-yyyy'), 67842, 72683, 2);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10275, to_date('18-08-2004', 'dd-mm-yyyy'), to_date('17-10-2016', 'dd-mm-yyyy'), 54561, 65567, 57637489);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10280, to_date('20-11-2015', 'dd-mm-yyyy'), to_date('12-10-2015', 'dd-mm-yyyy'), 62896, 98599, 29441693);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10285, to_date('13-07-2020', 'dd-mm-yyyy'), to_date('12-11-2010', 'dd-mm-yyyy'), 92714, 23932, 29818936);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10290, to_date('14-04-2009', 'dd-mm-yyyy'), to_date('01-09-2011', 'dd-mm-yyyy'), 53215, 11784, 55689777);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10295, to_date('26-04-2000', 'dd-mm-yyyy'), to_date('25-02-2003', 'dd-mm-yyyy'), 31537, 83753, 12);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10300, to_date('21-11-2000', 'dd-mm-yyyy'), to_date('17-12-2006', 'dd-mm-yyyy'), 99297, 23798, 68511494);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10305, to_date('18-12-2009', 'dd-mm-yyyy'), to_date('17-05-2013', 'dd-mm-yyyy'), 24117, 33256, 99181387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10310, to_date('27-07-2015', 'dd-mm-yyyy'), to_date('02-10-2011', 'dd-mm-yyyy'), 15243, 17339, 72774815);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10315, to_date('28-04-2018', 'dd-mm-yyyy'), to_date('20-08-2010', 'dd-mm-yyyy'), 24506, 44258, 47135816);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10320, to_date('25-07-2005', 'dd-mm-yyyy'), to_date('06-09-2003', 'dd-mm-yyyy'), 88157, 98974, 18248815);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10325, to_date('18-05-2006', 'dd-mm-yyyy'), to_date('13-03-2013', 'dd-mm-yyyy'), 93917, 87483, 46879551);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10330, to_date('05-10-2020', 'dd-mm-yyyy'), to_date('26-01-2007', 'dd-mm-yyyy'), 84125, 25287, 5);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10335, to_date('09-05-2017', 'dd-mm-yyyy'), to_date('10-09-2009', 'dd-mm-yyyy'), 22138, 57325, 27367712);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10340, to_date('22-09-2013', 'dd-mm-yyyy'), to_date('12-07-2018', 'dd-mm-yyyy'), 33249, 31194, 71546176);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10345, to_date('27-01-2011', 'dd-mm-yyyy'), to_date('24-08-2013', 'dd-mm-yyyy'), 95963, 63711, 56689312);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10350, to_date('17-01-2020', 'dd-mm-yyyy'), to_date('15-09-2013', 'dd-mm-yyyy'), 92863, 48137, 86795563);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10355, to_date('28-08-2001', 'dd-mm-yyyy'), to_date('22-07-2008', 'dd-mm-yyyy'), 76787, 37416, 59526612);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10360, to_date('12-08-2001', 'dd-mm-yyyy'), to_date('14-04-2020', 'dd-mm-yyyy'), 36681, 66121, 86795563);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10365, to_date('23-09-2002', 'dd-mm-yyyy'), to_date('24-03-2016', 'dd-mm-yyyy'), 16763, 78735, 37874639);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10370, to_date('21-09-2005', 'dd-mm-yyyy'), to_date('19-02-2011', 'dd-mm-yyyy'), 49213, 34594, 99458773);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10375, to_date('04-05-2019', 'dd-mm-yyyy'), to_date('28-06-2001', 'dd-mm-yyyy'), 78121, 97261, 16182935);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10380, to_date('01-03-2006', 'dd-mm-yyyy'), to_date('23-11-2016', 'dd-mm-yyyy'), 62379, 95296, 91322455);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10385, to_date('25-01-2019', 'dd-mm-yyyy'), to_date('28-02-2018', 'dd-mm-yyyy'), 86966, 76821, 29818936);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10390, to_date('20-04-2001', 'dd-mm-yyyy'), to_date('02-07-2011', 'dd-mm-yyyy'), 97775, 71864, 84881439);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10395, to_date('27-05-2004', 'dd-mm-yyyy'), to_date('01-11-2017', 'dd-mm-yyyy'), 51819, 97261, 17729142);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10400, to_date('20-02-2018', 'dd-mm-yyyy'), to_date('07-06-2018', 'dd-mm-yyyy'), 65950, 49757, 49248963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10405, to_date('06-01-2004', 'dd-mm-yyyy'), to_date('30-05-2013', 'dd-mm-yyyy'), 91977, 69376, 19649366);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10410, to_date('05-09-2014', 'dd-mm-yyyy'), to_date('31-07-2018', 'dd-mm-yyyy'), 68484, 33256, 77157355);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10415, to_date('01-03-2016', 'dd-mm-yyyy'), to_date('06-07-2015', 'dd-mm-yyyy'), 93681, 37416, 46263931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10420, to_date('01-01-2016', 'dd-mm-yyyy'), to_date('01-01-2011', 'dd-mm-yyyy'), 29715, 29621, 85196743);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10425, to_date('19-07-2018', 'dd-mm-yyyy'), to_date('01-01-2006', 'dd-mm-yyyy'), 35233, 39662, 84655373);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10430, to_date('06-08-2008', 'dd-mm-yyyy'), to_date('25-12-2009', 'dd-mm-yyyy'), 94266, 87483, 33496191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10435, to_date('30-08-2006', 'dd-mm-yyyy'), to_date('07-01-2019', 'dd-mm-yyyy'), 71149, 69376, 26782667);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10440, to_date('01-11-2020', 'dd-mm-yyyy'), to_date('29-09-2014', 'dd-mm-yyyy'), 64309, 39662, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10445, to_date('01-08-2011', 'dd-mm-yyyy'), to_date('20-10-2007', 'dd-mm-yyyy'), 28586, 55519, 84881439);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10450, to_date('17-09-2012', 'dd-mm-yyyy'), to_date('17-05-2018', 'dd-mm-yyyy'), 80642, 44258, 84699689);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10455, to_date('19-04-2016', 'dd-mm-yyyy'), to_date('17-02-2004', 'dd-mm-yyyy'), 85724, 79784, 46263931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10460, to_date('11-10-2015', 'dd-mm-yyyy'), to_date('15-05-2010', 'dd-mm-yyyy'), 47569, 99923, 61495641);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10465, to_date('02-09-2011', 'dd-mm-yyyy'), to_date('28-01-2019', 'dd-mm-yyyy'), 63737, 49732, 69359165);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10470, to_date('12-11-2002', 'dd-mm-yyyy'), to_date('17-10-2014', 'dd-mm-yyyy'), 98158, 29621, 79853819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10475, to_date('08-11-2001', 'dd-mm-yyyy'), to_date('15-10-2002', 'dd-mm-yyyy'), 85391, 49732, 55689777);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10480, to_date('24-08-2019', 'dd-mm-yyyy'), to_date('19-11-2006', 'dd-mm-yyyy'), 35468, 57325, 39846413);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10485, to_date('08-05-2009', 'dd-mm-yyyy'), to_date('11-06-2016', 'dd-mm-yyyy'), 36681, 66693, 46328589);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10490, to_date('03-06-2018', 'dd-mm-yyyy'), to_date('29-04-2016', 'dd-mm-yyyy'), 54459, 99923, 46328589);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10495, to_date('15-07-2018', 'dd-mm-yyyy'), to_date('03-12-2003', 'dd-mm-yyyy'), 48441, 36148, 81316259);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10500, to_date('07-11-2000', 'dd-mm-yyyy'), to_date('03-06-2003', 'dd-mm-yyyy'), 22618, 22414, 51759376);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10505, to_date('08-05-2002', 'dd-mm-yyyy'), to_date('21-02-2020', 'dd-mm-yyyy'), 47534, 49757, 72118325);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10510, to_date('25-10-2006', 'dd-mm-yyyy'), to_date('25-09-2005', 'dd-mm-yyyy'), 50305, 23933, 81477344);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10515, to_date('03-10-2012', 'dd-mm-yyyy'), to_date('01-03-2008', 'dd-mm-yyyy'), 47449, 68695, 65394313);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10520, to_date('23-09-2015', 'dd-mm-yyyy'), to_date('25-05-2002', 'dd-mm-yyyy'), 88944, 24794, 75443212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10525, to_date('27-01-2009', 'dd-mm-yyyy'), to_date('27-07-2002', 'dd-mm-yyyy'), 67571, 72683, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10530, to_date('19-08-2002', 'dd-mm-yyyy'), to_date('03-10-2011', 'dd-mm-yyyy'), 19525, 98432, 47127676);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10535, to_date('22-10-2020', 'dd-mm-yyyy'), to_date('02-10-2011', 'dd-mm-yyyy'), 62657, 34594, 15975426);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10540, to_date('16-10-2015', 'dd-mm-yyyy'), to_date('03-05-2005', 'dd-mm-yyyy'), 67189, 48819, 18);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10545, to_date('12-01-2008', 'dd-mm-yyyy'), to_date('05-09-2014', 'dd-mm-yyyy'), 62597, 32932, 85915935);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10550, to_date('28-10-2014', 'dd-mm-yyyy'), to_date('22-03-2011', 'dd-mm-yyyy'), 62428, 32374, 49296536);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10555, to_date('05-08-2019', 'dd-mm-yyyy'), to_date('29-12-2014', 'dd-mm-yyyy'), 37925, 65285, 18248815);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10560, to_date('22-09-2012', 'dd-mm-yyyy'), to_date('11-02-2012', 'dd-mm-yyyy'), 27623, 63711, 51759376);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10565, to_date('18-02-2018', 'dd-mm-yyyy'), to_date('10-08-2008', 'dd-mm-yyyy'), 69512, 49347, 52349614);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10570, to_date('18-12-2008', 'dd-mm-yyyy'), to_date('14-03-2012', 'dd-mm-yyyy'), 44498, 96248, 33384713);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10575, to_date('30-01-2004', 'dd-mm-yyyy'), to_date('04-03-2009', 'dd-mm-yyyy'), 28937, 51926, 88921152);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10580, to_date('02-01-2014', 'dd-mm-yyyy'), to_date('24-06-2007', 'dd-mm-yyyy'), 26725, 54343, 13612611);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10585, to_date('10-01-2015', 'dd-mm-yyyy'), to_date('26-07-2016', 'dd-mm-yyyy'), 99834, 44258, 64525236);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10590, to_date('14-08-2019', 'dd-mm-yyyy'), to_date('13-10-2010', 'dd-mm-yyyy'), 34937, 84117, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10595, to_date('16-03-2010', 'dd-mm-yyyy'), to_date('29-09-2005', 'dd-mm-yyyy'), 73148, 48137, 41879417);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10600, to_date('19-05-2008', 'dd-mm-yyyy'), to_date('01-02-2008', 'dd-mm-yyyy'), 68672, 82688, 57471452);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10605, to_date('24-11-2013', 'dd-mm-yyyy'), to_date('09-01-2007', 'dd-mm-yyyy'), 27539, 95296, 14813658);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10610, to_date('05-03-2013', 'dd-mm-yyyy'), to_date('25-03-2002', 'dd-mm-yyyy'), 78263, 47969, 97635136);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10615, to_date('14-04-2017', 'dd-mm-yyyy'), to_date('24-02-2009', 'dd-mm-yyyy'), 33249, 69417, 85915935);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10620, to_date('20-10-2012', 'dd-mm-yyyy'), to_date('22-05-2017', 'dd-mm-yyyy'), 83361, 37416, 57637489);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10625, to_date('28-05-2003', 'dd-mm-yyyy'), to_date('18-07-2004', 'dd-mm-yyyy'), 34141, 19291, 26462311);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10630, to_date('20-10-2008', 'dd-mm-yyyy'), to_date('19-08-2001', 'dd-mm-yyyy'), 98173, 65567, 68814298);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10635, to_date('09-04-2005', 'dd-mm-yyyy'), to_date('31-08-2007', 'dd-mm-yyyy'), 92714, 34594, 43149369);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10640, to_date('31-05-2008', 'dd-mm-yyyy'), to_date('19-02-2014', 'dd-mm-yyyy'), 76787, 84241, 11495212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10645, to_date('30-08-2008', 'dd-mm-yyyy'), to_date('11-12-2014', 'dd-mm-yyyy'), 79135, 96931, 27638892);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10650, to_date('29-04-2004', 'dd-mm-yyyy'), to_date('09-04-2013', 'dd-mm-yyyy'), 34575, 81766, 99181387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10655, to_date('01-05-2006', 'dd-mm-yyyy'), to_date('01-02-2020', 'dd-mm-yyyy'), 15917, 79784, 76884387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10660, to_date('01-09-2018', 'dd-mm-yyyy'), to_date('03-05-2000', 'dd-mm-yyyy'), 33829, 73237, 75443212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10665, to_date('18-06-2020', 'dd-mm-yyyy'), to_date('11-07-2016', 'dd-mm-yyyy'), 19585, 84117, 55369266);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10670, to_date('10-03-2015', 'dd-mm-yyyy'), to_date('21-04-2019', 'dd-mm-yyyy'), 57653, 82338, 46879551);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10675, to_date('08-08-2016', 'dd-mm-yyyy'), to_date('07-03-2010', 'dd-mm-yyyy'), 85391, 84241, 38815826);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10680, to_date('02-10-2020', 'dd-mm-yyyy'), to_date('03-12-2013', 'dd-mm-yyyy'), 35468, 98482, 8);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10685, to_date('18-02-2016', 'dd-mm-yyyy'), to_date('15-08-2010', 'dd-mm-yyyy'), 72463, 72682, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10690, to_date('15-10-2014', 'dd-mm-yyyy'), to_date('13-07-2000', 'dd-mm-yyyy'), 11878, 83871, 52131513);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10695, to_date('02-03-2017', 'dd-mm-yyyy'), to_date('28-02-2011', 'dd-mm-yyyy'), 37517, 77497, 15129862);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10700, to_date('18-11-2016', 'dd-mm-yyyy'), to_date('12-06-2016', 'dd-mm-yyyy'), 68172, 49477, 55592359);
commit;
prompt 300 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10705, to_date('24-09-2008', 'dd-mm-yyyy'), to_date('09-09-2003', 'dd-mm-yyyy'), 77211, 37652, 18);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10710, to_date('01-12-2010', 'dd-mm-yyyy'), to_date('01-05-2007', 'dd-mm-yyyy'), 28179, 47969, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10715, to_date('25-06-2001', 'dd-mm-yyyy'), to_date('02-09-2009', 'dd-mm-yyyy'), 67842, 76821, 95554736);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10720, to_date('24-01-2009', 'dd-mm-yyyy'), to_date('06-08-2012', 'dd-mm-yyyy'), 95963, 18581, 29441693);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10725, to_date('23-06-2003', 'dd-mm-yyyy'), to_date('04-09-2008', 'dd-mm-yyyy'), 12194, 25287, 96534397);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10730, to_date('02-01-2015', 'dd-mm-yyyy'), to_date('22-12-2009', 'dd-mm-yyyy'), 17255, 55519, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10735, to_date('01-12-2016', 'dd-mm-yyyy'), to_date('29-12-2004', 'dd-mm-yyyy'), 88458, 72682, 61495641);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10740, to_date('25-06-2004', 'dd-mm-yyyy'), to_date('09-05-2007', 'dd-mm-yyyy'), 76234, 55331, 37252525);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10745, to_date('30-07-2018', 'dd-mm-yyyy'), to_date('01-06-2011', 'dd-mm-yyyy'), 81926, 12389, 64525236);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10750, to_date('04-06-2002', 'dd-mm-yyyy'), to_date('06-01-2019', 'dd-mm-yyyy'), 76529, 26944, 37874639);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10755, to_date('30-01-2002', 'dd-mm-yyyy'), to_date('07-07-2013', 'dd-mm-yyyy'), 65862, 23932, 62479178);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10760, to_date('04-08-2015', 'dd-mm-yyyy'), to_date('01-01-2000', 'dd-mm-yyyy'), 65950, 18581, 42376146);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10765, to_date('09-12-2017', 'dd-mm-yyyy'), to_date('17-03-2000', 'dd-mm-yyyy'), 34618, 29621, 59798994);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10770, to_date('12-02-2009', 'dd-mm-yyyy'), to_date('09-05-2005', 'dd-mm-yyyy'), 36532, 6, 29441693);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10775, to_date('29-01-2005', 'dd-mm-yyyy'), to_date('08-08-2003', 'dd-mm-yyyy'), 37694, 84117, 57985566);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10780, to_date('28-06-2003', 'dd-mm-yyyy'), to_date('14-06-2009', 'dd-mm-yyyy'), 67993, 74937, 68814298);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10785, to_date('02-05-2007', 'dd-mm-yyyy'), to_date('01-01-2015', 'dd-mm-yyyy'), 36787, 83126, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10790, to_date('15-03-2011', 'dd-mm-yyyy'), to_date('28-03-2016', 'dd-mm-yyyy'), 46946, 31194, 73817326);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10795, to_date('08-12-2007', 'dd-mm-yyyy'), to_date('21-06-2003', 'dd-mm-yyyy'), 58725, 71864, 44142435);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10800, to_date('19-04-2012', 'dd-mm-yyyy'), to_date('15-06-2004', 'dd-mm-yyyy'), 23923, 79912, 9);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10805, to_date('10-01-2005', 'dd-mm-yyyy'), to_date('24-08-2009', 'dd-mm-yyyy'), 95330, 82338, 61134559);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10810, to_date('23-05-2016', 'dd-mm-yyyy'), to_date('23-04-2006', 'dd-mm-yyyy'), 14655, 31194, 46879551);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10815, to_date('07-10-2015', 'dd-mm-yyyy'), to_date('07-09-2020', 'dd-mm-yyyy'), 60632, 99923, 4);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10820, to_date('22-06-2012', 'dd-mm-yyyy'), to_date('20-09-2016', 'dd-mm-yyyy'), 26978, 52399, 54515892);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10825, to_date('05-01-2002', 'dd-mm-yyyy'), to_date('24-03-2019', 'dd-mm-yyyy'), 42781, 98482, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10830, to_date('14-05-2003', 'dd-mm-yyyy'), to_date('09-05-2000', 'dd-mm-yyyy'), 23097, 67718, 54442487);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10835, to_date('23-06-2003', 'dd-mm-yyyy'), to_date('09-05-2005', 'dd-mm-yyyy'), 31383, 77497, 73143256);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10840, to_date('13-05-2005', 'dd-mm-yyyy'), to_date('26-01-2006', 'dd-mm-yyyy'), 77623, 67718, 85196743);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10845, to_date('31-03-2011', 'dd-mm-yyyy'), to_date('22-06-2016', 'dd-mm-yyyy'), 93335, 99835, 56927789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10850, to_date('06-06-2001', 'dd-mm-yyyy'), to_date('15-07-2012', 'dd-mm-yyyy'), 41513, 44258, 57143634);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10855, to_date('14-01-2011', 'dd-mm-yyyy'), to_date('18-03-2010', 'dd-mm-yyyy'), 84649, 52399, 63855668);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10860, to_date('07-06-2001', 'dd-mm-yyyy'), to_date('18-01-2018', 'dd-mm-yyyy'), 83972, 48137, 43834893);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10865, to_date('04-08-2016', 'dd-mm-yyyy'), to_date('09-09-2001', 'dd-mm-yyyy'), 72159, 32422, 15924254);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10870, to_date('24-01-2020', 'dd-mm-yyyy'), to_date('11-02-2013', 'dd-mm-yyyy'), 93216, 77992, 62365835);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10875, to_date('22-08-2011', 'dd-mm-yyyy'), to_date('18-01-2013', 'dd-mm-yyyy'), 53433, 49347, 35982335);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10880, to_date('08-12-2014', 'dd-mm-yyyy'), to_date('31-08-2003', 'dd-mm-yyyy'), 85726, 63711, 73928971);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10885, to_date('24-05-2015', 'dd-mm-yyyy'), to_date('27-09-2014', 'dd-mm-yyyy'), 62829, 98599, 39171226);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10890, to_date('29-03-2005', 'dd-mm-yyyy'), to_date('03-01-2008', 'dd-mm-yyyy'), 75874, 19291, 24472763);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10895, to_date('10-04-2001', 'dd-mm-yyyy'), to_date('29-04-2006', 'dd-mm-yyyy'), 15193, 67718, 59238419);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10900, to_date('21-12-2012', 'dd-mm-yyyy'), to_date('13-03-2020', 'dd-mm-yyyy'), 12559, 48137, 23769387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10905, to_date('26-10-2017', 'dd-mm-yyyy'), to_date('30-12-2014', 'dd-mm-yyyy'), 92714, 34594, 56977482);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10910, to_date('23-08-2004', 'dd-mm-yyyy'), to_date('08-09-2007', 'dd-mm-yyyy'), 81562, 67788, 34781111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10915, to_date('10-07-2007', 'dd-mm-yyyy'), to_date('22-10-2018', 'dd-mm-yyyy'), 29395, 68695, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10920, to_date('24-03-2014', 'dd-mm-yyyy'), to_date('19-03-2004', 'dd-mm-yyyy'), 68267, 42414, 13787177);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10925, to_date('08-06-2018', 'dd-mm-yyyy'), to_date('14-05-2000', 'dd-mm-yyyy'), 88157, 72683, 87145958);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10930, to_date('26-01-2015', 'dd-mm-yyyy'), to_date('04-04-2003', 'dd-mm-yyyy'), 48566, 83871, 51594664);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10935, to_date('16-08-2014', 'dd-mm-yyyy'), to_date('29-07-2012', 'dd-mm-yyyy'), 47283, 97261, 93667714);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3779, to_date('12-09-2020', 'dd-mm-yyyy'), to_date('16-08-2019', 'dd-mm-yyyy'), 97624, 36383, 44142435);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4345, to_date('09-01-2007', 'dd-mm-yyyy'), to_date('29-04-2016', 'dd-mm-yyyy'), 96396, 77497, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3999, to_date('03-06-2007', 'dd-mm-yyyy'), to_date('18-02-2005', 'dd-mm-yyyy'), 92448, 59143, 8);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7927, to_date('27-09-2011', 'dd-mm-yyyy'), to_date('19-09-2013', 'dd-mm-yyyy'), 71718, 66121, 45314931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5535, to_date('23-03-2017', 'dd-mm-yyyy'), to_date('23-12-2014', 'dd-mm-yyyy'), 65779, 7, 56927789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8191, to_date('04-09-2012', 'dd-mm-yyyy'), to_date('30-12-2013', 'dd-mm-yyyy'), 58725, 58234, 45585767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7656, to_date('22-07-2017', 'dd-mm-yyyy'), to_date('21-12-2017', 'dd-mm-yyyy'), 111, 52399, 29818936);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6186, to_date('16-10-2002', 'dd-mm-yyyy'), to_date('12-09-2001', 'dd-mm-yyyy'), 45666, 88239, 15975426);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9613, to_date('23-02-2005', 'dd-mm-yyyy'), to_date('19-10-2018', 'dd-mm-yyyy'), 43629, 82688, 29818936);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7516, to_date('26-12-2018', 'dd-mm-yyyy'), to_date('21-11-2004', 'dd-mm-yyyy'), 78263, 98482, 88875579);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5321, to_date('26-07-2019', 'dd-mm-yyyy'), to_date('18-12-2003', 'dd-mm-yyyy'), 72159, 83871, 34766568);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5271, to_date('09-11-2006', 'dd-mm-yyyy'), to_date('28-01-2003', 'dd-mm-yyyy'), 2074, 39662, 32681299);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6411, to_date('08-11-2003', 'dd-mm-yyyy'), to_date('29-04-2004', 'dd-mm-yyyy'), 23097, 65567, 73143256);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3352, to_date('06-03-2020', 'dd-mm-yyyy'), to_date('15-04-2002', 'dd-mm-yyyy'), 62126, 43839, 45646399);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9268, to_date('03-04-2006', 'dd-mm-yyyy'), to_date('30-03-2011', 'dd-mm-yyyy'), 27623, 43839, 89972635);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9247, to_date('20-03-2012', 'dd-mm-yyyy'), to_date('11-01-2015', 'dd-mm-yyyy'), 88684, 69376, 56194188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8387, to_date('24-02-2011', 'dd-mm-yyyy'), to_date('15-09-2006', 'dd-mm-yyyy'), 15723, 23932, 56194188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2566, to_date('12-12-2011', 'dd-mm-yyyy'), to_date('27-09-2011', 'dd-mm-yyyy'), 53215, 22414, 55445293);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1236, to_date('17-06-2005', 'dd-mm-yyyy'), to_date('26-11-2006', 'dd-mm-yyyy'), 55188, 49732, 81269834);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9356, to_date('07-12-2013', 'dd-mm-yyyy'), to_date('08-02-2003', 'dd-mm-yyyy'), 31537, 82338, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3155, to_date('26-07-2020', 'dd-mm-yyyy'), to_date('26-10-2013', 'dd-mm-yyyy'), 79975, 65682, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3395, to_date('01-04-2013', 'dd-mm-yyyy'), to_date('28-04-2002', 'dd-mm-yyyy'), 94229, 43839, 69774122);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6325, to_date('14-01-2017', 'dd-mm-yyyy'), to_date('17-11-2006', 'dd-mm-yyyy'), 15243, 98599, 91824968);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2312, to_date('26-02-2013', 'dd-mm-yyyy'), to_date('04-06-2001', 'dd-mm-yyyy'), 73189, 25287, 86795563);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1767, to_date('22-03-2008', 'dd-mm-yyyy'), to_date('30-01-2020', 'dd-mm-yyyy'), 84601, 49732, 12684866);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5733, to_date('25-08-2003', 'dd-mm-yyyy'), to_date('03-07-2001', 'dd-mm-yyyy'), 17449, 74937, 16);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3148, to_date('11-06-2012', 'dd-mm-yyyy'), to_date('27-10-2014', 'dd-mm-yyyy'), 44498, 7, 114);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7954, to_date('24-04-2003', 'dd-mm-yyyy'), to_date('06-05-2000', 'dd-mm-yyyy'), 34579, 91753, 84881439);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9529, to_date('18-05-2008', 'dd-mm-yyyy'), to_date('06-09-2019', 'dd-mm-yyyy'), 46869, 43839, 72118325);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6673, to_date('25-03-2004', 'dd-mm-yyyy'), to_date('20-11-2004', 'dd-mm-yyyy'), 58634, 74937, 12874949);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9977, to_date('07-09-2013', 'dd-mm-yyyy'), to_date('01-10-2000', 'dd-mm-yyyy'), 74936, 82688, 12874949);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7433, to_date('18-05-2016', 'dd-mm-yyyy'), to_date('23-06-2008', 'dd-mm-yyyy'), 73324, 32374, 41857774);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9941, to_date('28-01-2003', 'dd-mm-yyyy'), to_date('22-02-2015', 'dd-mm-yyyy'), 84649, 49732, 73784175);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2279, to_date('17-05-2010', 'dd-mm-yyyy'), to_date('27-04-2006', 'dd-mm-yyyy'), 62126, 67788, 14438592);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9112, to_date('30-07-2000', 'dd-mm-yyyy'), to_date('29-04-2008', 'dd-mm-yyyy'), 67993, 71864, 63855668);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7675, to_date('18-08-2013', 'dd-mm-yyyy'), to_date('14-02-2009', 'dd-mm-yyyy'), 94229, 87325, 15129862);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8412, to_date('28-05-2007', 'dd-mm-yyyy'), to_date('11-03-2017', 'dd-mm-yyyy'), 11521, 65285, 26462311);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4535, to_date('20-12-2014', 'dd-mm-yyyy'), to_date('08-02-2018', 'dd-mm-yyyy'), 34403, 37416, 51759376);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6659, to_date('06-08-2009', 'dd-mm-yyyy'), to_date('04-12-2001', 'dd-mm-yyyy'), 58835, 65682, 47347838);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7582, to_date('22-07-2019', 'dd-mm-yyyy'), to_date('25-07-2019', 'dd-mm-yyyy'), 76427, 25287, 47529738);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1224, to_date('28-04-2002', 'dd-mm-yyyy'), to_date('19-03-2017', 'dd-mm-yyyy'), 33624, 87325, 75914197);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3468, to_date('29-10-2008', 'dd-mm-yyyy'), to_date('13-04-2019', 'dd-mm-yyyy'), 38771, 57325, 87145958);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6677, to_date('21-09-2015', 'dd-mm-yyyy'), to_date('30-12-2014', 'dd-mm-yyyy'), 85671, 99835, 39171226);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7481, to_date('08-11-2020', 'dd-mm-yyyy'), to_date('16-09-2004', 'dd-mm-yyyy'), 14627, 54343, 91322455);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5479, to_date('07-02-2002', 'dd-mm-yyyy'), to_date('11-12-2002', 'dd-mm-yyyy'), 54459, 96931, 82243612);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1896, to_date('15-05-2018', 'dd-mm-yyyy'), to_date('18-03-2006', 'dd-mm-yyyy'), 38868, 7, 55689777);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4559, to_date('17-02-2013', 'dd-mm-yyyy'), to_date('12-04-2011', 'dd-mm-yyyy'), 111, 9, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4113, to_date('11-09-2018', 'dd-mm-yyyy'), to_date('28-01-2011', 'dd-mm-yyyy'), 40462, 32374, 44142435);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1798, to_date('05-10-2002', 'dd-mm-yyyy'), to_date('28-01-2009', 'dd-mm-yyyy'), 73617, 42414, 49296536);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3444, to_date('11-11-2014', 'dd-mm-yyyy'), to_date('29-12-2009', 'dd-mm-yyyy'), 13299, 26284, 72628196);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1147, to_date('09-08-2001', 'dd-mm-yyyy'), to_date('24-11-2009', 'dd-mm-yyyy'), 17577, 83871, 22999597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5762, to_date('19-08-2018', 'dd-mm-yyyy'), to_date('03-02-2010', 'dd-mm-yyyy'), 22224, 55519, 85636881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6991, to_date('05-02-2004', 'dd-mm-yyyy'), to_date('22-11-2010', 'dd-mm-yyyy'), 22224, 47969, 33384713);
commit;
prompt 400 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8451, to_date('06-10-2017', 'dd-mm-yyyy'), to_date('17-05-2013', 'dd-mm-yyyy'), 81987, 98482, 61134559);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3867, to_date('23-12-2010', 'dd-mm-yyyy'), to_date('11-06-2001', 'dd-mm-yyyy'), 92448, 87483, 29845241);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3179, to_date('25-11-2020', 'dd-mm-yyyy'), to_date('16-03-2016', 'dd-mm-yyyy'), 83966, 42414, 6);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6621, to_date('17-03-2009', 'dd-mm-yyyy'), to_date('18-03-2020', 'dd-mm-yyyy'), 55447, 82338, 27367712);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1411, to_date('25-12-2005', 'dd-mm-yyyy'), to_date('13-03-2020', 'dd-mm-yyyy'), 39545, 48819, 33496191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9332, to_date('10-01-2007', 'dd-mm-yyyy'), to_date('19-06-2006', 'dd-mm-yyyy'), 71766, 26284, 14973237);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2286, to_date('13-12-2015', 'dd-mm-yyyy'), to_date('12-04-2000', 'dd-mm-yyyy'), 65534, 72682, 46151364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9971, to_date('17-07-2015', 'dd-mm-yyyy'), to_date('13-03-2013', 'dd-mm-yyyy'), 26387, 96248, 66169498);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7568, to_date('30-01-2012', 'dd-mm-yyyy'), to_date('06-08-2010', 'dd-mm-yyyy'), 22348, 32932, 48138574);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5847, to_date('16-08-2010', 'dd-mm-yyyy'), to_date('01-02-2003', 'dd-mm-yyyy'), 94977, 49732, 95554736);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3452, to_date('11-06-2016', 'dd-mm-yyyy'), to_date('09-04-2006', 'dd-mm-yyyy'), 20093, 95296, 36698269);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9292, to_date('30-11-2016', 'dd-mm-yyyy'), to_date('20-10-2017', 'dd-mm-yyyy'), 67953, 59143, 83615625);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8877, to_date('14-09-2002', 'dd-mm-yyyy'), to_date('02-06-2003', 'dd-mm-yyyy'), 71347, 15868, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8336, to_date('26-01-2011', 'dd-mm-yyyy'), to_date('19-08-2001', 'dd-mm-yyyy'), 15193, 23933, 66464862);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7263, to_date('10-02-2015', 'dd-mm-yyyy'), to_date('01-03-2002', 'dd-mm-yyyy'), 58187, 66693, 34129523);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2827, to_date('21-01-2020', 'dd-mm-yyyy'), to_date('04-12-2000', 'dd-mm-yyyy'), 86947, 67718, 83248218);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4779, to_date('05-11-2014', 'dd-mm-yyyy'), to_date('22-08-2011', 'dd-mm-yyyy'), 83739, 12389, 41879417);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1233, to_date('11-11-2015', 'dd-mm-yyyy'), to_date('14-06-2003', 'dd-mm-yyyy'), 57278, 19291, 5);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4637, to_date('20-02-2015', 'dd-mm-yyyy'), to_date('19-08-2009', 'dd-mm-yyyy'), 16841, 45211, 29261328);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3224, to_date('12-07-2000', 'dd-mm-yyyy'), to_date('30-07-2019', 'dd-mm-yyyy'), 79975, 79784, 25172694);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4371, to_date('02-09-2014', 'dd-mm-yyyy'), to_date('15-09-2017', 'dd-mm-yyyy'), 32262, 67718, 41857774);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4198, to_date('28-05-2017', 'dd-mm-yyyy'), to_date('01-05-2006', 'dd-mm-yyyy'), 15071, 15868, 37874639);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6993, to_date('08-01-2012', 'dd-mm-yyyy'), to_date('20-12-2011', 'dd-mm-yyyy'), 96636, 63711, 14419582);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2247, to_date('21-03-2001', 'dd-mm-yyyy'), to_date('17-07-2013', 'dd-mm-yyyy'), 54143, 82338, 76237121);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9233, to_date('24-12-2000', 'dd-mm-yyyy'), to_date('26-01-2017', 'dd-mm-yyyy'), 95447, 97911, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4792, to_date('12-05-2019', 'dd-mm-yyyy'), to_date('31-03-2014', 'dd-mm-yyyy'), 97217, 95296, 63855668);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8125, to_date('13-01-2000', 'dd-mm-yyyy'), to_date('27-02-2006', 'dd-mm-yyyy'), 34575, 68695, 48122127);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9654, to_date('15-08-2014', 'dd-mm-yyyy'), to_date('14-06-2008', 'dd-mm-yyyy'), 82923, 79912, 14419582);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7137, to_date('20-08-2019', 'dd-mm-yyyy'), to_date('06-06-2015', 'dd-mm-yyyy'), 81987, 82688, 97895962);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2758, to_date('23-08-2018', 'dd-mm-yyyy'), to_date('04-04-2014', 'dd-mm-yyyy'), 53776, 43839, 69774122);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6977, to_date('14-10-2018', 'dd-mm-yyyy'), to_date('29-03-2003', 'dd-mm-yyyy'), 89107, 93474, 93667714);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1749, to_date('26-08-2009', 'dd-mm-yyyy'), to_date('10-03-2012', 'dd-mm-yyyy'), 36852, 23798, 62232168);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1974, to_date('01-06-2012', 'dd-mm-yyyy'), to_date('25-04-2017', 'dd-mm-yyyy'), 13546, 65285, 48122127);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2241, to_date('21-04-2012', 'dd-mm-yyyy'), to_date('04-11-2014', 'dd-mm-yyyy'), 92999, 15868, 33512225);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9338, to_date('08-06-2008', 'dd-mm-yyyy'), to_date('31-03-2017', 'dd-mm-yyyy'), 52852, 6, 39846331);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3846, to_date('12-10-2006', 'dd-mm-yyyy'), to_date('30-12-2005', 'dd-mm-yyyy'), 45679, 58234, 63151798);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3387, to_date('21-03-2017', 'dd-mm-yyyy'), to_date('18-02-2007', 'dd-mm-yyyy'), 85724, 79784, 55445293);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8431, to_date('06-10-2019', 'dd-mm-yyyy'), to_date('27-12-2013', 'dd-mm-yyyy'), 95619, 99923, 61962852);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6957, to_date('18-08-2003', 'dd-mm-yyyy'), to_date('29-05-2004', 'dd-mm-yyyy'), 71149, 55331, 5);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8165, to_date('10-08-2005', 'dd-mm-yyyy'), to_date('28-10-2016', 'dd-mm-yyyy'), 21997, 19291, 67419271);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1991, to_date('10-07-2002', 'dd-mm-yyyy'), to_date('17-10-2012', 'dd-mm-yyyy'), 83361, 58234, 53199867);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6878, to_date('11-02-2011', 'dd-mm-yyyy'), to_date('12-10-2001', 'dd-mm-yyyy'), 26637, 87325, 26462311);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1393, to_date('13-03-2004', 'dd-mm-yyyy'), to_date('03-06-2013', 'dd-mm-yyyy'), 69459, 59143, 95994968);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3385, to_date('07-04-2015', 'dd-mm-yyyy'), to_date('11-09-2010', 'dd-mm-yyyy'), 33699, 23933, 64583677);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9674, to_date('04-07-2010', 'dd-mm-yyyy'), to_date('19-06-2011', 'dd-mm-yyyy'), 63362, 48137, 78341231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7215, to_date('31-07-2015', 'dd-mm-yyyy'), to_date('20-05-2002', 'dd-mm-yyyy'), 21172, 51926, 85196743);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1389, to_date('12-02-2000', 'dd-mm-yyyy'), to_date('02-12-2014', 'dd-mm-yyyy'), 19763, 83126, 46134653);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1526, to_date('09-03-2002', 'dd-mm-yyyy'), to_date('21-02-2003', 'dd-mm-yyyy'), 84141, 96931, 99458773);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9987, to_date('06-05-2007', 'dd-mm-yyyy'), to_date('24-02-2009', 'dd-mm-yyyy'), 15071, 87325, 75443212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4121, to_date('08-03-2017', 'dd-mm-yyyy'), to_date('01-08-2018', 'dd-mm-yyyy'), 87665, 18581, 112);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9644, to_date('18-05-2003', 'dd-mm-yyyy'), to_date('29-06-2017', 'dd-mm-yyyy'), 66396, 57325, 89972635);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (8595, to_date('22-03-2016', 'dd-mm-yyyy'), to_date('13-01-2011', 'dd-mm-yyyy'), 37406, 59143, 71546176);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4758, to_date('06-06-2020', 'dd-mm-yyyy'), to_date('21-02-2001', 'dd-mm-yyyy'), 18751, 22414, 31839511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2175, to_date('21-04-2006', 'dd-mm-yyyy'), to_date('27-04-2020', 'dd-mm-yyyy'), 34833, 31194, 91922595);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7865, to_date('08-09-2007', 'dd-mm-yyyy'), to_date('26-11-2011', 'dd-mm-yyyy'), 7716, 84117, 83623371);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5357, to_date('23-01-2005', 'dd-mm-yyyy'), to_date('21-04-2000', 'dd-mm-yyyy'), 55447, 26944, 14438592);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6195, to_date('29-08-2013', 'dd-mm-yyyy'), to_date('25-06-2008', 'dd-mm-yyyy'), 55699, 52399, 75443212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3484, to_date('18-09-2014', 'dd-mm-yyyy'), to_date('21-11-2018', 'dd-mm-yyyy'), 68969, 29621, 25595898);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6931, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('07-04-2004', 'dd-mm-yyyy'), 98643, 34594, 57127317);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4995, to_date('21-06-2008', 'dd-mm-yyyy'), to_date('29-05-2010', 'dd-mm-yyyy'), 63362, 83126, 33512225);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6412, to_date('26-12-2006', 'dd-mm-yyyy'), to_date('06-01-2013', 'dd-mm-yyyy'), 62698, 79784, 92986276);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9295, to_date('21-02-2009', 'dd-mm-yyyy'), to_date('18-09-2000', 'dd-mm-yyyy'), 93824, 88239, 45314931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6429, to_date('01-07-2019', 'dd-mm-yyyy'), to_date('08-06-2005', 'dd-mm-yyyy'), 33975, 98432, 59626673);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5364, to_date('23-10-2000', 'dd-mm-yyyy'), to_date('08-07-2011', 'dd-mm-yyyy'), 68592, 26944, 15924254);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (2573, to_date('06-11-2006', 'dd-mm-yyyy'), to_date('10-09-2017', 'dd-mm-yyyy'), 84941, 17339, 55689777);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7324, to_date('12-08-2006', 'dd-mm-yyyy'), to_date('23-11-2003', 'dd-mm-yyyy'), 71886, 96931, 67263928);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9134, to_date('22-02-2008', 'dd-mm-yyyy'), to_date('27-10-2016', 'dd-mm-yyyy'), 93335, 63711, 12);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9594, to_date('01-11-2020', 'dd-mm-yyyy'), to_date('22-10-2000', 'dd-mm-yyyy'), 97544, 33256, 17729142);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4592, to_date('03-04-2012', 'dd-mm-yyyy'), to_date('01-03-2002', 'dd-mm-yyyy'), 56857, 87483, 19649366);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6639, to_date('21-12-2002', 'dd-mm-yyyy'), to_date('22-11-2016', 'dd-mm-yyyy'), 22348, 82839, 31121978);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6758, to_date('09-08-2009', 'dd-mm-yyyy'), to_date('07-05-2016', 'dd-mm-yyyy'), 71347, 51926, 39853517);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7254, to_date('06-10-2014', 'dd-mm-yyyy'), to_date('10-05-2009', 'dd-mm-yyyy'), 16841, 48819, 22788535);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1678, to_date('22-07-2009', 'dd-mm-yyyy'), to_date('10-11-2010', 'dd-mm-yyyy'), 77995, 55519, 63855668);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (1581, to_date('08-06-2004', 'dd-mm-yyyy'), to_date('11-02-2014', 'dd-mm-yyyy'), 53823, 39662, 35317388);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9891, to_date('10-11-2006', 'dd-mm-yyyy'), to_date('11-05-2016', 'dd-mm-yyyy'), 52326, 73237, 64583677);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7167, to_date('20-01-2000', 'dd-mm-yyyy'), to_date('17-05-2011', 'dd-mm-yyyy'), 73561, 6, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5851, to_date('25-03-2000', 'dd-mm-yyyy'), to_date('23-01-2007', 'dd-mm-yyyy'), 17577, 58234, 56689312);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (6663, to_date('03-06-2005', 'dd-mm-yyyy'), to_date('06-08-2018', 'dd-mm-yyyy'), 97594, 37652, 75592485);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3436, to_date('09-07-2000', 'dd-mm-yyyy'), to_date('06-07-2002', 'dd-mm-yyyy'), 73396, 23933, 82527286);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7361, to_date('08-03-2002', 'dd-mm-yyyy'), to_date('24-11-2000', 'dd-mm-yyyy'), 61965, 97911, 68511494);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (4784, to_date('30-11-2014', 'dd-mm-yyyy'), to_date('29-07-2006', 'dd-mm-yyyy'), 68592, 8, 51552331);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (3253, to_date('31-08-2015', 'dd-mm-yyyy'), to_date('26-05-2019', 'dd-mm-yyyy'), 51425, 83871, 52131513);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (9918, to_date('18-04-2016', 'dd-mm-yyyy'), to_date('01-09-2003', 'dd-mm-yyyy'), 71149, 59143, 21745437);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (5286, to_date('26-06-2001', 'dd-mm-yyyy'), to_date('14-06-2017', 'dd-mm-yyyy'), 51473, 87483, 22788535);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (7931, to_date('10-04-2010', 'dd-mm-yyyy'), to_date('12-08-2005', 'dd-mm-yyyy'), 39795, 17339, 34766568);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24446, to_date('16-06-2012', 'dd-mm-yyyy'), to_date('12-01-2014', 'dd-mm-yyyy'), 62867, 33256, 85648914);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72748, to_date('11-03-2011', 'dd-mm-yyyy'), to_date('26-06-2019', 'dd-mm-yyyy'), 46796, 7, 85648914);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99735, to_date('30-01-2001', 'dd-mm-yyyy'), to_date('09-10-2005', 'dd-mm-yyyy'), 95447, 48137, 111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63122, to_date('22-03-2014', 'dd-mm-yyyy'), to_date('09-02-2011', 'dd-mm-yyyy'), 24661, 8, 79853819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43668, to_date('04-06-2012', 'dd-mm-yyyy'), to_date('28-05-2003', 'dd-mm-yyyy'), 66240, 23932, 37874639);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97592, to_date('12-10-2009', 'dd-mm-yyyy'), to_date('22-05-2002', 'dd-mm-yyyy'), 12791, 65567, 79853819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35673, to_date('22-10-2008', 'dd-mm-yyyy'), to_date('10-10-2020', 'dd-mm-yyyy'), 46755, 26944, 46151364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37873, to_date('19-08-2001', 'dd-mm-yyyy'), to_date('12-07-2016', 'dd-mm-yyyy'), 38599, 98974, 28847179);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69841, to_date('26-07-2005', 'dd-mm-yyyy'), to_date('20-06-2002', 'dd-mm-yyyy'), 77445, 69376, 15975426);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53394, to_date('11-04-2003', 'dd-mm-yyyy'), to_date('01-09-2004', 'dd-mm-yyyy'), 53562, 43839, 12998387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16513, to_date('07-06-2000', 'dd-mm-yyyy'), to_date('31-05-2007', 'dd-mm-yyyy'), 26978, 12389, 87814169);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (86834, to_date('11-07-2005', 'dd-mm-yyyy'), to_date('24-07-2018', 'dd-mm-yyyy'), 81987, 22231, 21377498);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (12879, to_date('08-06-2005', 'dd-mm-yyyy'), to_date('23-10-2011', 'dd-mm-yyyy'), 84649, 72683, 41879417);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42443, to_date('18-10-2012', 'dd-mm-yyyy'), to_date('04-12-2017', 'dd-mm-yyyy'), 66512, 11784, 47659666);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66299, to_date('24-06-2008', 'dd-mm-yyyy'), to_date('11-08-2004', 'dd-mm-yyyy'), 59244, 23484, 38469744);
commit;
prompt 500 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59281, to_date('05-11-2020', 'dd-mm-yyyy'), to_date('20-01-2015', 'dd-mm-yyyy'), 64561, 87325, 29415222);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98635, to_date('26-07-2003', 'dd-mm-yyyy'), to_date('12-12-2005', 'dd-mm-yyyy'), 82357, 12389, 47347838);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37966, to_date('17-01-2013', 'dd-mm-yyyy'), to_date('13-03-2018', 'dd-mm-yyyy'), 26995, 22414, 55689777);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89642, to_date('25-10-2011', 'dd-mm-yyyy'), to_date('29-09-2018', 'dd-mm-yyyy'), 65872, 74937, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51516, to_date('15-08-2015', 'dd-mm-yyyy'), to_date('22-07-2017', 'dd-mm-yyyy'), 35956, 11784, 91944651);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93654, to_date('28-10-2020', 'dd-mm-yyyy'), to_date('27-11-2012', 'dd-mm-yyyy'), 24919, 49732, 111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15418, to_date('10-05-2005', 'dd-mm-yyyy'), to_date('06-12-2010', 'dd-mm-yyyy'), 26926, 34594, 57396459);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (57445, to_date('27-01-2006', 'dd-mm-yyyy'), to_date('21-10-2004', 'dd-mm-yyyy'), 27361, 98482, 72628196);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19455, to_date('02-10-2014', 'dd-mm-yyyy'), to_date('09-04-2008', 'dd-mm-yyyy'), 75672, 79784, 57322122);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11269, to_date('11-05-2014', 'dd-mm-yyyy'), to_date('19-11-2005', 'dd-mm-yyyy'), 26746, 36383, 64583677);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53585, to_date('17-08-2007', 'dd-mm-yyyy'), to_date('01-10-2001', 'dd-mm-yyyy'), 99779, 49757, 24472763);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48974, to_date('01-07-2000', 'dd-mm-yyyy'), to_date('31-08-2018', 'dd-mm-yyyy'), 88792, 49732, 68814298);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28489, to_date('11-08-2006', 'dd-mm-yyyy'), to_date('05-02-2019', 'dd-mm-yyyy'), 98847, 34594, 63855668);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49875, to_date('29-10-2016', 'dd-mm-yyyy'), to_date('02-07-2011', 'dd-mm-yyyy'), 68267, 83753, 52349614);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53931, to_date('02-02-2014', 'dd-mm-yyyy'), to_date('07-04-2005', 'dd-mm-yyyy'), 46558, 54343, 3);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46564, to_date('08-02-2016', 'dd-mm-yyyy'), to_date('20-10-2018', 'dd-mm-yyyy'), 88458, 81766, 63832548);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97639, to_date('20-06-2008', 'dd-mm-yyyy'), to_date('24-09-2017', 'dd-mm-yyyy'), 16001, 72682, 8);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67992, to_date('25-12-2003', 'dd-mm-yyyy'), to_date('06-08-2014', 'dd-mm-yyyy'), 27522, 66121, 14813658);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76629, to_date('21-11-2008', 'dd-mm-yyyy'), to_date('15-12-2007', 'dd-mm-yyyy'), 86947, 83871, 63151798);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17455, to_date('13-02-2001', 'dd-mm-yyyy'), to_date('30-08-2010', 'dd-mm-yyyy'), 46831, 67718, 97635136);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35613, to_date('23-09-2017', 'dd-mm-yyyy'), to_date('29-10-2020', 'dd-mm-yyyy'), 14632, 37792, 43834893);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67772, to_date('11-07-2015', 'dd-mm-yyyy'), to_date('07-08-2016', 'dd-mm-yyyy'), 34658, 17339, 71686597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79366, to_date('24-06-2012', 'dd-mm-yyyy'), to_date('10-02-2011', 'dd-mm-yyyy'), 67552, 72682, 31121978);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37556, to_date('17-10-2020', 'dd-mm-yyyy'), to_date('19-07-2008', 'dd-mm-yyyy'), 64794, 37652, 73817326);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10940, to_date('19-10-2012', 'dd-mm-yyyy'), to_date('08-04-2014', 'dd-mm-yyyy'), 44617, 93474, 57322122);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10945, to_date('21-08-2002', 'dd-mm-yyyy'), to_date('21-09-2006', 'dd-mm-yyyy'), 72518, 33256, 14186931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10950, to_date('15-09-2019', 'dd-mm-yyyy'), to_date('19-09-2009', 'dd-mm-yyyy'), 56857, 79115, 58759211);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10955, to_date('07-02-2017', 'dd-mm-yyyy'), to_date('12-11-2002', 'dd-mm-yyyy'), 22006, 48137, 12);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10960, to_date('06-12-2016', 'dd-mm-yyyy'), to_date('16-11-2018', 'dd-mm-yyyy'), 24128, 84241, 12684866);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10965, to_date('06-12-2013', 'dd-mm-yyyy'), to_date('30-04-2012', 'dd-mm-yyyy'), 99624, 93474, 79853819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10970, to_date('02-02-2014', 'dd-mm-yyyy'), to_date('26-09-2010', 'dd-mm-yyyy'), 42541, 39662, 39846413);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10975, to_date('04-07-2020', 'dd-mm-yyyy'), to_date('02-06-2018', 'dd-mm-yyyy'), 34573, 96248, 31121978);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10980, to_date('20-07-2014', 'dd-mm-yyyy'), to_date('09-10-2011', 'dd-mm-yyyy'), 22224, 77992, 54539963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10985, to_date('18-02-2019', 'dd-mm-yyyy'), to_date('24-03-2008', 'dd-mm-yyyy'), 76115, 82688, 34781111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10990, to_date('24-11-2013', 'dd-mm-yyyy'), to_date('20-06-2001', 'dd-mm-yyyy'), 75939, 99923, 67263928);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10995, to_date('15-01-2002', 'dd-mm-yyyy'), to_date('27-05-2008', 'dd-mm-yyyy'), 51268, 54343, 58987191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21424, to_date('16-12-2016', 'dd-mm-yyyy'), to_date('23-03-2014', 'dd-mm-yyyy'), 92662, 23798, 43834893);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46713, to_date('17-04-2004', 'dd-mm-yyyy'), to_date('15-06-2016', 'dd-mm-yyyy'), 54143, 96931, 69181511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49247, to_date('21-10-2013', 'dd-mm-yyyy'), to_date('06-11-2006', 'dd-mm-yyyy'), 22348, 47969, 84312545);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16577, to_date('21-06-2007', 'dd-mm-yyyy'), to_date('27-01-2004', 'dd-mm-yyyy'), 13489, 43839, 91944651);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43754, to_date('09-10-2011', 'dd-mm-yyyy'), to_date('25-03-2016', 'dd-mm-yyyy'), 71347, 82688, 47127676);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79227, to_date('10-10-2001', 'dd-mm-yyyy'), to_date('10-02-2019', 'dd-mm-yyyy'), 74449, 7, 115);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52425, to_date('29-04-2019', 'dd-mm-yyyy'), to_date('28-02-2013', 'dd-mm-yyyy'), 34491, 47969, 94558835);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99466, to_date('31-12-2015', 'dd-mm-yyyy'), to_date('09-03-2004', 'dd-mm-yyyy'), 72531, 66693, 67263928);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (54946, to_date('20-06-2017', 'dd-mm-yyyy'), to_date('21-12-2010', 'dd-mm-yyyy'), 64549, 37652, 87145958);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38234, to_date('23-11-2011', 'dd-mm-yyyy'), to_date('26-07-2008', 'dd-mm-yyyy'), 72127, 51926, 21383172);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96725, to_date('04-11-2008', 'dd-mm-yyyy'), to_date('25-01-2000', 'dd-mm-yyyy'), 76245, 99835, 91466594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62922, to_date('13-06-2018', 'dd-mm-yyyy'), to_date('05-10-2012', 'dd-mm-yyyy'), 69923, 37792, 77157355);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (75839, to_date('18-07-2015', 'dd-mm-yyyy'), to_date('24-10-2003', 'dd-mm-yyyy'), 34141, 31194, 95554736);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (64578, to_date('26-02-2011', 'dd-mm-yyyy'), to_date('05-07-2011', 'dd-mm-yyyy'), 15723, 34594, 29441693);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76958, to_date('24-02-2008', 'dd-mm-yyyy'), to_date('18-10-2000', 'dd-mm-yyyy'), 74936, 96931, 77651851);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63541, to_date('22-02-2015', 'dd-mm-yyyy'), to_date('26-09-2018', 'dd-mm-yyyy'), 39749, 25287, 11495212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14553, to_date('19-12-2005', 'dd-mm-yyyy'), to_date('25-10-2009', 'dd-mm-yyyy'), 85726, 74937, 115);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97736, to_date('23-01-2013', 'dd-mm-yyyy'), to_date('18-06-2020', 'dd-mm-yyyy'), 29447, 97911, 27419676);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98464, to_date('14-06-2005', 'dd-mm-yyyy'), to_date('17-01-2009', 'dd-mm-yyyy'), 31134, 98482, 72528849);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (73849, to_date('31-12-2020', 'dd-mm-yyyy'), to_date('25-10-2011', 'dd-mm-yyyy'), 8273, 95296, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63224, to_date('17-04-2008', 'dd-mm-yyyy'), to_date('18-04-2017', 'dd-mm-yyyy'), 58713, 23484, 78538649);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17183, to_date('21-11-2007', 'dd-mm-yyyy'), to_date('19-07-2007', 'dd-mm-yyyy'), 52419, 83126, 51759376);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46346, to_date('30-08-2005', 'dd-mm-yyyy'), to_date('19-04-2019', 'dd-mm-yyyy'), 79656, 98482, 17);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74569, to_date('07-03-2011', 'dd-mm-yyyy'), to_date('06-10-2004', 'dd-mm-yyyy'), 42215, 79784, 87145958);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99518, to_date('03-08-2011', 'dd-mm-yyyy'), to_date('27-05-2010', 'dd-mm-yyyy'), 81456, 25287, 46879551);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48783, to_date('16-09-2008', 'dd-mm-yyyy'), to_date('11-10-2007', 'dd-mm-yyyy'), 88781, 23932, 72118325);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91289, to_date('18-06-2012', 'dd-mm-yyyy'), to_date('10-03-2000', 'dd-mm-yyyy'), 16648, 23932, 67431562);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76231, to_date('20-01-2015', 'dd-mm-yyyy'), to_date('22-03-2020', 'dd-mm-yyyy'), 23923, 84241, 21326952);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88627, to_date('24-02-2020', 'dd-mm-yyyy'), to_date('18-10-2008', 'dd-mm-yyyy'), 86986, 86171, 99181387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29732, to_date('18-10-2014', 'dd-mm-yyyy'), to_date('04-12-2019', 'dd-mm-yyyy'), 77995, 37792, 87145958);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28113, to_date('10-03-2001', 'dd-mm-yyyy'), to_date('29-12-2010', 'dd-mm-yyyy'), 72924, 79115, 42714677);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66974, to_date('29-06-2001', 'dd-mm-yyyy'), to_date('08-02-2000', 'dd-mm-yyyy'), 86994, 44478, 51645252);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91352, to_date('23-01-2006', 'dd-mm-yyyy'), to_date('15-05-2019', 'dd-mm-yyyy'), 33204, 12389, 4);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16554, to_date('19-04-2018', 'dd-mm-yyyy'), to_date('12-12-2018', 'dd-mm-yyyy'), 59148, 42865, 3);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14715, to_date('17-07-2008', 'dd-mm-yyyy'), to_date('29-01-2020', 'dd-mm-yyyy'), 89353, 86171, 35179913);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84458, to_date('15-06-2017', 'dd-mm-yyyy'), to_date('28-07-2015', 'dd-mm-yyyy'), 48522, 57325, 71944274);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25956, to_date('21-07-2020', 'dd-mm-yyyy'), to_date('08-01-2005', 'dd-mm-yyyy'), 37355, 58234, 61167848);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98688, to_date('23-03-2012', 'dd-mm-yyyy'), to_date('25-12-2016', 'dd-mm-yyyy'), 37355, 78735, 49248963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51839, to_date('05-02-2003', 'dd-mm-yyyy'), to_date('30-06-2013', 'dd-mm-yyyy'), 47341, 84117, 43834893);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43857, to_date('15-11-2012', 'dd-mm-yyyy'), to_date('12-07-2000', 'dd-mm-yyyy'), 97594, 23798, 84655373);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68448, to_date('27-02-2002', 'dd-mm-yyyy'), to_date('15-07-2017', 'dd-mm-yyyy'), 88792, 84117, 34129523);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53491, to_date('14-10-2020', 'dd-mm-yyyy'), to_date('23-11-2004', 'dd-mm-yyyy'), 92459, 76821, 84655373);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44877, to_date('20-08-2019', 'dd-mm-yyyy'), to_date('17-08-2015', 'dd-mm-yyyy'), 54459, 78735, 99513467);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84588, to_date('26-11-2002', 'dd-mm-yyyy'), to_date('25-09-2016', 'dd-mm-yyyy'), 87861, 55331, 67189854);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84653, to_date('15-09-2016', 'dd-mm-yyyy'), to_date('16-06-2011', 'dd-mm-yyyy'), 94974, 99835, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69135, to_date('26-12-2004', 'dd-mm-yyyy'), to_date('25-05-2005', 'dd-mm-yyyy'), 59554, 65682, 41857774);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76226, to_date('04-04-2011', 'dd-mm-yyyy'), to_date('05-11-2000', 'dd-mm-yyyy'), 74792, 26944, 47643779);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15783, to_date('04-06-2000', 'dd-mm-yyyy'), to_date('04-06-2000', 'dd-mm-yyyy'), 49213, 52399, 84699689);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77952, to_date('11-02-2005', 'dd-mm-yyyy'), to_date('03-02-2011', 'dd-mm-yyyy'), 45684, 25287, 61959199);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11258, to_date('29-07-2000', 'dd-mm-yyyy'), to_date('19-09-2006', 'dd-mm-yyyy'), 16966, 77497, 83347685);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56397, to_date('17-05-2007', 'dd-mm-yyyy'), to_date('22-04-2011', 'dd-mm-yyyy'), 25969, 79115, 72118325);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98129, to_date('24-11-2012', 'dd-mm-yyyy'), to_date('19-07-2019', 'dd-mm-yyyy'), 20488, 96931, 91944651);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76536, to_date('31-12-2004', 'dd-mm-yyyy'), to_date('14-07-2000', 'dd-mm-yyyy'), 92583, 84117, 22788535);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33165, to_date('19-04-2005', 'dd-mm-yyyy'), to_date('09-11-2007', 'dd-mm-yyyy'), 75643, 49732, 15975426);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (75255, to_date('13-06-2010', 'dd-mm-yyyy'), to_date('23-09-2018', 'dd-mm-yyyy'), 54665, 17339, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14524, to_date('08-07-2019', 'dd-mm-yyyy'), to_date('02-07-2012', 'dd-mm-yyyy'), 47341, 66693, 36698269);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43226, to_date('01-02-2006', 'dd-mm-yyyy'), to_date('12-10-2019', 'dd-mm-yyyy'), 75423, 99835, 15924254);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55475, to_date('10-06-2014', 'dd-mm-yyyy'), to_date('15-05-2007', 'dd-mm-yyyy'), 47283, 74937, 48122127);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14927, to_date('25-07-2009', 'dd-mm-yyyy'), to_date('22-04-2013', 'dd-mm-yyyy'), 96442, 19291, 68814298);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62165, to_date('31-08-2012', 'dd-mm-yyyy'), to_date('04-07-2016', 'dd-mm-yyyy'), 13907, 98482, 56689312);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18486, to_date('15-06-2006', 'dd-mm-yyyy'), to_date('08-11-2004', 'dd-mm-yyyy'), 73724, 23798, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29213, to_date('19-09-2015', 'dd-mm-yyyy'), to_date('02-10-2019', 'dd-mm-yyyy'), 67113, 51926, 73928971);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17462, to_date('29-10-2005', 'dd-mm-yyyy'), to_date('22-08-2004', 'dd-mm-yyyy'), 83761, 93474, 67431562);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76864, to_date('19-09-2019', 'dd-mm-yyyy'), to_date('20-06-2003', 'dd-mm-yyyy'), 15656, 97261, 34338321);
commit;
prompt 600 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22952, to_date('28-07-2017', 'dd-mm-yyyy'), to_date('31-01-2002', 'dd-mm-yyyy'), 32271, 23933, 33512225);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44931, to_date('13-06-2006', 'dd-mm-yyyy'), to_date('08-05-2014', 'dd-mm-yyyy'), 3759, 23933, 34766568);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96916, to_date('28-07-2007', 'dd-mm-yyyy'), to_date('28-09-2018', 'dd-mm-yyyy'), 62444, 31194, 99513467);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15826, to_date('06-02-2000', 'dd-mm-yyyy'), to_date('15-06-2016', 'dd-mm-yyyy'), 36674, 31194, 81269834);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82369, to_date('27-02-2018', 'dd-mm-yyyy'), to_date('05-05-2000', 'dd-mm-yyyy'), 42541, 72682, 43149369);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95669, to_date('28-01-2012', 'dd-mm-yyyy'), to_date('13-11-2007', 'dd-mm-yyyy'), 26926, 74937, 5);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11473, to_date('10-05-2016', 'dd-mm-yyyy'), to_date('05-02-2007', 'dd-mm-yyyy'), 33624, 32932, 34766568);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95144, to_date('24-09-2016', 'dd-mm-yyyy'), to_date('19-09-2018', 'dd-mm-yyyy'), 39513, 72682, 21326952);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17133, to_date('09-11-2003', 'dd-mm-yyyy'), to_date('06-06-2011', 'dd-mm-yyyy'), 88157, 69417, 61962852);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82324, to_date('07-12-2000', 'dd-mm-yyyy'), to_date('27-05-2016', 'dd-mm-yyyy'), 61613, 37792, 35179913);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62211, to_date('19-10-2003', 'dd-mm-yyyy'), to_date('25-10-2003', 'dd-mm-yyyy'), 89107, 69376, 43149369);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45818, to_date('15-09-2009', 'dd-mm-yyyy'), to_date('06-04-2001', 'dd-mm-yyyy'), 27353, 31194, 58819249);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23865, to_date('15-09-2006', 'dd-mm-yyyy'), to_date('15-06-2020', 'dd-mm-yyyy'), 59554, 57325, 69828852);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53595, to_date('04-06-2010', 'dd-mm-yyyy'), to_date('26-01-2014', 'dd-mm-yyyy'), 33624, 59143, 57143634);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27969, to_date('21-03-2005', 'dd-mm-yyyy'), to_date('21-10-2005', 'dd-mm-yyyy'), 95075, 84117, 14973237);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92435, to_date('06-05-2012', 'dd-mm-yyyy'), to_date('08-01-2013', 'dd-mm-yyyy'), 58699, 99923, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62664, to_date('13-06-2000', 'dd-mm-yyyy'), to_date('05-05-2016', 'dd-mm-yyyy'), 43464, 37416, 47659666);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61918, to_date('28-05-2001', 'dd-mm-yyyy'), to_date('09-03-2003', 'dd-mm-yyyy'), 97775, 49732, 87811817);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18491, to_date('03-02-2015', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 92355, 93474, 83347685);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43184, to_date('13-07-2011', 'dd-mm-yyyy'), to_date('12-07-2008', 'dd-mm-yyyy'), 37548, 83871, 34781111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68932, to_date('20-08-2006', 'dd-mm-yyyy'), to_date('08-05-2018', 'dd-mm-yyyy'), 86989, 37416, 58942594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16987, to_date('21-12-2007', 'dd-mm-yyyy'), to_date('28-12-2006', 'dd-mm-yyyy'), 26387, 32932, 111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62199, to_date('18-04-2020', 'dd-mm-yyyy'), to_date('07-11-2004', 'dd-mm-yyyy'), 84141, 42865, 37644767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77983, to_date('11-05-2019', 'dd-mm-yyyy'), to_date('22-03-2017', 'dd-mm-yyyy'), 22006, 82688, 43373513);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22845, to_date('12-07-2002', 'dd-mm-yyyy'), to_date('02-09-2014', 'dd-mm-yyyy'), 52326, 97261, 49968778);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62273, to_date('30-06-2015', 'dd-mm-yyyy'), to_date('20-12-2005', 'dd-mm-yyyy'), 13548, 43839, 19977314);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71497, to_date('16-03-2003', 'dd-mm-yyyy'), to_date('16-05-2020', 'dd-mm-yyyy'), 14911, 67718, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (54471, to_date('07-02-2020', 'dd-mm-yyyy'), to_date('01-04-2004', 'dd-mm-yyyy'), 22224, 68695, 34766568);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95815, to_date('09-11-2008', 'dd-mm-yyyy'), to_date('04-02-2002', 'dd-mm-yyyy'), 96588, 98974, 13);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94892, to_date('03-01-2008', 'dd-mm-yyyy'), to_date('17-09-2006', 'dd-mm-yyyy'), 67953, 44258, 58942594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68896, to_date('27-07-2019', 'dd-mm-yyyy'), to_date('27-11-2020', 'dd-mm-yyyy'), 89246, 55331, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48185, to_date('04-07-2002', 'dd-mm-yyyy'), to_date('25-11-2010', 'dd-mm-yyyy'), 45413, 82688, 21745437);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98755, to_date('10-05-2000', 'dd-mm-yyyy'), to_date('28-09-2000', 'dd-mm-yyyy'), 11593, 22414, 57143634);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39241, to_date('21-11-2016', 'dd-mm-yyyy'), to_date('30-04-2012', 'dd-mm-yyyy'), 23315, 87325, 11);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41583, to_date('21-03-2015', 'dd-mm-yyyy'), to_date('23-06-2003', 'dd-mm-yyyy'), 44434, 34594, 71546176);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (64987, to_date('14-05-2014', 'dd-mm-yyyy'), to_date('10-07-2007', 'dd-mm-yyyy'), 86947, 49732, 92681188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23938, to_date('10-02-2017', 'dd-mm-yyyy'), to_date('04-11-2001', 'dd-mm-yyyy'), 75874, 82688, 66169498);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (54542, to_date('10-11-2002', 'dd-mm-yyyy'), to_date('16-06-2020', 'dd-mm-yyyy'), 27947, 11784, 57471452);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25198, to_date('29-07-2011', 'dd-mm-yyyy'), to_date('20-05-2008', 'dd-mm-yyyy'), 31286, 84117, 52682627);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51968, to_date('06-06-2008', 'dd-mm-yyyy'), to_date('29-01-2005', 'dd-mm-yyyy'), 11878, 31194, 17937991);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74714, to_date('29-09-2014', 'dd-mm-yyyy'), to_date('31-07-2016', 'dd-mm-yyyy'), 35715, 32422, 39846413);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59686, to_date('14-04-2012', 'dd-mm-yyyy'), to_date('24-10-2006', 'dd-mm-yyyy'), 12599, 23798, 58819249);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95925, to_date('24-12-2008', 'dd-mm-yyyy'), to_date('02-11-2013', 'dd-mm-yyyy'), 68484, 36148, 86795563);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77829, to_date('16-08-2004', 'dd-mm-yyyy'), to_date('21-03-2005', 'dd-mm-yyyy'), 94452, 82338, 81225789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45266, to_date('20-05-2020', 'dd-mm-yyyy'), to_date('08-01-2016', 'dd-mm-yyyy'), 62379, 23933, 19977314);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23381, to_date('25-10-2019', 'dd-mm-yyyy'), to_date('15-04-2020', 'dd-mm-yyyy'), 16648, 69417, 15129862);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13857, to_date('03-11-2006', 'dd-mm-yyyy'), to_date('27-08-2015', 'dd-mm-yyyy'), 43366, 82839, 69181511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81432, to_date('01-08-2001', 'dd-mm-yyyy'), to_date('02-12-2019', 'dd-mm-yyyy'), 94452, 25287, 47529738);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95715, to_date('21-06-2006', 'dd-mm-yyyy'), to_date('24-01-2014', 'dd-mm-yyyy'), 13985, 42414, 112);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25821, to_date('21-04-2003', 'dd-mm-yyyy'), to_date('26-08-2011', 'dd-mm-yyyy'), 35772, 36383, 3);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61544, to_date('24-07-2014', 'dd-mm-yyyy'), to_date('31-12-2018', 'dd-mm-yyyy'), 67278, 84117, 92986276);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61465, to_date('26-06-2015', 'dd-mm-yyyy'), to_date('10-09-2013', 'dd-mm-yyyy'), 87578, 23933, 91824968);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82293, to_date('10-05-2007', 'dd-mm-yyyy'), to_date('05-07-2020', 'dd-mm-yyyy'), 52269, 82688, 16);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68975, to_date('25-01-2020', 'dd-mm-yyyy'), to_date('08-10-2004', 'dd-mm-yyyy'), 79594, 8, 26512429);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62788, to_date('27-04-2011', 'dd-mm-yyyy'), to_date('20-03-2005', 'dd-mm-yyyy'), 42575, 66693, 25155176);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59346, to_date('12-03-2015', 'dd-mm-yyyy'), to_date('18-05-2020', 'dd-mm-yyyy'), 92355, 12389, 69923664);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (64667, to_date('21-09-2016', 'dd-mm-yyyy'), to_date('18-02-2011', 'dd-mm-yyyy'), 81281, 22414, 8);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63885, to_date('10-06-2011', 'dd-mm-yyyy'), to_date('06-06-2001', 'dd-mm-yyyy'), 32844, 67788, 16);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84447, to_date('27-08-2001', 'dd-mm-yyyy'), to_date('18-09-2020', 'dd-mm-yyyy'), 32124, 87325, 71944274);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96491, to_date('05-10-2005', 'dd-mm-yyyy'), to_date('12-06-2014', 'dd-mm-yyyy'), 87916, 74937, 87556685);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72913, to_date('31-10-2001', 'dd-mm-yyyy'), to_date('08-11-2019', 'dd-mm-yyyy'), 26817, 44478, 49248963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91729, to_date('25-08-2007', 'dd-mm-yyyy'), to_date('07-09-2018', 'dd-mm-yyyy'), 83966, 19848, 78341231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18523, to_date('31-10-2019', 'dd-mm-yyyy'), to_date('23-11-2009', 'dd-mm-yyyy'), 112, 22414, 19977314);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61217, to_date('05-03-2008', 'dd-mm-yyyy'), to_date('03-12-2019', 'dd-mm-yyyy'), 31719, 98482, 39846331);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26482, to_date('19-07-2013', 'dd-mm-yyyy'), to_date('19-12-2016', 'dd-mm-yyyy'), 97299, 88239, 51645252);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13825, to_date('31-12-2018', 'dd-mm-yyyy'), to_date('15-10-2006', 'dd-mm-yyyy'), 61694, 25287, 99181387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13719, to_date('22-01-2020', 'dd-mm-yyyy'), to_date('02-03-2001', 'dd-mm-yyyy'), 72159, 99835, 54442487);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79991, to_date('18-06-2019', 'dd-mm-yyyy'), to_date('29-10-2015', 'dd-mm-yyyy'), 58725, 44478, 14438592);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22328, to_date('14-03-2014', 'dd-mm-yyyy'), to_date('03-06-2014', 'dd-mm-yyyy'), 65534, 78735, 64583677);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46456, to_date('15-05-2012', 'dd-mm-yyyy'), to_date('10-09-2004', 'dd-mm-yyyy'), 48828, 32374, 12874949);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82429, to_date('29-06-2009', 'dd-mm-yyyy'), to_date('08-01-2016', 'dd-mm-yyyy'), 11878, 98599, 111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56825, to_date('03-02-2016', 'dd-mm-yyyy'), to_date('16-03-2016', 'dd-mm-yyyy'), 54780, 26944, 58759211);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58245, to_date('06-04-2011', 'dd-mm-yyyy'), to_date('06-03-2020', 'dd-mm-yyyy'), 15322, 44258, 26782667);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93942, to_date('12-01-2015', 'dd-mm-yyyy'), to_date('04-02-2008', 'dd-mm-yyyy'), 93349, 32422, 95994968);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89724, to_date('28-01-2004', 'dd-mm-yyyy'), to_date('21-02-2016', 'dd-mm-yyyy'), 77897, 55331, 61959199);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14654, to_date('08-09-2000', 'dd-mm-yyyy'), to_date('17-09-2009', 'dd-mm-yyyy'), 60246, 72682, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43272, to_date('31-10-2013', 'dd-mm-yyyy'), to_date('13-08-2009', 'dd-mm-yyyy'), 76356, 67788, 85636881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97239, to_date('05-10-2009', 'dd-mm-yyyy'), to_date('18-01-2012', 'dd-mm-yyyy'), 24506, 67788, 65394313);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21412, to_date('28-02-2017', 'dd-mm-yyyy'), to_date('15-08-2014', 'dd-mm-yyyy'), 34491, 37652, 38469744);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35592, to_date('27-01-2008', 'dd-mm-yyyy'), to_date('04-10-2010', 'dd-mm-yyyy'), 22006, 77497, 67419271);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76443, to_date('02-12-2000', 'dd-mm-yyyy'), to_date('02-01-2019', 'dd-mm-yyyy'), 93681, 86171, 33456381);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (75293, to_date('12-04-2020', 'dd-mm-yyyy'), to_date('22-02-2018', 'dd-mm-yyyy'), 74449, 67788, 111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52197, to_date('23-12-2017', 'dd-mm-yyyy'), to_date('16-03-2015', 'dd-mm-yyyy'), 94964, 23933, 27638892);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44925, to_date('03-08-2007', 'dd-mm-yyyy'), to_date('18-03-2012', 'dd-mm-yyyy'), 42281, 83126, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19229, to_date('25-07-2006', 'dd-mm-yyyy'), to_date('16-01-2004', 'dd-mm-yyyy'), 98643, 78735, 88875579);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55576, to_date('31-12-2008', 'dd-mm-yyyy'), to_date('04-04-2006', 'dd-mm-yyyy'), 73561, 82688, 68367174);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52913, to_date('16-11-2006', 'dd-mm-yyyy'), to_date('10-08-2010', 'dd-mm-yyyy'), 91369, 83753, 11);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48373, to_date('07-10-2016', 'dd-mm-yyyy'), to_date('04-09-2007', 'dd-mm-yyyy'), 34792, 48137, 32681299);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58481, to_date('26-09-2006', 'dd-mm-yyyy'), to_date('22-06-2009', 'dd-mm-yyyy'), 83193, 97911, 63855668);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66143, to_date('04-02-2007', 'dd-mm-yyyy'), to_date('04-11-2017', 'dd-mm-yyyy'), 79566, 22414, 58942594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (64975, to_date('05-06-2018', 'dd-mm-yyyy'), to_date('26-11-2018', 'dd-mm-yyyy'), 62657, 37652, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44975, to_date('17-04-2006', 'dd-mm-yyyy'), to_date('29-04-2020', 'dd-mm-yyyy'), 84601, 37792, 8);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81928, to_date('03-02-2007', 'dd-mm-yyyy'), to_date('19-09-2019', 'dd-mm-yyyy'), 36159, 67718, 84312545);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11226, to_date('11-11-2014', 'dd-mm-yyyy'), to_date('17-10-2014', 'dd-mm-yyyy'), 48952, 9, 17937991);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94638, to_date('14-04-2010', 'dd-mm-yyyy'), to_date('17-12-2010', 'dd-mm-yyyy'), 58749, 69417, 57471452);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78746, to_date('10-04-2016', 'dd-mm-yyyy'), to_date('19-04-2012', 'dd-mm-yyyy'), 34367, 82839, 36291759);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10000, to_date('13-09-2005', 'dd-mm-yyyy'), to_date('25-05-2006', 'dd-mm-yyyy'), 61113, 65567, 95994968);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10005, to_date('02-06-2018', 'dd-mm-yyyy'), to_date('15-10-2000', 'dd-mm-yyyy'), 96311, 31194, 93667714);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10010, to_date('13-06-2013', 'dd-mm-yyyy'), to_date('16-06-2015', 'dd-mm-yyyy'), 64445, 42865, 28847179);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10015, to_date('10-12-2010', 'dd-mm-yyyy'), to_date('23-01-2005', 'dd-mm-yyyy'), 73977, 49347, 61495641);
commit;
prompt 700 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10020, to_date('15-01-2008', 'dd-mm-yyyy'), to_date('10-11-2002', 'dd-mm-yyyy'), 11593, 82839, 58747241);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10025, to_date('03-03-2011', 'dd-mm-yyyy'), to_date('04-08-2016', 'dd-mm-yyyy'), 33362, 23933, 56777364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10030, to_date('28-01-2007', 'dd-mm-yyyy'), to_date('25-09-2003', 'dd-mm-yyyy'), 48731, 66693, 51575582);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10035, to_date('23-07-2020', 'dd-mm-yyyy'), to_date('10-04-2005', 'dd-mm-yyyy'), 62816, 98482, 69181511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10040, to_date('25-12-2000', 'dd-mm-yyyy'), to_date('11-01-2009', 'dd-mm-yyyy'), 91925, 97261, 61523464);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10045, to_date('14-02-2001', 'dd-mm-yyyy'), to_date('04-12-2016', 'dd-mm-yyyy'), 17138, 83753, 113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10050, to_date('02-02-2007', 'dd-mm-yyyy'), to_date('23-01-2005', 'dd-mm-yyyy'), 55447, 99923, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10055, to_date('12-04-2009', 'dd-mm-yyyy'), to_date('28-12-2020', 'dd-mm-yyyy'), 69332, 96931, 57471452);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10060, to_date('22-08-2018', 'dd-mm-yyyy'), to_date('24-01-2006', 'dd-mm-yyyy'), 57161, 6, 27638892);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (10065, to_date('20-09-2005', 'dd-mm-yyyy'), to_date('05-01-2017', 'dd-mm-yyyy'), 74413, 29621, 87556685);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (211, to_date('08-07-2020', 'dd-mm-yyyy'), to_date('09-08-2020', 'dd-mm-yyyy'), 113, 6, 115);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (212, to_date('02-01-2021', 'dd-mm-yyyy'), to_date('02-10-2021', 'dd-mm-yyyy'), 112, 9, 113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (314, to_date('09-10-2020', 'dd-mm-yyyy'), to_date('10-01-2020', 'dd-mm-yyyy'), 111, 6, 112);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88284, to_date('13-05-2017', 'dd-mm-yyyy'), to_date('01-06-2019', 'dd-mm-yyyy'), 85337, 34594, 86795563);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46177, to_date('09-05-2002', 'dd-mm-yyyy'), to_date('11-08-2007', 'dd-mm-yyyy'), 84148, 99923, 51969257);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27373, to_date('28-11-2007', 'dd-mm-yyyy'), to_date('04-03-2008', 'dd-mm-yyyy'), 40163, 23484, 45646399);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72473, to_date('11-04-2003', 'dd-mm-yyyy'), to_date('20-08-2010', 'dd-mm-yyyy'), 27522, 34594, 67263928);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13983, to_date('11-10-2004', 'dd-mm-yyyy'), to_date('09-01-2018', 'dd-mm-yyyy'), 80642, 23484, 18);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85714, to_date('06-08-2006', 'dd-mm-yyyy'), to_date('09-04-2009', 'dd-mm-yyyy'), 62826, 69376, 33512225);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13217, to_date('30-04-2009', 'dd-mm-yyyy'), to_date('01-08-2007', 'dd-mm-yyyy'), 78461, 23932, 1);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65399, to_date('09-01-2015', 'dd-mm-yyyy'), to_date('23-08-2019', 'dd-mm-yyyy'), 25332, 71864, 77651851);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67531, to_date('07-12-2007', 'dd-mm-yyyy'), to_date('16-09-2012', 'dd-mm-yyyy'), 37672, 82338, 54442487);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23965, to_date('04-02-2010', 'dd-mm-yyyy'), to_date('25-01-2013', 'dd-mm-yyyy'), 11985, 88239, 63315843);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67593, to_date('01-09-2010', 'dd-mm-yyyy'), to_date('15-07-2000', 'dd-mm-yyyy'), 94254, 23932, 63832548);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76914, to_date('07-10-2013', 'dd-mm-yyyy'), to_date('19-08-2009', 'dd-mm-yyyy'), 81546, 77497, 19971565);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88988, to_date('05-11-2012', 'dd-mm-yyyy'), to_date('06-09-2018', 'dd-mm-yyyy'), 52216, 32422, 37874639);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69793, to_date('25-03-2019', 'dd-mm-yyyy'), to_date('05-04-2007', 'dd-mm-yyyy'), 59244, 95296, 98347945);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32897, to_date('05-04-2020', 'dd-mm-yyyy'), to_date('16-06-2004', 'dd-mm-yyyy'), 26926, 39662, 21146846);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69782, to_date('04-01-2020', 'dd-mm-yyyy'), to_date('21-08-2003', 'dd-mm-yyyy'), 76234, 49732, 65918254);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15662, to_date('09-04-2002', 'dd-mm-yyyy'), to_date('15-05-2001', 'dd-mm-yyyy'), 49781, 91753, 23965441);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (75355, to_date('12-10-2001', 'dd-mm-yyyy'), to_date('02-11-2008', 'dd-mm-yyyy'), 17972, 77497, 85915935);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81553, to_date('21-06-2012', 'dd-mm-yyyy'), to_date('21-09-2000', 'dd-mm-yyyy'), 99516, 23484, 87556685);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62989, to_date('15-12-2015', 'dd-mm-yyyy'), to_date('27-07-2007', 'dd-mm-yyyy'), 88817, 37416, 71513138);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61895, to_date('29-03-2012', 'dd-mm-yyyy'), to_date('06-06-2000', 'dd-mm-yyyy'), 62248, 67718, 22112742);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47311, to_date('28-10-2007', 'dd-mm-yyyy'), to_date('01-05-2002', 'dd-mm-yyyy'), 22239, 72682, 67189854);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87452, to_date('06-03-2008', 'dd-mm-yyyy'), to_date('25-10-2018', 'dd-mm-yyyy'), 83386, 49757, 98457755);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16217, to_date('01-10-2000', 'dd-mm-yyyy'), to_date('17-07-2019', 'dd-mm-yyyy'), 48714, 32374, 21377498);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27713, to_date('08-10-2000', 'dd-mm-yyyy'), to_date('20-09-2004', 'dd-mm-yyyy'), 58496, 49347, 6);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22843, to_date('02-04-2000', 'dd-mm-yyyy'), to_date('07-02-2017', 'dd-mm-yyyy'), 85589, 42414, 39846331);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49467, to_date('01-09-2019', 'dd-mm-yyyy'), to_date('24-06-2012', 'dd-mm-yyyy'), 14457, 88239, 56927789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87151, to_date('10-11-2000', 'dd-mm-yyyy'), to_date('26-12-2011', 'dd-mm-yyyy'), 77312, 87483, 63855668);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83437, to_date('06-01-2001', 'dd-mm-yyyy'), to_date('24-05-2007', 'dd-mm-yyyy'), 63362, 26284, 28847179);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38836, to_date('27-12-2000', 'dd-mm-yyyy'), to_date('04-09-2016', 'dd-mm-yyyy'), 75873, 65682, 59626673);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97953, to_date('06-10-2002', 'dd-mm-yyyy'), to_date('09-10-2016', 'dd-mm-yyyy'), 95963, 48819, 73143256);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11574, to_date('10-03-2020', 'dd-mm-yyyy'), to_date('05-09-2008', 'dd-mm-yyyy'), 59481, 65567, 25595898);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55464, to_date('07-11-2019', 'dd-mm-yyyy'), to_date('28-09-2002', 'dd-mm-yyyy'), 85391, 77992, 29415222);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77996, to_date('25-06-2013', 'dd-mm-yyyy'), to_date('28-04-2015', 'dd-mm-yyyy'), 55691, 26944, 88875579);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94281, to_date('13-09-2010', 'dd-mm-yyyy'), to_date('19-04-2014', 'dd-mm-yyyy'), 87188, 33256, 85636881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39984, to_date('30-08-2002', 'dd-mm-yyyy'), to_date('15-07-2002', 'dd-mm-yyyy'), 24497, 65567, 67419271);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17911, to_date('28-06-2016', 'dd-mm-yyyy'), to_date('10-05-2005', 'dd-mm-yyyy'), 79975, 63711, 52682627);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29984, to_date('22-10-2014', 'dd-mm-yyyy'), to_date('30-06-2017', 'dd-mm-yyyy'), 59554, 12389, 1);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (73739, to_date('07-01-2008', 'dd-mm-yyyy'), to_date('10-10-2012', 'dd-mm-yyyy'), 72159, 22414, 77157355);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59211, to_date('30-04-2011', 'dd-mm-yyyy'), to_date('22-02-2011', 'dd-mm-yyyy'), 96588, 22231, 64525236);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61932, to_date('14-03-2003', 'dd-mm-yyyy'), to_date('01-08-2007', 'dd-mm-yyyy'), 25969, 49347, 33384713);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98565, to_date('25-04-2017', 'dd-mm-yyyy'), to_date('22-01-2011', 'dd-mm-yyyy'), 46793, 82839, 59238419);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25966, to_date('15-07-2016', 'dd-mm-yyyy'), to_date('27-11-2018', 'dd-mm-yyyy'), 67117, 23798, 57143634);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92231, to_date('15-01-2015', 'dd-mm-yyyy'), to_date('07-03-2018', 'dd-mm-yyyy'), 26824, 78735, 47659666);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16846, to_date('12-01-2016', 'dd-mm-yyyy'), to_date('23-04-2001', 'dd-mm-yyyy'), 33249, 24794, 31953698);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91777, to_date('29-10-2010', 'dd-mm-yyyy'), to_date('02-05-2014', 'dd-mm-yyyy'), 92459, 98482, 33384713);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79341, to_date('28-05-2005', 'dd-mm-yyyy'), to_date('27-07-2013', 'dd-mm-yyyy'), 38868, 39662, 65394313);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33639, to_date('10-09-2017', 'dd-mm-yyyy'), to_date('08-08-2010', 'dd-mm-yyyy'), 14861, 49347, 61167848);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23621, to_date('27-08-2018', 'dd-mm-yyyy'), to_date('22-01-2001', 'dd-mm-yyyy'), 22239, 23932, 15);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77592, to_date('03-06-2016', 'dd-mm-yyyy'), to_date('12-12-2008', 'dd-mm-yyyy'), 27661, 17339, 2);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41941, to_date('11-03-2008', 'dd-mm-yyyy'), to_date('23-04-2012', 'dd-mm-yyyy'), 27623, 66693, 22112742);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31725, to_date('11-01-2005', 'dd-mm-yyyy'), to_date('31-08-2006', 'dd-mm-yyyy'), 26052, 22414, 67419271);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34798, to_date('24-03-2012', 'dd-mm-yyyy'), to_date('21-05-2005', 'dd-mm-yyyy'), 82357, 44258, 47135816);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26868, to_date('03-10-2020', 'dd-mm-yyyy'), to_date('10-07-2010', 'dd-mm-yyyy'), 67278, 78735, 71944274);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71893, to_date('17-01-2005', 'dd-mm-yyyy'), to_date('25-02-2001', 'dd-mm-yyyy'), 33219, 37792, 61959199);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49881, to_date('04-01-2003', 'dd-mm-yyyy'), to_date('30-09-2011', 'dd-mm-yyyy'), 34284, 11784, 31121978);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93191, to_date('11-05-2015', 'dd-mm-yyyy'), to_date('07-08-2001', 'dd-mm-yyyy'), 14318, 9, 44821479);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42921, to_date('20-12-2000', 'dd-mm-yyyy'), to_date('19-02-2004', 'dd-mm-yyyy'), 36866, 81766, 33496191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69361, to_date('05-12-2010', 'dd-mm-yyyy'), to_date('25-09-2020', 'dd-mm-yyyy'), 99743, 59143, 71513138);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51323, to_date('22-09-2016', 'dd-mm-yyyy'), to_date('25-12-2006', 'dd-mm-yyyy'), 29911, 23932, 33456381);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55467, to_date('01-02-2019', 'dd-mm-yyyy'), to_date('16-10-2013', 'dd-mm-yyyy'), 99424, 83871, 112);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63697, to_date('23-02-2019', 'dd-mm-yyyy'), to_date('16-08-2017', 'dd-mm-yyyy'), 61113, 65682, 69181511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19335, to_date('20-11-2012', 'dd-mm-yyyy'), to_date('18-09-2020', 'dd-mm-yyyy'), 88817, 67718, 97359492);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51355, to_date('26-11-2017', 'dd-mm-yyyy'), to_date('23-09-2012', 'dd-mm-yyyy'), 48875, 79912, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53234, to_date('21-12-2000', 'dd-mm-yyyy'), to_date('03-03-2005', 'dd-mm-yyyy'), 84518, 55519, 47127676);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78556, to_date('27-04-2008', 'dd-mm-yyyy'), to_date('13-09-2017', 'dd-mm-yyyy'), 34284, 47969, 86795563);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66841, to_date('06-06-2008', 'dd-mm-yyyy'), to_date('21-07-2009', 'dd-mm-yyyy'), 93348, 54343, 98457755);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27792, to_date('13-12-2001', 'dd-mm-yyyy'), to_date('21-10-2016', 'dd-mm-yyyy'), 59626, 99923, 12998387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82368, to_date('21-03-2019', 'dd-mm-yyyy'), to_date('26-09-2012', 'dd-mm-yyyy'), 93389, 42865, 75443212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34978, to_date('30-01-2006', 'dd-mm-yyyy'), to_date('08-11-2006', 'dd-mm-yyyy'), 85726, 76821, 43834893);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52628, to_date('29-11-2018', 'dd-mm-yyyy'), to_date('21-07-2016', 'dd-mm-yyyy'), 66514, 66693, 62479178);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11351, to_date('28-07-2009', 'dd-mm-yyyy'), to_date('05-08-2019', 'dd-mm-yyyy'), 36714, 76821, 61962852);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28818, to_date('08-11-2008', 'dd-mm-yyyy'), to_date('23-03-2010', 'dd-mm-yyyy'), 15656, 96248, 115);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63119, to_date('14-09-2016', 'dd-mm-yyyy'), to_date('08-02-2006', 'dd-mm-yyyy'), 33624, 68695, 68814298);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23686, to_date('05-01-2015', 'dd-mm-yyyy'), to_date('27-03-2013', 'dd-mm-yyyy'), 42575, 24794, 8);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24645, to_date('14-12-2007', 'dd-mm-yyyy'), to_date('28-11-2006', 'dd-mm-yyyy'), 114, 87325, 98548123);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28798, to_date('07-01-2015', 'dd-mm-yyyy'), to_date('24-05-2003', 'dd-mm-yyyy'), 36893, 65285, 16182935);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61621, to_date('13-11-2005', 'dd-mm-yyyy'), to_date('13-07-2007', 'dd-mm-yyyy'), 59981, 54343, 77165484);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17758, to_date('19-04-2006', 'dd-mm-yyyy'), to_date('12-01-2004', 'dd-mm-yyyy'), 84539, 36383, 45314931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29159, to_date('26-06-2009', 'dd-mm-yyyy'), to_date('20-09-2018', 'dd-mm-yyyy'), 93828, 69417, 77157355);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17249, to_date('31-03-2002', 'dd-mm-yyyy'), to_date('15-08-2000', 'dd-mm-yyyy'), 84398, 37416, 49968778);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16561, to_date('02-12-2006', 'dd-mm-yyyy'), to_date('19-08-2001', 'dd-mm-yyyy'), 57256, 42414, 87467891);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34669, to_date('14-10-2000', 'dd-mm-yyyy'), to_date('10-04-2013', 'dd-mm-yyyy'), 16986, 37652, 59238419);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44332, to_date('01-02-2008', 'dd-mm-yyyy'), to_date('20-08-2019', 'dd-mm-yyyy'), 52432, 17339, 72118325);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94526, to_date('13-11-2016', 'dd-mm-yyyy'), to_date('25-10-2005', 'dd-mm-yyyy'), 41612, 59143, 19977314);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69669, to_date('18-09-2002', 'dd-mm-yyyy'), to_date('03-07-2016', 'dd-mm-yyyy'), 96396, 69417, 69181511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69378, to_date('22-08-2002', 'dd-mm-yyyy'), to_date('07-07-2010', 'dd-mm-yyyy'), 69835, 99923, 56977482);
commit;
prompt 800 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18193, to_date('21-01-2006', 'dd-mm-yyyy'), to_date('03-04-2012', 'dd-mm-yyyy'), 18584, 19291, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53135, to_date('14-06-2009', 'dd-mm-yyyy'), to_date('07-08-2012', 'dd-mm-yyyy'), 69512, 99923, 39846413);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85564, to_date('04-01-2003', 'dd-mm-yyyy'), to_date('25-10-2000', 'dd-mm-yyyy'), 79633, 93474, 83623371);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44894, to_date('12-11-2005', 'dd-mm-yyyy'), to_date('17-02-2005', 'dd-mm-yyyy'), 26817, 26944, 55689777);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94232, to_date('05-07-2005', 'dd-mm-yyyy'), to_date('20-04-2015', 'dd-mm-yyyy'), 34767, 48137, 89972635);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59141, to_date('22-04-2010', 'dd-mm-yyyy'), to_date('19-11-2020', 'dd-mm-yyyy'), 69669, 65567, 71686597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24226, to_date('05-06-2002', 'dd-mm-yyyy'), to_date('09-08-2012', 'dd-mm-yyyy'), 14899, 49732, 61822711);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34969, to_date('11-02-2005', 'dd-mm-yyyy'), to_date('17-04-2016', 'dd-mm-yyyy'), 21154, 99835, 21326952);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33989, to_date('10-05-2006', 'dd-mm-yyyy'), to_date('23-07-2011', 'dd-mm-yyyy'), 86242, 66121, 35317388);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85881, to_date('17-01-2007', 'dd-mm-yyyy'), to_date('03-09-2012', 'dd-mm-yyyy'), 58496, 44478, 61523464);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77137, to_date('19-12-2007', 'dd-mm-yyyy'), to_date('19-11-2020', 'dd-mm-yyyy'), 71718, 33256, 15129862);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61282, to_date('13-07-2002', 'dd-mm-yyyy'), to_date('05-03-2002', 'dd-mm-yyyy'), 13217, 54343, 34666769);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43684, to_date('11-11-2010', 'dd-mm-yyyy'), to_date('28-08-2012', 'dd-mm-yyyy'), 72977, 22414, 87814169);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68898, to_date('25-03-2007', 'dd-mm-yyyy'), to_date('29-03-2013', 'dd-mm-yyyy'), 35885, 79912, 10);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58798, to_date('16-01-2013', 'dd-mm-yyyy'), to_date('04-08-2006', 'dd-mm-yyyy'), 73977, 54343, 59282125);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66233, to_date('25-05-2002', 'dd-mm-yyyy'), to_date('12-03-2009', 'dd-mm-yyyy'), 32371, 32932, 43373513);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74183, to_date('12-06-2009', 'dd-mm-yyyy'), to_date('09-08-2018', 'dd-mm-yyyy'), 22449, 81766, 37644767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59662, to_date('16-12-2019', 'dd-mm-yyyy'), to_date('28-04-2019', 'dd-mm-yyyy'), 42310, 36148, 76884387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24614, to_date('25-01-2013', 'dd-mm-yyyy'), to_date('25-03-2020', 'dd-mm-yyyy'), 56071, 82839, 98548123);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92318, to_date('11-10-2007', 'dd-mm-yyyy'), to_date('24-12-2003', 'dd-mm-yyyy'), 62362, 84241, 51645252);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99484, to_date('17-03-2004', 'dd-mm-yyyy'), to_date('24-03-2008', 'dd-mm-yyyy'), 48806, 82338, 14813658);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96858, to_date('14-09-2005', 'dd-mm-yyyy'), to_date('25-07-2016', 'dd-mm-yyyy'), 66661, 51926, 27419676);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87353, to_date('03-02-2012', 'dd-mm-yyyy'), to_date('09-04-2001', 'dd-mm-yyyy'), 79566, 82839, 62365835);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51682, to_date('25-03-2006', 'dd-mm-yyyy'), to_date('01-09-2004', 'dd-mm-yyyy'), 34767, 71864, 38815826);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69181, to_date('26-10-2016', 'dd-mm-yyyy'), to_date('28-05-2010', 'dd-mm-yyyy'), 33362, 45211, 56689312);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25451, to_date('20-06-2012', 'dd-mm-yyyy'), to_date('17-03-2004', 'dd-mm-yyyy'), 66512, 84117, 35179913);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (64175, to_date('27-12-2014', 'dd-mm-yyyy'), to_date('31-10-2008', 'dd-mm-yyyy'), 89107, 66121, 69359165);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56475, to_date('08-03-2016', 'dd-mm-yyyy'), to_date('18-09-2017', 'dd-mm-yyyy'), 53562, 42865, 37874639);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38379, to_date('20-10-2009', 'dd-mm-yyyy'), to_date('31-01-2007', 'dd-mm-yyyy'), 65997, 23484, 82527286);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38717, to_date('10-04-2016', 'dd-mm-yyyy'), to_date('15-12-2010', 'dd-mm-yyyy'), 61694, 42865, 46879551);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84119, to_date('31-08-2006', 'dd-mm-yyyy'), to_date('29-09-2008', 'dd-mm-yyyy'), 56857, 83871, 48138574);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23855, to_date('23-05-2014', 'dd-mm-yyyy'), to_date('29-03-2005', 'dd-mm-yyyy'), 83771, 54343, 68814298);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95828, to_date('08-08-2016', 'dd-mm-yyyy'), to_date('11-04-2005', 'dd-mm-yyyy'), 17127, 8, 65121925);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79445, to_date('15-08-2013', 'dd-mm-yyyy'), to_date('23-12-2016', 'dd-mm-yyyy'), 22239, 86171, 79115231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (12747, to_date('24-01-2012', 'dd-mm-yyyy'), to_date('08-08-2005', 'dd-mm-yyyy'), 23575, 98432, 86795563);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48491, to_date('19-05-2009', 'dd-mm-yyyy'), to_date('13-05-2000', 'dd-mm-yyyy'), 94554, 76821, 85915935);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56256, to_date('05-11-2015', 'dd-mm-yyyy'), to_date('07-07-2017', 'dd-mm-yyyy'), 14878, 33256, 65394313);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21366, to_date('25-12-2008', 'dd-mm-yyyy'), to_date('17-05-2017', 'dd-mm-yyyy'), 75423, 65682, 32499819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79219, to_date('28-03-2005', 'dd-mm-yyyy'), to_date('31-01-2008', 'dd-mm-yyyy'), 86966, 91753, 61523464);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78945, to_date('30-06-2016', 'dd-mm-yyyy'), to_date('13-04-2003', 'dd-mm-yyyy'), 66514, 22231, 18);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41856, to_date('09-09-2011', 'dd-mm-yyyy'), to_date('29-07-2001', 'dd-mm-yyyy'), 52269, 51926, 78341231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (12466, to_date('12-11-2008', 'dd-mm-yyyy'), to_date('15-06-2013', 'dd-mm-yyyy'), 26123, 79784, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65192, to_date('23-06-2003', 'dd-mm-yyyy'), to_date('12-08-2016', 'dd-mm-yyyy'), 29395, 43839, 34129523);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94944, to_date('17-06-2018', 'dd-mm-yyyy'), to_date('12-03-2015', 'dd-mm-yyyy'), 14956, 72683, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19255, to_date('03-04-2005', 'dd-mm-yyyy'), to_date('22-07-2011', 'dd-mm-yyyy'), 75050, 65567, 56194188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97873, to_date('31-05-2001', 'dd-mm-yyyy'), to_date('13-10-2015', 'dd-mm-yyyy'), 69381, 32422, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79256, to_date('29-06-2010', 'dd-mm-yyyy'), to_date('01-05-2012', 'dd-mm-yyyy'), 85332, 79784, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55378, to_date('14-07-2016', 'dd-mm-yyyy'), to_date('16-01-2000', 'dd-mm-yyyy'), 58673, 59143, 87556685);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48288, to_date('30-01-2004', 'dd-mm-yyyy'), to_date('28-03-2014', 'dd-mm-yyyy'), 15723, 25287, 77651851);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92724, to_date('03-08-2005', 'dd-mm-yyyy'), to_date('01-02-2017', 'dd-mm-yyyy'), 19861, 44258, 63722518);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45822, to_date('11-09-2018', 'dd-mm-yyyy'), to_date('18-05-2010', 'dd-mm-yyyy'), 98598, 59143, 21377498);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37736, to_date('24-03-2004', 'dd-mm-yyyy'), to_date('19-01-2005', 'dd-mm-yyyy'), 36255, 74937, 54539963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47599, to_date('02-09-2006', 'dd-mm-yyyy'), to_date('15-10-2000', 'dd-mm-yyyy'), 15631, 65682, 79115231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72886, to_date('29-11-2000', 'dd-mm-yyyy'), to_date('19-12-2018', 'dd-mm-yyyy'), 73946, 65682, 19649366);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88916, to_date('26-06-2007', 'dd-mm-yyyy'), to_date('19-06-2009', 'dd-mm-yyyy'), 57346, 36383, 97635136);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53423, to_date('24-07-2010', 'dd-mm-yyyy'), to_date('03-02-2020', 'dd-mm-yyyy'), 95447, 49477, 49937262);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88739, to_date('01-02-2004', 'dd-mm-yyyy'), to_date('28-09-2015', 'dd-mm-yyyy'), 60781, 23798, 66298675);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (86852, to_date('11-10-2010', 'dd-mm-yyyy'), to_date('18-05-2007', 'dd-mm-yyyy'), 91369, 37652, 12);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78298, to_date('29-08-2000', 'dd-mm-yyyy'), to_date('21-10-2005', 'dd-mm-yyyy'), 42310, 29621, 68814298);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18258, to_date('27-11-2002', 'dd-mm-yyyy'), to_date('01-11-2016', 'dd-mm-yyyy'), 85433, 11784, 61959199);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66973, to_date('15-08-2019', 'dd-mm-yyyy'), to_date('24-04-2019', 'dd-mm-yyyy'), 87938, 65682, 77157355);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77787, to_date('15-04-2003', 'dd-mm-yyyy'), to_date('28-12-2002', 'dd-mm-yyyy'), 52834, 6, 46134653);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33772, to_date('05-11-2014', 'dd-mm-yyyy'), to_date('23-04-2008', 'dd-mm-yyyy'), 94229, 32422, 46328589);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25469, to_date('20-05-2006', 'dd-mm-yyyy'), to_date('03-10-2020', 'dd-mm-yyyy'), 31286, 54343, 73143256);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87622, to_date('06-07-2018', 'dd-mm-yyyy'), to_date('08-01-2003', 'dd-mm-yyyy'), 42515, 48819, 13612611);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76858, to_date('19-09-2008', 'dd-mm-yyyy'), to_date('24-04-2018', 'dd-mm-yyyy'), 42281, 99835, 46263931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52817, to_date('30-12-2003', 'dd-mm-yyyy'), to_date('16-02-2013', 'dd-mm-yyyy'), 28284, 82688, 48138574);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67526, to_date('24-10-2019', 'dd-mm-yyyy'), to_date('27-11-2005', 'dd-mm-yyyy'), 21655, 19291, 34766568);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88344, to_date('23-09-2002', 'dd-mm-yyyy'), to_date('20-08-2001', 'dd-mm-yyyy'), 28947, 42414, 14813658);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41483, to_date('24-06-2012', 'dd-mm-yyyy'), to_date('18-08-2005', 'dd-mm-yyyy'), 27897, 57325, 57396459);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (57537, to_date('19-12-2009', 'dd-mm-yyyy'), to_date('26-06-2000', 'dd-mm-yyyy'), 98224, 87483, 53199867);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32783, to_date('29-03-2001', 'dd-mm-yyyy'), to_date('19-07-2011', 'dd-mm-yyyy'), 27947, 55331, 47347838);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35313, to_date('01-11-2017', 'dd-mm-yyyy'), to_date('01-06-2001', 'dd-mm-yyyy'), 69669, 91753, 77737128);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66136, to_date('08-09-2001', 'dd-mm-yyyy'), to_date('19-10-2005', 'dd-mm-yyyy'), 83966, 93474, 14419582);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24361, to_date('27-02-2015', 'dd-mm-yyyy'), to_date('03-11-2016', 'dd-mm-yyyy'), 35715, 6, 72118325);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53179, to_date('13-01-2007', 'dd-mm-yyyy'), to_date('18-07-2018', 'dd-mm-yyyy'), 32124, 45211, 54539963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (64784, to_date('20-11-2008', 'dd-mm-yyyy'), to_date('31-08-2017', 'dd-mm-yyyy'), 48551, 83126, 27367712);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68285, to_date('07-04-2018', 'dd-mm-yyyy'), to_date('20-10-2014', 'dd-mm-yyyy'), 43835, 72682, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48182, to_date('08-03-2001', 'dd-mm-yyyy'), to_date('07-05-2006', 'dd-mm-yyyy'), 49213, 66693, 56777364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47982, to_date('05-07-2001', 'dd-mm-yyyy'), to_date('13-08-2005', 'dd-mm-yyyy'), 61822, 65682, 74162997);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74531, to_date('31-05-2008', 'dd-mm-yyyy'), to_date('12-08-2005', 'dd-mm-yyyy'), 47696, 97911, 99513467);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31354, to_date('18-08-2008', 'dd-mm-yyyy'), to_date('15-02-2009', 'dd-mm-yyyy'), 52212, 79784, 67419271);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28135, to_date('26-08-2003', 'dd-mm-yyyy'), to_date('20-08-2000', 'dd-mm-yyyy'), 18279, 77497, 21383172);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44113, to_date('22-02-2009', 'dd-mm-yyyy'), to_date('17-05-2017', 'dd-mm-yyyy'), 35857, 93474, 36698269);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32795, to_date('14-06-2005', 'dd-mm-yyyy'), to_date('07-08-2003', 'dd-mm-yyyy'), 97445, 78735, 71546176);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61294, to_date('07-12-2015', 'dd-mm-yyyy'), to_date('31-12-2003', 'dd-mm-yyyy'), 95435, 86171, 13612611);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67689, to_date('19-12-2015', 'dd-mm-yyyy'), to_date('30-11-2015', 'dd-mm-yyyy'), 86947, 79912, 31121978);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41667, to_date('14-05-2000', 'dd-mm-yyyy'), to_date('05-03-2013', 'dd-mm-yyyy'), 34696, 42865, 58747241);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65633, to_date('27-08-2020', 'dd-mm-yyyy'), to_date('26-07-2004', 'dd-mm-yyyy'), 19581, 23932, 88921152);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93994, to_date('07-11-2000', 'dd-mm-yyyy'), to_date('15-05-2018', 'dd-mm-yyyy'), 69512, 77992, 85636881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76968, to_date('19-03-2015', 'dd-mm-yyyy'), to_date('08-05-2014', 'dd-mm-yyyy'), 97422, 48137, 98457755);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42334, to_date('13-11-2014', 'dd-mm-yyyy'), to_date('21-10-2000', 'dd-mm-yyyy'), 97299, 26284, 77165484);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82346, to_date('07-06-2009', 'dd-mm-yyyy'), to_date('20-11-2017', 'dd-mm-yyyy'), 48937, 48819, 97359492);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24223, to_date('22-12-2004', 'dd-mm-yyyy'), to_date('30-09-2009', 'dd-mm-yyyy'), 92662, 65567, 65121925);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58189, to_date('06-02-2005', 'dd-mm-yyyy'), to_date('24-10-2013', 'dd-mm-yyyy'), 56071, 36148, 34533386);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96124, to_date('03-07-2018', 'dd-mm-yyyy'), to_date('11-12-2013', 'dd-mm-yyyy'), 14171, 23798, 18248815);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76431, to_date('16-03-2013', 'dd-mm-yyyy'), to_date('17-06-2006', 'dd-mm-yyyy'), 93634, 99835, 14);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92856, to_date('17-09-2005', 'dd-mm-yyyy'), to_date('06-11-2009', 'dd-mm-yyyy'), 67184, 65682, 51575582);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59986, to_date('25-12-2012', 'dd-mm-yyyy'), to_date('20-11-2009', 'dd-mm-yyyy'), 84119, 18581, 59526612);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93846, to_date('06-10-2018', 'dd-mm-yyyy'), to_date('23-06-2017', 'dd-mm-yyyy'), 88944, 71864, 91322455);
commit;
prompt 900 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33379, to_date('01-09-2012', 'dd-mm-yyyy'), to_date('02-03-2014', 'dd-mm-yyyy'), 52469, 47969, 43834893);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21565, to_date('14-10-2008', 'dd-mm-yyyy'), to_date('11-01-2020', 'dd-mm-yyyy'), 72893, 49347, 38789282);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89385, to_date('25-11-2019', 'dd-mm-yyyy'), to_date('20-03-2004', 'dd-mm-yyyy'), 35772, 43839, 62232168);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89523, to_date('14-10-2018', 'dd-mm-yyyy'), to_date('02-08-2013', 'dd-mm-yyyy'), 79615, 24794, 22999597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23869, to_date('24-02-2008', 'dd-mm-yyyy'), to_date('12-08-2000', 'dd-mm-yyyy'), 48902, 49757, 81225789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77135, to_date('17-04-2000', 'dd-mm-yyyy'), to_date('23-07-2002', 'dd-mm-yyyy'), 69629, 93474, 37644767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21539, to_date('19-09-2012', 'dd-mm-yyyy'), to_date('02-03-2013', 'dd-mm-yyyy'), 36655, 83753, 87364494);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52887, to_date('09-12-2019', 'dd-mm-yyyy'), to_date('06-09-2012', 'dd-mm-yyyy'), 15723, 68695, 61822711);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97556, to_date('10-01-2012', 'dd-mm-yyyy'), to_date('12-03-2013', 'dd-mm-yyyy'), 69082, 19291, 85648914);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45298, to_date('28-04-2010', 'dd-mm-yyyy'), to_date('15-09-2009', 'dd-mm-yyyy'), 67117, 57325, 83987279);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28424, to_date('06-05-2011', 'dd-mm-yyyy'), to_date('12-10-2014', 'dd-mm-yyyy'), 73998, 22414, 99181387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31445, to_date('19-12-2009', 'dd-mm-yyyy'), to_date('19-02-2016', 'dd-mm-yyyy'), 99685, 78735, 74628867);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46519, to_date('10-03-2016', 'dd-mm-yyyy'), to_date('15-06-2003', 'dd-mm-yyyy'), 76115, 83753, 81316259);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76641, to_date('12-02-2015', 'dd-mm-yyyy'), to_date('11-08-2009', 'dd-mm-yyyy'), 72734, 34594, 31839511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51142, to_date('15-12-2007', 'dd-mm-yyyy'), to_date('23-01-2002', 'dd-mm-yyyy'), 57166, 51926, 79853819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42982, to_date('16-09-2020', 'dd-mm-yyyy'), to_date('25-10-2010', 'dd-mm-yyyy'), 44938, 67788, 59526612);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29888, to_date('03-08-2018', 'dd-mm-yyyy'), to_date('14-10-2001', 'dd-mm-yyyy'), 62414, 65285, 43149369);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36277, to_date('28-10-2013', 'dd-mm-yyyy'), to_date('30-12-2017', 'dd-mm-yyyy'), 41736, 51926, 81269834);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83772, to_date('29-04-2007', 'dd-mm-yyyy'), to_date('29-07-2016', 'dd-mm-yyyy'), 83386, 44258, 41857774);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21229, to_date('10-05-2003', 'dd-mm-yyyy'), to_date('16-06-2017', 'dd-mm-yyyy'), 31537, 37652, 32681299);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85742, to_date('29-10-2003', 'dd-mm-yyyy'), to_date('05-06-2020', 'dd-mm-yyyy'), 37694, 34594, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27999, to_date('19-10-2006', 'dd-mm-yyyy'), to_date('02-09-2010', 'dd-mm-yyyy'), 68873, 51926, 92986276);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58854, to_date('17-03-2000', 'dd-mm-yyyy'), to_date('02-05-2015', 'dd-mm-yyyy'), 22224, 47969, 67428652);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13377, to_date('20-04-2004', 'dd-mm-yyyy'), to_date('24-10-2003', 'dd-mm-yyyy'), 96588, 52399, 39146534);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58779, to_date('29-10-2003', 'dd-mm-yyyy'), to_date('05-10-2020', 'dd-mm-yyyy'), 62698, 9, 29261328);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (64643, to_date('20-06-2001', 'dd-mm-yyyy'), to_date('14-11-2015', 'dd-mm-yyyy'), 31286, 76821, 73784175);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45216, to_date('15-10-2016', 'dd-mm-yyyy'), to_date('11-01-2012', 'dd-mm-yyyy'), 18125, 25287, 36283787);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71959, to_date('09-07-2011', 'dd-mm-yyyy'), to_date('29-08-2019', 'dd-mm-yyyy'), 61336, 97911, 32643411);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63987, to_date('23-07-2007', 'dd-mm-yyyy'), to_date('12-12-2007', 'dd-mm-yyyy'), 97217, 72683, 97895962);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81716, to_date('05-10-2003', 'dd-mm-yyyy'), to_date('20-05-2008', 'dd-mm-yyyy'), 99932, 66121, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71152, to_date('01-03-2008', 'dd-mm-yyyy'), to_date('22-07-2009', 'dd-mm-yyyy'), 34579, 23798, 71945123);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49981, to_date('16-07-2017', 'dd-mm-yyyy'), to_date('29-07-2007', 'dd-mm-yyyy'), 64481, 68695, 17);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (57844, to_date('25-10-2013', 'dd-mm-yyyy'), to_date('10-11-2000', 'dd-mm-yyyy'), 87861, 87483, 59798994);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33168, to_date('03-02-2016', 'dd-mm-yyyy'), to_date('07-07-2004', 'dd-mm-yyyy'), 85629, 66693, 98347945);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74244, to_date('12-12-2017', 'dd-mm-yyyy'), to_date('11-11-2017', 'dd-mm-yyyy'), 53113, 77497, 56977482);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56331, to_date('15-12-2004', 'dd-mm-yyyy'), to_date('20-07-2003', 'dd-mm-yyyy'), 95981, 31194, 55592359);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16436, to_date('25-01-2017', 'dd-mm-yyyy'), to_date('01-05-2003', 'dd-mm-yyyy'), 74413, 22414, 62232168);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21748, to_date('29-11-2020', 'dd-mm-yyyy'), to_date('31-10-2000', 'dd-mm-yyyy'), 13985, 37652, 61495641);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42447, to_date('10-11-2013', 'dd-mm-yyyy'), to_date('31-01-2010', 'dd-mm-yyyy'), 38868, 19291, 51552331);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (54717, to_date('11-07-2001', 'dd-mm-yyyy'), to_date('01-06-2013', 'dd-mm-yyyy'), 38419, 25287, 57396459);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47815, to_date('21-05-2010', 'dd-mm-yyyy'), to_date('17-09-2018', 'dd-mm-yyyy'), 41736, 98432, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68495, to_date('04-11-2012', 'dd-mm-yyyy'), to_date('05-10-2008', 'dd-mm-yyyy'), 48574, 72683, 59526612);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18576, to_date('15-06-2009', 'dd-mm-yyyy'), to_date('12-01-2006', 'dd-mm-yyyy'), 22618, 81766, 29272161);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89656, to_date('19-10-2015', 'dd-mm-yyyy'), to_date('24-01-2006', 'dd-mm-yyyy'), 75643, 66693, 91466594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79936, to_date('26-05-2005', 'dd-mm-yyyy'), to_date('27-09-2002', 'dd-mm-yyyy'), 85629, 83753, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82283, to_date('01-05-2016', 'dd-mm-yyyy'), to_date('17-12-2016', 'dd-mm-yyyy'), 54515, 17339, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22998, to_date('11-11-2013', 'dd-mm-yyyy'), to_date('16-12-2009', 'dd-mm-yyyy'), 18379, 26944, 16285986);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41937, to_date('02-05-2000', 'dd-mm-yyyy'), to_date('04-07-2002', 'dd-mm-yyyy'), 69212, 26944, 29818936);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74933, to_date('07-05-2006', 'dd-mm-yyyy'), to_date('27-09-2006', 'dd-mm-yyyy'), 65168, 66121, 52936598);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45452, to_date('25-11-2004', 'dd-mm-yyyy'), to_date('12-07-2007', 'dd-mm-yyyy'), 29447, 83126, 35179913);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (57238, to_date('10-08-2019', 'dd-mm-yyyy'), to_date('29-08-2012', 'dd-mm-yyyy'), 72531, 65682, 56927789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (73426, to_date('26-06-2010', 'dd-mm-yyyy'), to_date('16-09-2008', 'dd-mm-yyyy'), 15656, 55519, 42376146);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77558, to_date('27-02-2001', 'dd-mm-yyyy'), to_date('08-02-2007', 'dd-mm-yyyy'), 77312, 65567, 56927789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77583, to_date('16-12-2015', 'dd-mm-yyyy'), to_date('04-01-2005', 'dd-mm-yyyy'), 81546, 32422, 67189854);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27412, to_date('25-06-2007', 'dd-mm-yyyy'), to_date('14-11-2015', 'dd-mm-yyyy'), 64549, 69417, 19241945);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11912, to_date('12-09-2012', 'dd-mm-yyyy'), to_date('16-04-2002', 'dd-mm-yyyy'), 28586, 84241, 6);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23995, to_date('24-08-2011', 'dd-mm-yyyy'), to_date('14-02-2009', 'dd-mm-yyyy'), 85332, 12389, 58819249);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51771, to_date('22-02-2020', 'dd-mm-yyyy'), to_date('30-03-2011', 'dd-mm-yyyy'), 12888, 45211, 54539963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95575, to_date('05-07-2010', 'dd-mm-yyyy'), to_date('23-12-2015', 'dd-mm-yyyy'), 83386, 49732, 8);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19448, to_date('15-06-2014', 'dd-mm-yyyy'), to_date('27-12-2014', 'dd-mm-yyyy'), 38848, 67718, 74162997);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77353, to_date('10-09-2013', 'dd-mm-yyyy'), to_date('30-01-2005', 'dd-mm-yyyy'), 92478, 65567, 63151798);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83459, to_date('11-04-2007', 'dd-mm-yyyy'), to_date('19-12-2014', 'dd-mm-yyyy'), 71344, 34594, 115);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61493, to_date('05-12-2005', 'dd-mm-yyyy'), to_date('25-01-2010', 'dd-mm-yyyy'), 12971, 55331, 57396459);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37777, to_date('09-09-2011', 'dd-mm-yyyy'), to_date('12-12-2016', 'dd-mm-yyyy'), 11985, 57325, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48441, to_date('26-07-2000', 'dd-mm-yyyy'), to_date('22-09-2017', 'dd-mm-yyyy'), 79466, 48819, 17729142);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69859, to_date('01-11-2015', 'dd-mm-yyyy'), to_date('19-04-2013', 'dd-mm-yyyy'), 62248, 58234, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27378, to_date('13-04-2013', 'dd-mm-yyyy'), to_date('03-04-2003', 'dd-mm-yyyy'), 48566, 49732, 11862857);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28485, to_date('03-11-2005', 'dd-mm-yyyy'), to_date('06-11-2001', 'dd-mm-yyyy'), 62213, 95296, 89972635);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32778, to_date('09-04-2000', 'dd-mm-yyyy'), to_date('24-12-2018', 'dd-mm-yyyy'), 79249, 19848, 32681299);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34149, to_date('04-01-2001', 'dd-mm-yyyy'), to_date('26-12-2002', 'dd-mm-yyyy'), 55188, 97911, 95994968);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96694, to_date('12-07-2020', 'dd-mm-yyyy'), to_date('01-05-2017', 'dd-mm-yyyy'), 72977, 54343, 49296536);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45891, to_date('01-06-2006', 'dd-mm-yyyy'), to_date('23-10-2020', 'dd-mm-yyyy'), 3759, 23798, 69864674);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (86645, to_date('06-12-2004', 'dd-mm-yyyy'), to_date('12-01-2018', 'dd-mm-yyyy'), 66396, 19291, 19977314);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67799, to_date('29-04-2003', 'dd-mm-yyyy'), to_date('26-06-2004', 'dd-mm-yyyy'), 96311, 26944, 62479178);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41753, to_date('01-04-2011', 'dd-mm-yyyy'), to_date('30-09-2016', 'dd-mm-yyyy'), 54531, 19291, 39846413);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67242, to_date('25-02-2019', 'dd-mm-yyyy'), to_date('16-02-2018', 'dd-mm-yyyy'), 98224, 8, 52936598);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13815, to_date('18-04-2001', 'dd-mm-yyyy'), to_date('09-09-2003', 'dd-mm-yyyy'), 81562, 29621, 84312545);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32911, to_date('22-10-2008', 'dd-mm-yyyy'), to_date('06-11-2013', 'dd-mm-yyyy'), 72463, 59143, 62365835);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45967, to_date('20-11-2008', 'dd-mm-yyyy'), to_date('18-11-2003', 'dd-mm-yyyy'), 99779, 67788, 47347838);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (86235, to_date('16-09-2019', 'dd-mm-yyyy'), to_date('25-10-2014', 'dd-mm-yyyy'), 51957, 39662, 49248963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81572, to_date('05-04-2018', 'dd-mm-yyyy'), to_date('30-01-2014', 'dd-mm-yyyy'), 13568, 69376, 14186931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88868, to_date('24-09-2004', 'dd-mm-yyyy'), to_date('04-06-2008', 'dd-mm-yyyy'), 16763, 58234, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15284, to_date('06-02-2012', 'dd-mm-yyyy'), to_date('18-08-2010', 'dd-mm-yyyy'), 12197, 12389, 28847179);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22836, to_date('15-12-2017', 'dd-mm-yyyy'), to_date('19-12-2009', 'dd-mm-yyyy'), 33975, 39662, 96766481);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (73687, to_date('19-06-2002', 'dd-mm-yyyy'), to_date('22-08-2018', 'dd-mm-yyyy'), 36852, 42865, 98548123);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68713, to_date('04-12-2020', 'dd-mm-yyyy'), to_date('18-05-2006', 'dd-mm-yyyy'), 34658, 98974, 71945123);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91554, to_date('05-02-2010', 'dd-mm-yyyy'), to_date('29-04-2007', 'dd-mm-yyyy'), 35571, 87325, 96644292);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28346, to_date('18-10-2002', 'dd-mm-yyyy'), to_date('06-12-2019', 'dd-mm-yyyy'), 45392, 54343, 81316259);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91869, to_date('21-12-2004', 'dd-mm-yyyy'), to_date('02-06-2011', 'dd-mm-yyyy'), 99616, 39662, 39171226);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22329, to_date('16-08-2009', 'dd-mm-yyyy'), to_date('03-01-2012', 'dd-mm-yyyy'), 22348, 86171, 99181387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58714, to_date('12-02-2015', 'dd-mm-yyyy'), to_date('06-12-2001', 'dd-mm-yyyy'), 2502, 84117, 23769387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92966, to_date('28-07-2019', 'dd-mm-yyyy'), to_date('10-04-2003', 'dd-mm-yyyy'), 21781, 19291, 57143634);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66525, to_date('22-12-2006', 'dd-mm-yyyy'), to_date('19-09-2000', 'dd-mm-yyyy'), 48937, 19291, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92778, to_date('29-11-2004', 'dd-mm-yyyy'), to_date('21-11-2014', 'dd-mm-yyyy'), 26654, 23484, 37644767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38443, to_date('28-11-2006', 'dd-mm-yyyy'), to_date('07-08-2014', 'dd-mm-yyyy'), 89246, 96248, 96534397);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34364, to_date('04-01-2002', 'dd-mm-yyyy'), to_date('07-08-2007', 'dd-mm-yyyy'), 15723, 18581, 38815826);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78327, to_date('02-08-2014', 'dd-mm-yyyy'), to_date('07-01-2000', 'dd-mm-yyyy'), 78797, 98599, 61523464);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17732, to_date('16-09-2015', 'dd-mm-yyyy'), to_date('29-10-2000', 'dd-mm-yyyy'), 11985, 99923, 66298675);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69828, to_date('28-04-2020', 'dd-mm-yyyy'), to_date('24-06-2011', 'dd-mm-yyyy'), 37672, 48819, 37644767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45638, to_date('06-10-2009', 'dd-mm-yyyy'), to_date('19-02-2013', 'dd-mm-yyyy'), 77623, 82839, 114);
commit;
prompt 1000 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56542, to_date('10-09-2002', 'dd-mm-yyyy'), to_date('22-03-2020', 'dd-mm-yyyy'), 17127, 87325, 3);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37858, to_date('24-04-2009', 'dd-mm-yyyy'), to_date('16-08-2016', 'dd-mm-yyyy'), 85202, 86171, 69181511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56371, to_date('04-12-2018', 'dd-mm-yyyy'), to_date('25-11-2007', 'dd-mm-yyyy'), 98711, 82839, 12998387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35459, to_date('20-06-2010', 'dd-mm-yyyy'), to_date('06-03-2019', 'dd-mm-yyyy'), 45392, 84241, 69359165);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48861, to_date('16-11-2001', 'dd-mm-yyyy'), to_date('23-03-2000', 'dd-mm-yyyy'), 92355, 58234, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28226, to_date('11-07-2006', 'dd-mm-yyyy'), to_date('22-08-2015', 'dd-mm-yyyy'), 71766, 49757, 63832548);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48134, to_date('11-09-2016', 'dd-mm-yyyy'), to_date('28-10-2004', 'dd-mm-yyyy'), 71149, 8, 77157355);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53767, to_date('31-05-2004', 'dd-mm-yyyy'), to_date('14-04-2016', 'dd-mm-yyyy'), 19568, 23798, 7);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95614, to_date('15-05-2013', 'dd-mm-yyyy'), to_date('14-10-2011', 'dd-mm-yyyy'), 91717, 59143, 99458773);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16859, to_date('02-05-2015', 'dd-mm-yyyy'), to_date('11-03-2009', 'dd-mm-yyyy'), 49986, 32422, 43834893);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95611, to_date('16-10-2006', 'dd-mm-yyyy'), to_date('18-08-2010', 'dd-mm-yyyy'), 61613, 65567, 31839511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63815, to_date('28-09-2008', 'dd-mm-yyyy'), to_date('14-05-2012', 'dd-mm-yyyy'), 37937, 87325, 65394313);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65934, to_date('07-02-2004', 'dd-mm-yyyy'), to_date('13-09-2003', 'dd-mm-yyyy'), 14939, 79784, 47135816);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17658, to_date('18-02-2013', 'dd-mm-yyyy'), to_date('07-10-2019', 'dd-mm-yyyy'), 74413, 59143, 87814169);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91128, to_date('08-05-2012', 'dd-mm-yyyy'), to_date('12-03-2001', 'dd-mm-yyyy'), 62896, 82338, 14973237);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32324, to_date('23-03-2006', 'dd-mm-yyyy'), to_date('06-07-2007', 'dd-mm-yyyy'), 58666, 49757, 47127676);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55857, to_date('19-10-2002', 'dd-mm-yyyy'), to_date('26-04-2009', 'dd-mm-yyyy'), 16192, 31194, 66298675);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66557, to_date('21-07-2019', 'dd-mm-yyyy'), to_date('01-01-2004', 'dd-mm-yyyy'), 56166, 88239, 10);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55564, to_date('21-05-2007', 'dd-mm-yyyy'), to_date('26-04-2007', 'dd-mm-yyyy'), 43362, 9, 10);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89738, to_date('31-07-2005', 'dd-mm-yyyy'), to_date('29-08-2001', 'dd-mm-yyyy'), 42575, 87483, 95994968);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94559, to_date('24-02-2003', 'dd-mm-yyyy'), to_date('06-05-2019', 'dd-mm-yyyy'), 13907, 98432, 14186931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68749, to_date('17-10-2007', 'dd-mm-yyyy'), to_date('21-07-2018', 'dd-mm-yyyy'), 71344, 65285, 56777364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83761, to_date('18-09-2001', 'dd-mm-yyyy'), to_date('02-06-2014', 'dd-mm-yyyy'), 34491, 42414, 77165484);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33552, to_date('24-05-2003', 'dd-mm-yyyy'), to_date('09-02-2014', 'dd-mm-yyyy'), 14331, 73237, 73928971);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94999, to_date('09-01-2010', 'dd-mm-yyyy'), to_date('14-12-2002', 'dd-mm-yyyy'), 53562, 93474, 19977314);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29999, to_date('01-08-2011', 'dd-mm-yyyy'), to_date('12-09-2019', 'dd-mm-yyyy'), 34937, 96248, 47347838);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (55844, to_date('27-12-2016', 'dd-mm-yyyy'), to_date('30-07-2010', 'dd-mm-yyyy'), 84119, 49732, 19971565);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23949, to_date('23-07-2015', 'dd-mm-yyyy'), to_date('09-10-2009', 'dd-mm-yyyy'), 97594, 44258, 39146534);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91211, to_date('05-10-2018', 'dd-mm-yyyy'), to_date('31-03-2014', 'dd-mm-yyyy'), 71344, 77992, 88921152);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34245, to_date('26-08-2007', 'dd-mm-yyyy'), to_date('22-10-2010', 'dd-mm-yyyy'), 63746, 12389, 69828852);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85291, to_date('24-09-2016', 'dd-mm-yyyy'), to_date('15-11-2014', 'dd-mm-yyyy'), 62148, 72683, 61523464);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88711, to_date('23-04-2010', 'dd-mm-yyyy'), to_date('26-04-2005', 'dd-mm-yyyy'), 88458, 71864, 94229953);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38655, to_date('08-07-2011', 'dd-mm-yyyy'), to_date('21-12-2005', 'dd-mm-yyyy'), 47449, 15868, 46134653);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93636, to_date('15-10-2014', 'dd-mm-yyyy'), to_date('09-08-2012', 'dd-mm-yyyy'), 22138, 39662, 39846331);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77534, to_date('29-06-2000', 'dd-mm-yyyy'), to_date('12-01-2002', 'dd-mm-yyyy'), 99424, 23484, 84655373);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82682, to_date('18-10-2015', 'dd-mm-yyyy'), to_date('28-01-2019', 'dd-mm-yyyy'), 99297, 84241, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41813, to_date('07-09-2012', 'dd-mm-yyyy'), to_date('12-08-2001', 'dd-mm-yyyy'), 81722, 49757, 84881439);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27236, to_date('12-06-2010', 'dd-mm-yyyy'), to_date('27-03-2003', 'dd-mm-yyyy'), 41612, 7, 59626673);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18539, to_date('13-01-2010', 'dd-mm-yyyy'), to_date('31-05-2017', 'dd-mm-yyyy'), 97445, 73237, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85282, to_date('27-03-2003', 'dd-mm-yyyy'), to_date('05-10-2011', 'dd-mm-yyyy'), 86947, 37416, 33456381);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32812, to_date('14-05-2014', 'dd-mm-yyyy'), to_date('30-09-2016', 'dd-mm-yyyy'), 69835, 63711, 62479178);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35585, to_date('08-12-2000', 'dd-mm-yyyy'), to_date('01-03-2017', 'dd-mm-yyyy'), 18584, 19291, 58747241);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41964, to_date('01-08-2005', 'dd-mm-yyyy'), to_date('04-04-2020', 'dd-mm-yyyy'), 51425, 32422, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51518, to_date('16-08-2007', 'dd-mm-yyyy'), to_date('14-01-2007', 'dd-mm-yyyy'), 18125, 97911, 56777364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47228, to_date('24-11-2002', 'dd-mm-yyyy'), to_date('22-09-2002', 'dd-mm-yyyy'), 20093, 29621, 96644292);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47236, to_date('03-03-2014', 'dd-mm-yyyy'), to_date('14-11-2003', 'dd-mm-yyyy'), 22353, 98482, 32681299);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96433, to_date('24-02-2011', 'dd-mm-yyyy'), to_date('24-04-2001', 'dd-mm-yyyy'), 49651, 93474, 21745437);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62712, to_date('31-12-2002', 'dd-mm-yyyy'), to_date('13-11-2013', 'dd-mm-yyyy'), 89915, 83753, 34533386);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91337, to_date('20-06-2002', 'dd-mm-yyyy'), to_date('05-09-2001', 'dd-mm-yyyy'), 50305, 7, 69923664);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41528, to_date('06-12-2014', 'dd-mm-yyyy'), to_date('14-05-2013', 'dd-mm-yyyy'), 27353, 42865, 71945123);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51539, to_date('29-11-2003', 'dd-mm-yyyy'), to_date('17-09-2017', 'dd-mm-yyyy'), 37355, 45211, 47643779);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52645, to_date('16-04-2015', 'dd-mm-yyyy'), to_date('04-09-2002', 'dd-mm-yyyy'), 34763, 74937, 95554736);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65456, to_date('07-10-2009', 'dd-mm-yyyy'), to_date('02-11-2008', 'dd-mm-yyyy'), 34767, 37792, 63832548);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74379, to_date('11-10-2015', 'dd-mm-yyyy'), to_date('09-07-2015', 'dd-mm-yyyy'), 97775, 26284, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52637, to_date('30-08-2009', 'dd-mm-yyyy'), to_date('17-03-2019', 'dd-mm-yyyy'), 49929, 29621, 15924254);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (57133, to_date('07-09-2010', 'dd-mm-yyyy'), to_date('04-05-2019', 'dd-mm-yyyy'), 40462, 83126, 77737128);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72539, to_date('18-09-2008', 'dd-mm-yyyy'), to_date('20-02-2004', 'dd-mm-yyyy'), 27539, 87325, 69864674);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85658, to_date('11-06-2005', 'dd-mm-yyyy'), to_date('09-03-2004', 'dd-mm-yyyy'), 94554, 68695, 39846331);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26674, to_date('21-04-2005', 'dd-mm-yyyy'), to_date('07-09-2011', 'dd-mm-yyyy'), 19557, 44258, 55445293);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21319, to_date('16-08-2000', 'dd-mm-yyyy'), to_date('21-12-2016', 'dd-mm-yyyy'), 22449, 67718, 58819249);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59222, to_date('01-04-2002', 'dd-mm-yyyy'), to_date('01-03-2006', 'dd-mm-yyyy'), 64147, 12389, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72628, to_date('09-11-2009', 'dd-mm-yyyy'), to_date('09-03-2008', 'dd-mm-yyyy'), 97217, 98599, 64525236);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78279, to_date('05-06-2006', 'dd-mm-yyyy'), to_date('07-01-2012', 'dd-mm-yyyy'), 84518, 58234, 52385335);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23171, to_date('21-04-2006', 'dd-mm-yyyy'), to_date('20-07-2014', 'dd-mm-yyyy'), 57161, 59143, 74162997);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93518, to_date('05-03-2019', 'dd-mm-yyyy'), to_date('23-05-2001', 'dd-mm-yyyy'), 75142, 77992, 27638892);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15726, to_date('28-08-2012', 'dd-mm-yyyy'), to_date('14-01-2009', 'dd-mm-yyyy'), 74121, 98482, 69359165);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45912, to_date('08-12-2003', 'dd-mm-yyyy'), to_date('21-03-2004', 'dd-mm-yyyy'), 79921, 87325, 51759376);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42152, to_date('27-01-2012', 'dd-mm-yyyy'), to_date('07-10-2000', 'dd-mm-yyyy'), 32271, 45211, 99458773);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83198, to_date('03-05-2008', 'dd-mm-yyyy'), to_date('18-07-2017', 'dd-mm-yyyy'), 92727, 79784, 65394313);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27312, to_date('28-09-2001', 'dd-mm-yyyy'), to_date('26-11-2001', 'dd-mm-yyyy'), 82648, 48819, 36291759);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17836, to_date('03-07-2010', 'dd-mm-yyyy'), to_date('07-01-2000', 'dd-mm-yyyy'), 17577, 17339, 32681299);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16319, to_date('13-04-2003', 'dd-mm-yyyy'), to_date('22-07-2013', 'dd-mm-yyyy'), 97544, 32932, 81225789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62328, to_date('29-11-2019', 'dd-mm-yyyy'), to_date('10-03-2015', 'dd-mm-yyyy'), 37599, 26944, 77165484);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71956, to_date('09-07-2008', 'dd-mm-yyyy'), to_date('27-01-2007', 'dd-mm-yyyy'), 57721, 9, 87814169);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82791, to_date('08-10-2019', 'dd-mm-yyyy'), to_date('14-12-2015', 'dd-mm-yyyy'), 88157, 98432, 1);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81277, to_date('05-12-2016', 'dd-mm-yyyy'), to_date('15-07-2001', 'dd-mm-yyyy'), 98423, 67718, 52385335);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65918, to_date('26-02-2018', 'dd-mm-yyyy'), to_date('28-04-2012', 'dd-mm-yyyy'), 69381, 32374, 91944651);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22959, to_date('14-07-2004', 'dd-mm-yyyy'), to_date('12-03-2012', 'dd-mm-yyyy'), 85596, 88239, 59626673);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42448, to_date('28-03-2020', 'dd-mm-yyyy'), to_date('27-10-2004', 'dd-mm-yyyy'), 58725, 63711, 46253661);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39389, to_date('12-01-2007', 'dd-mm-yyyy'), to_date('07-07-2002', 'dd-mm-yyyy'), 11843, 83871, 57235855);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (12233, to_date('30-05-2015', 'dd-mm-yyyy'), to_date('16-03-2013', 'dd-mm-yyyy'), 35956, 17339, 31839511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13369, to_date('04-07-2009', 'dd-mm-yyyy'), to_date('17-08-2003', 'dd-mm-yyyy'), 81926, 44478, 56689312);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14175, to_date('29-05-2010', 'dd-mm-yyyy'), to_date('30-05-2020', 'dd-mm-yyyy'), 56167, 88239, 57322122);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78112, to_date('30-08-2012', 'dd-mm-yyyy'), to_date('07-02-2003', 'dd-mm-yyyy'), 27361, 6, 14);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13762, to_date('14-12-2018', 'dd-mm-yyyy'), to_date('17-10-2013', 'dd-mm-yyyy'), 64179, 79912, 34533386);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89918, to_date('24-07-2020', 'dd-mm-yyyy'), to_date('26-04-2008', 'dd-mm-yyyy'), 67536, 98599, 67419271);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25965, to_date('20-06-2007', 'dd-mm-yyyy'), to_date('19-01-2017', 'dd-mm-yyyy'), 61822, 26944, 35179913);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31197, to_date('02-03-2015', 'dd-mm-yyyy'), to_date('15-11-2001', 'dd-mm-yyyy'), 14979, 23484, 39846413);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66397, to_date('28-11-2011', 'dd-mm-yyyy'), to_date('30-05-2011', 'dd-mm-yyyy'), 47433, 52399, 37644767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35844, to_date('30-03-2009', 'dd-mm-yyyy'), to_date('05-11-2015', 'dd-mm-yyyy'), 34855, 31194, 72528849);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53498, to_date('08-10-2015', 'dd-mm-yyyy'), to_date('10-12-2006', 'dd-mm-yyyy'), 39997, 36383, 59282125);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26444, to_date('13-06-2001', 'dd-mm-yyyy'), to_date('12-10-2010', 'dd-mm-yyyy'), 86947, 74937, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33748, to_date('06-10-2003', 'dd-mm-yyyy'), to_date('04-03-2005', 'dd-mm-yyyy'), 8273, 34594, 14973237);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37759, to_date('31-07-2019', 'dd-mm-yyyy'), to_date('02-10-2006', 'dd-mm-yyyy'), 12790, 65285, 81269834);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74746, to_date('01-11-2001', 'dd-mm-yyyy'), to_date('27-03-2019', 'dd-mm-yyyy'), 60246, 78735, 95554736);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53588, to_date('06-05-2002', 'dd-mm-yyyy'), to_date('25-11-2015', 'dd-mm-yyyy'), 34937, 99835, 51645252);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94934, to_date('24-05-2003', 'dd-mm-yyyy'), to_date('12-04-2008', 'dd-mm-yyyy'), 18865, 59143, 78341231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71493, to_date('14-03-2010', 'dd-mm-yyyy'), to_date('16-03-2003', 'dd-mm-yyyy'), 73396, 65285, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28359, to_date('19-12-2001', 'dd-mm-yyyy'), to_date('18-12-2007', 'dd-mm-yyyy'), 19512, 34594, 57637489);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33373, to_date('30-12-2000', 'dd-mm-yyyy'), to_date('03-07-2002', 'dd-mm-yyyy'), 42551, 12389, 52349614);
commit;
prompt 1100 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67859, to_date('15-09-2019', 'dd-mm-yyyy'), to_date('27-01-2009', 'dd-mm-yyyy'), 62428, 76821, 34887941);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18136, to_date('19-07-2007', 'dd-mm-yyyy'), to_date('15-12-2015', 'dd-mm-yyyy'), 96385, 88239, 49968778);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84216, to_date('14-05-2005', 'dd-mm-yyyy'), to_date('10-10-2002', 'dd-mm-yyyy'), 7488, 43839, 32878338);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88833, to_date('11-05-2005', 'dd-mm-yyyy'), to_date('07-06-2002', 'dd-mm-yyyy'), 81755, 97261, 87811817);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51179, to_date('12-10-2005', 'dd-mm-yyyy'), to_date('05-12-2006', 'dd-mm-yyyy'), 95282, 97261, 87467891);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37848, to_date('14-02-2003', 'dd-mm-yyyy'), to_date('17-08-2013', 'dd-mm-yyyy'), 94974, 69417, 113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29578, to_date('09-11-2011', 'dd-mm-yyyy'), to_date('26-06-2019', 'dd-mm-yyyy'), 97184, 59143, 32643411);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99565, to_date('19-09-2011', 'dd-mm-yyyy'), to_date('09-10-2016', 'dd-mm-yyyy'), 59148, 76821, 97635136);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71915, to_date('27-08-2019', 'dd-mm-yyyy'), to_date('14-12-2017', 'dd-mm-yyyy'), 81456, 99835, 21326952);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72146, to_date('21-10-2014', 'dd-mm-yyyy'), to_date('21-04-2019', 'dd-mm-yyyy'), 43362, 47969, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65853, to_date('23-02-2012', 'dd-mm-yyyy'), to_date('27-05-2003', 'dd-mm-yyyy'), 99297, 18581, 85648914);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81659, to_date('18-04-2006', 'dd-mm-yyyy'), to_date('09-11-2002', 'dd-mm-yyyy'), 69332, 97911, 81269834);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74657, to_date('02-08-2013', 'dd-mm-yyyy'), to_date('03-07-2008', 'dd-mm-yyyy'), 96816, 6, 29818936);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66724, to_date('29-03-2018', 'dd-mm-yyyy'), to_date('05-06-2019', 'dd-mm-yyyy'), 80642, 79115, 92681188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59762, to_date('04-09-2016', 'dd-mm-yyyy'), to_date('20-07-2015', 'dd-mm-yyyy'), 74121, 71864, 69923664);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23652, to_date('03-12-2004', 'dd-mm-yyyy'), to_date('30-07-2009', 'dd-mm-yyyy'), 64794, 95296, 61959199);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94182, to_date('12-12-2007', 'dd-mm-yyyy'), to_date('09-07-2008', 'dd-mm-yyyy'), 48731, 49477, 44142435);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13341, to_date('07-04-2000', 'dd-mm-yyyy'), to_date('10-01-2000', 'dd-mm-yyyy'), 28266, 44258, 31839511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16852, to_date('04-01-2007', 'dd-mm-yyyy'), to_date('06-08-2010', 'dd-mm-yyyy'), 57256, 87483, 23965441);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96677, to_date('28-09-2004', 'dd-mm-yyyy'), to_date('06-01-2020', 'dd-mm-yyyy'), 73751, 19848, 11);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26138, to_date('20-08-2019', 'dd-mm-yyyy'), to_date('26-08-2005', 'dd-mm-yyyy'), 27888, 98974, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34154, to_date('11-06-2008', 'dd-mm-yyyy'), to_date('29-03-2005', 'dd-mm-yyyy'), 13649, 82688, 72528849);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92164, to_date('13-10-2019', 'dd-mm-yyyy'), to_date('07-09-2004', 'dd-mm-yyyy'), 53374, 31194, 23965441);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98414, to_date('08-01-2016', 'dd-mm-yyyy'), to_date('08-05-2005', 'dd-mm-yyyy'), 13907, 57325, 23965441);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14625, to_date('22-01-2018', 'dd-mm-yyyy'), to_date('19-03-2019', 'dd-mm-yyyy'), 92999, 77992, 97635136);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13147, to_date('08-08-2007', 'dd-mm-yyyy'), to_date('28-02-2008', 'dd-mm-yyyy'), 37672, 65285, 63832548);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83637, to_date('26-03-2006', 'dd-mm-yyyy'), to_date('11-01-2003', 'dd-mm-yyyy'), 16966, 82688, 33456381);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (86438, to_date('18-12-2005', 'dd-mm-yyyy'), to_date('24-02-2001', 'dd-mm-yyyy'), 59981, 43839, 49968778);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87569, to_date('21-09-2013', 'dd-mm-yyyy'), to_date('11-12-2017', 'dd-mm-yyyy'), 22479, 19848, 91322455);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34682, to_date('25-06-2005', 'dd-mm-yyyy'), to_date('22-12-2013', 'dd-mm-yyyy'), 37299, 15868, 52682627);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21832, to_date('17-04-2013', 'dd-mm-yyyy'), to_date('29-04-2002', 'dd-mm-yyyy'), 95435, 19848, 9);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17692, to_date('05-09-2006', 'dd-mm-yyyy'), to_date('22-11-2016', 'dd-mm-yyyy'), 60781, 51926, 33496191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15513, to_date('19-04-2006', 'dd-mm-yyyy'), to_date('06-08-2017', 'dd-mm-yyyy'), 83972, 31194, 25172694);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13592, to_date('05-06-2006', 'dd-mm-yyyy'), to_date('15-06-2017', 'dd-mm-yyyy'), 42454, 97911, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (12886, to_date('20-03-2014', 'dd-mm-yyyy'), to_date('01-01-2005', 'dd-mm-yyyy'), 11985, 31194, 79853819);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27147, to_date('03-02-2009', 'dd-mm-yyyy'), to_date('09-11-2009', 'dd-mm-yyyy'), 55562, 19848, 51683638);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13193, to_date('02-05-2002', 'dd-mm-yyyy'), to_date('23-04-2001', 'dd-mm-yyyy'), 18125, 95296, 96644292);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47324, to_date('21-02-2003', 'dd-mm-yyyy'), to_date('21-09-2003', 'dd-mm-yyyy'), 14911, 96931, 48138574);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19359, to_date('22-10-2018', 'dd-mm-yyyy'), to_date('02-04-2003', 'dd-mm-yyyy'), 94974, 65682, 69864674);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79591, to_date('15-01-2000', 'dd-mm-yyyy'), to_date('23-04-2007', 'dd-mm-yyyy'), 14627, 65285, 68367174);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17329, to_date('26-06-2018', 'dd-mm-yyyy'), to_date('31-10-2019', 'dd-mm-yyyy'), 37599, 23484, 49248963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44861, to_date('01-07-2006', 'dd-mm-yyyy'), to_date('05-05-2013', 'dd-mm-yyyy'), 79615, 48137, 59282125);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96956, to_date('05-03-2001', 'dd-mm-yyyy'), to_date('20-11-2016', 'dd-mm-yyyy'), 96311, 19291, 1);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49155, to_date('27-04-2016', 'dd-mm-yyyy'), to_date('31-12-2019', 'dd-mm-yyyy'), 56071, 98599, 46263931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14861, to_date('22-04-2007', 'dd-mm-yyyy'), to_date('29-06-2009', 'dd-mm-yyyy'), 67184, 37792, 62365835);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69957, to_date('07-06-2008', 'dd-mm-yyyy'), to_date('23-09-2019', 'dd-mm-yyyy'), 53215, 49477, 52682627);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22361, to_date('30-01-2002', 'dd-mm-yyyy'), to_date('11-01-2017', 'dd-mm-yyyy'), 79594, 49732, 69359165);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27174, to_date('21-11-2005', 'dd-mm-yyyy'), to_date('17-12-2019', 'dd-mm-yyyy'), 56622, 22231, 89253324);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36427, to_date('22-08-2020', 'dd-mm-yyyy'), to_date('02-02-2000', 'dd-mm-yyyy'), 58253, 77497, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84684, to_date('18-11-2003', 'dd-mm-yyyy'), to_date('09-11-2017', 'dd-mm-yyyy'), 77434, 45211, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26411, to_date('29-10-2006', 'dd-mm-yyyy'), to_date('24-07-2008', 'dd-mm-yyyy'), 33408, 8, 58987191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53889, to_date('27-01-2000', 'dd-mm-yyyy'), to_date('27-08-2003', 'dd-mm-yyyy'), 17127, 49347, 97635136);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89148, to_date('10-07-2001', 'dd-mm-yyyy'), to_date('20-06-2019', 'dd-mm-yyyy'), 16192, 93474, 59238419);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82971, to_date('14-10-2008', 'dd-mm-yyyy'), to_date('20-04-2009', 'dd-mm-yyyy'), 48574, 18581, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29997, to_date('19-09-2018', 'dd-mm-yyyy'), to_date('14-06-2019', 'dd-mm-yyyy'), 76548, 47969, 46879551);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22871, to_date('07-11-2008', 'dd-mm-yyyy'), to_date('21-05-2014', 'dd-mm-yyyy'), 99181, 78735, 52131513);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53574, to_date('09-09-2002', 'dd-mm-yyyy'), to_date('03-01-2010', 'dd-mm-yyyy'), 15071, 42865, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (77683, to_date('01-03-2011', 'dd-mm-yyyy'), to_date('28-07-2009', 'dd-mm-yyyy'), 18751, 67788, 36283787);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29588, to_date('27-01-2013', 'dd-mm-yyyy'), to_date('02-11-2017', 'dd-mm-yyyy'), 54143, 54343, 63286759);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44259, to_date('21-03-2017', 'dd-mm-yyyy'), to_date('24-01-2019', 'dd-mm-yyyy'), 36539, 58234, 69828852);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58572, to_date('11-08-2012', 'dd-mm-yyyy'), to_date('18-11-2008', 'dd-mm-yyyy'), 92359, 99923, 61167848);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62223, to_date('26-03-2002', 'dd-mm-yyyy'), to_date('09-10-2014', 'dd-mm-yyyy'), 48522, 55519, 61523464);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81476, to_date('02-11-2002', 'dd-mm-yyyy'), to_date('19-12-2008', 'dd-mm-yyyy'), 58465, 9, 21326952);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24347, to_date('30-07-2019', 'dd-mm-yyyy'), to_date('02-04-2017', 'dd-mm-yyyy'), 54244, 83871, 56777364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32339, to_date('15-02-2019', 'dd-mm-yyyy'), to_date('13-02-2004', 'dd-mm-yyyy'), 43835, 96248, 34781111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19618, to_date('13-08-2003', 'dd-mm-yyyy'), to_date('22-07-2011', 'dd-mm-yyyy'), 33523, 79115, 48138574);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11747, to_date('11-09-2005', 'dd-mm-yyyy'), to_date('01-12-2017', 'dd-mm-yyyy'), 81456, 9, 65121925);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87424, to_date('26-03-2008', 'dd-mm-yyyy'), to_date('19-07-2004', 'dd-mm-yyyy'), 64561, 65285, 45585767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56565, to_date('09-08-2016', 'dd-mm-yyyy'), to_date('04-07-2012', 'dd-mm-yyyy'), 24723, 99923, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17197, to_date('04-08-2006', 'dd-mm-yyyy'), to_date('31-05-2009', 'dd-mm-yyyy'), 57161, 15868, 82243612);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63487, to_date('20-10-2017', 'dd-mm-yyyy'), to_date('18-02-2000', 'dd-mm-yyyy'), 67113, 25287, 17);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (73381, to_date('03-12-2020', 'dd-mm-yyyy'), to_date('11-04-2000', 'dd-mm-yyyy'), 96385, 52399, 15975426);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18313, to_date('17-09-2019', 'dd-mm-yyyy'), to_date('13-04-2001', 'dd-mm-yyyy'), 34367, 83871, 58819249);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76944, to_date('28-05-2012', 'dd-mm-yyyy'), to_date('12-04-2011', 'dd-mm-yyyy'), 19557, 17339, 81477344);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25535, to_date('14-01-2015', 'dd-mm-yyyy'), to_date('24-10-2015', 'dd-mm-yyyy'), 48441, 55519, 46151364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82856, to_date('29-05-2016', 'dd-mm-yyyy'), to_date('21-06-2013', 'dd-mm-yyyy'), 92448, 79912, 54515892);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71376, to_date('01-09-2020', 'dd-mm-yyyy'), to_date('29-08-2010', 'dd-mm-yyyy'), 12173, 49477, 57471452);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83477, to_date('30-08-2005', 'dd-mm-yyyy'), to_date('24-05-2006', 'dd-mm-yyyy'), 35113, 76821, 38469744);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59137, to_date('11-11-2002', 'dd-mm-yyyy'), to_date('13-01-2017', 'dd-mm-yyyy'), 85118, 98482, 1);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27869, to_date('24-02-2019', 'dd-mm-yyyy'), to_date('10-03-2010', 'dd-mm-yyyy'), 25764, 6, 72628196);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14297, to_date('29-02-2016', 'dd-mm-yyyy'), to_date('19-02-2015', 'dd-mm-yyyy'), 34491, 36148, 63315843);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93929, to_date('06-10-2007', 'dd-mm-yyyy'), to_date('29-07-2006', 'dd-mm-yyyy'), 19672, 36383, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18973, to_date('10-09-2009', 'dd-mm-yyyy'), to_date('16-10-2003', 'dd-mm-yyyy'), 14878, 23932, 87467891);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13373, to_date('08-01-2008', 'dd-mm-yyyy'), to_date('23-02-2008', 'dd-mm-yyyy'), 44322, 98974, 64525236);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72873, to_date('01-10-2019', 'dd-mm-yyyy'), to_date('25-08-2006', 'dd-mm-yyyy'), 11593, 26284, 57985566);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84569, to_date('29-05-2000', 'dd-mm-yyyy'), to_date('14-09-2020', 'dd-mm-yyyy'), 71347, 49347, 2);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (49581, to_date('15-11-2002', 'dd-mm-yyyy'), to_date('25-09-2002', 'dd-mm-yyyy'), 67117, 12389, 61134559);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32644, to_date('08-02-2011', 'dd-mm-yyyy'), to_date('20-08-2004', 'dd-mm-yyyy'), 78708, 79784, 71944274);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (23858, to_date('04-11-2017', 'dd-mm-yyyy'), to_date('07-07-2005', 'dd-mm-yyyy'), 19061, 49477, 71513138);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17349, to_date('06-03-2013', 'dd-mm-yyyy'), to_date('31-07-2009', 'dd-mm-yyyy'), 15917, 7, 46134653);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59674, to_date('11-03-2000', 'dd-mm-yyyy'), to_date('26-10-2015', 'dd-mm-yyyy'), 39795, 88239, 33512225);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58162, to_date('14-07-2007', 'dd-mm-yyyy'), to_date('19-10-2010', 'dd-mm-yyyy'), 55461, 49477, 1);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72536, to_date('13-04-2016', 'dd-mm-yyyy'), to_date('17-03-2020', 'dd-mm-yyyy'), 68672, 81766, 63722518);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89343, to_date('23-02-2018', 'dd-mm-yyyy'), to_date('02-02-2010', 'dd-mm-yyyy'), 18139, 26944, 3);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89542, to_date('21-12-2019', 'dd-mm-yyyy'), to_date('13-09-2001', 'dd-mm-yyyy'), 68856, 91753, 112);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19883, to_date('29-05-2014', 'dd-mm-yyyy'), to_date('24-02-2003', 'dd-mm-yyyy'), 12791, 69417, 69359165);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36911, to_date('08-06-2009', 'dd-mm-yyyy'), to_date('30-11-2018', 'dd-mm-yyyy'), 26052, 67788, 78538649);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94948, to_date('04-08-2009', 'dd-mm-yyyy'), to_date('25-08-2008', 'dd-mm-yyyy'), 19061, 69417, 81225789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24269, to_date('13-09-2016', 'dd-mm-yyyy'), to_date('26-12-2015', 'dd-mm-yyyy'), 34367, 48137, 83623371);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94753, to_date('08-10-2001', 'dd-mm-yyyy'), to_date('28-06-2002', 'dd-mm-yyyy'), 94426, 33256, 73143256);
commit;
prompt 1200 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34165, to_date('18-11-2018', 'dd-mm-yyyy'), to_date('08-12-2017', 'dd-mm-yyyy'), 79921, 39662, 72528849);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27418, to_date('25-09-2016', 'dd-mm-yyyy'), to_date('02-01-2005', 'dd-mm-yyyy'), 27522, 54343, 31839511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18626, to_date('05-04-2012', 'dd-mm-yyyy'), to_date('04-04-2006', 'dd-mm-yyyy'), 19877, 82688, 27638892);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58769, to_date('23-08-2013', 'dd-mm-yyyy'), to_date('24-01-2007', 'dd-mm-yyyy'), 96941, 99923, 6);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41695, to_date('24-08-2012', 'dd-mm-yyyy'), to_date('22-11-2013', 'dd-mm-yyyy'), 92855, 49757, 55689777);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99471, to_date('28-07-2007', 'dd-mm-yyyy'), to_date('25-04-2014', 'dd-mm-yyyy'), 71718, 88239, 69923664);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21836, to_date('07-09-2002', 'dd-mm-yyyy'), to_date('13-12-2017', 'dd-mm-yyyy'), 65997, 51926, 88875579);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (46135, to_date('14-02-2012', 'dd-mm-yyyy'), to_date('26-01-2011', 'dd-mm-yyyy'), 53378, 42865, 53199867);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84697, to_date('07-01-2020', 'dd-mm-yyyy'), to_date('25-09-2011', 'dd-mm-yyyy'), 13943, 9, 49968778);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59581, to_date('02-10-2019', 'dd-mm-yyyy'), to_date('19-07-2007', 'dd-mm-yyyy'), 93211, 98974, 79115231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41874, to_date('03-07-2018', 'dd-mm-yyyy'), to_date('03-01-2013', 'dd-mm-yyyy'), 35772, 23932, 39853517);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95651, to_date('18-07-2011', 'dd-mm-yyyy'), to_date('19-06-2003', 'dd-mm-yyyy'), 22161, 25287, 22999597);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72166, to_date('20-11-2000', 'dd-mm-yyyy'), to_date('20-07-2001', 'dd-mm-yyyy'), 18795, 69376, 93667714);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61714, to_date('11-04-2012', 'dd-mm-yyyy'), to_date('13-03-2007', 'dd-mm-yyyy'), 13985, 49477, 61134559);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21275, to_date('01-06-2020', 'dd-mm-yyyy'), to_date('01-12-2015', 'dd-mm-yyyy'), 68873, 58234, 89611861);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92951, to_date('06-05-2019', 'dd-mm-yyyy'), to_date('18-01-2016', 'dd-mm-yyyy'), 58666, 37416, 14813658);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39983, to_date('27-09-2006', 'dd-mm-yyyy'), to_date('16-08-2007', 'dd-mm-yyyy'), 86989, 31194, 57985566);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71578, to_date('05-06-2015', 'dd-mm-yyyy'), to_date('31-08-2005', 'dd-mm-yyyy'), 15759, 66693, 97635136);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87857, to_date('30-11-2004', 'dd-mm-yyyy'), to_date('07-11-2005', 'dd-mm-yyyy'), 92999, 49347, 47127676);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (47289, to_date('06-08-2010', 'dd-mm-yyyy'), to_date('25-08-2012', 'dd-mm-yyyy'), 41221, 98482, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92162, to_date('18-08-2007', 'dd-mm-yyyy'), to_date('02-05-2015', 'dd-mm-yyyy'), 14899, 96931, 29415222);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94685, to_date('13-04-2005', 'dd-mm-yyyy'), to_date('15-06-2013', 'dd-mm-yyyy'), 34579, 37652, 67189854);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38834, to_date('18-03-2006', 'dd-mm-yyyy'), to_date('18-08-2007', 'dd-mm-yyyy'), 84125, 66693, 45585767);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17269, to_date('21-01-2004', 'dd-mm-yyyy'), to_date('07-06-2001', 'dd-mm-yyyy'), 99181, 74937, 97895962);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53657, to_date('29-10-2015', 'dd-mm-yyyy'), to_date('29-06-2014', 'dd-mm-yyyy'), 14278, 59143, 35179913);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78714, to_date('10-03-2015', 'dd-mm-yyyy'), to_date('20-04-2002', 'dd-mm-yyyy'), 67189, 74937, 95279333);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21614, to_date('25-04-2013', 'dd-mm-yyyy'), to_date('01-01-2010', 'dd-mm-yyyy'), 70927, 23798, 25172694);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39865, to_date('28-04-2008', 'dd-mm-yyyy'), to_date('02-12-2002', 'dd-mm-yyyy'), 87578, 8, 72774815);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48927, to_date('27-06-2005', 'dd-mm-yyyy'), to_date('28-12-2003', 'dd-mm-yyyy'), 14939, 77992, 52682627);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87396, to_date('26-09-2003', 'dd-mm-yyyy'), to_date('17-01-2013', 'dd-mm-yyyy'), 94254, 51926, 96766481);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81725, to_date('26-12-2010', 'dd-mm-yyyy'), to_date('01-04-2018', 'dd-mm-yyyy'), 19182, 49477, 57396459);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36318, to_date('05-06-2005', 'dd-mm-yyyy'), to_date('06-04-2018', 'dd-mm-yyyy'), 94977, 15868, 38815826);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17163, to_date('14-01-2017', 'dd-mm-yyyy'), to_date('30-04-2000', 'dd-mm-yyyy'), 84649, 29621, 84312545);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72517, to_date('19-07-2020', 'dd-mm-yyyy'), to_date('23-06-2007', 'dd-mm-yyyy'), 86966, 48819, 24472763);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22311, to_date('15-10-2019', 'dd-mm-yyyy'), to_date('01-01-2008', 'dd-mm-yyyy'), 15322, 67788, 26512429);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35658, to_date('06-11-2013', 'dd-mm-yyyy'), to_date('11-09-2011', 'dd-mm-yyyy'), 23382, 12389, 111);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35741, to_date('14-12-2009', 'dd-mm-yyyy'), to_date('14-08-2015', 'dd-mm-yyyy'), 44938, 74937, 62894113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17121, to_date('16-03-2008', 'dd-mm-yyyy'), to_date('25-12-2011', 'dd-mm-yyyy'), 42526, 42865, 62894113);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (96721, to_date('14-01-2002', 'dd-mm-yyyy'), to_date('31-12-2000', 'dd-mm-yyyy'), 74936, 84241, 71944274);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93989, to_date('14-05-2001', 'dd-mm-yyyy'), to_date('29-09-2020', 'dd-mm-yyyy'), 79424, 67788, 46134653);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31273, to_date('15-05-2000', 'dd-mm-yyyy'), to_date('03-08-2010', 'dd-mm-yyyy'), 81281, 79115, 81225789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (31647, to_date('03-07-2004', 'dd-mm-yyyy'), to_date('27-10-2015', 'dd-mm-yyyy'), 37599, 99835, 22788535);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92842, to_date('05-08-2010', 'dd-mm-yyyy'), to_date('30-11-2010', 'dd-mm-yyyy'), 71886, 83871, 17937991);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88483, to_date('18-03-2009', 'dd-mm-yyyy'), to_date('31-12-2020', 'dd-mm-yyyy'), 15322, 79784, 14973237);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36589, to_date('09-07-2000', 'dd-mm-yyyy'), to_date('18-09-2011', 'dd-mm-yyyy'), 18597, 42865, 16);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21923, to_date('02-01-2010', 'dd-mm-yyyy'), to_date('26-11-2001', 'dd-mm-yyyy'), 94452, 69376, 87467891);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52566, to_date('24-05-2013', 'dd-mm-yyyy'), to_date('19-03-2006', 'dd-mm-yyyy'), 18503, 65567, 81477344);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95974, to_date('09-07-2004', 'dd-mm-yyyy'), to_date('11-06-2007', 'dd-mm-yyyy'), 77628, 74937, 38789282);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15492, to_date('12-12-2011', 'dd-mm-yyyy'), to_date('13-05-2014', 'dd-mm-yyyy'), 36255, 69376, 37874639);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14913, to_date('28-11-2003', 'dd-mm-yyyy'), to_date('05-03-2005', 'dd-mm-yyyy'), 63737, 68695, 49937262);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67355, to_date('14-11-2002', 'dd-mm-yyyy'), to_date('15-02-2016', 'dd-mm-yyyy'), 92727, 58234, 31839511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33418, to_date('21-02-2007', 'dd-mm-yyyy'), to_date('12-05-2019', 'dd-mm-yyyy'), 96161, 58234, 81316259);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (76634, to_date('19-07-2009', 'dd-mm-yyyy'), to_date('10-01-2008', 'dd-mm-yyyy'), 28266, 82839, 18);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88932, to_date('01-04-2003', 'dd-mm-yyyy'), to_date('09-07-2009', 'dd-mm-yyyy'), 42575, 73237, 63151798);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16315, to_date('23-02-2012', 'dd-mm-yyyy'), to_date('16-08-2001', 'dd-mm-yyyy'), 15917, 9, 15924254);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44267, to_date('12-09-2007', 'dd-mm-yyyy'), to_date('10-10-2003', 'dd-mm-yyyy'), 61113, 71864, 14973237);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36747, to_date('14-06-2000', 'dd-mm-yyyy'), to_date('06-08-2018', 'dd-mm-yyyy'), 74835, 57325, 77165484);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (73268, to_date('20-05-2018', 'dd-mm-yyyy'), to_date('10-04-2019', 'dd-mm-yyyy'), 97445, 98482, 77737128);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48198, to_date('17-01-2017', 'dd-mm-yyyy'), to_date('11-07-2016', 'dd-mm-yyyy'), 11593, 19291, 11495212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42327, to_date('04-01-2013', 'dd-mm-yyyy'), to_date('29-06-2000', 'dd-mm-yyyy'), 48765, 6, 96644292);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (25589, to_date('03-09-2010', 'dd-mm-yyyy'), to_date('23-09-2020', 'dd-mm-yyyy'), 79594, 68695, 54442487);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67982, to_date('21-10-2009', 'dd-mm-yyyy'), to_date('05-04-2011', 'dd-mm-yyyy'), 46033, 8, 56777364);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (72777, to_date('03-12-2017', 'dd-mm-yyyy'), to_date('02-08-2007', 'dd-mm-yyyy'), 96636, 42865, 17);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11954, to_date('23-10-2008', 'dd-mm-yyyy'), to_date('06-09-2018', 'dd-mm-yyyy'), 92662, 32374, 66169498);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97671, to_date('03-08-2020', 'dd-mm-yyyy'), to_date('31-03-2014', 'dd-mm-yyyy'), 68755, 98599, 48986472);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (44371, to_date('08-04-2014', 'dd-mm-yyyy'), to_date('03-06-2019', 'dd-mm-yyyy'), 15678, 63711, 37252525);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (34644, to_date('17-04-2007', 'dd-mm-yyyy'), to_date('17-09-2009', 'dd-mm-yyyy'), 48695, 57325, 14438592);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63947, to_date('07-10-2007', 'dd-mm-yyyy'), to_date('30-12-2003', 'dd-mm-yyyy'), 13548, 49477, 49296536);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (87828, to_date('03-04-2017', 'dd-mm-yyyy'), to_date('12-08-2012', 'dd-mm-yyyy'), 25969, 87483, 54442487);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53725, to_date('21-03-2020', 'dd-mm-yyyy'), to_date('24-12-2015', 'dd-mm-yyyy'), 56162, 83871, 32643411);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88848, to_date('19-04-2012', 'dd-mm-yyyy'), to_date('21-03-2001', 'dd-mm-yyyy'), 79921, 18581, 84411282);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (42789, to_date('29-10-2014', 'dd-mm-yyyy'), to_date('27-04-2001', 'dd-mm-yyyy'), 36852, 6, 14186931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81827, to_date('28-06-2016', 'dd-mm-yyyy'), to_date('26-06-2006', 'dd-mm-yyyy'), 15734, 57325, 23769387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35642, to_date('21-07-2012', 'dd-mm-yyyy'), to_date('11-03-2009', 'dd-mm-yyyy'), 65950, 29621, 78538649);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63863, to_date('16-12-2001', 'dd-mm-yyyy'), to_date('25-02-2007', 'dd-mm-yyyy'), 85589, 36148, 49248963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62514, to_date('13-11-2014', 'dd-mm-yyyy'), to_date('07-01-2009', 'dd-mm-yyyy'), 93917, 17339, 46134653);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (93584, to_date('25-10-2012', 'dd-mm-yyyy'), to_date('13-04-2007', 'dd-mm-yyyy'), 35751, 98974, 14813658);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98816, to_date('01-09-2018', 'dd-mm-yyyy'), to_date('23-08-2000', 'dd-mm-yyyy'), 62148, 32374, 65918254);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61212, to_date('02-04-2016', 'dd-mm-yyyy'), to_date('24-08-2009', 'dd-mm-yyyy'), 56622, 45211, 25595898);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (71369, to_date('06-09-2003', 'dd-mm-yyyy'), to_date('09-10-2007', 'dd-mm-yyyy'), 74413, 84241, 85648914);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (28491, to_date('04-03-2004', 'dd-mm-yyyy'), to_date('18-11-2002', 'dd-mm-yyyy'), 55562, 52399, 18248815);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83842, to_date('29-10-2008', 'dd-mm-yyyy'), to_date('14-02-2012', 'dd-mm-yyyy'), 17255, 66121, 71513138);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22248, to_date('02-01-2013', 'dd-mm-yyyy'), to_date('24-05-2001', 'dd-mm-yyyy'), 55691, 44258, 58819249);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66211, to_date('23-03-2020', 'dd-mm-yyyy'), to_date('22-12-2016', 'dd-mm-yyyy'), 58496, 77497, 44142435);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14124, to_date('25-06-2007', 'dd-mm-yyyy'), to_date('29-04-2014', 'dd-mm-yyyy'), 63763, 79115, 97895962);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (61765, to_date('16-11-2007', 'dd-mm-yyyy'), to_date('09-01-2014', 'dd-mm-yyyy'), 59244, 95296, 95994968);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95265, to_date('03-08-2020', 'dd-mm-yyyy'), to_date('20-02-2014', 'dd-mm-yyyy'), 22449, 83126, 97359492);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (68278, to_date('28-03-2012', 'dd-mm-yyyy'), to_date('12-09-2010', 'dd-mm-yyyy'), 32531, 32932, 96766481);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37821, to_date('22-12-2001', 'dd-mm-yyyy'), to_date('08-08-2001', 'dd-mm-yyyy'), 31991, 7, 47659666);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58546, to_date('15-03-2019', 'dd-mm-yyyy'), to_date('18-05-2007', 'dd-mm-yyyy'), 43464, 49732, 58747241);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (94552, to_date('11-06-2008', 'dd-mm-yyyy'), to_date('29-03-2017', 'dd-mm-yyyy'), 34630, 23484, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17276, to_date('18-02-2018', 'dd-mm-yyyy'), to_date('15-03-2008', 'dd-mm-yyyy'), 36532, 99923, 62232168);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (91651, to_date('28-05-2010', 'dd-mm-yyyy'), to_date('07-07-2017', 'dd-mm-yyyy'), 54665, 23798, 16285986);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78387, to_date('27-01-2013', 'dd-mm-yyyy'), to_date('14-05-2007', 'dd-mm-yyyy'), 26824, 47969, 93667714);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (88819, to_date('22-05-2000', 'dd-mm-yyyy'), to_date('27-04-2001', 'dd-mm-yyyy'), 11579, 32932, 91944651);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65498, to_date('21-03-2014', 'dd-mm-yyyy'), to_date('15-01-2003', 'dd-mm-yyyy'), 83361, 98599, 18789792);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84532, to_date('27-12-2002', 'dd-mm-yyyy'), to_date('29-07-2000', 'dd-mm-yyyy'), 57653, 8, 84881439);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95879, to_date('01-04-2000', 'dd-mm-yyyy'), to_date('16-06-2012', 'dd-mm-yyyy'), 54561, 31194, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37445, to_date('13-10-2010', 'dd-mm-yyyy'), to_date('11-12-2015', 'dd-mm-yyyy'), 92866, 37652, 71546176);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95876, to_date('21-03-2015', 'dd-mm-yyyy'), to_date('06-09-2003', 'dd-mm-yyyy'), 37355, 11784, 18248815);
commit;
prompt 1300 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (48593, to_date('22-03-2002', 'dd-mm-yyyy'), to_date('29-12-2004', 'dd-mm-yyyy'), 43835, 49477, 55592359);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66337, to_date('04-12-2001', 'dd-mm-yyyy'), to_date('01-02-2001', 'dd-mm-yyyy'), 76134, 69376, 14813658);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (62142, to_date('11-06-2013', 'dd-mm-yyyy'), to_date('15-05-2014', 'dd-mm-yyyy'), 85786, 98599, 38789282);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67631, to_date('17-02-2008', 'dd-mm-yyyy'), to_date('22-09-2017', 'dd-mm-yyyy'), 89246, 32932, 99513467);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (37285, to_date('27-06-2010', 'dd-mm-yyyy'), to_date('13-09-2006', 'dd-mm-yyyy'), 76234, 12389, 56194188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53846, to_date('18-12-2020', 'dd-mm-yyyy'), to_date('20-11-2018', 'dd-mm-yyyy'), 35233, 49347, 84456489);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52587, to_date('13-06-2006', 'dd-mm-yyyy'), to_date('20-05-2009', 'dd-mm-yyyy'), 32262, 88239, 52682627);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16681, to_date('12-05-2013', 'dd-mm-yyyy'), to_date('08-09-2000', 'dd-mm-yyyy'), 14331, 76821, 97635136);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35556, to_date('21-06-2012', 'dd-mm-yyyy'), to_date('17-06-2020', 'dd-mm-yyyy'), 91778, 98599, 84312545);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95896, to_date('20-06-2014', 'dd-mm-yyyy'), to_date('25-06-2020', 'dd-mm-yyyy'), 61253, 34594, 91322455);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58269, to_date('05-09-2004', 'dd-mm-yyyy'), to_date('05-03-2015', 'dd-mm-yyyy'), 16986, 49757, 69864674);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67692, to_date('19-03-2000', 'dd-mm-yyyy'), to_date('27-04-2000', 'dd-mm-yyyy'), 16986, 48819, 35317388);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (58644, to_date('23-05-2010', 'dd-mm-yyyy'), to_date('07-01-2003', 'dd-mm-yyyy'), 62825, 34594, 59526612);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99659, to_date('27-08-2014', 'dd-mm-yyyy'), to_date('18-11-2011', 'dd-mm-yyyy'), 16966, 11784, 72118325);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (43858, to_date('27-03-2002', 'dd-mm-yyyy'), to_date('08-04-2006', 'dd-mm-yyyy'), 37406, 11784, 87814169);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (74413, to_date('26-08-2013', 'dd-mm-yyyy'), to_date('07-07-2013', 'dd-mm-yyyy'), 3856, 9, 44849415);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (66726, to_date('18-01-2008', 'dd-mm-yyyy'), to_date('07-05-2004', 'dd-mm-yyyy'), 17255, 26284, 21146846);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (27854, to_date('15-01-2020', 'dd-mm-yyyy'), to_date('17-05-2010', 'dd-mm-yyyy'), 88363, 32932, 91922595);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35125, to_date('12-08-2009', 'dd-mm-yyyy'), to_date('20-07-2019', 'dd-mm-yyyy'), 97676, 43839, 54539963);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53988, to_date('22-05-2008', 'dd-mm-yyyy'), to_date('01-10-2017', 'dd-mm-yyyy'), 99181, 29621, 12684866);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83617, to_date('04-09-2006', 'dd-mm-yyyy'), to_date('30-11-2020', 'dd-mm-yyyy'), 34141, 44258, 91922595);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (35286, to_date('05-12-2013', 'dd-mm-yyyy'), to_date('19-01-2011', 'dd-mm-yyyy'), 51268, 8, 81225789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (51792, to_date('28-09-2018', 'dd-mm-yyyy'), to_date('24-04-2000', 'dd-mm-yyyy'), 65779, 24794, 38815826);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (98282, to_date('23-04-2020', 'dd-mm-yyyy'), to_date('17-02-2009', 'dd-mm-yyyy'), 51268, 87483, 97895962);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17595, to_date('16-08-2012', 'dd-mm-yyyy'), to_date('12-01-2013', 'dd-mm-yyyy'), 67113, 65285, 57985566);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32172, to_date('27-03-2005', 'dd-mm-yyyy'), to_date('31-10-2001', 'dd-mm-yyyy'), 49877, 23798, 4);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39932, to_date('13-10-2000', 'dd-mm-yyyy'), to_date('29-05-2001', 'dd-mm-yyyy'), 77623, 52399, 76237121);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11148, to_date('03-03-2003', 'dd-mm-yyyy'), to_date('17-12-2004', 'dd-mm-yyyy'), 71344, 37652, 83623371);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16786, to_date('29-10-2014', 'dd-mm-yyyy'), to_date('16-04-2002', 'dd-mm-yyyy'), 69415, 59143, 81477344);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78494, to_date('08-08-2007', 'dd-mm-yyyy'), to_date('04-02-2006', 'dd-mm-yyyy'), 76583, 76821, 21377498);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52789, to_date('19-10-2020', 'dd-mm-yyyy'), to_date('04-06-2000', 'dd-mm-yyyy'), 34630, 78735, 67725578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38878, to_date('20-08-2002', 'dd-mm-yyyy'), to_date('22-11-2010', 'dd-mm-yyyy'), 12274, 15868, 95279333);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22366, to_date('08-02-2016', 'dd-mm-yyyy'), to_date('02-01-2018', 'dd-mm-yyyy'), 97445, 49732, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85453, to_date('01-11-2019', 'dd-mm-yyyy'), to_date('05-11-2005', 'dd-mm-yyyy'), 31991, 69417, 57322122);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (17736, to_date('07-03-2007', 'dd-mm-yyyy'), to_date('14-12-2006', 'dd-mm-yyyy'), 96588, 71864, 84881439);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63829, to_date('13-08-2016', 'dd-mm-yyyy'), to_date('18-08-2015', 'dd-mm-yyyy'), 62444, 73237, 73784175);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18714, to_date('09-04-2013', 'dd-mm-yyyy'), to_date('08-10-2018', 'dd-mm-yyyy'), 63831, 43839, 63722518);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (14235, to_date('24-08-2007', 'dd-mm-yyyy'), to_date('20-06-2018', 'dd-mm-yyyy'), 98847, 24794, 97359492);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84321, to_date('03-12-2015', 'dd-mm-yyyy'), to_date('25-11-2018', 'dd-mm-yyyy'), 23382, 23932, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (63898, to_date('08-12-2003', 'dd-mm-yyyy'), to_date('17-03-2013', 'dd-mm-yyyy'), 57721, 18581, 33456381);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65636, to_date('19-01-2010', 'dd-mm-yyyy'), to_date('20-01-2020', 'dd-mm-yyyy'), 55699, 23933, 59798994);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84469, to_date('22-09-2012', 'dd-mm-yyyy'), to_date('05-01-2012', 'dd-mm-yyyy'), 22006, 96931, 58942594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99312, to_date('11-09-2002', 'dd-mm-yyyy'), to_date('13-11-2016', 'dd-mm-yyyy'), 48952, 77992, 14186931);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38372, to_date('11-04-2020', 'dd-mm-yyyy'), to_date('30-10-2010', 'dd-mm-yyyy'), 4154, 17339, 84411282);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (24836, to_date('24-10-2020', 'dd-mm-yyyy'), to_date('11-11-2007', 'dd-mm-yyyy'), 92662, 83871, 57322122);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81234, to_date('12-02-2011', 'dd-mm-yyyy'), to_date('30-01-2016', 'dd-mm-yyyy'), 41585, 88239, 69923664);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33268, to_date('26-09-2005', 'dd-mm-yyyy'), to_date('08-08-2017', 'dd-mm-yyyy'), 28338, 96931, 96644292);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (45164, to_date('24-06-2019', 'dd-mm-yyyy'), to_date('30-03-2001', 'dd-mm-yyyy'), 57959, 42865, 81225789);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39162, to_date('13-02-2002', 'dd-mm-yyyy'), to_date('19-06-2016', 'dd-mm-yyyy'), 84941, 84117, 94948578);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56414, to_date('17-11-2003', 'dd-mm-yyyy'), to_date('25-03-2008', 'dd-mm-yyyy'), 67496, 29621, 1);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (59936, to_date('19-07-2004', 'dd-mm-yyyy'), to_date('01-07-2018', 'dd-mm-yyyy'), 69415, 54343, 53199867);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84691, to_date('10-02-2013', 'dd-mm-yyyy'), to_date('25-09-2004', 'dd-mm-yyyy'), 97375, 54343, 25595898);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (95441, to_date('30-01-2006', 'dd-mm-yyyy'), to_date('06-03-2013', 'dd-mm-yyyy'), 73396, 23932, 23769387);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (84536, to_date('08-02-2004', 'dd-mm-yyyy'), to_date('28-12-2016', 'dd-mm-yyyy'), 11521, 91753, 34887941);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (82931, to_date('01-06-2000', 'dd-mm-yyyy'), to_date('26-02-2001', 'dd-mm-yyyy'), 56153, 45211, 13612611);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36386, to_date('27-05-2000', 'dd-mm-yyyy'), to_date('10-08-2012', 'dd-mm-yyyy'), 17449, 77992, 61822711);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39271, to_date('07-07-2009', 'dd-mm-yyyy'), to_date('20-03-2010', 'dd-mm-yyyy'), 93335, 37792, 33496191);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (53466, to_date('27-03-2004', 'dd-mm-yyyy'), to_date('21-05-2000', 'dd-mm-yyyy'), 54563, 17339, 81269834);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (32414, to_date('26-09-2003', 'dd-mm-yyyy'), to_date('15-01-2015', 'dd-mm-yyyy'), 92863, 66121, 48122127);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (57893, to_date('09-06-2004', 'dd-mm-yyyy'), to_date('20-04-2000', 'dd-mm-yyyy'), 76438, 55519, 12874949);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (15964, to_date('13-12-2006', 'dd-mm-yyyy'), to_date('06-08-2004', 'dd-mm-yyyy'), 61965, 87483, 36251212);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92347, to_date('02-09-2007', 'dd-mm-yyyy'), to_date('30-01-2004', 'dd-mm-yyyy'), 77623, 48137, 34533386);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (73139, to_date('20-02-2012', 'dd-mm-yyyy'), to_date('18-02-2005', 'dd-mm-yyyy'), 54780, 78735, 86494619);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (12749, to_date('09-09-2004', 'dd-mm-yyyy'), to_date('09-01-2010', 'dd-mm-yyyy'), 52326, 96248, 9);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (83464, to_date('27-05-2010', 'dd-mm-yyyy'), to_date('19-02-2019', 'dd-mm-yyyy'), 28266, 26284, 34666769);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (79984, to_date('12-09-2019', 'dd-mm-yyyy'), to_date('12-01-2011', 'dd-mm-yyyy'), 47569, 98974, 26782667);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41279, to_date('16-06-2000', 'dd-mm-yyyy'), to_date('26-09-2013', 'dd-mm-yyyy'), 42526, 52399, 37252525);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (16281, to_date('15-11-2017', 'dd-mm-yyyy'), to_date('15-12-2008', 'dd-mm-yyyy'), 72977, 84241, 29441693);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (36243, to_date('29-12-2018', 'dd-mm-yyyy'), to_date('16-06-2013', 'dd-mm-yyyy'), 70927, 67718, 58942594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (22815, to_date('06-10-2018', 'dd-mm-yyyy'), to_date('01-10-2007', 'dd-mm-yyyy'), 71845, 32422, 12684866);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33192, to_date('27-06-2006', 'dd-mm-yyyy'), to_date('28-03-2000', 'dd-mm-yyyy'), 25748, 95296, 75592485);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29815, to_date('30-01-2012', 'dd-mm-yyyy'), to_date('13-01-2006', 'dd-mm-yyyy'), 73977, 98599, 92681188);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (19227, to_date('12-05-2000', 'dd-mm-yyyy'), to_date('12-02-2001', 'dd-mm-yyyy'), 95126, 76821, 93624858);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41254, to_date('06-01-2013', 'dd-mm-yyyy'), to_date('31-01-2015', 'dd-mm-yyyy'), 82128, 71864, 83299428);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (99166, to_date('24-07-2018', 'dd-mm-yyyy'), to_date('19-01-2014', 'dd-mm-yyyy'), 44135, 44258, 36283787);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (75735, to_date('06-04-2011', 'dd-mm-yyyy'), to_date('13-04-2007', 'dd-mm-yyyy'), 85596, 76821, 93667714);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26165, to_date('29-11-2009', 'dd-mm-yyyy'), to_date('02-10-2015', 'dd-mm-yyyy'), 15193, 22231, 18248815);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92514, to_date('10-03-2014', 'dd-mm-yyyy'), to_date('07-08-2020', 'dd-mm-yyyy'), 91717, 23933, 17729142);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38255, to_date('04-12-2000', 'dd-mm-yyyy'), to_date('01-07-2006', 'dd-mm-yyyy'), 38694, 67788, 79115231);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78777, to_date('01-01-2012', 'dd-mm-yyyy'), to_date('09-09-2019', 'dd-mm-yyyy'), 56162, 72682, 85648914);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (38671, to_date('30-10-2006', 'dd-mm-yyyy'), to_date('19-04-2010', 'dd-mm-yyyy'), 28973, 66693, 12);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78938, to_date('08-10-2012', 'dd-mm-yyyy'), to_date('03-07-2001', 'dd-mm-yyyy'), 46345, 59143, 94197881);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (26964, to_date('21-12-2014', 'dd-mm-yyyy'), to_date('12-11-2016', 'dd-mm-yyyy'), 68742, 23933, 97895962);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (81444, to_date('11-08-2006', 'dd-mm-yyyy'), to_date('13-09-2019', 'dd-mm-yyyy'), 65837, 32932, 37252525);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (65326, to_date('21-12-2017', 'dd-mm-yyyy'), to_date('20-04-2004', 'dd-mm-yyyy'), 76343, 29621, 42714677);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (18679, to_date('09-07-2017', 'dd-mm-yyyy'), to_date('17-02-2017', 'dd-mm-yyyy'), 22755, 48137, 17);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (33212, to_date('19-03-2016', 'dd-mm-yyyy'), to_date('12-06-2018', 'dd-mm-yyyy'), 64561, 24794, 33384713);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29794, to_date('14-07-2007', 'dd-mm-yyyy'), to_date('19-03-2012', 'dd-mm-yyyy'), 74413, 93474, 34666769);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (67487, to_date('08-07-2019', 'dd-mm-yyyy'), to_date('30-03-2017', 'dd-mm-yyyy'), 35168, 25287, 95554736);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (86476, to_date('09-04-2012', 'dd-mm-yyyy'), to_date('30-12-2013', 'dd-mm-yyyy'), 96442, 32932, 63151798);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (41588, to_date('22-02-2020', 'dd-mm-yyyy'), to_date('31-08-2012', 'dd-mm-yyyy'), 48522, 45211, 4);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (69892, to_date('18-01-2010', 'dd-mm-yyyy'), to_date('05-03-2012', 'dd-mm-yyyy'), 57278, 17339, 49296536);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (13689, to_date('14-06-2019', 'dd-mm-yyyy'), to_date('18-12-2018', 'dd-mm-yyyy'), 96161, 76821, 58942594);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (75157, to_date('20-01-2019', 'dd-mm-yyyy'), to_date('02-06-2015', 'dd-mm-yyyy'), 68592, 18581, 89611861);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89995, to_date('06-11-2006', 'dd-mm-yyyy'), to_date('22-04-2014', 'dd-mm-yyyy'), 84125, 63711, 46328589);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (97357, to_date('28-04-2019', 'dd-mm-yyyy'), to_date('20-09-2011', 'dd-mm-yyyy'), 22161, 33256, 69181511);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (11243, to_date('11-11-2004', 'dd-mm-yyyy'), to_date('18-02-2002', 'dd-mm-yyyy'), 66661, 32422, 37874639);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (21769, to_date('11-07-2015', 'dd-mm-yyyy'), to_date('06-09-2002', 'dd-mm-yyyy'), 96396, 8, 92969828);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (89365, to_date('24-06-2005', 'dd-mm-yyyy'), to_date('23-09-2011', 'dd-mm-yyyy'), 63737, 18581, 87811817);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (78565, to_date('26-09-2015', 'dd-mm-yyyy'), to_date('19-11-2016', 'dd-mm-yyyy'), 83556, 66121, 58987191);
commit;
prompt 1400 records committed...
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (85565, to_date('22-01-2006', 'dd-mm-yyyy'), to_date('19-10-2008', 'dd-mm-yyyy'), 35168, 32932, 63151798);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (29414, to_date('23-09-2000', 'dd-mm-yyyy'), to_date('18-10-2012', 'dd-mm-yyyy'), 64445, 69417, 36291759);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (56668, to_date('03-07-2001', 'dd-mm-yyyy'), to_date('15-03-2007', 'dd-mm-yyyy'), 17954, 23932, 17729142);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (52412, to_date('14-07-2005', 'dd-mm-yyyy'), to_date('17-11-2006', 'dd-mm-yyyy'), 27353, 42865, 87145958);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (39937, to_date('21-06-2004', 'dd-mm-yyyy'), to_date('18-12-2005', 'dd-mm-yyyy'), 35113, 95296, 69828852);
insert into RENT (rent_id, rent_begindate, rent_enddate, client_id, agent_id, vehicle_licensenumber)
values (92181, to_date('27-02-2020', 'dd-mm-yyyy'), to_date('16-10-2011', 'dd-mm-yyyy'), 35857, 19848, 14438592);
commit;
prompt 1406 records loaded
prompt Loading REPORT...
insert into REPORT (report_id, report_returnmode, report_ispaid, rent_id)
values (311, 'OKAY', 'Y', 212);
insert into REPORT (report_id, report_returnmode, report_ispaid, rent_id)
values (312, 'OKAY', 'Y', 212);
insert into REPORT (report_id, report_returnmode, report_ispaid, rent_id)
values (313, 'OKAY', 'Y', 211);
insert into REPORT (report_id, report_returnmode, report_ispaid, rent_id)
values (414, 'OKAY', 'Y', 314);
commit;
prompt 4 records loaded
prompt Enabling foreign key constraints for AGENT...
alter table AGENT enable constraint SYS_C007149;
prompt Enabling foreign key constraints for BOOK...
alter table BOOK enable constraint SYS_C007558;
alter table BOOK enable constraint SYS_C007559;
prompt Enabling foreign key constraints for MADAF...
alter table MADAF enable constraint SYS_C007563;
prompt Enabling foreign key constraints for ALL_BOOKS...
alter table ALL_BOOKS enable constraint SYS_C007572;
alter table ALL_BOOKS enable constraint SYS_C007573;
alter table ALL_BOOKS enable constraint SYS_C007574;
prompt Enabling foreign key constraints for HASHALA...
alter table HASHALA enable constraint SYS_C007589;
prompt Enabling foreign key constraints for MODEL...
alter table MODEL enable constraint SYS_C007165;
prompt Enabling foreign key constraints for VEHICLE...
alter table VEHICLE enable constraint SYS_C007169;
prompt Enabling foreign key constraints for RENT...
alter table RENT enable constraint SYS_C007177;
alter table RENT enable constraint SYS_C007178;
alter table RENT enable constraint SYS_C007179;
prompt Enabling foreign key constraints for REPORT...
alter table REPORT enable constraint SSSSSSS;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for AGENT...
alter table AGENT enable all triggers;
prompt Enabling triggers for CATEGORY...
alter table CATEGORY enable all triggers;
prompt Enabling triggers for AUTHOR...
alter table AUTHOR enable all triggers;
prompt Enabling triggers for BOOK...
alter table BOOK enable all triggers;
prompt Enabling triggers for MADAF...
alter table MADAF enable all triggers;
prompt Enabling triggers for STATUS...
alter table STATUS enable all triggers;
prompt Enabling triggers for ALL_BOOKS...
alter table ALL_BOOKS enable all triggers;
prompt Enabling triggers for AREA...
alter table AREA enable all triggers;
prompt Enabling triggers for BRAND...
alter table BRAND enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
prompt Enabling triggers for CLIENT...
alter table CLIENT enable all triggers;
prompt Enabling triggers for HASHALA...
alter table HASHALA enable all triggers;
prompt Enabling triggers for MODEL...
alter table MODEL enable all triggers;
prompt Enabling triggers for VEHICLE...
alter table VEHICLE enable all triggers;
prompt Enabling triggers for RENT...
alter table RENT enable all triggers;
prompt Enabling triggers for REPORT...
alter table REPORT enable all triggers;
set feedback on
set define on
prompt Done.
