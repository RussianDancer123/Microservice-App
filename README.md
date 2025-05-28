# 🚀 Microservice App

A microservices-based application using Angular for the frontend, Spring Boot for the backend services, and Docker for containerization.

---

## 📦 Requirements
> 🐳 For running the project using containers (recommended), you only need:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)

> 🛠️ For manual development or debugging (optional):

- [Node.js & Angular CLI](https://angular.io/guide/setup-local) – to run or develop the frontend manually
- [Java 17+](https://adoptium.net/) – required to run Spring Boot services locally
- [Maven](https://maven.apache.org/) – for building backend services manually (if not using the wrapper)

---

## 🛠️ How to Run

### 🔧 Option 1: Run Angular + Backend Services with Docker Compose *(Recommended)*

```bash
# 1. Start everything from containers
cd docker
docker-compose -f docker-compose-run.yml up --build
```

### 🔧 Option 2: Run Angular + Backend Services manually (WIP)

```bash
# 1. Start DB and Keycloak
cd docker
docker-compose -f docker-compose.yml up --build

# 2. Start Microservices
cd ApiGateway
./mvnw spring-boot:run

cd ../CompendiumClientService
./mvnw spring-boot:run

cd ../EurekaServer
./mvnw spring-boot:run

# 3. Start Angular
cd ../MicroserviceFrontend
npm install
ng serve
```