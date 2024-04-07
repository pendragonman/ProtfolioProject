-- 1. FINDING FIVE OLDEST USERS 
SELECT * FROM users ORDER BY created_at ASC LIMIT 5;

-- 2. Most Popular Registeration Date
 SELECT 
    DAYNAME(created_at) AS day_name,
    COUNT(*) AS no_of_day_name,
    TIME(created_at) AS time_created
FROM
    users
GROUP BY day_name			
ORDER BY no_of_day_name DESC
LIMIT 2;

-- 3. Inactive users
SELECT 
    username
FROM
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    image_url IS NULL;
    
-- 4. Who got the most likes

SELECT 
    likes.user_id, photo_id, COUNT(*) AS total, username
FROM
    photos
        JOIN
    likes ON photos.id = likes.photo_id
        JOIN
    users ON photos.user_id = users.id
GROUP BY photo_id
ORDER BY total DESC
LIMIT 1;

-- 5. How many times deos the average user post
SELECT 
    (SELECT 
            COUNT(*)
        FROM
            photos) / (SELECT 
            COUNT(*)
        FROM
            users) AS AVG;
            
-- 6. Most popular used tags
SELECT 
	tag_name,count(*) AS total_used
FROM
    photo_tags
        JOIN
    tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY total_used DESC LIMIT 5;

-- 7. Find users who have liked every single photo on the site
SELECT 
    username, user_id, COUNT(*) AS total
FROM
    users
        JOIN
    likes ON users.id = likes.user_id
GROUP BY username
HAVING total = (SELECT 
        COUNT(*)
    FROM
        photos);

