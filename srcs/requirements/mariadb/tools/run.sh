#!/bin/sh

# Step 0
# Check if the directory which will contain the mariadb server pid-file and the socket file exists, and if not, create it.
if [ ! -d /run/mysqld ]; then
	mkdir /run/mysqld
	chown mysql:mysql /run/mysqld
fi

# Step 1
# Check if the database is already created, and if not, create it and set it up.
if [ ! -d /var/lib/mysql/mysql ]; then

	chown mysql:mysql /var/lib/mysql

	# This is a dirty patch to avoid errors caused by `No such file or directory` when setting up the plugins.
	sed -i 's/$basedir\/lib\/\*\/mariadb19/$basedir\/lib\*\/mariadb/g' $(which mariadb-install-db)

	mariadb-install-db
	export WP_DB_NAME=wordpress
	export WP_DB_USER=wordpress
	export WP_DB_PASSWORD=wordpressPassword
	envsubst < tmp/setup_db.sql | mariadbd --bootstrap
fi

exec mariadbd
