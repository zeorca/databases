/*
Задача №1
Установите СУБД MySQL. 
Создайте в домашней директории файл .my.cnf, задав в нем логин 
и пароль, который указывался при установке.

Создал my.cnf. Положил в диск C:. Не уверен, что это домашняя директория, но так работает

[client]
user=root
password=

*/

/*
Задача №2
Создайте базу данных example, 
разместите в ней таблицу users, состоящую из двух столбцов, 
числового id и строкового name.
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
 Задача №3
 Создайте дамп базы данных example из предыдущего задания, 
 разверните содержимое дампа в новую базу данных sample.

mysqldump example > example.sql
mysqladmin CREATE sample
mysql sample < example.sql
*/

/* 
Задача №4
Создайте дамп единственной таблицы help_keyword базы данных mysql. 
Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.

mysqldump where="1 limit 100" mysql help_keyword > hk.sql