# Use the official PHP image as the base
FROM php:8.0-fpm

# Set working directory and User
USER www-data
WORKDIR /var/www/html

# Environment variables
ENV PHP_CONF_DATE_TIMEZONE=UTC \
    PHP_CONF_MAX_EXECUTION_TIME=60 \
    PHP_CONF_MEMORY_LIMIT=512M \
    PHP_CONF_OPCACHE_VALIDATE_TIMESTAMP=0 \
    PHP_CONF_MAX_INPUT_VARS=1000 \
    PHP_CONF_UPLOAD_LIMIT=40M \
    PHP_CONF_MAX_POST_SIZE=40M

# Update and install PHP extensions and system dependencies
RUN apt-get update && \
    apt-get --yes install --no-install-recommends \
        imagemagick \
        libmagickwand-dev \
        ghostscript \
        openssh-client \
        aspell \
        aspell-en aspell-es aspell-de aspell-fr \
        git \
        curl \
        zip \
        unzip \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
        libonig-dev \
        libxslt1-dev \
        libzip-dev \
        libmemcached-dev \
        zlib1g-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-configure intl && \
    docker-php-ext-install \
        pdo \
        pdo_mysql \
        intl \
        opcache \
        mysqli \
        exif \
        gd \
        xsl \
        zip \
        mbstring \
        bcmath && \
    pecl install imagick && docker-php-ext-enable imagick && \
    pecl install apcu && docker-php-ext-enable apcu && \
    pecl install memcached && docker-php-ext-enable memcached && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set memory limit
RUN echo "memory_limit=512M" > /usr/local/etc/php/conf.d/memory-limit.ini

# Install MySQL client
RUN apt-get update && apt-get install -y default-mysql-client && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Node.js, npm, and Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && npm install -g yarn && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Ensure writable permissions for cache and logs directories
RUN chown -R www-data:www-data /var/www/html/ /var/www/html/ && \
    chmod -R 775 /var/www/html/ /var/www/html/

# Copy the existing application directory contents
COPY . .

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
