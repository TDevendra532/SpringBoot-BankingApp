# 🏦 Spring Boot BankApp (Dockerized on AWS EC2)

This is a fully Dockerized Spring Boot + MySQL banking application, deployed on an AWS EC2 instance using Docker commands.

---

## 🔥 Full Commands (Copy-Paste Ready) for EC2 Terminal.
Steps to Follow :

```bash
# 1. Clone the Repository
git clone https://github.com/TDevendra532/spring-bankapp-custom.git
cd spring-bankapp

# 2. Build the JAR file
./mvnw clean package
# OR (if Maven is installed)
mvn clean package

# 3. Build the Docker Image
docker build -t devendra532/spring-bankapp:v1 .

# 4. Create Docker Network
docker network create bankapp-net

# 5. Start MySQL Container
docker run -d \
--name mysql \
--network bankapp-net \
-e MYSQL_ROOT_PASSWORD=Test@123 \
-e MYSQL_DATABASE=BankDB \
-v mysql_data:/var/lib/mysql \
-p 3306:3306 \
mysql:latest

# 6. Run Spring Boot App Container
docker run -d \
--name bankapp \
--network bankapp-net \
-e SPRING_DATASOURCE_URL="jdbc:mysql://mysql:3306/BankDB?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" \
-e SPRING_DATASOURCE_USERNAME=root \
-e SPRING_DATASOURCE_PASSWORD=Test@123 \
-p 8080:8080 \
devendra532/spring-bankapp:v1

# 7. Verify Application
curl http://localhost:8080/actuator/health

