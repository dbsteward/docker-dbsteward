#!/usr/bin/env sh
set -e

# A dbsteward source directory mounted into the container
# This will also allow you to run phpunit in the container.
if [ -d "$DBSTEWARD_DIR" ]; then
  composer global remove dbsteward/dbsteward
  cd "$DBSTEWARD_DIR" && composer install
  "$DBSTEWARD_DIR/bin/dbsteward" "$@"
# Run command using the pre-built dbsteward package
else
  /root/.composer/vendor/bin/dbsteward "$@"
fi
