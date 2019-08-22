# load csv into database

```SQL
load data local infile 'file.csv' into table tablename fields terminated by ',' lines terminated by '\n' (column, column);
```

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
alter table Licenses change column id id int(10) unsigned not null auto_increment primary key;
```

# trim

```SQL
update tablename set column = LTRIM(RTRIM(column));
```

# rename column

```SQL
ALTER TABLE table_name
CHANGE COLUMN old_column_name new_column_name data_type;
```
