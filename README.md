# docker-dbsteward

Run [DBSteward](https://github.com/dbsteward/dbsteward), the SQL definition differencing tool.

Usage:
```
docker run --rm -t bstoots/dbsteward
```

To mount a volume from your host:
```
docker run --rm -t -v C:\Users\bstoots\path\to\dbxml:/db bstoots/dbsteward --xml=/db/db.xml
```

To run a specific published version of DBSteward from [Packagist](https://packagist.org/packages/dbsteward/dbsteward):
```
docker run --rm -t -e DBSTEWARD_VERSION=dev-master -v C:\Users\bstoots\path\to\dbxml:/db bstoots/dbsteward bstoots/dbsteward --xml=/db/db.xml
```

To mount a local checkout of the DBSteward source code in your container:
```
docker run --rm -t -e DBSTEWARD_DIR=/dbsteward -v C:\Users\bstoots\path\to\DBSteward:/db bstoots/dbsteward bstoots/dbsteward -v C:\Users\bstoots\path\to\dbxml:/db bstoots/dbsteward bstoots/dbsteward --xml=/db/db.xml
```
