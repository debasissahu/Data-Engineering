--Create Connection
CREATE EXTENSION postgres_fdw;
CREATE EXTENSION dblink;

CREATE SERVER foreign_server
        FOREIGN DATA WRAPPER postgres_fdw
        OPTIONS (host '<amazon_redshift _ip>', port '<amazon_redshift _port>', dbname 'amazon_redshift _database_name', sslmode 'require');

CREATE USER MAPPING FOR <postgres_current_user>
        SERVER foreign_server
        OPTIONS (user '<amazon_redshift _user>', password 'amazon_redshift _password');

--Delete/Drop Connection---------------------------------
drop USER MAPPING FOR postgres
        SERVER foreign_server;

drop SERVER foreign_server;

--QUERY-------------------------------------------------------

--Query 1
Create table quantta.final_ceo_pollingbooth1 as
 SELECT st_code,state_name,district_code,district_name,pc_no,pc_name,ac_no,ac_name,sec_no,sec_name,part_no,part_name,ps_no,ps_name,pincode,pop_count FROM dblink('foreign_server'::text, 
 'Select st_code,state_name,district_code,district_name,pc_no,pc_name,ac_no,ac_name,sec_no,sec_name,part_no,part_name,ps_no,ps_name,pincode,"count" as pop_count from final_ceo_pollingbooth'::text) 
 t1(
   st_code        character varying(256),
   state_name     character varying(500),
   district_code  integer,
   district_name  character varying(256),
   pc_no          integer,
   pc_name        character varying(500),
   ac_no          integer,
   ac_name        character varying(500),
   sec_no         integer,
   sec_name       character varying(500),
   part_no        integer,
   part_name      character varying(500),
   ps_no          integer,
   ps_name        character varying(500),
   pincode        integer,
   pop_count        bigint
 );
