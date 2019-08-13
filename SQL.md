# load csv into database

sql```
load data local infile 'file.csv' into table tablename fields terminated by ',' lines terminated by '\n' (column, column);
´´´
