## Hive 3 in docker container

[docker hub](https://hub.docker.com/repository/docker/sharpetl/hive3)

## Build

```sh
docker build -t sharpetl/hive3:3.1.2 .
```

## Run

You can use this as your docker-compose file:

```yaml
version: '3'
services:
  hive:
    image: sharpetl/hive3:3.1.2
    ports:
      - "9083:9083"
      - "10000:10000"
      - "10002:10002"
    environment:
      - CONNECTION_URL=jdbc:mysql://mysql:3306/hive?useSSL=false
      - CONNECTION_USER_NAME=root
      - CONNECTION_PASSWORD=root
      - WAREHOUSE_DIR=file://${HOME}/Documents/warehouse
      - WAIT_HOSTS=mysql:3306
    depends_on:
      - mysql
    volumes:
      - ${HOME}/Documents/warehouse:${HOME}/Documents/warehouse
  mysql:
    image: mysql:5.7.28
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=root
```

## Acknowledgements

this project is re-using code and configs from [metorikku/hive:2.3.7](https://hub.docker.com/r/metorikku/hive)
