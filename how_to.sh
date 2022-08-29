# create an uploads.ini files to allow large file upload

upload_max_filesize = 100M
post_max_size = 100M

# docker-compose.yml
version: "2"
 
services:
   wordpress-db:
     container_name: wordpress-db
     image: mysql:latest
     volumes:
       - ./db:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: $ROOTPWD
       MYSQL_DATABASE: wordpress
       MYSQL_USER: $USER
       MYSQL_PASSWORD: $PWD
 
   wordpress:
     container_name: wordpress
     depends_on:
       - wordpress-db
     image: wordpress:latest
     ports:
       - 8081:80
     restart: always
     volumes:
       - ./uploads.ini:/usr/local/etc/php/conf.d/uploads.ini
       - ./html:/var/www/html
     environment:
       WORDPRESS_DB_HOST: wordpress-db:3306
       WORDPRESS_DB_USER: $USER
       WORDPRESS_DB_PASSWORD: $PWD
       WORDPRESS_DB_NAME: wordpress
     
   wordpress-pma:
    image: phpmyadmin/phpmyadmin
    container_name: wordpress-pma
    depends_on:
        - wordpress-db
    environment:
        - PMA_HOST=wordpress-db
        - PMA_PORT=3306
        - PMA_ARBITRARY=1
    ports:
        - 8082:80
    restart: always
