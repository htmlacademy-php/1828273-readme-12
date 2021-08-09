CREATE DATABASE readme
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE readme;

CREATE TABLE users (
  id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  registration TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(128) NOT NULL,
  login VARCHAR(50) NOT NULL,
  password CHAR(64) NOT NULL,
  avatar VARCHAR(200)
);

CREATE UNIQUE INDEX u_email ON users(email);
CREATE UNIQUE INDEX u_login ON users(login);

CREATE TABLE post (
  id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  user_id INT(11) NOT NULL,
  content_id INT(11) NOT NULL,
  creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  title VARCHAR(100),
  content TINYTEXT NOT NULL,
  author VARCHAR(100),
  picture VARCHAR(200),
  video VARCHAR(200),
  web VARCHAR(200),
  views INT(11)
);

CREATE INDEX p_title ON post(title);
CREATE INDEX p_author ON post(author);

CREATE TABLE comments (
  id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  user_id INT(11) NOT NULL,
  post_id INT(11) NOT NULL,
  creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  content TINYTEXT NOT NULL
);

CREATE TABLE likes (
  id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  user_id INT(11) NOT NULL,
  post_id INT(11) NOT NULL
);

CREATE TABLE subscription (
  id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  user_id INT(11) NOT NULL,
  user_id_subscribed INT(11) NOT NULL
);

CREATE TABLE messages (
  id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  user_id_sender INT(11) NOT NULL,
  user_id_recipient INT(11) NOT NULL,
  creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  content TINYTEXT NOT NULL
);

CREATE TABLE hashtags (
  id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  name VARCHAR(20) NOT NULL
);

CREATE UNIQUE INDEX h_name ON hashtags(name);

CREATE TABLE posts_hashtags (
  post_id INT(11) NOT NULL,
  hashtag_id INT(11) NOT NULL
);

CREATE TABLE contents (
  id INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
  name VARCHAR(15) NOT NULL,
  class VARCHAR(15) NOT NULL
);
