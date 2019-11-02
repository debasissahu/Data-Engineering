## POSTGRES SQL QUERY
-------------------------------------------

### 1. String matching percentage

CREATE EXTENSION pg_trgm;\n
SELECT similarity(Str1,Str2) FROM tbl_SimilarString;



