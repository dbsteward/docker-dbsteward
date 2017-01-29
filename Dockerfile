FROM ubuntu:16.04
# Whole mess of deps incoming
RUN apt-get update && apt-get install -y \
  ca-certificates \
  openssl \
  git \
  libxml2 \
  libxml2-dev \
  libxml2-utils \
  php-cli \
  php-mysqli \
  php-pgsql \
  php-xml
# Download and Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
# Install DBSteward
RUN php composer.phar global require nkiraly/dbsteward:dev-master
ENV PATH=$PATH:/root/.composer/vendor/bin
# Pick a sane entrypoint / default command
ENTRYPOINT ["dbsteward"]
CMD ["-h"]
