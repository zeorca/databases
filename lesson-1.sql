/*
������ �1
���������� ���� MySQL. 
�������� � �������� ���������� ���� .my.cnf, ����� � ��� ����� 
� ������, ������� ���������� ��� ���������.

������ my.cnf. ������� � ���� C:. �� ������, ��� ��� �������� ����������, �� ��� ��������

[client]
user=root
password=

*/

/*
������ �2
�������� ���� ������ example, 
���������� � ��� ������� users, ��������� �� ���� ��������, 
��������� id � ���������� name.
*/

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

/*
 ������ �3
 �������� ���� ���� ������ example �� ����������� �������, 
 ���������� ���������� ����� � ����� ���� ������ sample.

mysqldump example > example.sql
mysqladmin CREATE sample
mysql sample < example.sql
*/

/* 
������ �4
�������� ���� ������������ ������� help_keyword ���� ������ mysql. 
������ ��������� ����, ����� ���� �������� ������ ������ 100 ����� �������.

mysqldump where="1 limit 100" mysql help_keyword > hk.sql