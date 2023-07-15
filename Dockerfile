#
# Package stage
#
FROM openjdk:11-jdk-slim
COPY --from=build /target/dat-ve-xe-0.0.1-SNAPSHOT.jar demo.jar
# ENV PORT=8080
EXPOSE 8081
ENTRYPOINT ["java","-jar","demo.jar"]