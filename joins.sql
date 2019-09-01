SELECT *
FROM users;

SELECT *
FROM posts
WHERE user_id='100';

SELECT *, first_name, last_name
FROM posts
INNER JOIN users
ON users.id = posts.user_id
WHERE user_id='200';

SELECT posts.*, users.username
FROM posts
INNER JOIN users
ON users.id = posts.user_id
WHERE users.first_name='Norene'
AND users.last_name='Schmitt';

SELECT DISTINCT username
FROM users
INNER JOIN posts
ON users.id = posts.user_id
WHERE posts.created_at > '01/01/2015';

SELECT posts.title, posts.content, users.username
FROM posts
INNER JOIN users
ON users.id = posts.user_id
WHERE users.created_at > '01/01/2015';

SELECT posts.title, comments.id, comments.body, comments.created_at, comments.updated_at, comments.user_id, comments.post_id
FROM comments
INNER JOIN posts
ON posts.id = comments.post_id;

SELECT posts.title, posts.url, comments.body
FROM comments
INNER JOIN posts
ON posts.id = comments.post_id
WHERE posts.created_at < '01/01/2015';

SELECT posts.title, posts.url, comments.body
FROM comments
INNER JOIN posts
ON posts.id = comments.post_id
WHERE posts.created_at > '01/01/2015';

SELECT posts.title as "post_title", posts.url as "post_url", comments.body as "comment_body"
FROM comments
INNER JOIN posts
ON posts.id = comments.post_id
WHERE comments.body
LIKE '%USB%';

SELECT posts.title as "post_title", users.first_name, users.last_name, comments.body as "comment_body"
FROM posts
INNER JOIN comments
ON posts.id = comments.post_id
INNER JOIN users
ON posts.user_id = users.id
WHERE comments.body
LIKE '%matrix%';

SELECT users.first_name, users.last_name, comments.body as "comment_body"
FROM comments
INNER JOIN users
ON users.id = comments.user_id
INNER JOIN posts
ON posts.id = comments.post_id
WHERE comments.body
LIKE '%SSL%'
AND posts.content
LIKE '%dolorum%';

SELECT users.first_name as "post_author_first_name", users.last_name as "post_author_last_name", posts.title as "post_title", users.username as "comment_author_username", comments.body as "comment_body"
FROM comments
INNER JOIN users
ON users.id = comments.user_id
INNER JOIN posts
ON posts.id = comments.post_id
WHERE comments.body
LIKE '%SSL%'
AND posts.content
LIKE '%nemo%'
OR comments.body
LIKE '%firewall%'
AND posts.content
LIKE '%nemo%';