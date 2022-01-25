create user Aviya 
IDENTIFIED BY av2000
default tablespace SYSTEM
temporary tablespace TEMP
profile DEFAULT
password expire;
grant create session to Aviya;

grant all on rent to Aviya;
grant select on agent to Aviya;

revoke all on rent from Aviya;



