-- DONE
-- Find, for each customer, the number of loans she took.
-- If a customer took no loans, list her name with a count of zero.
-- The output schema shoulc be (name, loanCount).

select name, coalesce(count(lno), 0) as loanCount
from customer
left join borrower on name = cname
left join loan on lno = no
group by name;

