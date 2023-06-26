FROM maven:3.9.0-eclipse-temurin-17 AS build
WORKDIR /app/
COPY . /app/
RUN mvn clean package -DskipTests
#
# Package stage
#
FROM eclipse-temurin:17-jdk
COPY --from=build /app/target/*.jar app.jar
EXPOSE 61747
ENTRYPOINT ["java","-jar","app.jar"]