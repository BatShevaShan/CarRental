create or replace procedure best_agent is
cursor bext_agents is(
select agent_id from agent where agent_id in(
select agent_id from (
select agent_id, count(*) as deels 
from rent natural join agent
group by agent_id)
where deels =(select max (num_deels)
from( select agent_id, count(*) as num_deels
from rent natural join agent
group by agent_id))
UNION
select agent_id from (
select agent_id, count(*) as hashalot 
from hashala natural join agent
group by agent_id)
where hashalot =(select max (num_hashalot)
from( select agent_id, count(*) as num_hashalot
from hashala natural join agent
group by agent_id))));

begin
  dbms_output.put_line('The best agents: ');
  FOR agent IN bext_agents
  LOOP
  dbms_output.put_line('agent id: '|| agent.agent_id);
  END LOOP;

end;


create or replace procedure books_and_authors(author in out varchar) is
cursor books is select * from book where author_id = author; 
begin
  dbms_output.put_line('The author is: ' || author);
  dbms_output.put_line('The authors books are: ');
  FOR book IN books
  LOOP
  dbms_output.put_line('book id: '|| book.b_id || ' book name: ' || book.book_name);
  END LOOP;

  

end books_and_authors;


create or replace function update_report(report in NUMBER) return CHAR is 
isPaid CHAR;
begin
  select report_isPaid into isPaid from report where report_id = report;
  if sql%notfound then
     dbms_output.put_line('report not exist');
  elsif sql%found then
    update report
    SET report_isPaid = 'YES'
    where report_id = report;
    dbms_output.put_line( 'report id: '|| report ||' report before update to YES: ' || isPaid);
  end if;
  return(isPaid);
end;


create or replace function calculates_discount(licensenumber in number, discount in number) return number is
  price number;
  vehicle_model model.model_id%type;
  
begin
 select model_id into vehicle_model from vehicle where vehicle_licensenumber = licensenumber;
 update model
    SET model_price = model_price - (model_price * discount / 100)
    where model_id = vehicle_model;
  select model_price into price from model where model_id = vehicle_model;

  return(price);
end;


create or replace trigger print_update_city
  after update of areaid on city  
  for each row
declare
  -- local variables here
begin
  dbms_output.put_line('City area updated');
end print_update_game_status;



create or replace trigger insert_agent
  after insert on agent  
  for each row
declare
  
begin
  dbms_output.put_line(:new.agent_id || ' successfully added');
end insert_agent;
