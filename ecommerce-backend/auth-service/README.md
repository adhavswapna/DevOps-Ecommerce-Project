# Auth Service

Authentication and authorization service for the **DevOps E-Commerce Microservices Platform**.

The Auth Service manages user authentication, vendor registration, password security, JWT-based authentication, vendor approval status, Redis integration, and Kafka-based event communication with other microservices.

---

## 📌 Overview

The Auth Service is responsible for:

* User registration
* User login
* Vendor self-registration
* Vendor authentication
* JWT token generation and verification
* Password hashing and validation
* Password reset functionality
* Role-based authentication
* Vendor approval-status enforcement
* Redis integration
* Kafka event publishing and consumption
* Secure authentication middleware
* Communication with other microservices

### Vendor Registration Flow

```text
Vendor
   │
   ▼
Vendor Dashboard
   │
   ▼
POST /auth/register/vendor
   │
   ▼
Auth Service
   │
   ├── Create AuthUser
   │      └── vendorStatus = PENDING
   │
   └── Publish auth.user.created
              │
              ▼
        Vendor/User Services
              │
              ▼
        Admin Dashboard
              │
       ┌──────┴──────┐
       ▼             ▼
    APPROVE        REJECT
       │             │
       └──────┬──────┘
              ▼
      vendor.status.updated
              │
              ▼
        Auth Service
              │
       Update vendorStatus
```

An unapproved vendor cannot log in.

---

# 🏗️ Architecture

## Development Architecture

```text
┌──────────────────────┐
│   Storefront :3000   │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│  Nginx API Gateway   │
│       :8081          │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│    Auth Service      │
│       :3001          │
└──────┬───────┬───────┘
       │       │
       ▼       ▼
 PostgreSQL   Redis
       │
       ▼
     Kafka
```

## Production Architecture

```text
                    Internet
                       │
                       ▼
                HTTPS / TLS
                       │
                       ▼
              ┌────────────────┐
              │    Traefik     │
              │ Ingress/Gateway│
              └───────┬────────┘
                      │
                      ▼
             Kubernetes Service
                      │
                      ▼
             ┌─────────────────┐
             │   Auth Service  │
             │    :3001        │
             └──────┬──────────┘
                    │
          ┌─────────┼─────────┐
          ▼         ▼         ▼
     PostgreSQL   Redis     Kafka
```

---

# 🛠️ Technology Stack

| Technology      | Purpose                            |
| --------------- | ---------------------------------- |
| Node.js 20      | Runtime                            |
| TypeScript      | Application development            |
| Express.js      | HTTP server                        |
| Prisma          | Database ORM                       |
| PostgreSQL      | Authentication data                |
| Redis           | Caching/session-related operations |
| Kafka           | Event-driven communication         |
| JWT             | Authentication tokens              |
| bcrypt/bcryptjs | Password hashing                   |
| Zod             | Request validation                 |
| Helmet          | HTTP security headers              |
| CORS            | Cross-origin configuration         |
| Morgan          | HTTP request logging               |
| Docker          | Containerization                   |
| Kubernetes      | Production orchestration           |
| Traefik         | Production ingress/API gateway     |

---

# 📂 Project Structure

```text
auth-service/
├── src/
│   ├── app.ts
│   ├── server.ts
│   │
│   ├── constants/
│   │   └── role.enum.ts
│   │
│   ├── controllers/
│   │   └── auth.controller.ts
│   │
│   ├── kafka/
│   │   ├── auth.consumer.ts
│   │   ├── auth.producer.ts
│   │   ├── kafka.client.ts
│   │   ├── topics.ts
│   │   └── vendor.consumer.ts
│   │
│   ├── middlewares/
│   │   ├── auth.middleware.ts
│   │   └── role.middleware.ts
│   │
│   ├── redis/
│   │   ├── redis-client.ts
│   │   └── redis.ts
│   │
│   ├── routes/
│   │   └── auth.routes.ts
│   │
│   ├── services/
│   │   └── auth.service.ts
│   │
│   ├── types/
│   │   ├── auth.ts
│   │   └── express.d.ts
│   │
│   ├── utils/
│   │   ├── jwt.ts
│   │   ├── password.ts
│   │   └── reset-token.ts
│   │
│   ├── validators/
│   │   └── auth.validator.ts
│   │
│   └── db/
│       └── prisma/
│           └── schema.prisma
│
├── Dockerfile
├── .dockerignore
├── package.json
├── package-lock.json
├── tsconfig.json
└── README.md
```

---

# 🔐 Authentication Responsibilities

## User Registration

The Auth Service creates authentication accounts for normal users.

Typical flow:

```text
Client
  │
  ▼
Auth API
  │
  ▼
Validate request
  │
  ▼
Hash password
  │
  ▼
Create AuthUser
  │
  ▼
Publish auth.user.created
  │
  ▼
User Service
```

---

# 🏪 Vendor Registration

Vendors use a self-registration workflow.

```text
Vendor Registration
        │
        ▼
Auth Service
        │
        ▼
Create AuthUser
        │
        ├── role = VENDOR
        │
        └── vendorStatus = PENDING
        │
        ▼
Publish auth.user.created
        │
        ▼
Vendor/User Services
        │
        ▼
Admin reviews vendor
```

A vendor remains unable to authenticate while their status is:

```text
PENDING
```

If the administrator rejects the vendor:

```text
REJECTED
```

If the administrator approves the vendor:

```text
APPROVED
```

The vendor can then log in and access the vendor dashboard.

---

# 👤 Roles

The service supports the following roles:

```text
ADMIN
USER
VENDOR
```

Role information is stored in the authentication database and included in JWT authentication data.

---

# 🔑 JWT Authentication

After successful authentication, the service generates a JWT.

The JWT contains authentication information such as:

```text
userId
role
name
email
```

Example conceptual payload:

```json
{
  "userId": "user-id",
  "role": "VENDOR",
  "name": "Beauty Store",
  "email": "vendor@example.com"
}
```

The JWT is subsequently used by protected APIs.

---

# 🔒 Password Security

Passwords are never stored as plain text.

The service uses password hashing before storing credentials.

Authentication flow:

```text
Plain Password
      │
      ▼
Password Hashing
      │
      ▼
PostgreSQL
```

During login:

```text
Login Password
      │
      ▼
Compare With Hash
      │
      ▼
Authentication Result
```

---

# 📡 Kafka Integration

The Auth Service uses Kafka for asynchronous communication between microservices.

## Published Events

### `auth.user.created`

Published when Auth Service creates an authentication account.

Consumers can use this event to create or synchronize related user/vendor records.

```text
Auth Service
     │
     ▼
Kafka
     │
     └── auth.user.created
             │
             ├── User Service
             │
             └── Vendor Service
```

---

## Consumed Events

### `vendor.status.updated`

The Auth Service consumes vendor approval-status events.

Example:

```json
{
  "event": "VENDOR_STATUS_UPDATED",
  "data": {
    "vendorId": "vendor-id",
    "userId": "user-id",
    "status": "APPROVED"
  }
}
```

The Auth Service updates the corresponding authentication account.

Possible statuses:

```text
PENDING
APPROVED
REJECTED
```

---

# ⚡ Redis

Redis is integrated into the Auth Service for fast in-memory operations.

Redis can be used for authentication-related temporary data such as:

* Cached information
* Temporary authentication data
* Reset-token related workflows
* Fast lookups

---

# 🗄️ Database

The service uses **PostgreSQL** with **Prisma ORM**.

Prisma schema:

```text
src/db/prisma/schema.prisma
```

Generate Prisma Client:

```bash
npx prisma generate --schema=src/db/prisma/schema.prisma
```

Run development migrations:

```bash
npx prisma migrate dev
```

---

# 🌐 Service Port

| Service      |   Port |
| ------------ | -----: |
| Auth Service | `3001` |

The application listens on:

```text
0.0.0.0:3001
```

---

# 🔌 API Gateway

During local development, requests are routed through Nginx.

```text
Frontend
   │
   ▼
Nginx :8081
   │
   ▼
Auth Service :3001
```

The frontend should communicate with the gateway rather than directly exposing backend services.

Production will use Traefik and Kubernetes Services.

---

# ⚙️ Environment Variables

Create a local `.env` file.

Example:

```env
PORT=3001

DATABASE_URL=postgresql://USER:PASSWORD@HOST:5432/DATABASE

JWT_SECRET=your-secure-jwt-secret

REDIS_HOST=localhost
REDIS_PORT=6379

KAFKA_BROKER=localhost:9092
KAFKA_CLIENT_ID=auth-service
KAFKA_GROUP_ID=auth-service-group

ENABLE_KAFKA=true

VENDOR_FRONTEND_URL=http://localhost:5173
```

> Never commit `.env` files or production secrets to Git.

For Kubernetes, secrets should be managed using Kubernetes Secrets and, in the planned production architecture, External Secrets Operator or another approved secrets-management solution.

---

# 🚀 Local Development

## 1. Install dependencies

```bash
npm ci
```

## 2. Generate Prisma Client

```bash
npx prisma generate --schema=src/db/prisma/schema.prisma
```

## 3. Start development server

```bash
npm run dev
```

The service runs on:

```text
http://localhost:3001
```

---

# 🧪 Build

Compile TypeScript:

```bash
npm run build
```

Successful compilation generates:

```text
dist/server.js
```

Start the compiled application:

```bash
npm start
```

---

# 🐳 Docker

The Auth Service includes a production-oriented Dockerfile.

Build the image:

```bash
docker build -t auth-service:dev .
```

Run the container:

```bash
docker run --rm \
  -p 3001:3001 \
  --env-file .env \
  auth-service:dev
```

The container exposes:

```text
3001
```

---

# 🩺 Health Check

The service should provide an application health endpoint suitable for container and Kubernetes health checks.

Example:

```text
GET /health
```

Example response:

```json
{
  "status": "ok"
}
```

The exact endpoint should be verified against the current route configuration before configuring Kubernetes probes.

---

# 🔐 Security

Current security practices include:

* Password hashing
* JWT authentication
* Role-based authorization
* Vendor approval-status validation
* Helmet security headers
* CORS configuration
* Request validation with Zod
* Environment-based secrets
* Kafka event validation
* Protected authentication middleware

Production security will additionally include:

* HTTPS/TLS
* Kubernetes NetworkPolicies
* Traefik security configuration
* External Secrets
* Kyverno policies
* Container image scanning
* SBOM generation
* Image signing
* Runtime security controls

---

# ☸️ Kubernetes Deployment

The planned production deployment uses Kubernetes.

Target architecture:

```text
                 Internet
                    │
                    ▼
                 Traefik
                    │
                    ▼
             auth-service
                    │
              ┌─────┼─────┐
              ▼     ▼     ▼
         PostgreSQL Redis Kafka
```

Planned Kubernetes resources:

```text
Namespace
Deployment
Service
ConfigMap
Secret
ServiceAccount
HorizontalPodAutoscaler
NetworkPolicy
IngressRoute / Ingress
```

Traefik will route external authentication requests to the internal Auth Service Kubernetes Service.

---

# 📦 Helm

The service will eventually be packaged using Helm.

Example planned structure:

```text
helm/
└── auth-service/
    ├── Chart.yaml
    ├── values.yaml
    └── templates/
        ├── deployment.yaml
        ├── service.yaml
        ├── configmap.yaml
        ├── secret.yaml
        ├── hpa.yaml
        └── networkpolicy.yaml
```

---

# 🔄 CI/CD

The planned CI/CD pipeline will use GitHub Actions.

Pipeline stages:

```text
Developer
   │
   ▼
Git Push
   │
   ▼
GitHub Actions
   │
   ├── Lint
   ├── TypeScript Build
   ├── Unit Tests
   ├── Security Scan
   ├── Dependency Scan
   ├── Docker Build
   ├── Trivy Scan
   ├── SBOM Generation
   └── Image Signing
          │
          ▼
        GHCR
          │
          ▼
       Argo CD
          │
          ▼
     Kubernetes
```

Planned security tooling includes:

* Trivy
* CodeQL
* Syft
* Cosign
* Checkov
* SonarQube

---

# 📊 Observability

The planned observability stack includes:

```text
Auth Service
     │
     ├── Metrics
     ├── Logs
     └── Traces
          │
          ▼
   OpenTelemetry
          │
          ▼
    Grafana Stack
```

Planned components:

* Prometheus
* Grafana
* Loki
* Tempo
* Alertmanager
* Grafana Alloy / OpenTelemetry

Important authentication metrics will include:

* Login success/failure
* Registration attempts
* Vendor registration count
* Authentication latency
* HTTP error rate
* Kafka consumer/producer health
* Database connectivity
* Redis connectivity

---

# 🛡️ Reliability

Production reliability will include:

* Kubernetes replica scaling
* Readiness probes
* Liveness probes
* Resource requests/limits
* Horizontal Pod Autoscaling
* Kafka retry/error handling
* Redis availability monitoring
* PostgreSQL monitoring
* Rolling deployments
* GitOps-based deployment

---

# 🧪 Testing Strategy

Testing will cover:

### Authentication

```text
User Registration
User Login
Invalid Password
Invalid Credentials
JWT Validation
Token Expiration
```

### Vendor Authentication

```text
Vendor Registration
PENDING Vendor Login
APPROVED Vendor Login
REJECTED Vendor Login
Vendor Status Update
```

### Authorization

```text
USER
VENDOR
ADMIN
```

Each role should only access the APIs permitted for that role.

---

# 🔗 Service Dependencies

The Auth Service communicates with:

| Dependency     | Purpose                         |
| -------------- | ------------------------------- |
| PostgreSQL     | Authentication database         |
| Redis          | Fast temporary/cache operations |
| Kafka          | Event-driven communication      |
| User Service   | User synchronization            |
| Vendor Service | Vendor status synchronization   |
| Frontend       | Authentication requests         |
| Nginx          | Local API gateway               |
| Traefik        | Production ingress              |

---

# 📋 Useful Commands

Install dependencies:

```bash
npm ci
```

Development:

```bash
npm run dev
```

Build:

```bash
npm run build
```

Production start:

```bash
npm start
```

Generate Prisma Client:

```bash
npx prisma generate --schema=src/db/prisma/schema.prisma
```

Run Prisma migrations:

```bash
npx prisma migrate dev
```

Build Docker image:

```bash
docker build -t auth-service:dev .
```

Check generated application:

```bash
ls -lh dist/server.js
```

---

# 📈 DevOps Learning Goals

This service is part of the user's practical DevOps learning project.

The Auth Service is being used to practice:

* Microservices architecture
* Docker containerization
* Kubernetes deployments
* Helm
* GitHub Actions
* CI/CD
* GitOps
* Traefik
* Infrastructure as Code
* Secrets management
* Container security
* SBOM
* Image signing
* Observability
* Monitoring
* Distributed systems
* Kafka-based event-driven architecture
* Production reliability

---

# 🗺️ Future Improvements

Planned improvements include:

* Automated unit and integration tests
* Kubernetes deployment manifests
* Helm chart
* GitHub Actions CI/CD
* GHCR image publishing
* Trivy security scanning
* SBOM generation
* Cosign image signing
* Argo CD deployment
* Argo Rollouts
* OpenTelemetry instrumentation
* Prometheus metrics
* Grafana dashboards
* Loki centralized logging
* Tempo distributed tracing
* Kyverno policy enforcement
* NetworkPolicies
* Horizontal Pod Autoscaling
* Disaster recovery integration

---

# ✅ Current Status

| Component                       | Status     |
| ------------------------------- | ---------- |
| TypeScript source               | ✅          |
| Prisma integration              | ✅          |
| JWT authentication              | ✅          |
| Password hashing                | ✅          |
| Role support                    | ✅          |
| Vendor registration             | ✅          |
| Vendor approval-status handling | ✅          |
| Kafka integration               | ✅          |
| Redis integration               | ✅          |
| TypeScript build                | ✅          |
| Dockerfile                      | ✅          |
| `.dockerignore`                 | ✅          |
| Docker image                    | 🔄         |
| Kubernetes                      | 🔄 Planned |
| Helm                            | 🔄 Planned |
| CI/CD                           | 🔄 Planned |
| GitOps                          | 🔄 Planned |
| Observability                   | 🔄 Planned |
| Security scanning               | 🔄 Planned |

---

# 📄 License

This project is intended for **personal learning, practice, and portfolio/DevOps education purposes**.

See the repository license for the applicable terms.

