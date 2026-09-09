# 🛒 Ecommerce Microservices Platform

A production-oriented **microservices-based ecommerce platform** designed to demonstrate modern application development, cloud-native architecture, DevOps, and DevSecOps practices.

The platform provides separate applications for customers, vendors, and administrators and supports product management, shopping carts, orders, payments, inventory, reviews, invoices, shipping, refunds, notifications, analytics, and vendor management.

The application is being progressively evolved from a local Docker/WSL2 environment into a **Kubernetes-based, GitOps-driven platform**.

---

## 📌 Project Status

> 🚧 **Active DevOps transformation**

The application is already functional as a local microservices platform.

The DevOps implementation is being added incrementally without unnecessarily rewriting the existing application.

### Current environment

* WSL2 Ubuntu
* Docker
* Docker Compose
* Nginx API Gateway
* PostgreSQL
* Redis
* Apache Kafka
* MinIO
* Node.js / Express microservices
* Next.js storefront
* React/Vite dashboards

### Target platform

* Kubernetes
* kind for local Kubernetes development
* Traefik Gateway
* Helm
* Terraform
* Checkov
* GitHub Actions
* GitHub Container Registry
* Argo CD
* Argo Rollouts
* Cilium
* Hubble
* Kyverno
* cert-manager
* External Secrets Operator
* OpenTelemetry
* Grafana Alloy
* Prometheus
* Loki
* Tempo
* Alertmanager
* Trivy
* CodeQL
* SonarQube
* Syft
* Cosign
* SBOM
* Velero
* k6

---

# 🏗️ Project Architecture

The project follows a microservices architecture where each business capability is implemented as an independent service.

```text
                         ┌───────────────────────┐
                         │    Customer Browser   │
                         └───────────┬───────────┘
                                     │
                         ┌───────────▼───────────┐
                         │   Storefront :3000    │
                         │       Next.js         │
                         └───────────┬───────────┘
                                     │
                                     │ REST API
                                     ▼
                         ┌───────────────────────┐
                         │    Nginx API Gateway  │
                         │       :8081           │
                         └───────────┬───────────┘
                                     │
          ┌──────────────────────────┼──────────────────────────┐
          │                          │                          │
          ▼                          ▼                          ▼
     Auth / User              Product / Search             Order / Payment
      Services                   Services                     Services
          │                          │                          │
          └──────────────────────────┼──────────────────────────┘
                                     │
                     ┌───────────────┼───────────────┐
                     │               │               │
                     ▼               ▼               ▼
                  Kafka            Redis         PostgreSQL
                     │
          ┌──────────┼───────────┐
          ▼          ▼           ▼
      Inventory    Invoice    Notification
       Service     Service      Service
                     │
                     ▼
                   MinIO
```

---

# 🌐 Environment Strategy

The project intentionally uses different technologies at different stages.

## Local Development

Local development remains simple and developer-friendly.

```text
WSL2 Ubuntu
    │
    ├── Nginx API Gateway
    │       │
    │       ├── Auth Service
    │       ├── Product Service
    │       ├── Cart Service
    │       ├── Order Service
    │       ├── Payment Service
    │       └── Other Services
    │
    └── Docker
            ├── PostgreSQL
            ├── Redis
            ├── Kafka
            └── MinIO
```

Nginx is retained for local development because the current services run directly in the WSL2 environment and the existing gateway configuration is already functional.

## Kubernetes / Production

The Kubernetes architecture uses Traefik as the production gateway.

```text
                         Internet
                            │
                           HTTPS
                            │
                    Load Balancer / LB
                            │
                         Traefik
                            │
                     Gateway API
                            │
        ┌───────────────────┼───────────────────┐
        │                   │                   │
        ▼                   ▼                   ▼
     Auth Service       Product Service      Order Service
        │                   │                   │
        └───────────────────┼───────────────────┘
                            │
                   Kubernetes Services
                            │
        ┌───────────────────┼───────────────────┐
        ▼                   ▼                   ▼
     PostgreSQL           Redis               Kafka
```

### Gateway strategy

| Environment            | Gateway |
| ---------------------- | ------- |
| Local WSL2 development | Nginx   |
| Local Kubernetes       | Traefik |
| Production Kubernetes  | Traefik |

---

# 🏪 Vendor Registration & Approval Workflow

Vendor onboarding follows an administrator approval process.

```text
                 Vendor
                   │
                   ▼
          Vendor Registration
                   │
          Username + Password
                   │
                   ▼
                PENDING
                   │
                   ▼
          Admin Reviews Vendor
              /           \
             /             \
            ▼               ▼
        APPROVED         REJECTED
            │               │
            ▼               ▼
      Vendor Login      Access Restricted
            │
            ▼
     Vendor Dashboard
            │
            ▼
      Create Product
```

## Vendor Registration

The vendor registers through the Vendor Dashboard.

```text
http://localhost:5173
```

The registration form includes:

```text
Username
Email
Password
Confirm Password
```

The vendor remains in:

```text
PENDING
```

until administrator approval.

## Administrator Approval

The administrator uses:

```text
http://localhost:5174
```

The administrator can:

* Review vendor applications
* Approve vendors
* Reject vendors
* Manage users
* Manage products
* Manage orders
* View analytics

Only approved vendors can perform protected vendor operations.

---

# 📦 Product Creation Workflow

Only an approved vendor can create products.

```text
Approved Vendor
      │
      ▼
Vendor Dashboard
      │
      ▼
Add Product
      │
      ▼
Nginx / Traefik Gateway
      │
      ▼
Product Service
      │
      ▼
PostgreSQL
```

Products contain information such as:

```text
Product Name
Description
Price
Stock
Category
Images
Vendor ID
```

---

# 🛡️ Authentication & Authorization

Authentication is handled by the Auth Service.

The platform supports:

* JWT authentication
* Google OAuth
* Role-based authorization
* Vendor approval authorization
* Protected backend APIs

Application roles:

```text
USER
VENDOR
ADMIN
```

Vendor operations require:

```text
JWT Valid
    │
    ▼
Role = VENDOR
    │
    ▼
Vendor Exists
    │
    ▼
Vendor Status = APPROVED
    │
    ▼
Allow Operation
```

Authorization is enforced by backend services and is not dependent solely on frontend restrictions.

---

# 🧩 Backend Microservices

| Service                  | Responsibility                       |
| ------------------------ | ------------------------------------ |
| **Auth Service**         | Authentication, JWT and Google OAuth |
| **User Service**         | Customer/user management             |
| **Admin Service**        | Administrative operations            |
| **Product Service**      | Product catalog and management       |
| **Cart Service**         | Shopping cart management             |
| **Order Service**        | Order creation and lifecycle         |
| **Payment Service**      | Payment processing                   |
| **Rating Service**       | Product ratings and reviews          |
| **Inventory Service**    | Stock and inventory                  |
| **Invoice Service**      | Invoice generation and storage       |
| **Analytics Service**    | Ecommerce analytics                  |
| **Vendor Service**       | Vendor registration and approval     |
| **Search Service**       | Product search                       |
| **Shipping Service**     | Shipping and tracking                |
| **Refund Service**       | Refund processing                    |
| **Email Service**        | Email notifications                  |
| **Notification Service** | Application notifications            |

---

# 🖥️ Frontend Applications

## 🛍️ Storefront

Built with Next.js.

```text
http://localhost:3000
```

Features include:

* Product browsing
* Product search
* Product details
* Shopping cart
* Checkout
* Payments
* Orders
* Invoices
* Reviews
* Shipping tracking

---

## 🏪 Vendor Dashboard

Built with React/Vite.

```text
http://localhost:5173
```

Features include:

* Vendor registration
* Vendor login
* Approval status
* Product management
* Inventory management
* Order management
* Vendor analytics

---

## 👨‍💼 Admin Dashboard

Built with React.

```text
http://localhost:5174
```

Features include:

* Admin authentication
* Vendor approval
* Vendor rejection
* User management
* Product management
* Order management
* Analytics
* Platform administration

---

# 🌐 API Gateway

## Local Development — Nginx

Nginx acts as the local API Gateway.

Frontend applications communicate through:

```text
http://localhost:8081/api
```

Example:

```text
Frontend
   │
   ▼
http://localhost:8081/api/products
   │
   ▼
Nginx
   │
   ▼
Product Service :3003
```

Nginx provides:

* API routing
* Reverse proxying
* Authorization header forwarding
* CORS handling
* Upload size configuration
* Request forwarding
* Health endpoints

## Kubernetes / Production — Traefik

Traefik will be introduced when the application is deployed to Kubernetes.

The Kubernetes gateway will provide:

* Kubernetes service discovery
* Gateway API
* HTTPS/TLS
* Rate limiting
* Security headers
* WebSocket support
* Traffic management
* Observability integration

---

# 🐳 Docker

Docker is used to provide reproducible application and infrastructure environments.

Current local infrastructure includes:

* PostgreSQL
* Redis
* Apache Kafka
* Zookeeper
* MinIO

The DevOps implementation will progressively introduce:

* Multi-stage Docker builds
* BuildKit
* Buildx
* Non-root containers
* Minimal base images
* Health checks
* Resource-aware containers
* Image vulnerability scanning
* SBOM generation
* Image signing

---

# ☸️ Kubernetes

The target deployment platform is Kubernetes.

Local Kubernetes development will use:

```text
kind
```

The project will not use Minikube or k3s.

The Kubernetes implementation will include:

* Deployments
* Services
* ConfigMaps
* Secrets
* Ingress/Gateway
* HPA
* PDB
* Readiness probes
* Liveness probes
* Startup probes
* Resource requests and limits
* NetworkPolicy
* RBAC
* Pod Security Standards
* Topology spreading
* Rolling deployments

---

# 🚦 Kubernetes Gateway

Traefik will be used as the Kubernetes production gateway.

```text
Internet
    │
    ▼
Load Balancer
    │
    ▼
Traefik
    │
    ▼
Gateway API
    │
    ├── /api/auth
    ├── /api/products
    ├── /api/cart
    ├── /api/orders
    ├── /api/payments
    ├── /api/users
    ├── /api/vendors
    └── other APIs
```

TLS certificates will be managed using:

```text
cert-manager
```

---

# 📦 Helm

Helm will be used to package Kubernetes applications.

```text
Helm
 │
 ├── auth
 ├── user
 ├── product
 ├── cart
 ├── order
 ├── payment
 ├── inventory
 └── other services
```

Helm will provide configurable deployment values for:

* Image versions
* Replicas
* Resources
* Environment configuration
* Service configuration
* Gateway configuration
* Autoscaling

---

# 🌍 Infrastructure as Code

Terraform will manage infrastructure and platform-level resources.

The project will use:

```text
Terraform
   │
   ├── Kubernetes infrastructure
   ├── Networking
   ├── Supporting resources
   └── Cloud resources when deployed to AWS
```

Terraform security will be validated with:

```text
Checkov
```

Terraform validation pipeline:

```text
terraform fmt
       │
       ▼
terraform validate
       │
       ▼
Checkov
       │
       ▼
terraform plan
```

---

# 🔄 CI/CD

GitHub Actions will provide continuous integration and delivery automation.

```text
Developer
    │
    ▼
Git Push / Pull Request
    │
    ▼
GitHub Actions
    │
    ├── Lint
    ├── Unit Tests
    ├── TypeScript
    ├── CodeQL
    ├── SonarQube
    ├── Checkov
    ├── Trivy
    ├── Helm Lint
    ├── kubeconform
    ├── Docker Build
    ├── SBOM
    └── Cosign
            │
            ▼
           GHCR
            │
            ▼
        GitOps Update
            │
            ▼
          Argo CD
```

---

# 🔐 DevSecOps

Security is integrated throughout the software delivery lifecycle.

## Source Code Security

* GitHub Secret Scanning
* Dependabot
* CodeQL
* Branch protection
* CODEOWNERS
* GitHub Rulesets

## Code Quality

* ESLint
* TypeScript
* SonarQube
* Automated tests

## Infrastructure Security

* Terraform
* Checkov
* Kubernetes security validation
* RBAC
* NetworkPolicy
* Pod Security Standards

## Container Security

* Trivy
* Syft
* SBOM
* Cosign
* Image signing
* Provenance / attestations

## Kubernetes Security

* Kyverno
* Cilium NetworkPolicy
* Tetragon runtime security
* Non-root containers
* Dropped Linux capabilities
* Read-only filesystem where practical
* No privilege escalation

---

# 🔏 Software Supply Chain Security

Container images will be built using Docker BuildKit/Buildx and published to:

```text
GitHub Container Registry (GHCR)
```

The supply chain will include:

```text
Source Code
     │
     ▼
GitHub Actions
     │
     ▼
Docker BuildKit
     │
     ▼
OCI Image
     │
     ├── SBOM
     ├── Vulnerability Scan
     └── Provenance
             │
             ▼
          Cosign
             │
             ▼
        Signed Image
             │
             ▼
            GHCR
```

---

# 🛡️ Kubernetes Policy

Kyverno will enforce Kubernetes security and operational policies.

Examples:

* Require non-root containers
* Require resource requests/limits
* Prevent privileged containers
* Require approved image registries
* Require image signatures
* Prevent unsafe configurations
* Enforce labels and metadata

---

# 🌐 Kubernetes Networking

Cilium will provide Kubernetes networking and network security.

Hubble will provide network visibility.

```text
                    Cilium
                       │
        ┌──────────────┼──────────────┐
        │              │              │
        ▼              ▼              ▼
     Service        Service        Service
        │              │              │
        └──────────────┼──────────────┘
                       │
                    Hubble
                       │
                Network Visibility
```

NetworkPolicy will restrict unnecessary service-to-service communication.

---

# 📊 Observability

Observability will be based on OpenTelemetry.

Grafana Alloy will act as the unified telemetry collector.

```text
Applications
     │
     │ OpenTelemetry
     ▼
Grafana Alloy
     │
     ├────────► Prometheus
     │            Metrics
     │
     ├────────► Loki
     │            Logs
     │
     └────────► Tempo
                  Traces
                       │
                       ▼
                    Grafana
```

Alerting:

```text
Prometheus
    │
    ▼
Alertmanager
```

The platform will monitor:

* Availability
* Error rate
* Request latency
* p95/p99 latency
* CPU
* Memory
* Pod health
* Kafka activity
* Service errors
* Gateway traffic

---

# 🔍 Distributed Tracing

OpenTelemetry tracing will allow a request to be followed across services.

Example:

```text
Customer
   │
   ▼
Traefik
   │
   ▼
Order Service
   │
   ├──► Payment Service
   │
   ├──► Inventory Service
   │
   ├──► Kafka
   │       │
   │       └──► Notification Service
   │
   └──► Invoice Service
```

This makes it possible to identify where latency or failures occur in distributed requests.

---

# 📈 Reliability & Autoscaling

The Kubernetes platform will implement:

* Horizontal Pod Autoscaler
* KEDA for event-driven workloads where appropriate
* PodDisruptionBudget
* Readiness probes
* Liveness probes
* Startup probes
* Resource requests
* Resource limits
* Graceful shutdown
* Rolling updates
* Retry and timeout policies
* Topology spreading

Kafka consumer workloads can later use KEDA for event-driven scaling based on consumer lag.

---

# 💾 Backup & Disaster Recovery

Velero will be used to demonstrate Kubernetes backup and recovery.

Example recovery workflow:

```text
Kubernetes
    │
    ▼
Velero Backup
    │
    ▼
Application Failure
    │
    ▼
Delete / Recreate Resources
    │
    ▼
Velero Restore
    │
    ▼
Application Recovery
```

The project will demonstrate an actual backup and restore scenario rather than only documenting it.

---

# 🧪 Testing

Testing will cover multiple layers.

### Application Tests

* Jest
* Vitest
* Supertest

### End-to-End Tests

* Playwright

### Kubernetes Validation

* Helm lint
* kubeconform

### Performance Testing

* k6

Example performance targets will include:

* Request throughput
* Error percentage
* p95 latency
* p99 latency

---

# 📨 Event-Driven Architecture

Apache Kafka is used for asynchronous communication.

Example:

```text
Order Service
     │
     │ Order Created
     ▼
   Kafka
     │
     ├──────────► Inventory Service
     │
     ├──────────► Payment Service
     │
     ├──────────► Invoice Service
     │
     ├──────────► Email Service
     │
     └──────────► Notification Service
```

Kafka reduces direct coupling between asynchronous business operations.

---

# ⚡ Redis

Redis provides caching and temporary data storage.

Current use cases include:

* Cart data
* Caching
* Session-related information
* Frequently accessed data

Local configuration:

```text
Redis: localhost:6379
```

---

# 📦 MinIO

MinIO provides S3-compatible object storage during local development.

Used for:

* Product images
* Generated invoices
* Application files

Local endpoints:

```text
S3 API:  localhost:9000
Console:  localhost:9001
```

When the platform is moved to AWS, MinIO can be replaced by:

```text
Amazon S3
```

without changing the overall object-storage architecture.

---

# 🗄️ Database Architecture

The microservices follow database ownership by service.

```text
PostgreSQL
│
├── auth_db
├── admin_db
├── product_db
├── email_db
├── cart_db
├── order_db
├── payment_db
├── rating_db
├── inventory_db
├── invoice_db
├── analytics_db
├── vendor_db
├── search_db
├── shipping_db
├── user_db
├── refund_db
└── notification_db
```

Services should not directly access another service's database.

Communication between services should occur through APIs or events.

---

# 🛠️ Technology Stack

## Application

* Next.js
* React
* TypeScript
* Vite
* Tailwind CSS
* Zustand
* Node.js
* Express.js
* Prisma
* REST APIs
* JWT
* Google OAuth

## Data & Messaging

* PostgreSQL
* Redis
* Apache Kafka
* MinIO

## Local Gateway

* Nginx

## Kubernetes Gateway

* Traefik

## Containers

* Docker
* Docker BuildKit
* Docker Buildx
* OCI images
* GitHub Container Registry

## Kubernetes

* Kubernetes
* kind
* Helm
* Traefik
* Cilium
* Hubble
* Kyverno
* cert-manager
* External Secrets Operator

## Infrastructure

* Terraform
* Checkov

## CI/CD & GitOps

* GitHub
* GitHub Actions
* Argo CD
* Argo Rollouts

## Security

* CodeQL
* Dependabot
* GitHub Secret Scanning
* SonarQube
* Trivy
* Syft
* Cosign
* SBOM
* Provenance / attestations

## Observability

* OpenTelemetry
* Grafana Alloy
* Prometheus
* Loki
* Tempo
* Grafana
* Alertmanager

## Reliability

* HPA
* KEDA
* PDB
* Velero
* k6

---

# 📂 Repository Structure

The DevOps implementation will progressively organize the repository into application, infrastructure, Kubernetes, Helm, and CI/CD components.

```text
Ecommerce-Project/
│
├── README.md
│
├── docker-compose.yml
│
├── ecommerce-backend/
│   ├── auth-service/
│   ├── admin-service/
│   ├── product-service/
│   ├── email-service/
│   ├── cart-service/
│   ├── order-service/
│   ├── payment-service/
│   ├── rating-service/
│   ├── inventory-service/
│   ├── invoice-service/
│   ├── analytics-service/
│   ├── vendor-service/
│   ├── search-service/
│   ├── shipping-service/
│   ├── user-service/
│   ├── refund-service/
│   └── notification-service/
│
├── ecommerce-frontend/
│   ├── storefront/
│   ├── admin-dashboard/
│   └── vendor-dashboard/
│
├── nginx/
│   └── nginx.conf
│
├── terraform/
│
├── k8s/
│
├── helm/
│
└── .github/
    ├── workflows/
    ├── CODEOWNERS
    └── dependabot.yml
```

---

# 🚀 DevOps Roadmap

The DevOps implementation will be completed incrementally.

### Phase 1 — Source Control

* Git cleanup
* GitHub repository
* Branch strategy
* CODEOWNERS
* Rulesets
* Dependabot
* Secret scanning

### Phase 2 — Containerization

* Dockerfiles
* Multi-stage builds
* BuildKit
* Health checks
* Non-root containers
* Image optimization

### Phase 3 — CI

* GitHub Actions
* Lint
* Tests
* TypeScript
* CodeQL
* SonarQube
* Trivy
* Checkov
* Helm lint
* kubeconform

### Phase 4 — Supply Chain Security

* GHCR
* SBOM
* Syft
* Cosign
* Image signing
* Provenance / attestations

### Phase 5 — Infrastructure as Code

* Terraform
* Checkov
* Infrastructure modules
* Environment separation

### Phase 6 — Kubernetes

* kind
* Kubernetes manifests
* Services
* ConfigMaps
* Secrets
* RBAC
* NetworkPolicy
* Resource management

### Phase 7 — Production Gateway

* Traefik
* Gateway API
* TLS
* cert-manager
* Rate limiting
* Security headers

### Phase 8 — GitOps

* Argo CD
* Helm
* Argo Rollouts
* Progressive delivery

### Phase 9 — Security

* Kyverno
* Cilium
* Hubble
* Tetragon
* External Secrets Operator
* Runtime security

### Phase 10 — Observability

* OpenTelemetry
* Grafana Alloy
* Prometheus
* Loki
* Tempo
* Grafana
* Alertmanager

### Phase 11 — Reliability

* HPA
* KEDA
* PDB
* Health probes
* Graceful shutdown
* k6 performance testing

### Phase 12 — Disaster Recovery

* Velero
* Backup
* Restore
* Recovery validation

### Phase 13 — Cloud Deployment

After the local Kubernetes implementation is stable, the platform can be mapped to AWS services.

Example:

```text
Local                    AWS
────────────────────────────────────
kind                 →   EKS
MinIO                →   S3
PostgreSQL           →   RDS / PostgreSQL
Redis                →   ElastiCache
Kafka                →   Managed Kafka
Terraform            →   AWS infrastructure
Traefik              →   Kubernetes gateway
```

AWS deployment will be introduced only after the local Kubernetes platform is stable in order to control cloud costs.

---

# 🎯 DevOps Objectives

The final project aims to demonstrate practical knowledge of:

* Linux
* Git
* GitHub
* Docker
* Kubernetes
* Helm
* Terraform
* CI/CD
* GitOps
* DevSecOps
* Cloud networking
* Kubernetes networking
* Infrastructure as Code
* Container security
* Supply-chain security
* Observability
* Distributed tracing
* Autoscaling
* Disaster recovery
* Performance testing
* Production deployment practices

The goal is not simply to deploy an application.

The goal is to demonstrate the complete lifecycle:

```text
Code
 │
 ▼
GitHub
 │
 ▼
CI
 │
 ├── Test
 ├── Security Scan
 ├── IaC Scan
 └── Code Analysis
 │
 ▼
Build
 │
 ▼
SBOM + Provenance
 │
 ▼
Sign Image
 │
 ▼
GHCR
 │
 ▼
GitOps
 │
 ▼
Argo CD
 │
 ▼
Kubernetes
 │
 ▼
Traefik
 │
 ▼
Microservices
 │
 ▼
Observability
 │
 ▼
Alerts / SLOs
```

---

# 👩‍💻 Author

**Swapna Adhav**

---

# 📄 License

Copyright © 2026 Swapna Adhav. All Rights Reserved.

This project is provided for portfolio and educational purposes only.

You may view the source code, but you may not copy, modify, distribute,
or use this project or substantial portions of its source code without
prior written permission from the author.

