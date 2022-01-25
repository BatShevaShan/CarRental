
select b_id, book_name, b_id, category_id, book_name, category_name, author_id
from book natural join category
where category_name = &<name="category" list= " 'פעוטות', 'ילדים', 'גדולי ישראל'">
order by category_name


select  agent_name, client_name, author_name, agent_salary
from agent natural join author natural join client
where agent_salary >= &<name="salary" type="float" default="10000">
order by agent_name


select t.report_id, t.report_returnmode
from report t
where t.report_ispaid = &<name="is paid" checkbox="report_ispaid,"> 
order by t.report_id;


select *
from book 
&<name="sort" list="b_id, book_name, category_id"
prefix = " order by " 
suffix = " Desc ">


SELECT   department_id , AVG(agent_salary)
FROM agent      
GROUP BY department_id
HAVING   AVG(agent_salary) >= (SELECT AVG(agent_salary) FROM  agent WHERE department_id = 1) 


select rent_id, agent_name, agent_salary
from rent natural join agent
where rent_id < 10
order by rent_id
