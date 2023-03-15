FROM openjdk:8
COPY ./target/SPEMiniProject-1.0-SNAPSHOT-jar-with-dependencies.jar ./
WORKDIR ./
CMD ["java", "-jar", "SPEMiniProject-1.0-SNAPSHOT-jar-with-dependencies.jar"]
