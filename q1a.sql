-- DONE
-- customer's credit rating may decrease after they got a loan.
-- Find (customer, loan) pairs where the customer no longer satisfies the minimum credit requried by the loan.
-- The output schema should be (name, no)

select c.name, l.no
from customer c, loan l 
where c.credit < l.minCredit;