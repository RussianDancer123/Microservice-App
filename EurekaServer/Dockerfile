FROM eclipse-temurin:23-jdk
LABEL authors="RussianDancer"
WORKDIR /eureka-server-service

COPY target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]