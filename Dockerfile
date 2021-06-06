FROM php:7.2-apache
COPY web/ /var/www/html/
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
