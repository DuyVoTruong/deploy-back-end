#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jdk-slim
COPY --from=build /home/app/target/dat-ve-xe-0.0.1-SNAPSHOT.jar demo.jar
# ENV PORT=8081
EXPOSE 8081
ENTRYPOINT ["java","-jar","/demo.jar"]