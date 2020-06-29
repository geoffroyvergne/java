# Vert.x Samples

https://vmp.fabric8.io/
https://github.com/vert-x3/vertx-examples

mvn io.fabric8:vertx-maven-plugin:1.0.9:setup \
    -DprojectGroupId=org.acme \
    -DprojectArtifactId=acme-project \
    -DprojectVersion=1.0-SNAPSHOT \ # default to 1.0-SNAPSHOT
    -Dverticle=org.acme.Foo \
    -Ddependencies=web,jmx,mongo

mkdir vertx-sample

mvn io.fabric8:vertx-maven-plugin:1.0.9:setup -DprojectGroupId=com.base -DprojectArtifactId=vertx-sample -DprojectVersion=1.0-SNAPSHOT -Dverticle=com.base.MainVerticle -Ddependencies=web

mvn clean install vertx:start

mvn vertx:stop
