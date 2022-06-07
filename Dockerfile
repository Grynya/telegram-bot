# docker build -t fast-maven:1.5 .
FROM maven:latest as build
COPY . .
RUN mvn clean install

FROM openjdk:11-jre-slim-buster

COPY --from=build target/kpi.acts.hello_bot-2019.1.jar .

EXPOSE 4000

ENTRYPOINT ["java", "-jar", "fast-maven-builds-1.5.jar", "5306466810:AAEZDUaSuG_WSofcVJWs80KY5OnopsOD04M", "HelloWorldLab2Bot"]
