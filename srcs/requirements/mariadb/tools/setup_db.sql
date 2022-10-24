-- force considering the grant tables
FLUSH PRIVILEGES;

-- delete all users
DELETE FROM mysql.user;

-- create new user
CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';

-- give all permissions to the new user
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';

-- apply modifications to the grant tables (maybe not necessary)
FLUSH PRIVILEGES;
