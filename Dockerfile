FROM openjdk:12-alpine
COPY target/my-app-*.jar /my-app.jar
CMD ["java","-jar","/my-app.jar"]
