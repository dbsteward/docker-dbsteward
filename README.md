# docker-dbsteward

Run [DBSteward](https://github.com/nkiraly/DBSteward), the SQL definition differencing tool.

Usage:
```
docker run -t bstoots/dbsteward
```

To mount a volume from your host:
```
docker run -t -v C:\Users\bstoots\path\to\dbxml:/db bstoots/dbsteward --xml=/db/db.xml
```
