# 🏦 Spring Boot BankApp (Dockerized on AWS EC2)

This is a **Dockerized Spring Boot Banking Application** connected to **MySQL**, fully deployed on an **AWS EC2 instance** using Docker CLI.  
It follows real-world deployment practices including container networking, health checks, and infrastructure isolation.
Check Images Folder to view the OverView of Application.
This project is perfect for demonstrating **cloud deployment, DevOps workflow, and freelance readiness**.

---

## 🚀 EC2 Docker Deployment Commands

```bash
# Clone the repo on EC2
git clone https://github.com/TDevendra532/SpringBoot-BankingApp.git
cd SpringBoot-BankingApp

# Build the JAR file
mvn clean install

# Build Docker image
docker build -t devendra532/spring-bankapp:v1 .

# Create Docker network
docker network create bankapp-net

# Run MySQL container
docker run -d \
--name mysql \
--network bankapp-net \
-e MYSQL_ROOT_PASSWORD=Test@123 \
-e MYSQL_DATABASE=BankDB \
-v mysql_data:/var/lib/mysql \
-p 3306:3306 \
mysql:latest

# Run Spring Boot app container
docker run -d \
--name bankapp \
--network bankapp-net \
-e SPRING_DATASOURCE_URL="jdbc:mysql://mysql:3306/BankDB?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" \
-e SPRING_DATASOURCE_USERNAME=root \
-e SPRING_DATASOURCE_PASSWORD=Test@123 \
-p 8080:8080 \
devendra532/spring-bankapp:v1

# Check Application on AWS Ec2:
https//EC2_public_Ip:8080

# Health check
curl http://localhost:8080/actuator/health
