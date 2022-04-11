FROM maven:3.8.1-openjdk-17-slim

WORKDIR /build

# Build dependency offline to streamline build
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src src
RUN mvn package -Dmaven.test.skip=true

FROM openjdk:11-jdk
COPY --from=0 /build/target/*.jar /app/app.jar

EXPOSE 8082
ENTRYPOINT [ "java", "-jar", "/app/app.jar", "--server.port=8082" ]