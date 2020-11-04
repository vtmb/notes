# create database 

```SQL
CREATE DATABASE databasename DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

# allow remote hosts

```bash
/etc/mysql/mariadb.conf.d/50-server.cnf
```
set bind-adress from localhost to 0.0.0.0

# load csv into database

```SQL
load data local infile 'file.csv' into table tablename
  fields terminated by ',' 
  lines terminated by '\n' (column, column);
```

When inserting in Tables with auto_increment Values, ignore this field. The database will generate it automatically.

# using varchar with utf8mb4

mind the limit! varchar(191) is correct. varchar(255) will not work

# import a database backup

```SQL
mysql -u username -p database_name < file.sql
```

# create backup

```SQL
mysqldump db_name > backup-file.sql
```

# alter table: make id primary key and being auto_increment

tested on empty tables

```SQL
alter table Licenses
  change column id id int(10) unsigned not null auto_increment primary key;
```

# trim

```SQL
update tablename 
  set column = LTRIM(RTRIM(column));
```

# rename column

```SQL
ALTER TABLE table_name
CHANGE COLUMN old_column_name new_column_name data_type;
```

# add column

```SQL
ALTER TABLE tablename
ADD COLUMN phone VARCHAR(15) AFTER someColumn;
```

# make a cloumn being the first
```SQL
alter table TABLENAME modify COLUMNNAME COLUMNTYPE first;
```

# change type of column
```SQL
alter table TABLENAME change COLUMNNAME COLUMNNAME NEWTYPE;
```

# update value from another table (helps fixing id/value)

```SQL
update Licenses 
  set computerID = (select Computers.id from Computers where Computers.hostname = Licenses.hostname);
```

# export as CSV

```SQL
SELECT customer_id, firstname, surname INTO OUTFILE '/exportdata/customers.txt'
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
  FROM customers order by firstname;
```

exports are by default written to /var/lib/mysql/$NAMEOFDATABASE in Linux
exports are by default written to /usr/local/var/mysql/$NAMEOFDATABASE in macOS


# creating user and granting access

```SQL
create user 'USERNAME'@'%' identified by PASSWORD;
grant all privileges on DATABASENAME.TABLENAME to 'USERNAME'@'%';
```
