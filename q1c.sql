-- DONE
-- List the loan type(s) with the smallest number of borrowers.
-- The output schema should be (loanType)

-- Test failed, partial credit.
-- Could be more than one type with smallest count.
-- must return all loans with minimum count.

with loanCountPerType as (
    select type, count(*) as count
    from borrower
    join loan on lno = no
    group by type
)
select type as loanType
from loanCountPerType t1, (select min(count) as min from loanCountPerType) minVal
where t1.count = minVal.min;

