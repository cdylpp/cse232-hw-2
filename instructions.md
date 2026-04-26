# Instructions

Recall our schema of a bank:

```
   customer (name: text, credit: integer)
   loan (no: string, type: text, minCredit: integer NOT NULL, amount: integer NOT NULL)
   borrower (cname: text, lno: text, due: date)
```

where `borrower.cname` and `borrower.lno` are foreign keys referencing customer, respectively loan, whose primary keys
are name, respectively no (number). Also, `(cname, lno)` is a primary key for the borrower table.

Attribute `loan.minCredit` indicates the minimum credit required of a customer to qualify for that loan.
You may assume that it is non-negative.

1. Write the following queries in SQL. Make sure that the output contains no duplicates.
   1. [10pts] Customers’ credit rating may decrease after they got a loan. Find (customer,loan) pairs where the customer no longer satisfies the minimum credit required by the loan. The output schema should be (name, no).
   2. [5pts] Find for each customer the number of loans she took. If a customer took no loans, list her name
           with a count of zero. The output schema should be (name, loanCount).
   3. [10pts] List the loan type(s) with the smallest number of borrowers. The output schema should be (loanType).
   4. [15pts] List the customers who took every type of loan (at least one loan from every type). The output schema should be (name).
   5. [15pts] List the loans that have a strictly greater number of borrowers than the average number of borrowers over all loans of that type. The output schema should be (no).
   6. [15pts] Find the pairs of customers who took the exact same loans (i.e. all loans taken by one are taken by the other and viceversa; or, equivalently, for every loan l, customer 1 takes l if and only if so does customer 2). The output schema should be (name1, name2). The answer should contain exactly one tuple for each pair of customers who take exactly the same loans. For each pair of such customers, always choose the tuple that is lexicographically smaller (e.g. “(Jane,John)” but not “(John,Jane)”). Do not list customers with themselves.

2. Formulate the following updates in SQL. You may use a sequence of update commands but you are
    not allowed to change the schema of the database (the schema after the sequence executes should be the same as the original).
    1. [13pts] Change the type of all “jumbo mortgage” loans to “student” and the type of all original “student” loans to “jumbo mortgage”. You may assume that the only loan types represented in the data are "jumbo mortgage", "standard mortgage", "auto", "student", "personal", "business".
    2. [17pts] Delete all “jumbo mortgage” loans as well as the customers who took them. Do this carefully to avoid violating the referential integrity constraints.

Please submit a separate .sql file for each part of the problem. The submitted files should be named `q1a.sql`, `q1b.sql`, ....., `q2a.sql`, `q2b.sql`. The autograder will remind you to submit files with correct filenames.