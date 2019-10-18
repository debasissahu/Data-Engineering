## Administration System

### See the all user details
select * from pg_user_info;

### Add new user
create user usr_debasis with password '123456789';

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

### Provide Access Permission


### Public access Permission (Read Only)

### See the all public table from the database
SELECT DISTINCT tablename FROM pg_table_def WHERE  schemaname ='public';
