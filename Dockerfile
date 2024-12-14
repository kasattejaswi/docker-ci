FROM maven:3.9.9-eclipse-temurin-21 AS build

COPY . /app

WORKDIR /app

RUN mvn test

RUN mvn clean package


FROM eclipse-temurin:21-jre-alpine

COPY --from=build /app/target/dockermastery-0.0.1-SNAPSHOT.jar /app/dockermastery.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "/app/dockermastery.jar" ]