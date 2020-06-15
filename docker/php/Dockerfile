FROM php:7.3-fpm
ARG TIMEZONE
RUN apt-get update && apt-get install -y \
    openssl \
    git \
    unzip \
    libpq-dev \
    libxslt-dev

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& composer --version
# Set timezone
RUN ln -snf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && echo ${TIMEZONE} > /etc/timezone \
&& printf '[PHP]\ndate.timezone = "%s"\n', ${TIMEZONE} > /usr/local/etc/php/conf.d/tzone.ini \
&& "date"
# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_pgsql xsl

WORKDIR /var/www/symfony
COPY . /var/www/symfony
