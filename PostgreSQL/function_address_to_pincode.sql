CREATE OR REPLACE FUNCTION extractPincode(address character varying)
  RETURNS varchar AS
$BODY$
DECLARE
	ret varchar;
	numarray varchar[];
	arr_len int;
	n int:=0;
	temp_dd varchar;
BEGIN
	address:=trim(regexp_replace(address, '[^0-9]+', ' ','g'));
	numarray:=string_to_array(address,' ');
	arr_len=array_length(numarray,1);	

	ret:=null;
	WHILE arr_len > n LOOP
		temp_dd:=numarray[arr_len];
		IF length(temp_dd)=6 THEN
			n:=arr_len;
			ret:=temp_dd;
		END IF;
		arr_len:=arr_len-1;
	END LOOP ; 
	RETURN ret;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE STRICT
  COST 1;
