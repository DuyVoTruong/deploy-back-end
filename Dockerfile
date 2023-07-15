FROM eclipse-temurin:17-jdk-alpine
COPY target/dat-ve-xe-0.0.1-SNAPSHOT.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]