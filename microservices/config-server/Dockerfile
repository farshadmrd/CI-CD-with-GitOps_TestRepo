# First stage: Build the application with Maven
FROM maven:3.9.8-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Second stage: Create the actual Docker image
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=builder /app/target/config-server-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8888
ENTRYPOINT ["java", "-jar", "app.jar"]
