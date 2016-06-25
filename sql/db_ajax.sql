DROP DATABASE IF EXISTS db_ajax;
CREATE DATABASE db_ajax;

-- table user
DROP TABLE IF EXISTS db_ajax.user;
CREATE TABLE db_ajax.user (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK ID',
  email    VARCHAR(255) UNIQUE
  COMMENT 'Email',
  password VARCHAR(255) COMMENT 'password'
)
  COMMENT 'User table';

INSERT INTO db_ajax.user VALUES (NULL, 'asdf@asdf.com', '123');

SELECT *
FROM db_ajax.user;