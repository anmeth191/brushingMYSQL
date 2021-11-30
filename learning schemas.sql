DROP DATABASE socialMedia;
CREATE DATABASE socialMedia;
USE socialMedia;

 CREATE TABLE users(
 id INTEGER PRIMARY KEY auto_increment,
 username VARCHAR(255) UNIQUE NOT NULL,
 created_at TIMESTAMP DEFAULT NOW()
 );
 
 
 CREATE TABLE photos(
 id INTEGER AUTO_INCREMENT PRIMARY KEY,
 image_url VARCHAR(255) NOT NULL,
 user_id INTEGER NOT NULL,
 created_at TIMESTAMP DEFAULT NOW(),
 FOREIGN KEY (user_id) REFERENCES users(id)
 );
 
 
 CREATE TABLE comments(
 id INTEGER PRIMARY KEY AUTO_INCREMENT,
 comment_text VARCHAR(255) NOT NULL,
 created_at TIMESTAMP DEFAULT NOW(),
 user_id INTEGER NOT NULL,
 photo_id INTEGER NOT NULL,
 FOREIGN KEY (user_id) REFERENCES users(id),
 FOREIGN KEY (photo_id) REFERENCES photos(id)
 );
 
 
 CREATE TABLE likes(
 user_id INTEGER NOT NULL, 
 photo_id INTEGER NOT NULL, 
 created_at TIMESTAMP DEFAULT NOW(),
 FOREIGN KEY (photo_id) REFERENCES photos(id),
 FOREIGN KEY (user_id) REFERENCES users(id),
 PRIMARY KEY(user_id , photo_id)
 );
 
 CREATE TABLE follows(
 follower_id INTEGER NOT NULL,
 followee_id INTEGER NOT NULL,
 created_at TIMESTAMP DEFAULT NOW(),
 FOREIGN KEY (follower_id) REFERENCES users(id),
 FOREIGN KEY (followee_id) REFERENCES users(id)
 );
 
 CREATE TABLE tags(
 id INTEGER AUTO_INCREMENT PRIMARY KEY,
 tag_name VARCHAR(255) UNIQUE,
 created_at TIMESTAMP DEFAULT NOW()
 );
 
 
 CREATE TABLE photo_tags(
 photo_id INTEGER NOT NULL,
 tag_id INTEGER NOT NULL,
 FOREIGN KEY(photo_id) REFERENCES photos(id),
 FOREIGN KEY(tag_id) REFERENCES tags(id),
 PRIMARY KEY(photo_id , tag_id)
 );
 
 
 
/*Create a query that shows the oldes user in the database*/
 SELECT * FROM users ORDER BY created_at ASC LIMIT 5;

/*Create a query that shows the most popular registration day in the database*/
SELECT DAYNAME(created_at) AS most_used , COUNT(*) AS total FROM users GROUP BY most_used ORDER BY total DESC;
 
 /*Find the user who have never posted a photo*/
  SELECT users.username , photos.image_url FROM users JOIN photos ON users.id != photos.user_id;
 
  select * from photos where image_url is null;
 
