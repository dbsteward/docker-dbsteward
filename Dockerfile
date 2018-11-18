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
# Install a default DBSteward for people that just want to use the 
# current published version.
RUN composer global require dbsteward/dbsteward
# Use dbsteward.sh script as entrypoint so we can handle different versions 
# and development scenarios.
COPY dbsteward.sh /dbsteward.sh
ENTRYPOINT ["/dbsteward.sh"]
CMD ["-h"]
