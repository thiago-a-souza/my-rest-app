FROM openjdk:8-jdk-alpine

COPY target/my-rest-app.jar /

CMD ["java", "-jar", "/my-rest-app.jar"]
