-- TODO
-- Delete all “jumbo mortgage” loans as well as the customers who took them.
-- Do this carefully to avoid violating the referential integrity constraints.

-- delete in dependency order


create temp table jumbo_loans as
select distinct cname
from borrower
join loan on lno = no
where type = 'jumbo mortgage';

delete from borrower
where borrower.lno in (
    select no
    from loan
    where type = 'jumbo mortgage'
);

delete from loan
where type = 'jumbo mortgage';

delete from customer
where name in (
    select cname
    from jumbo_loans
);