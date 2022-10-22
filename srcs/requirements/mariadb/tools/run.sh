#!/bin/sh

# Step 0
# Check if the directory which will contain the mariadb server pid-file and the socket file exists, and if not, create it.
if [ ! -d /run/mysqld ]; then
	mkdir /run/mysqld
	chown mysql:mysql /run/mysqld
fi

# Step 1
# Check if the database is already created, and if not, create it.
if [ ! -d /var/lib/mysql/mysql ]; then
	chown mysql:mysql /var/lib/mysql

	# This is a dirty patch to avoid errors caused by `No such file or directory` when setting up the plugins.
	sed -i 's/$basedir\/lib\/\*\/mariadb19/$basedir\/lib\*\/mariadb/g' $(which mariadb-install-db)

	mariadb-install-db

	{
		# initialize privileges table (disabled when running in bootstrap mode)
		echo "FLUSH PRIVILEGES;"

		# delete all root user except the one with localhost as host
		echo "DELETE FROM mysql.user WHERE User = 'root' AND Host != 'localhost';"

		# change root password
		echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MARIADB_ROOT_PASSWORD');"

		# create new user
		echo "CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASSWORD';"

		# give all permissions to the new user
		echo "GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_DB_USER'@'%';"

		# apply modifications to the grant table (maybe not necessary)
		echo "FLUSH PRIVILEGES;"
	} | mariadbd --bootstrap
	exit 0
fi

exec mariadbd
