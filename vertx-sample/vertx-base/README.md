# Vert.x base

mvn clean compile vertx:run

mvn clean compile vertx:run -Dvertx.verticle=com.base.MainVerticle

mvn clean compile vertx:run -Dvertx.launcher=com.base.MainVerticle

mvn clean package -DskipTests && java -jar target/vertx-base-0.1.0.jar run com.base.MainVerticle -conf src/main/conf/application.json