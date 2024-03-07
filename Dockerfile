# Use a base image with GraalVM and Maven for native compilation
FROM ghcr.io/graalvm/graalvm-ce:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Quarkus application JAR file to the container
COPY target/*-runner /usr/src/app/application

# Expose the port that your Quarkus application will run on
EXPOSE 8080

# Set the entry point to run the Quarkus application
CMD ["./application", "-Dquarkus.http.host=0.0.0.0"]
