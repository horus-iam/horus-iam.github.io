# Mavenized Openxava

Maven repository ready to add pojos and run openxava magic.

# Requirements

- java 8
- maven
- mysql

## Variables

|Name |Value sample |Description
|--|--|
|ADMIN_PASSWORD|changeme| password for admin user
|DATABASE_HORUS_HOST|changeme| password for admin user
|DATABASE_HORUS_NAME|changeme| password for admin user
|DATABASE_HORUS_PORT|changeme| password for admin user
|DATABASE_HORUS_WEB_PASSWORD|changeme| password for admin user
|DATABASE_HORUS_WEB_USER|changeme| password for admin user
|DATABASE_SSL|changeme| password for admin user
|DATASOURCE_POOL_MAX_ACTIVE|changeme| password for admin user
|LOG_HIBERNATE_SQL|changeme| password for admin user
|HORUS_CRYPT_PASSWORD|changeme| password for admin user
|HORUS_CRYPT_SALT|changeme| password for admin user

**Shell variables**

```
export ADMIN_PASSWORD=admin
export DATABASE_HORUS_HOST=192.168.0.22
export DATABASE_HORUS_NAME=horus2
export DATABASE_HORUS_PORT=3306
export DATABASE_HORUS_WEB_PASSWORD=secret
export DATABASE_HORUS_WEB_USER=root
export DATABASE_SSL=false
export DATASOURCE_POOL_MAX_ACTIVE=2
export LOG_HIBERNATE_SQL=true
export HORUS_CRYPT_PASSWORD=changeme
export HORUS_CRYPT_SALT=changeme
export JAVA_CODE_CACHE="-XX:ReservedCodeCacheSize=128m"
export JAVA_FILE_ENCODING="-Dfile.encoding=UTF8"
export JAVA_GC="-XX:+UseSerialGC"
export JAVA_JVM_HEADLESS_MODE="-Djava.awt.headless=true"
export JAVA_JVM_MODE="-server"
export JAVA_JVM_SECURE_RANDOM="-Djava.security.egd=file:/dev/./urandom"
export JAVA_RAM_GENERATION="-XX:NewSize=128m -XX:MaxNewSize=128m"
export JAVA_RAM="-Xms512m -Xmx1024m"
export JAVA_TIME_ZONE="-Duser.timezone=America/Lima"
```

## Run with Eclipse

- Open this repository using eclipse
- Disable jsp and javascript validations: https://yandao.github.io/quick%20tips/2015/03/26/disable-stupid-eclipse-jsp-validation-errors
- Disable xml validation in this file : src/main/resources/application.xml
- If you need to use another name instead default **mavenized-ox**, change it in :
```


src/main/resources/application.xml
<application name="mavenized-ox">
```
- Start a mysql database
- Update credentials in hibernate and persistence xml files
- Add tomcat 9 to your eclipse
- Add the required variables as environment variables in eclipse > run configurations > Apache Tomcat > My Tomcat > Environment.
- Use the classic "Run As" >> "Run on server"

# Build & Run without Docker

- Clone this repository
- Install offline dependencies and compile

```
mvn clean install
```

This will generate you a horus-web.war file in /horus-web/target ready to be deployed on any java web application server




```
docker build -t horus-web:1.0.0 .
```

```
docker run --restart=always --name horus-web -d --log-opt max-size=5m --log-opt max-file=10 -p 8080:8080 \
-e ADMIN_PASSWORD=changeme \
-e DATABASE_HORUS_HOST=10.20.30.40 \
-e DATABASE_HORUS_NAME=horus_2 \
-e DATABASE_HORUS_PORT=3306 \
-e DATABASE_HORUS_WEB_PASSWORD=changeme \
-e DATABASE_HORUS_WEB_USER=root \
-e DATABASE_SSL=false \
-e JDBC_DATASOURCE_MAX_ACTIVE=10 \
-e LOG_HIBERNATE_SQL=true \
-e HORUS_CRYPT_PASSWORD=changeme \
-e HORUS_CRYPT_SALT=changeme \
-e JAVA_CODE_CACHE="-XX:ReservedCodeCacheSize=128m" \
-e JAVA_FILE_ENCODING="-Dfile.encoding=UTF8" \
-e JAVA_GC="-XX:+UseSerialGC" \
-e JAVA_JVM_HEADLESS_MODE="-Djava.awt.headless=true" \
-e JAVA_JVM_MODE="-server" \
-e JAVA_JVM_SECURE_RANDOM="-Djava.security.egd=file:/dev/./urandom" \
-e JAVA_RAM_GENERATION="-XX:NewSize=128m -XX:MaxNewSize=128m" \
-e JAVA_RAM="-Xms128m -Xmx700m" \
-e JAVA_TIME_ZONE="-Duser.timezone=America/Lima" \
-e TZ=America/Lima  horus-web:1.0.0

```

# TO-DO

- use latest openxava version
- Open a pull request with hibernate improvement to use environment values: https://github.com/jrichardsz/hibernate-orm/tree/5.3.9-Final-Feature_env
- ensure unique uniqueConstraints(mail, first, lastname, mainIdentifier)  
- customizable expiration
- aws log
- tomcat root
- user management
- google client
- consent form
