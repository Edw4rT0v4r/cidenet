CREATE DATABASE cidenet;
CREATE USER 'cidenet'@'%' IDENTIFIED BY 'cidenet';
GRANT ALL PRIVILEGES ON cidenet . * TO 'cidenet'@'%';
FLUSH PRIVILEGES;

SHOW DATABASES;