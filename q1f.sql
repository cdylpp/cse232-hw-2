-- TODO
-- Find the pairs of customer who took the exact same loans 
-- (i.e. all loans taken by one are taken by the other and viceversa; or, equivalently, for every loan l, customer 1 takes l iff so does customer 2).
-- The output schema should be (name1, name2). 
-- The answer should contain exactly one tuple for each pair of customers who take exactly the same loans.
-- For each pair of such customers, always choose the tuple that is lexicographically smaller. 
-- Do not list customers with themselves.


select b1.cname as name1, b2.cname as name2
from borrower b1, borrower b2
where b1.lno = b2.lno
and b1.cname < b2.cname
order by name1, name2;