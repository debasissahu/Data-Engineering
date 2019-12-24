--String matching percentage
CREATE EXTENSION pg_trgm;
SELECT similarity(Str1,Str2) FROM tbl_SimilarString;

--Using FILTER CLAUSE, multiple COUNT(*) in one SELECT Query for Different Groups
Select count(*), 
count(mobile_no) filter(where mobile_no like '9%'),
count(distinct(mobile_no)) filter(where mobile_no like '9%'),
count(*) filter(where mobile_no like '8%'),
count(*) filter(where mobile_no like '7%'),
count(*) filter(where mobile_no like '6%')
from table_name;



