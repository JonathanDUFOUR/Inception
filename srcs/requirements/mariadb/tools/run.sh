#!/bin/sh

# Step 0
# Check if the directory which will contain the mariadb server pid-file and the socket file exists, and if not, create it.
if [ ! -d /run/mysqld ]; then
	mkdir /run/mysqld
fi

# Step 1
# Check if the database is already created, and if not, create it.
if [ ! -d /var/lib/mysql/mysql ]; then
	
fi

exec mariadbd
