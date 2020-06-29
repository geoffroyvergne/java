# Vert.x bus

## Run producer
mvn clean compile vertx:run -Dvertx.verticle=com.base.ProducerVerticle 
mvn clean compile vertx:run -Dvertx.launcher=com.base.ProducerVerticle -Dvertx.config=src/main/application.json
java -jar ./target/vertx-bus-0.1.0.jar run --cluster com.base.ProducerVerticle

mvn clean package -DskipTests && java -jar target/vertx-bus-0.1.0.jar run com.base.ProducerVerticle -conf src/main/conf/application.json

## Run Consumer
mvn clean compile vertx:run -Dvertx.verticle=com.base.ConsumerVerticle
mvn clean compile vertx:run -Dvertx.launcher=com.base.ConsumerVerticle
java -jar ./target/vertx-bus-0.1.0.jar run --cluster com.base.ConsumerVerticle

mvn clean package -DskipTests && java -jar target/vertx-bus-0.1.0.jar run com.base.ConsumerVerticle -conf src/main/conf/application.json


mvn clean package docker:build
docker-compose up