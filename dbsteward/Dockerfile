FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
  ca-certificates \
  git \
  libxml2 \
  libxml2-dev \
  openssl \
  php-cli \
  php-mysqli \
  php-pgsql \
  php-xml \
  sudo 

RUN useradd \
  --create-home \
  --groups sudo \
  dbsteward
RUN echo dbsteward:dbsteward | chpasswd

USER dbsteward
WORKDIR /home/dbsteward

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
USER root
RUN sudo mv composer.phar /usr/local/bin/composer
USER dbsteward
# Display version information.
RUN composer --version

RUN composer global require nkiraly/dbsteward:dev-master
ENV PATH=$PATH:/home/dbsteward/.composer/vendor/bin

RUN mkdir /home/dbsteward/dbxml
VOLUME /home/dbsteward/dbxml
