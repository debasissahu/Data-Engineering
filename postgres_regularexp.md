### Removing all alpha
SELECT REGEXP_REPLACE('Newtown, 3A/7th Floor, ecospace, 700156, kolkata','[[:alpha:]]','','g');
