# For Java 11, try this
FROM adoptopenjdk/openjdk11:alpine-jre

## Refer to Maven build -> finalName
#ARG JAR_FILE=target/dockex-0.0.1-SNAPSHOT.jar

# cd /opt/app
WORKDIR /opt/app
RUN ./mvnw install -DskipTests
EXPOSE 8080
# cp target/spring-boot-web.jar /opt/app/app.jar
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]