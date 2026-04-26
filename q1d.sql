-- DONE
-- List the customers who took every type of loan (at least one loan from every type). The output schema should be (name).

select validLoanPairs.name
from (select name, type
        from customer
        join borrower on cname = name
        join loan on lno = no
        group by name, type) validLoanPairs, (select count(*) as numOfLoanTypes 
                                                from (select distinct type from loan) loanTypes) loanTypes_
group by validLoanPairs.name
having count(*) = loanTypes_.numOfLoanTypes;