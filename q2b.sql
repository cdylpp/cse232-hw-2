-- TODO
-- Delete all “jumbo mortgage” loans as well as the customers who took them.
-- Do this carefully to avoid violating the referential integrity constraints.

-- delete in dependency order


delete from borrower
where borrower.lno in (
    select no
    from loan
    where type = 'jumbo mortgage'
);

delete from loan
where type = 'jumbo mortgage';

delete from customer
where name not in (
    select cname
    from borrower
);