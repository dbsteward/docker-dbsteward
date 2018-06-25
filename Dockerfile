FROM ubuntu:16.04
# Whole mess of deps incoming
RUN apt-get update && apt-get install -y \
  ca-certificates \
  openssl \
  git \
  unzip \
  libxml2 \
  libxml2-dev \
  libxml2-utils \
  php-cli \
  php-mysqli \
  php-pgsql \
  php-xml \
  composer
# Install DBSteward
RUN composer global require nkiraly/dbsteward:dev-master
ENV PATH=$PATH:/root/.composer/vendor/bin
# Pick a sane entrypoint / default command
ENTRYPOINT ["dbsteward"]
CMD ["-h"]
