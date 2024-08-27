#!/bin/bash 

# Create the directories if they don't exist. This is necessary to avoid caching issues
mkdir -p ${APP_STORAGE_PATH}/storage
mkdir -p ${APP_STORAGE_PATH}/storage/framework
mkdir -p ${APP_STORAGE_PATH}/storage/framework/sessions
mkdir -p ${APP_STORAGE_PATH}/storage/framework/views
mkdir -p ${APP_STORAGE_PATH}/storage/framework/cache

# Set the permissions
chmod -R 755 ${APP_STORAGE_PATH}/storage/framework 

php artisan clear-compiled && php artisan optimize:clear && php artisan config:cache && php artisan config:clear && php artisan view:clear && php artisan cache:clear && php artisan migrate --force && php artisan storage:link && php docker/envs/envs.php && /usr/bin/supervisord -c /etc/supervisor/supervisord.conf