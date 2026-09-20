# Product Service

Product Service is a Node.js and TypeScript microservice responsible for managing products in the ecommerce application.

It provides APIs for product creation, product listing, product updates, product deletion, vendor product management, stock checking, category filtering, and product image uploads.

---

## Overview

Product Service is part of the ecommerce microservices architecture.

```text
                    Product Service
                           |
        ┌──────────────────┼──────────────────┐
        ↓                  ↓                  ↓
   PostgreSQL           Redis              Kafka
        |
      Prisma
        |
      MinIO
   Product Images
```

The service is designed to run independently and communicate with other services through APIs and event-driven communication.

---

## Technology Stack

* Node.js 20
* TypeScript
* Express.js
* Prisma ORM
* PostgreSQL
* Redis
* Apache Kafka
* MinIO
* Docker

---

## Service Port

```text
3003
```

Local direct service URL:

```text
http://localhost:3003
```

However, during local development, the frontend accesses backend APIs through the **Nginx API Gateway**.

---

# API Gateway

The application uses different gateway technologies for development and production.

## Development — Nginx

For local development, **Nginx** is used as the API Gateway and reverse proxy.

```text
Frontend
   │
   │ HTTP
   ▼
Nginx API Gateway :8081
   │
   │ /api/products
   ▼
Product Service :3003
```

Example gateway URL:

```text
http://localhost:8081/api/products
```

The Product Service itself runs on:

```text
http://localhost:3003
```

The frontend normally communicates with the Nginx gateway instead of directly calling individual backend services.

### Nginx Responsibilities

* Reverse proxy
* API routing
* Local development gateway
* Frontend-to-backend communication
* Routing `/api` requests to backend services

---

## Production — Traefik

In the production Kubernetes environment, **Traefik** is used as the API Gateway / ingress layer.

```text
Client
   │
   │ HTTPS
   ▼
Traefik
   │
   │ Kubernetes Routing
   ▼
Product Service
   │
   ├── PostgreSQL
   ├── Redis
   ├── Kafka
   └── MinIO
```

The Product Service runs inside Kubernetes and is exposed through a Kubernetes Service.

The Product Service does not need to know whether traffic arrived through Nginx or Traefik.

### Traefik Responsibilities

* Kubernetes ingress / gateway
* HTTP/HTTPS routing
* TLS termination
* Service discovery
* Load balancing
* Production traffic management

Therefore:

```text
Development → Nginx API Gateway
Production  → Traefik
```

This keeps the application code independent of the gateway implementation.

---

## Project Structure

```text
product-service/
│
├── src/
│   ├── controllers/
│   │   └── product.controller.ts
│   │
│   ├── db/
│   │   └── prisma/
│   │       └── schema.prisma
│   │
│   ├── kafka/
│   ├── middlewares/
│   ├── minio/
│   ├── redis/
│   ├── routes/
│   ├── services/
│   ├── types/
│   ├── app.ts
│   └── server.ts
│
├── dist/
├── Dockerfile
├── .dockerignore
├── package.json
├── package-lock.json
├── tsconfig.json
└── README.md
```

---

# Responsibilities

Product Service is responsible for:

* Creating products
* Listing products
* Getting product details
* Updating products
* Deleting products
* Listing vendor products
* Checking product stock
* Filtering products by category
* Uploading product images
* Storing product images in MinIO
* Managing product data using PostgreSQL and Prisma
* Integrating with Redis
* Integrating with Kafka

---

# Vendor Authorization

Product creation is restricted to authenticated and approved vendors.

The service uses the authenticated user's identity to determine the vendor.

The frontend should not be trusted to provide or control the vendor ID.

Expected workflow:

```text
Vendor Registration
       ↓
PENDING
       ↓
Admin Approval
       ↓
APPROVED
       ↓
Vendor Login
       ↓
Create Product
```

Rejected vendors cannot use the product creation functionality.

---

# Product Categories

Products can be filtered by category.

Example:

```text
GET /products?category=Beauty
```

Example categories:

```text
Beauty
Electronics
Fashion
Home
```

---

# Product Example

Example product:

```text
Name: Lakme Face Cream
Category: Beauty
Price: 499
Stock: 20
Description: Lakme face cream for daily skincare
```

---

# API Endpoints

The exact authentication requirements depend on the endpoint.

## Health

```http
GET /health
```

## List Products

```http
GET /products
```

Category filtering:

```http
GET /products?category=Beauty
```

## Get Product

```http
GET /products/:id
```

## Create Product

```http
POST /products
```

Requires an authenticated and approved vendor.

## Update Product

```http
PUT /products/:id
```

Requires appropriate authentication and authorization.

## Delete Product

```http
DELETE /products/:id
```

Requires appropriate authentication and authorization.

## Vendor Products

```http
GET /products/vendor
```

## Check Stock

```http
GET /products/:id/stock
```

> Refer to the current route and controller implementation for exact request bodies and authentication requirements.

---

# Database

PostgreSQL is used as the primary database.

Prisma is used as the ORM.

The Prisma schema is located at:

```text
src/db/prisma/schema.prisma
```

Generate Prisma Client:

```bash
npx prisma generate --schema=src/db/prisma/schema.prisma
```

The project uses a non-standard Prisma schema location, so the schema path must be supplied explicitly.

---

# Redis

Redis is used for fast data access and caching-related functionality.

Typical local configuration:

```env
REDIS_HOST=localhost
REDIS_PORT=6379
```

When running inside Docker or Kubernetes, the hostname should refer to the corresponding service rather than `localhost`.

---

# Kafka

Apache Kafka is used for event-driven communication between microservices.

Kafka allows services to communicate asynchronously without tightly coupling every operation to another service.

Kafka configuration is provided through environment variables.

When running inside Docker or Kubernetes, use the appropriate Kafka service hostname.

---

# MinIO

MinIO is used as object storage for product images.

Default bucket:

```text
products
```

Images are stored separately from the application container.

Example image URL:

```text
http://<minio-host>:9000/products/<filename>
```

The Product Service initializes the bucket and configures public read access for product images.

---

# Environment Variables

The service uses environment variables for application and infrastructure configuration.

Example:

```env
PORT=3003

DATABASE_URL=postgresql://username:password@localhost:5432/database

REDIS_HOST=localhost
REDIS_PORT=6379

KAFKA_BROKER=localhost:9092

MINIO_ENDPOINT=localhost
MINIO_PORT=9000
MINIO_ACCESS_KEY=minio
MINIO_SECRET_KEY=minio123
```

**Never commit real credentials or secrets to Git.**

The local `.env` file is excluded from the Docker build context through `.dockerignore`.

For Kubernetes, secrets should be injected using Kubernetes Secrets or an external secrets management solution.

---

# Local Development

Install dependencies:

```bash
npm ci
```

Start the development server:

```bash
npm run dev
```

During local development:

```text
Frontend
   ↓
Nginx API Gateway :8081
   ↓
Product Service :3003
```

---

# Build

Compile the TypeScript application:

```bash
npm run build
```

The compiled application is generated in:

```text
dist/
```

Production entry point:

```text
dist/server.js
```

---

# Production Start

Run the compiled application:

```bash
npm start
```

This executes:

```bash
node dist/server.js
```

---

# Docker

Product Service can be built as an independent Docker image.

## Docker Build Process

The Dockerfile performs the following steps:

```text
Node.js 20
    ↓
npm ci
    ↓
Copy source
    ↓
Prisma Generate
    ↓
TypeScript Build
    ↓
Expose 3003
    ↓
Run dist/server.js
```

## Build Docker Image

From the Product Service directory:

```bash
docker build -t product-service:dev .
```

Current development image:

```text
product-service:dev
```

## Verify Image

```bash
docker images | grep product-service
```

---

# Run Docker Container

The Product Service requires its dependent infrastructure to be available.

For local testing:

```bash
docker run --name product-service \
  -p 3003:3003 \
  --env-file .env \
  product-service:dev
```

Check the container:

```bash
docker ps
```

View logs:

```bash
docker logs product-service
```

Follow logs:

```bash
docker logs -f product-service
```

Stop the container:

```bash
docker stop product-service
```

Remove the container:

```bash
docker rm product-service
```

---

# Docker Ignore

The following files and directories are excluded from the Docker build context:

```text
node_modules
dist
.env
.git
.gitignore
Dockerfile
npm-debug.log
*.log
test.jpg
```

This prevents local dependencies, build artifacts, secrets, Git metadata, and unnecessary files from being copied into the image.

---

# Docker Networking

When running the Product Service inside Docker, `localhost` refers to the Product Service container itself.

Therefore, other containers should be accessed using their Docker service names.

Example:

```env
REDIS_HOST=redis
MINIO_ENDPOINT=minio
```

Architecture:

```text
Product Service
      |
      ├── PostgreSQL
      ├── Redis
      ├── Kafka
      └── MinIO
```

Docker Compose can be used to provide the required infrastructure and networking.

---

# Health Check

The Product Service exposes:

```http
GET /health
```

Test locally:

```bash
curl http://localhost:3003/health
```

The health endpoint can later be used for:

* Docker health checks
* Kubernetes liveness probes
* Kubernetes readiness probes
* Load balancers
* Monitoring systems

---

# DevOps Implementation

This Product Service is being used as part of a practical DevOps learning project.

Current implementation:

```text
Source Code
     ↓
TypeScript Build
     ↓
Prisma Generate
     ↓
Docker Build
     ↓
product-service:dev
```

Gateway architecture:

```text
Development
Frontend
   ↓
Nginx API Gateway
   ↓
Product Service
```

Production target:

```text
Client
   ↓
Traefik
   ↓
Kubernetes
   ↓
Product Service
```

---

# Planned CI/CD Pipeline

The planned CI/CD workflow is:

```text
Developer
    ↓
Git Push
    ↓
GitHub
    ↓
GitHub Actions
    ↓
Lint / Test / Build
    ↓
Security Scan
    ↓
Docker Build
    ↓
Trivy Scan
    ↓
Generate SBOM
    ↓
Sign Image
    ↓
Push to GHCR
    ↓
Kubernetes
    ↓
Argo CD
```

Planned tools include:

* GitHub Actions
* Docker
* GitHub Container Registry
* Trivy
* Syft
* Cosign
* Kubernetes
* Helm
* Argo CD

---

# Kubernetes

The Product Service is planned to be deployed to Kubernetes.

Production architecture:

```text
                    Internet
                       │
                      HTTPS
                       │
                       ▼
                    Traefik
                       │
                       ▼
              Product Service
                  Kubernetes
                   Service
                       │
              ┌────────┼────────┐
              ↓        ↓        ↓
         PostgreSQL  Redis     Kafka
                               
                       │
                     MinIO
```

Planned Kubernetes resources include:

* Deployment
* Service
* ConfigMap
* Secret
* Readiness probe
* Liveness probe
* Resource requests
* Resource limits
* Horizontal Pod Autoscaler
* Network policies

---

# Security

The current Docker build reports dependency vulnerabilities during `npm ci`.

These vulnerabilities should be reviewed and remediated deliberately.

Avoid blindly running:

```bash
npm audit fix --force
```

because forced upgrades can introduce breaking changes.

Future CI/CD security checks will include:

```text
Dependency Scan
      ↓
Container Scan
      ↓
SBOM Generation
      ↓
Image Signing
      ↓
Policy Validation
```

Planned security tools include:

* Trivy
* Syft
* Cosign
* Kyverno
* CodeQL

---

# Observability

Future observability will include:

```text
Product Service
      ↓
OpenTelemetry
      ↓
 ┌────┼─────┐
 ↓    ↓     ↓
Logs Metrics Traces
 ↓     ↓      ↓
Loki Prometheus Tempo
 └─────┼──────┘
       ↓
    Grafana
```

The service will eventually provide metrics, logs, and distributed traces for troubleshooting and performance monitoring.

---

# Current Status

| Component                   | Status                |
| --------------------------- | --------------------- |
| TypeScript Build            | ✅ Working             |
| Prisma Generate             | ✅ Working             |
| Dockerfile                  | ✅ Created             |
| Docker Image Build          | ✅ Working             |
| Docker Image                | `product-service:dev` |
| Health Endpoint             | Available             |
| PostgreSQL Integration      | Implemented           |
| Redis Integration           | Implemented           |
| Kafka Integration           | Implemented           |
| MinIO Integration           | Implemented           |
| Development Gateway         | Nginx                 |
| Production Gateway          | Traefik               |
| CI/CD                       | Planned               |
| Kubernetes                  | Planned               |
| Helm                        | Planned               |
| GitHub Actions              | Planned               |
| Container Security Scanning | Planned               |
| Observability               | Planned               |

---

# Development Commands

### Install dependencies

```bash
npm ci
```

### Development

```bash
npm run dev
```

### Build

```bash
npm run build
```

### Start

```bash
npm start
```

### Generate Prisma Client

```bash
npx prisma generate --schema=src/db/prisma/schema.prisma
```

### Docker Build

```bash
docker build -t product-service:dev .
```

### Docker Run

```bash
docker run --name product-service \
  -p 3003:3003 \
  --env-file .env \
  product-service:dev
```

---

# License

This project is intended for educational and self-learning purposes.

