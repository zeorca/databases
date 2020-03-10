/*
 Задание №1
 Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
 */

SELECT *
FROM users
WHERE id IN (SELECT user_id FROM orders);


/*
 Задание №2
 Выведите список товаров products и разделов catalogs, который соответствует товару.
 */

SELECT 
	p.name, 
	p.catalog_id, 
	c.* 
FROM 
	products AS p
	LEFT JOIN
	catalogs AS c
ON 
	p.catalog_id = c.id
;


/*
Задание №3
Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. 
Выведите список рейсов flights с русскими названиями городов.
*/

SELECT
	from.id,
	from.from,
	to.to
FROM
	(SELECT f.id, c.name AS `from` FROM  cities AS c, flights AS f WHERE f.from = c.label) AS `from`,
	(SELECT f.id, c.name AS `to` FROM cities AS c, flights AS f WHERE f.to = c.label) AS `to`
WHERE
	to.id = from.id
ORDER BY from.id;