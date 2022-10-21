#!/bin/sh

mariadb-install-db --defaults-file=/etc/my.cnf.d/mariadb-install-db.ini
exit 0

# Step 0
# Check if the directory which will contain the mariadb server pid-file and the socket file exists, and if not, create it.
if [ ! -d /run/mysqld ]; then
	mkdir /run/mysqld
	chown mysql:mysql /run/mysqld
fi

# Step 1
# Check if the database is already created, and if not, create it.
if [ ! -d /var/lib/mysql/mysql ]; then
	
fi

exec mariadbd --defaults-file=/etc/my.cnf.d/mariadbd.ini
