Mysql role
=========

We will install mysql, prometheus mysql exporter to expose data to prometheus server 

Role Variables
--------------
architecture: amd64
mysqld_exporter_version: 0.15.1
mysqld_exporter_port: 9104

Notes
------------
Now playbook only support for Centos distribution


Steps:
------------

- ##### edit mysql root user's password

> ALTER USER 'root'@'localhost' IDENTIFIED BY '123456aA@'

- ##### add user for mysqld_exporter: (if change password need edit mysqld_exporter.credential.cnf)

> CREATE USER 'mysqld_exporter'@'%' IDENTIFIED BY '123456aA@';

> GRANT ALL PRIVILEGES ON *.* TO 'mysqld_exporter'@'%' WITH GRANT OPTION;