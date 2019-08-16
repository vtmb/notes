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
