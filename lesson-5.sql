#Тема №3
/*
 Задание №1
 Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 Заполните их текущими датой и временем.
 */
UPDATE `users`
SET 
	`created_at` = NOW(), 
	`updated_at` =	NOW()
;

/*
 Задание №2
 Таблица users была неудачно спроектирована. 
 Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
 */
UPDATE `users`
SET  
	`created_at` = STR_TO_DATE(`updated_at`, '%d.%m.%Y %h:%m'),
	`updated_at` =	STR_TO_DATE(`updated_at`, '%d.%m.%Y %h:%m')
;

ALTER TABLE `users`
MODIFY `updated_at` DATETIME,
MODIFY`created_at` DATETIME
;

/*
 Задание №3
 В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
 если товар закончился и выше нуля, если на складе имеются запасы. 
 Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 Однако, нулевые запасы должны выводиться в конце, после всех записей.
 */
SELECT value
FROM storehouses_products
ORDER BY value = 0, value;


# Тема №4
/*
 Задание №1
 Подсчитайте средний возраст пользователей в таблице users
 */
 SELECT 
 	ROUND(AVG(TIMESTAMPDIFF(YEAR, `birthday_at`, CURDATE())))
 FROM
 	users
 ;
 
/*
 Задание №2
 Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */
 SELECT
 	COUNT(*) AS total,
 	DAYNAME(TIMESTAMPADD(YEAR, TIMESTAMPDIFF(YEAR, `birthday_at`, CURDATE()), birthday_at)) AS `day`
 FROM
 	users
 GROUP BY `day`
;
 