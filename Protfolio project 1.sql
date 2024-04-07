CREATE DATABASE instagram;
USE instagram;

----------- Creating the Users table-------------------
CREATE TABLE users (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL
);
DESC  users;

----------- Creating Photos table---------------------
CREATE TABLE photos (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

----------- Creating comment table ---------------
CREATE TABLE comments (
	comment_id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(225) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
	FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
	created_at TIMESTAMP DEFAULT NOW() NOT NULL
);

----------- Creating the likes table --------------
CREATE TABLE likes (
	user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY  (photo_id) REFERENCES photos(id),
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    PRIMARY KEY(user_id, photo_id)
);

----------- Creating the follows table -------------
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);