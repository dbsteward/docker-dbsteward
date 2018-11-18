#!/usr/bin/env bash

# A dbsteward source directory mounted into the container
# This will also allow you to run phpunit in the container.
if [[ -d "$DBSTEWARD_DIR" ]]; then
  composer global remove dbsteward/dbsteward
  $(cd "$DBSTEWARD_DIR" && composer install)
  "$DBSTEWARD_DIR/bin/dbsteward" "$@"
# Any version specification currently published to packagist.org: 
# https://packagist.org/packages/dbsteward/dbsteward
elif [[ -n "$DBSTEWARD_VERSION" ]]; then
  composer global remove dbsteward/dbsteward
  composer global require dbsteward/dbsteward:"$DBSTEWARD_VERSION"
  /root/.composer/vendor/bin/dbsteward "$@"
# Run command using the pre-built dbsteward package
else
  /root/.composer/vendor/bin/dbsteward "$@"
fi
