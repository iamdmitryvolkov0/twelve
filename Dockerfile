FROM php:8.4-fpm

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Установка Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Рабочая директория
WORKDIR /var/www

# Копируем код
COPY . /var/www

# Установка прав
RUN chown -R www-data:www-data /var/www