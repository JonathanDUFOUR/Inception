-- force considering the grant tables
FLUSH PRIVILEGES;

-- keep only a local root user
DELETE FROM mysql.user WHERE User = 'root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

-- change root password
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MARIADB_ROOT_PASSWORD');

-- create new user
CREATE USER '$MARIADB_WP_USER'@'%' IDENTIFIED BY '$MARIADB_WP_PASSWORD';

-- give all permissions to the new user
GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$MARIADB_WP_USER'@'%' IDENTIFIED BY '$MARIADB_WP_PASSWORD';

-- apply modifications to the grant tables (maybe not necessary)
FLUSH PRIVILEGES;
