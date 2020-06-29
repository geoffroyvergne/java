# Thorntail 

## base

### swith to java 11
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home

mvn clean thorntail:run

curl localhost:8080/hello

### swagger
http://localhost:8080/swagger.json
http://localhost:8080/swagger-ui/index.html?url=http://localhost:8080/swagger.json

## jpa

### Run Postgres first

```
docker run \
    --rm \
    --name postgres \
    -e POSTGRES_USER=employee \
    -e POSTGRES_PASSWORD=employee \
    -e POSTGRES_DB=employee \
    -p 5432:5432 \
    -d \
    postgres
```