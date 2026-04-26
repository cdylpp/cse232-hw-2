-- TODO
-- List the loans that have a strictly greater number of borrowers than the average number of borrowers over all loans of that type.
-- The output schema should be (no).

-- count # borrowers for each loan
-- compare with 
-- avg # of borrowers over all loans of that type

-- missing tuples

select t.no
from (
    select l.no, l.type, count(b.cname) as numBorrowers
    from loan l
    left join borrower b on b.lno = l.no
    group by l.no, l.type
) t
join (
    select q.type, AVG(q.numBorrowers) as avgBorrowers
    from (
        select l.no, l.type, COUNT(b.cname) as numBorrowers
        from loan l
        left join borrower b on b.lno = l.no
        group by l.no, l.type
    ) q
    group by q.type
) a on t.type = a.type
where t.numBorrowers > a.avgBorrowers;
