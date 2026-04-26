-- DONE
-- List the loan type(s) with the smallest number of borrowers.
-- The output schema should be (loanType)

select type as loanType
from customer
join borrower on name = cname
join loan on lno = no
group by type
order by count(*) asc
limit 1;

