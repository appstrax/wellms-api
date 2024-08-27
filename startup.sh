#!/bin/bash 

# Create the directories if they don't exist. This is necessary to avoid caching issues
mkdir -p ${APP_STORAGE_PATH}/storage
mkdir -p ${APP_STORAGE_PATH}/storage/framework
mkdir -p ${APP_STORAGE_PATH}/storage/framework/sessions
mkdir -p ${APP_STORAGE_PATH}/storage/framework/views
mkdir -p ${APP_STORAGE_PATH}/storage/framework/cache
mkdir -p ${APP_STORAGE_PATH}/storage/logs
mkdir -p ${APP_STORAGE_PATH}/storage/app

# Set the permissions
chmod -R 755 ${APP_STORAGE_PATH}/storage/framework 
chmod -R 755 ${APP_STORAGE_PATH}/storage/framework/views
chmod -R 755 ${APP_STORAGE_PATH}/storage/framework/cache
chmod -R 755 ${APP_STORAGE_PATH}/storage/app 
chmod -R 755 ${APP_STORAGE_PATH}/storage/logs 

FILE=${APP_STORAGE_PATH}/storage/oauth-private.key
if [ -f "$FILE" ]; then
    echo "$FILE exists."     
else 
    echo "$FILE does not exist. Generating app keys, passport keys and passport client"
    php artisan key:generate --force --no-interaction
    php artisan passport:keys --force --no-interaction 
    php artisan passport:client --personal --no-interaction
fi

php artisan clear-compiled && php artisan optimize:clear && php artisan config:cache && php artisan config:clear && php artisan view:clear && php artisan cache:clear && php artisan migrate --force && php artisan storage:link && php docker/envs/envs.php && /usr/bin/supervisord -c /etc/supervisor/supervisord.conf