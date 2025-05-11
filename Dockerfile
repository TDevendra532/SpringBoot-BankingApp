# 📦 Base image with Maven + OpenJDK 17
FROM maven:3.8.3-openjdk-17

# 👨 Maintainer info (optional)
LABEL maintainer="Devendra Talhande <devendra.b.talhande@gmail.com>"
LABEL app="spring-bankapp"

# 📂 Working directory
WORKDIR /app

# 📥 Copy all source code
COPY . .

# 🛠️ Build the app (skip tests for speed)
RUN mvn clean install -DskipTests=true

# 🌐 Expose port
EXPOSE 8080

# 🚀 Run the JAR (assuming only one jar in /target)
ENTRYPOINT ["java", "-jar", "target/bankapp.jar"]
