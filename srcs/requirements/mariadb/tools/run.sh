#!/bin/sh

# Step 0
# Check if the database is already created, and if not, create it and set it up.
if [ ! -d /var/lib/mysql/mysql ]; then

	chown mysql:mysql /var/lib/mysql

	# This is a dirty patch to avoid errors caused by `No such file or directory` when setting up the plugins.
	sed -i 's/$basedir\/lib\/\*\/mariadb19/$basedir\/lib\*\/mariadb/g' $(which mariadb-install-db)

	mariadb-install-db
	envsubst < tmp/setup_db.sql | mariadbd --bootstrap
fi

exec mariadbd
