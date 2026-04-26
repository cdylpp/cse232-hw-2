-- DONE
-- Change the type of all “jumbo mortgage” loans to “student” and the type of all original “student” loans to “jumbo mortgage”. 
-- You may assume that the only loan types represented in the data are "jumbo mortgage", "standard mortgage", "auto", "student", "personal", "business".

update loan
set type = 'student_new'
where type = 'jumbo mortgage';
update loan
set type = 'jumbo mortgage'
where type = 'student';
update loan
set type = 'student'
where type = 'student_new';

