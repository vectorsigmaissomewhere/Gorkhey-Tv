mysql> show tables;
+---------------------+
| Tables_in_customers |
+---------------------+
| cart                |
| order_history       |
| orderdetail         |
| product             |
| users               |
+---------------------+
5 rows in set (0.00 sec)

mysql> desc cart;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| cart_id      | int          | NO   | PRI | NULL    | auto_increment |
| username     | varchar(255) | YES  |     | NULL    |                |
| product_name | varchar(255) | YES  |     | NULL    |                |
| quantity     | int          | YES  |     | NULL    |                |
| price        | int          | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> desc order_history;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| order_id       | int          | NO   | PRI | NULL    | auto_increment |
| username       | varchar(100) | YES  |     | NULL    |                |
| total          | int          | YES  |     | NULL    |                |
| payment_method | varchar(100) | YES  |     | NULL    |                |
| transaction_id | varchar(100) | YES  |     | NULL    |                |
| status         | tinyint(1)   | YES  |     | NULL    |                |
| address        | varchar(255) | YES  |     | NULL    |                |
| orderdate      | date         | YES  |     | NULL    |                |
| deliverydate   | date         | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
9 rows in set (0.01 sec)

mysql> desc orderdetail;
+----------------+--------------+------+-----+---------+----------------+
| Field          | Type         | Null | Key | Default | Extra          |
+----------------+--------------+------+-----+---------+----------------+
| order_id       | int          | NO   | PRI | NULL    | auto_increment |
| username       | varchar(100) | YES  |     | NULL    |                |
| productName    | varchar(255) | YES  |     | NULL    |                |
| total          | int          | YES  |     | NULL    |                |
| payment_method | varchar(100) | YES  |     | NULL    |                |
| transaction_id | varchar(100) | YES  |     | NULL    |                |
| status         | tinyint(1)   | YES  |     | NULL    |                |
| address        | varchar(255) | YES  |     | NULL    |                |
| orderdate      | date         | YES  |     | NULL    |                |
| deliverydate   | date         | YES  |     | NULL    |                |
+----------------+--------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)

mysql> desc product;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| productid   | int          | NO   | PRI | NULL    | auto_increment |
| name        | varchar(500) | YES  |     | NULL    |                |
| description | varchar(500) | YES  |     | NULL    |                |
| price       | int          | YES  |     | NULL    |                |
| stock       | int          | YES  |     | NULL    |                |
| active      | varchar(10)  | YES  |     | NULL    |                |
| filename    | varchar(100) | YES  |     | NULL    |                |
| data        | longblob     | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> desc users;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| s1no         | int          | NO   | PRI | NULL    | auto_increment |
| fullname     | varchar(100) | YES  |     | NULL    |                |
| email        | varchar(100) | YES  |     | NULL    |                |
| username     | varchar(100) | YES  |     | NULL    |                |
| password     | varchar(100) | YES  |     | NULL    |                |
| mobileNumber | bigint       | YES  |     | NULL    |                |
| city         | varchar(100) | YES  |     | NULL    |                |
| state        | varchar(100) | YES  |     | NULL    |                |
| country      | varchar(100) | YES  |     | NULL    |                |
| isAdmin      | varchar(100) | YES  |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)


mysql> desc contact;
+--------------------+--------------+------+-----+---------+-------+
| Field              | Type         | Null | Key | Default | Extra |
+--------------------+--------------+------+-----+---------+-------+
| username           | varchar(100) | YES  |     | NULL    |       |
| messagetitle       | varchar(255) | YES  |     | NULL    |       |
| messagedescription | text         | YES  |     | NULL    |       |
+--------------------+--------------+------+-----+---------+-------+
3 rows in set (0.03 sec)
