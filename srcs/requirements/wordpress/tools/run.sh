#!/bin/sh

set -x -e

ls -ld /var/www/wordpress

# Step 0
# Check if wp-cli is already downloaded, and if not, download it.
if [ -z $(ls -A /var/www/wordpress) ]; then

	# Step 0.0
	# Download the wordpress-cli core files.
	wp core download
fi

# Step 1
# Check if the wp-config.php file exists, and if not, create it.
if [ ! -f /var/www/wordpress/wp-config.php ]; then

	# Step 1.0
	# Create the wp-config.php file.
	wp config create --dbname=$WP_DB_NAME --dbuser=$MARIADB_WP_USER --dbpass=$MARIADB_WP_PASSWORD --dbhost=$MARIADB_HOST

	# Step 1.1
	# Instanciate the database.
	wp db create

	# Step 1.2
	# Install wordpress, and create the admin user.
	wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

	# Step 1.3
	# Create a regular user.
	wp user create $WP_REGULAR_USER $WP_REGULAR_EMAIL --user_pass=$WP_REGULAR_PASSWORD --role=author
fi

# Step 2
# Start the php-fpm server.
exec php-fpm8 --nodaemonize
