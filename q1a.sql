-- DONE
-- customer's credit rating may decrease after they got a loan.
-- Find (customer, loan) pairs where the customer no longer satisfies the minimum credit requried by the loan.
-- The output schema should be (name, no)


-- find the customers for which they do not satisfy their loan reqs.
-- find all current (name, loan) pairs
-- filter by customers with credit < minCredit

select allLoanPairs.name, allLoanPairs.no
from (select *
from customer
join borrower on cname = name
join loan on lno = no) allLoanPairs
where allLoanPairs.credit < allLoanPairs.minCredit ;
