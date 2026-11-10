FROM eclipse-temurin:21-jre
COPY target/hello-world-app-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-cp", "app.jar", "com.example.App"]