# Start with a base image containing Java runtime (The FROM command)
FROM adoptopenjdk:11-jdk-hotspot

# The ARG command defines a variable that users can pass at build-time
ARG JAR_FILE=build/libs/*.jar

# The COPY command copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>
COPY ${JAR_FILE} app.jar

# The EXPOSE command informs Docker that the container listens on the specified network ports at runtime
EXPOSE 8080

# The ENTRYPOINT command allows you to configure a container that will run as an executable
ENTRYPOINT ["java","-jar","/app.jar"]