## Administration System

### See the all user details
select * from pg_user_info;

### Create super user
create user adminuser createuser password '1234Admin';

### Create New User
create user usr_debasis with password '123456789';

### Alter User
alter user usr_debasis with password '123456789';


## Privelage and permission
### Create Group     
CREATE GROUP read_group;

### Provide read only permission to the group
GRANT SELECT ON ALL TABLES IN SCHEMA public TO GROUP read_group;

### Provide different permission into group
GRANT SELECT ON ALL TABLES IN SCHEMA public TO GROUP fullaccess_group;
GRANT INSERT ON ALL TABLES IN SCHEMA public TO GROUP fullaccess_group;
GRANT DELETE ON ALL TABLES IN SCHEMA public TO GROUP fullaccess_group;
GRANT UPDATE ON ALL TABLES IN SCHEMA public TO GROUP fullaccess_group;

### Add User to Read-Only Group
ALTER GROUP read_group ADD USER usr_debasis;

### Remove users from group
ALTER GROUP read_group drop USER usr_debasis;

### Select all groups
select * from pg_group;


## Table creation and Data Export/Import

### Create table
create table users(
userid integer not null distkey sortkey,
username char(8),
firstname varchar(30),
lastname varchar(30),
city varchar(30),
state char(2),
email varchar(100),
phone char(14)
);

### COPY data from AWS S3 (Text/Csv)
copy users 
from 's3://awssampledbuswest2/tickit/allusers_pipe.txt'
credentials 'aws_iam_role=<iam-role-arn>'
delimiter '|' region 'us-west-2';

### COPY data from AWS S3 (PARQUET File)
COPY users
FROM 's3://bucket/folder1/folder2/'
IAM_ROLE 'aws_iam_role=<iam-role-arn>'
FORMAT AS PARQUET;

### See the all public table from the database
SELECT DISTINCT tablename FROM pg_table_def WHERE  schemaname ='public';

