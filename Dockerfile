#FROM adoptopenjdk/openjdk11:alpine-jre
FROM maven:3.6.3-jdk-11

# Refer to Maven build -> finalName
#ARG JAR_FILE=target/spring-boot-web.jar

# cd /opt/app
WORKDIR /workspace/app

COPY src src
COPY pom.xml .

RUN mvn clean package

# cp target/spring-boot-web.jar /opt/app/app.jar
#COPY ${JAR_FILE} app.jar

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","target/spring-boot-web-application-example-0.0.1-SNAPSHOT.war"]

## sudo docker run -p 8080:8080 -t docker-spring-boot:1.0
## sudo docker run -p 80:8080 -t docker-spring-boot:1.0
## sudo docker run -p 443:8443 -t docker-spring-boot:1.0
