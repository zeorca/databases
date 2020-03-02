/*
Задание №1
Пусть задан некоторый пользователь. 
Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.
 */

SELECT
	COUNT(*) AS count_messages,
	to_user_id,
	body,
	created_at
FROM messages
WHERE 
	from_user_id = 1
	AND
	to_user_id IN (
	SELECT initiator_user_id 
	FROM friend_requests 
	WHERE target_user_id = 1 AND status = 'approved'
		UNION
	SELECT target_user_id 
	FROM friend_requests 
	WHERE initiator_user_id  = 1 AND status = 'approved')
GROUP BY to_user_id
ORDER BY count_messages
LIMIT 1
;


/*
Задание №2
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
 */

SELECT
	COUNT(*) AS count_likes
FROM likes
WHERE user_id IN (select user_id FROM profiles where (birthday + INTERVAL 10 YEAR) > NOW())
;


/*
Задание №3
Определить кто больше поставил лайков (всего) - мужчины или женщины?
 */

select count(*) from likes where user_id in (select user_id from profiles where gender = 'f')
union
select count(*) from likes where user_id in (select user_id from profiles where gender = 'm');