
create view details_book_category
as select b_id, category_id, book_name, category_name, author_id
from book natural join category

--query
select * from details_book_category 
where category_name = 'פעוטות'
order by book_name

select b_id, book_name 
from details_book_category
where b_id = 101
order by book_name


update details_book_category 
set book_name = 'אורות חדשים'
where b_id = 101

delete from details_book_category 
where b_id = 53

