#!/bin/sh

# Step 0
# Check if the database is already created, and if not, create it and set it up.
if [ ! -d /var/lib/mysql/mysql ]; then

	chown mysql:mysql /var/lib/mysql

	mariadb-install-db --rpm
	envsubst < tmp/setup_db.sql | mariadbd --bootstrap
fi

exec mariadbd
