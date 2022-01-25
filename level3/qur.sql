
select  a.report_id, a.report_returnmode
from report a
where a.report_ispaid = 'Y' 
order by a.report_id

create index indx_r
on report(report_ispaid)

select  author_name, category_name
from book natural join author natural join category
order by book_name




select  agent_name, client_name, author_name
from agent natural join author natural join client
order by agent_name



select book_name
from book natural join all_books 
where book_name != 'עריסת הבמבוק';

select * from rent

update rent r
set r.rent_begindate = to_date('07-06-2016','dd-mm-yyyy')
where rent_id=31682

DELETE
FROM hashala
WHERE book_id in 
(SELECT book_id
FROM all_books
where status_id=1)

select * from hashala
