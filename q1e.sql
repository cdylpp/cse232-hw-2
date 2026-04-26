-- TODO
-- List the loans that have a strictly greater number of borrowers than the average number of borrowers over all loans of that type.
-- The output schema should be (no).

-- count # borrowers for each loan
-- compare with 
-- avg # of borrowers over all loans of that type



select no
from (select no, count(*) as numBorrowers, type
    from customer
    join borrower on cname = name
    join loan on lno = no
    group by no) t1, (select type, avg(q1.numBorrowers) as avgBorrowers
                    from (select no, count(*) as numBorrowers, type
                    from customer
                    join borrower on cname = name
                    join loan on lno = no
                    group by no) q1
                    group by type) t2
where t1.type = t2.type and t1.numBorrowers > t2.avgBorrowers;
