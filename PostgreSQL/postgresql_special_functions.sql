string_agg(x,'-');
coalesce(temp_org.vib_pincode, '') = ''
Select split_part('Debasis Kumar Sahu',' ',3)
regexp_split_to_array('a,b,c,d', ',')
string_to_array('xx~^~yy~^~zz', '~^~')
array_length(string_to_array('xx~^~yy~^~zz', '~^~'),1)
regexp_replace('abc$wa nto&toremove#spe1cial~chars', '[^a-zA-Z]', '','g')
substring('sasas88a99asd' FROM '[0-9]+')
age ~ '^[0-9\.]+$'
update tmp_bng_rawdata set age_2=to_number(age,'99999') where coalesce(age,'')!='' and dob ~ '^\d+(.\d+)?$'=false;
update tmp_bng_rawdata set age_2=age_convert(dob) where age_2<=0;
check numeric: select (mytext ~ '^([0-9]+[.]?[0-9]*|[.][0-9]+)$');
Select array_length(regexp_split_to_array('a,b,c,d,', ' '),1)
  coalesce(consumer.alt_mobile_no2_final::varchar, '') != ''
