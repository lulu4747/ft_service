CREATE DATABASE grafana_db;
CREATE USER 'gra_user' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON grafana_db.* TO 'gra_user';
FLUSH PRIVILEGES;