# User Service

The **User Service** is a backend microservice responsible for managing user profiles and user-related data in the ecommerce application.

It works together with the Auth Service through Kafka events and provides authenticated APIs for retrieving, updating, and deleting user profiles.

---

## Overview

The User Service is responsible for:

- Managing user profiles
- Storing user information in PostgreSQL
- Creating users from Auth Service Kafka events
- Retrieving individual users
- Retrieving the current authenticated user
- Updating user profiles
- Deleting users
- Publishing profile update events
- Publishing user deletion events
- Using Redis for user-service caching/session-related functionality
- Validating authenticated requests using JWT

---

## Architecture

### Development

```text
Frontend
   |
   v
Nginx API Gateway :8081
   |
   v
User Service :3015
   |
   +---- PostgreSQL
   |
   +---- Redis
   |
   +---- Kafka



Production Target
Client
   |
   v
HTTPS
   |
   v
Traefik Ingress
   |
   v
Kubernetes Service
   |
   v
User Service Pod
   |
   +---- PostgreSQL
   +---- Redis
   +---- Kafka
Technology Stack
Technology	Purpose
Node.js 20	Runtime
TypeScript	Application language
Express.js	HTTP server
Prisma	ORM
PostgreSQL	User database
Kafka	Event-driven communication
Redis	Cache/session-related storage
JWT	Authentication
Docker	Containerization
Kubernetes	Production orchestration
Traefik	Production ingress/API gateway
Helm	Kubernetes packaging
GitHub Actions	CI/CD
Service Port
3015

The service listens on:

0.0.0.0:3015
Project Structure
user-service/
├── src/
│   ├── app.ts
│   ├── server.ts
│   │
│   ├── controllers/
│   │   └── user.controller.ts
│   │
│   ├── db/
│   │   └── prisma/
│   │       ├── prisma.ts
│   │       └── schema.prisma
│   │
│   ├── kafka/
│   │   ├── kafka.client.ts
│   │   ├── user.consumer.ts
│   │   ├── user.producer.ts
│   │   └── user.topics.ts
│   │
│   ├── middlewares/
│   │   └── auth.middleware.ts
│   │
│   ├── redis/
│   │   ├── redis.ts
│   │   └── session.cache.ts
│   │
│   ├── routes/
│   │   └── user.routes.ts
│   │
│   ├── services/
│   │   └── user.service.ts
│   │
│   └── types/
│       └── express.d.ts
│
├── Dockerfile
├── .dockerignore
├── package.json
├── package-lock.json
├── tsconfig.json
└── README.md
Database

The service uses PostgreSQL through Prisma ORM.

User Model
User
├── id
├── email
├── role
├── name
├── phone
├── createdAt
└── updatedAt
Roles
USER
VENDOR
ADMIN

The email field is unique.

Prisma

Prisma schema:

src/db/prisma/schema.prisma

Generate Prisma Client:

npx prisma generate --schema=src/db/prisma/schema.prisma

Run database migrations when required:

npx prisma migrate dev
Kafka Integration

The User Service participates in event-driven communication using Kafka.

Consumes
auth.user.created

When the Auth Service creates a user, it publishes an auth.user.created event.

The User Service consumes the event and creates the corresponding user profile.

Flow:

Auth Service
     |
     | auth.user.created
     v
   Kafka
     |
     v
User Service
     |
     v
PostgreSQL
Publishes

The User Service publishes events for:

user.profile.updated
user.deleted

These events allow other services to react without tightly coupling them to the User Service.

Redis

Redis is used by the User Service for caching/session-related functionality.

Default configuration:

Host: localhost
Port: 6379
Database: 1

Environment variables:

REDIS_HOST
REDIS_PORT
REDIS_PASSWORD
Authentication

Authenticated endpoints use JWT-based authentication.

The authentication middleware extracts the JWT from the request and makes the authenticated user information available through:

req.user

The User Service uses the authenticated user's ID when handling the current-user endpoint.

API Responsibilities

Typical endpoints include:

GET    /users
GET    /users/:id
GET    /users/me
PUT    /users/:id
DELETE /users/:id

Exact routes are defined in:

src/routes/user.routes.ts
Local Development
Install dependencies
npm ci
Generate Prisma Client
npx prisma generate --schema=src/db/prisma/schema.prisma
Start development server
npm run dev

The service runs on:

http://localhost:3015
Production Build

Compile TypeScript:

npm run build

Compiled files are generated in:

dist/

Start the compiled application:

npm start
Docker

The service includes a Dockerfile for containerized deployment.

Build:

docker build -t user-service:dev .

Run:

docker run --rm -p 3015:3015 user-service:dev

The container exposes:

3015
Docker Build

The Docker image performs:

Node.js 20 base image
Dependency installation with npm ci
Prisma Client generation
TypeScript compilation
Application startup using dist/server.js
Health and Observability

The service should expose health information suitable for container and Kubernetes health checks.

Future production observability will include:

Prometheus metrics
Grafana dashboards
Loki logs
Tempo traces
OpenTelemetry
Grafana Alloy
Alertmanager

Target flow:

User Service
    |
    +---- Metrics ---> Prometheus
    |
    +---- Logs ------> Loki
    |
    +---- Traces ----> Tempo
    |
    v
  Grafana
Kubernetes

The production deployment will run the User Service inside Kubernetes.

Planned resources:

Deployment
Service
ConfigMap
Secret
HorizontalPodAutoscaler
NetworkPolicy
PodDisruptionBudget

Example target architecture:

Traefik
   |
   v
Kubernetes Service
   |
   v
User Service Pods
   |
   +---- PostgreSQL
   +---- Redis
   +---- Kafka
Helm

The service will be packaged using Helm as part of the production Kubernetes deployment.

Planned configuration includes:

Replica count
Image repository
Image tag
Resource requests/limits
Environment variables
Secrets
Service configuration
Health probes
Autoscaling
CI/CD

The planned CI/CD pipeline will include:

GitHub
   |
   v
GitHub Actions
   |
   +---- npm ci
   +---- npm run build
   +---- Tests
   +---- Security scanning
   +---- Docker build
   +---- Trivy scan
   +---- SBOM generation
   +---- Image signing
   |
   v
GHCR
   |
   v
Kubernetes
   |
   v
Argo CD
Security

Planned security controls include:

JWT authentication
Role-based authorization
Kubernetes NetworkPolicies
Secrets management
External Secrets Operator
Container image scanning
Dependency scanning
CodeQL
Trivy
SBOM generation
Cosign image signing
Kyverno policy enforcement
TLS using cert-manager
Testing

Build verification:

npm run build

Prisma verification:

npx prisma generate --schema=src/db/prisma/schema.prisma

Docker verification:

docker build -t user-service:dev .

Future testing will include:

Unit tests
Integration tests
API tests
Kafka event tests
Redis tests
Kubernetes health checks
k6 load testing
Environment Variables

Typical environment variables include:

PORT=3015

DATABASE_URL=postgresql://...

REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_PASSWORD=

KAFKA_BROKERS=localhost:9092

JWT_SECRET=...

Production secrets should not be committed to Git.

Kubernetes secrets and External Secrets Operator will be used for production secret management.

DevOps Learning Goals

This service is part of the ecommerce microservices project used for practical DevOps learning.

The service provides hands-on practice with:

TypeScript application builds
Node.js containerization
Docker
PostgreSQL
Prisma
Redis
Kafka
API gateways
Kubernetes
Helm
CI/CD
GitHub Actions
GHCR
Argo CD
Observability
Security scanning
Infrastructure automation
Current Status
Application
 TypeScript build
 Prisma Client generation
 Kafka consumer
 Kafka producer
 Redis integration
 JWT authentication middleware
 User profile operations
Containerization
 Dockerfile
 .dockerignore
 Docker image build
 user-service:dev
DevOps
 Kubernetes deployment
 Helm chart
 GitHub Actions CI
 GHCR publishing
 Argo CD deployment
 Observability stack
 Security scanning
 Production TLS
 Autoscaling
 Disaster recovery
Useful Commands
# Install dependencies
npm ci

# Generate Prisma Client
npx prisma generate --schema=src/db/prisma/schema.prisma

# Development
npm run dev

# Build
npm run build

# Start compiled application
npm start

# Docker build
docker build -t user-service:dev .

# Check Docker image
docker images | grep user-service
License

This project is intended for educational and self-learning purposes.

See the repository license for usage and distribution terms.



