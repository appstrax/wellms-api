#!/bin/bash 

# Create the directories if they don't exist. This is necessary to avoid caching issues
mkdir -p ${APP_STORAGE_PATH}/storage
mkdir -p ${APP_STORAGE_PATH}/storage/framework
mkdir -p ${APP_STORAGE_PATH}/storage/framework/sessions
mkdir -p ${APP_STORAGE_PATH}/storage/framework/views
mkdir -p ${APP_STORAGE_PATH}/storage/framework/cache
mkdir -p ${APP_STORAGE_PATH}/storage/logs
mkdir -p ${APP_STORAGE_PATH}/storage/app
mkdir -p ${APP_STORAGE_PATH}/storage/app/public
mkdir -p ${APP_STORAGE_PATH}/storage/app/public/imgcache

mkdir -p ${APP_STORAGE_PATH}/storage/h5p 
mkdir -p ${APP_STORAGE_PATH}/storage/h5p/temp
mkdir -p ${APP_STORAGE_PATH}/storage/h5p/libraries
mkdir -p ${APP_STORAGE_PATH}/storage/h5p/editor
mkdir -p ${APP_STORAGE_PATH}/storage/h5p/editor/images
mkdir -p ${APP_STORAGE_PATH}/storage/h5p/cachedassets

mkdir -p ${APP_STORAGE_PATH}/storage/app/h5p 
mkdir -p ${APP_STORAGE_PATH}/storage/app/h5p/temp
mkdir -p ${APP_STORAGE_PATH}/storage/app/h5p/libraries
mkdir -p ${APP_STORAGE_PATH}/storage/app/h5p/editor
mkdir -p ${APP_STORAGE_PATH}/storage/app/h5p/editor/images
mkdir -p ${APP_STORAGE_PATH}/storage/app/h5p/cachedassets

# Set the permissions
chmod -R 777 ${APP_STORAGE_PATH}/storage/framework 
chmod -R 777 ${APP_STORAGE_PATH}/storage/framework/views
chmod -R 777 ${APP_STORAGE_PATH}/storage/framework/cache
chmod -R 777 ${APP_STORAGE_PATH}/storage/app 
chmod -R 777 ${APP_STORAGE_PATH}/storage/logs 
chmod -R 777 ${APP_STORAGE_PATH}/storage/h5p 
chmod -R 777 ${APP_STORAGE_PATH}/storage/h5p/temp
chmod -R 777 ${APP_STORAGE_PATH}/storage/h5p/libraries
chmod -R 777 ${APP_STORAGE_PATH}/storage/h5p/editor
chmod -R 777 ${APP_STORAGE_PATH}/storage/h5p/editor/images
chmod -R 777 ${APP_STORAGE_PATH}/storage/h5p/cachedassets
chmod -R 777 ${APP_STORAGE_PATH}/storage/app/h5p 
chmod -R 777 ${APP_STORAGE_PATH}/storage/app/h5p/temp
chmod -R 777 ${APP_STORAGE_PATH}/storage/app/h5p/libraries
chmod -R 777 ${APP_STORAGE_PATH}/storage/app/h5p/editor
chmod -R 777 ${APP_STORAGE_PATH}/storage/app/h5p/editor/images
chmod -R 777 ${APP_STORAGE_PATH}/storage/app/h5p/cachedassets
chmod -R 777 ${APP_STORAGE_PATH}/storage/app/public
chmod -R 777 ${APP_STORAGE_PATH}/storage/app/public/imgcache

FILE=${APP_STORAGE_PATH}/storage/oauth-private.key
if [ -f "$FILE" ]; then
    echo "$FILE exists."     
else 
    echo "$FILE does not exist. Generating app keys, passport keys and passport client"
    php artisan key:generate --force --no-interaction
    php artisan passport:keys --force --no-interaction 
    php artisan passport:client --personal --no-interaction
fi

php artisan clear-compiled && php artisan optimize:clear && php artisan config:cache && php artisan config:clear && php artisan view:clear && php artisan cache:clear && php artisan migrate --force && php artisan storage:link && php artisan h5p:storage-link && php docker/envs/envs.php && /usr/bin/supervisord -c /etc/supervisor/supervisord.conf