# Use a base image with GraalVM and Maven for native compilation
FROM ghcr.io/graalvm/graalvm-ce:latest
# Set the working directory inside the container
WORKDIR /usr/src/app

## Copy the Gradle build files and settings
#COPY settings.gradle.kts /usr/src/app/settings.gradle.kts
#COPY build.gradle.kts /usr/src/app/build.gradle.kts

## Copy only the necessary files needed for dependency resolution
#COPY gradle /usr/src/app/gradle
#COPY gradlew /usr/src/app/gradlew

# Download Gradle and dependencies
RUN ./gradlew --version

# Build the Quarkus application using Gradle
RUN ./gradlew build -PquarkusPluginVersion=2.7.0.Final

# Copy the Quarkus application JAR file to the container
COPY build/libs/*-runner.jar /usr/src/app/app.jar

# Expose the port that your Quarkus application will run on
EXPOSE 8080

# Set the entry point to run the Quarkus application
CMD ["java", "-jar", "app.jar"]