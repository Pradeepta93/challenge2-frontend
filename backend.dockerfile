#Install correct Php image
FROM php
#Install Dependencies
RUN apt-get update -y && apt-get install -y openssl zip unzip git wget curl
#Install composer to manage Php Libraries
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#Installing Laravel Dependencies
RUN docker-php-ext-install pdo mbstring pdo_mysql
#Set working directory to app
WORKDIR /app
RUN git clone https://github.com/zurez/challenge2.git 
#Copy all my files to the workdir [. means all]
#COPY . /app  #No need to copy anymore 
#Change current workdir to cloned directory
WORKDIR /app/challenge2/backend
CMD wget -c https://gist.githubusercontent.com/zurez/42dbec27c5d6e11d77236fa397d95213/raw/91e69d4e0b1cbc95499f20f8e511aed6cf816d01/.env
#Install application depenencies
RUN composer install
#CMD php:artisan key:generate
#Start application
#Learn about CMD vs RUN
CMD php artisan serve --host=0.0.0.0 --port=8000
#Open Port 
EXPOSE 8000
