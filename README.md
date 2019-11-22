# docker-dbsteward

Run [DBSteward](https://github.com/dbsteward/dbsteward), the SQL definition differencing tool.

Usage:
```
docker run --rm -t dbsteward/dbsteward
```

To mount a volume from your host:
```
docker run --rm -t -v C:\Users\bstoots\path\to\dbxml:/db dbsteward/dbsteward --xml=/db/db.xml
```

To mount a local checkout of the DBSteward source code in your container:
```
docker run --rm -t -e DBSTEWARD_DIR=/dbsteward -v C:\Users\bstoots\path\to\DBSteward:/dbsteward -v C:\Users\bstoots\path\to\dbxml:/db dbsteward/dbsteward --xml=/db/db.xml
```
