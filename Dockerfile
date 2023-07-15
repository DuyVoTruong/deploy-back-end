#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /app
COPY . /app/
RUN mvn clean package

#
# Package stage
#
FROM openjdk:11-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar /app/demo.jar
# ENV PORT=8081
EXPOSE 8081
ENTRYPOINT ["java","-jar","demo.jar"]