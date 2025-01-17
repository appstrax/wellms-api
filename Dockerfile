FROM escolalms/php:8.2-prod
WORKDIR /var/www/html
EXPOSE 80
COPY / /var/www/html
RUN apt install -y apt-transport-https debian-archive-keyring debian-keyring \
  && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg \
  && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
RUN apt-get update && apt-get install caddy -y
RUN pecl install excimer
RUN cp docker/envs/.env.postgres.prod /var/www/html/.env \
  # general supervisord settings
  && cp docker/conf/supervisor/supervisord.conf /etc/supervisor/supervisord.conf \
  # supervisord services 
  && cp -r docker/conf/supervisor/services/* /etc/supervisor/custom.d \
  # caddy file for routing 
  && cp docker/conf/caddy/Caddyfile /etc/caddy/Caddyfile \
  # devilbox php.ini./ TODO this should be rather send to different custom file 
  && cp docker/conf/php/xxx-devilbox-default-php.ini /usr/local/etc/php/conf.d/xxx-devilbox-default-php.ini \
  # overwrite some php-fpm settings
  && cp docker/conf/php/php-fpm-custom.conf /usr/local/etc/php-fpm.d/php-fpm-custom.conf
RUN composer self-update && composer install --no-scripts
RUN chown -R devilbox:devilbox /var/www/

#CMD php docker/envs/envs.php && /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
CMD ["sh", "./startup.sh"]
