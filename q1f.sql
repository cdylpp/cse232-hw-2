-- TODO
-- Find the pairs of customer who took the exact same loans 
-- (i.e. all loans taken by one are taken by the other and viceversa; or, equivalently, for every loan l, customer 1 takes l iff so does customer 2).
-- The output schema should be (name1, name2). 
-- The answer should contain exactly one tuple for each pair of customers who take exactly the same loans.
-- For each pair of such customers, always choose the tuple that is lexicographically smaller. 
-- Do not list customers with themselves.

select c1.name as name1, c2.name as name2
from customer c1, customer c2
where c1.name < c2.name
and not exists (
    select 1
    from borrower b1
    where b1.cname = c1.name
    and not exists (
        select 1
        from borrower b2
        where b2.cname = c2.name
          and b2.lno = b1.lno
    )
)
and not exists (
    select 1
    from borrower b2
    where b2.cname = c2.name
    and not exists (
        select 1
        from borrower b1
        where b1.cname = c1.name
          and b1.lno = b2.lno
    )
);