### Removing all alpha
SELECT REGEXP_REPLACE('Newtown, 3A/7th Floor, ecospace, 700156, kolkata','[[:alpha:]]','','g');

### Removing all numeric
SELECT REGEXP_REPLACE('ABC12345xyz','[[:digit:]]','','g');

### Keep only numbers
SELECT regexp_replace('88Well- Th700156is Did-Not work&*($%%)_', '[^0-9]+', ' ','g')

### Extract PIN code from address
