# 🛒 Production-Grade E-Commerce Platform

### Cloud-Native Microservices • Kubernetes • GitOps • DevSecOps • Observability

A production-oriented e-commerce platform built with **microservices, Docker, Kubernetes, Terraform, GitHub Actions, Argo CD, Cilium, OpenTelemetry, and modern DevSecOps practices**.

This project takes an existing e-commerce application and progressively transforms it into a secure, observable, scalable, reliable, and GitOps-driven platform.

> **Goal:** Demonstrate the complete lifecycle of a production application — development, testing, security, containerization, deployment, observability, scaling, and disaster recovery.

---

# 🚀 Project Highlights

* 🧩 Microservices-based e-commerce architecture
* 🖥️ Next.js customer storefront
* 👨‍💼 Admin dashboard
* 🏪 Vendor dashboard
* 🐳 Docker + BuildKit
* ☸️ Kubernetes 1.37.x
* 🧪 kind local Kubernetes cluster
* 🌐 Nginx API Gateway
* 🔀 Kubernetes Gateway API
* 🛡️ Cilium CNI
* 🔎 Hubble network observability
* 📦 Helm
* 🏗️ Terraform
* 🔐 Checkov
* 🔄 GitHub Actions
* 📦 GitHub Container Registry
* 🚀 Argo CD GitOps
* 🔄 Argo Rollouts
* 🔍 Trivy
* 📋 Syft SBOM
* ✍️ Cosign image signing
* 🛡️ Kyverno
* 🔬 Tetragon
* 🔑 External Secrets Operator
* 🔒 cert-manager
* 📊 OpenTelemetry
* ⚙️ Grafana Alloy
* 📈 Prometheus
* 📝 Loki
* 🔭 Tempo
* 📊 Grafana
* 🚨 Alertmanager
* 📈 HPA
* ⚡ KEDA
* 💾 Velero
* 🧪 Jest/Vitest
* 🧪 Supertest
* 🎭 Playwright
* ⚡ k6

---

# 🏗️ High-Level Architecture

```text
                              USERS
                                │
                                ▼
                    ┌─────────────────────┐
                    │       NGINX         │
                    │     API Gateway     │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │    Gateway API      │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       CILIUM        │
                    │    Network Layer    │
                    └──────────┬──────────┘
                               │
          ┌────────────────────┼────────────────────┐
          │                    │                    │
          ▼                    ▼                    ▼
   ┌─────────────┐      ┌─────────────┐      ┌─────────────┐
   │ Auth        │      │ Product     │      │ Order       │
   │ Service     │      │ Service     │      │ Service     │
   └──────┬──────┘      └──────┬──────┘      └──────┬──────┘
          │                    │                    │
          └────────────────────┼────────────────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ▼                ▼                ▼
        PostgreSQL           Redis            Kafka
                                                  │
                                                  ▼
                                           Notification
                                              Service

                               │
                               ▼
                             MinIO


       ┌────────────────────────────────────────────────────┐
       │                   OBSERVABILITY                     │
       │                                                    │
       │ Applications → OpenTelemetry → Grafana Alloy       │
       │                              │                     │
       │                 ┌────────────┼────────────┐        │
       │                 ▼            ▼            ▼        │
       │            Prometheus      Loki         Tempo      │
       │                 │            │            │        │
       │                 └────────────┼────────────┘        │
       │                              ▼                     │
       │                           Grafana                  │
       │                              │                     │
       │                         Alertmanager               │
       └────────────────────────────────────────────────────┘


       ┌────────────────────────────────────────────────────┐
       │                    SECURITY                        │
       │                                                    │
       │ CodeQL • Dependabot • Secret Scanning              │
       │ SonarQube • Trivy • Checkov • Syft • Cosign         │
       │ Kyverno • Tetragon • RBAC • NetworkPolicy          │
       │ cert-manager • External Secrets                    │
       └────────────────────────────────────────────────────┘
```

---

# 🧩 Application Architecture

The existing e-commerce application consists of multiple services.

Typical backend services include:

```text
services/
├── auth-service
├── user-service
├── product-service
├── cart-service
├── order-service
├── payment-service
├── rating-service
├── inventory-service
├── invoice-service
├── notification-service
└── ...
```

Frontend applications:

```text
frontend/
admin-dashboard/
vendor-dashboard/
```

The exact service structure will remain aligned with the existing application.

---

# 🖥️ Frontend

## Customer Storefront

Technology:

* Next.js
* React
* TypeScript
* App Router

Features include:

* User registration/login
* Product browsing
* Product details
* Product images
* Shopping cart
* Checkout
* Orders
* User account

---

# 👨‍💼 Admin Dashboard

Technology:

* React
* Vite
* React Router

Responsibilities include:

* Vendor management
* Product management
* Order management
* Platform administration
* Administrative workflows

---

# 🏪 Vendor Dashboard

Technology:

* React
* Vite
* TypeScript

Responsibilities include:

* Vendor authentication
* Product management
* Order management
* Vendor analytics
* Inventory-related operations

---

# ⚙️ Backend

Backend services use:

* Node.js
* Express
* TypeScript
* Prisma
* PostgreSQL
* Redis
* Apache Kafka

Communication uses:

* REST APIs
* Kafka asynchronous events
* WebSockets where required

---

# 🌐 API Gateway

The project uses **Nginx** as the API Gateway.

Nginx handles:

* Reverse proxy
* Request routing
* CORS
* TLS termination
* Rate limiting
* Security headers
* Request size limits
* Timeouts
* WebSocket proxying
* Access logging
* Upstream load balancing

### Why Nginx?

Nginx is already part of the application architecture and is a mature, production-proven gateway.

There is no unnecessary replacement with another ingress/gateway technology.

---

# ☸️ Kubernetes

The application is deployed on:

**Kubernetes 1.37.x**

Local Kubernetes development uses:

**kind**

```text
Docker
   │
   ▼
 kind
   │
   ▼
Kubernetes
   │
   ├── Nginx
   ├── Cilium
   ├── Application Services
   ├── PostgreSQL
   ├── Redis
   ├── Kafka
   └── MinIO
```

The local Kubernetes environment is designed to model production practices without requiring an AWS environment during development.

---

# 🌐 Kubernetes Networking

## Cilium

Cilium provides:

* Kubernetes CNI
* NetworkPolicy
* Service networking
* Network visibility
* Runtime security integration

---

## Hubble

Hubble provides visibility into Kubernetes network communication.

Example:

```text
Frontend
   │
   ▼
Nginx
   │
   ▼
Order Service
   │
   ├── Payment Service
   │
   ├── Inventory Service
   │
   └── Kafka
          │
          ▼
    Notification Service
```

This allows service-to-service communication to be inspected and troubleshot.

---

# 📦 Helm

Helm is used for Kubernetes application packaging.

Example:

```text
helm/
├── ecommerce/
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
│
├── auth/
├── user/
├── product/
├── cart/
├── order/
├── payment/
└── ...
```

Helm manages application deployment templates and configuration.

---

# 🏗️ Infrastructure as Code

Infrastructure and platform configuration use:

**Terraform**

Terraform workflow:

```text
Terraform
   │
   ├── terraform fmt
   ├── terraform validate
   ├── terraform plan
   └── Checkov
```

Terraform is used for infrastructure/platform concerns.

Application deployment is handled separately through:

```text
Helm + Argo CD
```

This keeps infrastructure provisioning and application reconciliation properly separated.

---

# 🔄 CI/CD

The project uses:

**GitHub Actions**

Pipeline:

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
    ├── Integration Tests
    ├── TypeScript
    ├── CodeQL
    ├── SonarQube
    ├── Checkov
    ├── Trivy
    ├── Helm Lint
    └── kubeconform
             │
             ▼
       Docker BuildKit
             │
             ├── Trivy
             ├── Syft
             └── Cosign
             │
             ▼
            GHCR
```

---

# 🔐 DevSecOps

Security is integrated into the CI/CD lifecycle.

```text
Source Code
     │
     ├── Secret Scanning
     ├── Dependabot
     └── CodeQL
     │
     ▼
SonarQube
     │
     ▼
Checkov
     │
     ▼
Trivy
     │
     ▼
Docker Build
     │
     ├── Syft → SBOM
     │
     └── Cosign → Signature
     │
     ▼
GHCR
     │
     ▼
Kyverno
     │
     ▼
Kubernetes
```

---

# 🔍 Trivy

Trivy is used to scan:

* Container images
* Filesystems
* Dependencies
* Kubernetes manifests
* Configuration
* IaC where applicable

Security vulnerabilities are detected before deployment.

---

# 📋 SBOM

**Syft** generates Software Bills of Materials.

```text
Container Image
       │
       ▼
      Syft
       │
       ▼
      SBOM
```

SBOM provides visibility into the software components contained within application images.

---

# ✍️ Container Image Signing

Container images are signed with **Cosign**.

```text
Build Image
    │
    ▼
Generate SBOM
    │
    ▼
Cosign Sign
    │
    ▼
GHCR
    │
    ▼
Kyverno Verification
    │
    ▼
Kubernetes
```

This provides a stronger software supply-chain security model.

---

# 🛡️ Kubernetes Security

## Kyverno

Kyverno provides Kubernetes policy enforcement.

Example policies:

```text
❌ No privileged containers
❌ No root containers
❌ No latest image tags
❌ No missing resource limits
❌ No unapproved registries
❌ No insecure securityContext
```

---

## Tetragon

Tetragon provides runtime security and visibility.

It can observe:

* Process execution
* Network activity
* Runtime security events
* Container behavior

Tetragon is used alongside Cilium.

---

# 🔑 Secrets Management

Secrets are never committed to Git.

Local development may use Kubernetes Secrets.

Production-style secret management uses:

**External Secrets Operator**

```text
External Secret Store
        │
        ▼
External Secrets Operator
        │
        ▼
Kubernetes Secret
        │
        ▼
Application
```

When migrating to AWS, this can integrate with AWS Secrets Manager.

---

# 🔒 TLS

TLS certificates are managed using:

**cert-manager**

Example:

```text
Let's Encrypt
     │
     ▼
cert-manager
     │
     ▼
TLS Secret
     │
     ▼
Nginx
```

---

# 🔭 Observability

Observability is a **core platform capability**, not an optional feature.

The project uses:

* OpenTelemetry
* Grafana Alloy
* Prometheus
* Loki
* Tempo
* Grafana
* Alertmanager

---

# 📊 Observability Architecture

```text
                         APPLICATIONS
                              │
                              ▼
                       OpenTelemetry
                              │
                              ▼
                       Grafana Alloy
                              │
                ┌─────────────┼─────────────┐
                │             │             │
                ▼             ▼             ▼
           Prometheus        Loki          Tempo
             Metrics         Logs          Traces
                │             │             │
                └─────────────┼─────────────┘
                              │
                              ▼
                           Grafana
                              │
                              ▼
                         Alertmanager
```

---

# 📈 Metrics

**Prometheus** collects metrics from:

* Kubernetes
* Application services
* Nginx
* PostgreSQL
* Redis
* Kafka
* Infrastructure

Important metrics include:

```text
Request rate
Error rate
p95 latency
p99 latency
CPU usage
Memory usage
Pod availability
Database health
Kafka consumer lag
```

---

# 📝 Centralized Logging

Application and infrastructure logs are collected using:

**Grafana Alloy**

and stored in:

**Loki**

```text
Application
     │
     ▼
Grafana Alloy
     │
     ▼
Loki
     │
     ▼
Grafana
```

> Promtail is intentionally not used because it reached end-of-life. Grafana Alloy is used instead.

---

# 🔭 Distributed Tracing

Distributed tracing uses:

* OpenTelemetry
* Grafana Alloy
* Tempo
* Grafana

Example:

```text
HTTP Request
     │
     ▼
Nginx
     │
     ▼
Order Service
     │
     ├── Payment Service
     │
     ├── Inventory Service
     │
     └── Kafka
            │
            ▼
      Notification Service
```

A single trace can be used to investigate latency and failures across multiple services.

---

# 🚨 Alerting

**Alertmanager** handles alert routing.

Example alerts:

```text
High error rate
High p95/p99 latency
Pod unavailable
CrashLoopBackOff
High CPU
High memory
Kafka consumer lag
Database unavailable
Certificate expiry
Service unavailable
```

---

# 📊 Grafana Dashboards

Grafana dashboards will provide visibility into:

### Application

* Request rate
* Error rate
* Latency
* HTTP status codes

### Kubernetes

* Nodes
* Pods
* CPU
* Memory
* Restarts
* Deployment health

### Infrastructure

* PostgreSQL
* Redis
* Kafka
* Nginx

### Business / E-Commerce

* Orders
* Failed payments
* Inventory events
* Kafka events
* Checkout failures

---

# 📈 Autoscaling

## HPA

Horizontal Pod Autoscaler scales workloads based on metrics.

```text
Traffic
   │
   ▼
Prometheus / Metrics API
   │
   ▼
HPA
   │
   ▼
Pods ↑ / ↓
```

---

## KEDA

KEDA enables event-driven autoscaling.

Example:

```text
Kafka Consumer Lag
        │
        ▼
       KEDA
        │
        ▼
Consumer Pods ↑
```

This is particularly useful for Kafka-based services such as notifications and asynchronous order processing.

---

# 🚀 Progressive Delivery

**Argo Rollouts** is used for progressive deployments.

Example:

```text
Version 1
   │
   ├── 90%
   │
   └── Version 2
          │
          └── 10%
                │
                ▼
             Metrics
                │
          ┌─────┴─────┐
          ▼           ▼
       Healthy      Failed
          │           │
          ▼           ▼
       Promote      Rollback
```

Deployment strategies include:

* Canary
* Blue/Green
* Progressive delivery
* Automated rollback

---

# 🔄 GitOps

**Argo CD** manages Kubernetes application deployment.

Git is the source of truth.

```text
Developer
    │
    ▼
GitHub
    │
    ▼
GitOps Repository
    │
    ▼
Argo CD
    │
    ▼
Kubernetes
```

Argo CD continuously reconciles the desired state from Git with the cluster.

---

# 🗄️ PostgreSQL

PostgreSQL is the primary relational database.

Used for application data such as:

* Users
* Products
* Vendors
* Orders
* Payments
* Inventory
* Cart data

---

# ⚡ Redis

Redis is used for:

* Caching
* Fast lookups
* Sessions
* Temporary application data
* Distributed coordination where required

---

# 📨 Apache Kafka

Kafka provides event-driven communication.

Example events:

```text
OrderCreated
PaymentCompleted
InventoryUpdated
InvoiceCreated
NotificationRequested
```

Example architecture:

```text
Order Service
     │
     ▼
   Kafka
     │
 ┌───┼──────────────┐
 ▼   ▼              ▼
Inventory  Invoice  Notification
```

---

# 🗄️ MinIO

MinIO provides S3-compatible object storage for local development.

Used for:

* Product images
* Uploaded files
* Object storage

Migration path:

```text
Local Development
       │
       ▼
     MinIO
       │
       ▼
AWS Migration
       │
       ▼
Amazon S3
```

---

# 💾 Backup & Disaster Recovery

**Velero** is used for Kubernetes backup and restore.

The project will demonstrate an actual recovery scenario:

```text
Deploy Application
       │
       ▼
Create Backup
       │
       ▼
Simulate Failure
       │
       ▼
Delete Namespace
       │
       ▼
Restore
       │
       ▼
Verify Application
       │
       ▼
Verify Data
```

The DR documentation will include:

* RTO
* RPO
* Backup procedure
* Restore procedure
* Validation
* Recovery results

---

# 🧪 Testing Strategy

Testing is performed at multiple levels.

## Unit Testing

* Jest
* Vitest

## API Testing

* Supertest

## End-to-End Testing

* Playwright

## Load Testing

* k6

## Kubernetes Validation

* kubeconform

## Helm Validation

```bash
helm lint
```

Testing lifecycle:

```text
Unit Tests
    ↓
Integration Tests
    ↓
API Tests
    ↓
E2E Tests
    ↓
Load Tests
```

---

# 🛡️ Kubernetes Reliability

Production workloads use:

* Readiness probes
* Liveness probes
* Startup probes
* Resource requests
* Resource limits
* Rolling updates
* PodDisruptionBudgets
* Topology spread constraints
* Graceful shutdown
* Timeouts
* Retry strategies
* Health checks

---

# 📐 SLI / SLO

The platform will define measurable reliability objectives.

## Availability

```text
Successful Requests / Total Requests
```

## Latency

```text
p95 HTTP latency
p99 HTTP latency
```

## Error Rate

```text
5xx Responses / Total Requests
```

## Kafka

```text
Consumer Lag
```

These metrics are visualized through Grafana and can be used for deployment and reliability decisions.

---

# 📁 Repository Structure

The repository will progressively evolve toward:

```text
ecommerce/
│
├── frontend/
│
├── admin-dashboard/
│
├── vendor-dashboard/
│
├── services/
│   ├── auth-service/
│   ├── user-service/
│   ├── product-service/
│   ├── cart-service/
│   ├── order-service/
│   ├── payment-service/
│   ├── inventory-service/
│   ├── rating-service/
│   ├── invoice-service/
│   └── notification-service/
│
├── docker/
│
├── k8s/
│
├── helm/
│
├── terraform/
│
├── gitops/
│
├── tests/
│
├── scripts/
│
├── docs/
│   ├── architecture/
│   ├── adr/
│   ├── security/
│   ├── observability/
│   ├── runbooks/
│   └── disaster-recovery/
│
├── .github/
│   ├── workflows/
│   ├── CODEOWNERS
│   └── dependabot.yml
│
├── docker-compose.yml
├── README.md
└── .gitignore
```

The existing application structure will be preserved wherever practical rather than 

performing unnecessary rewrites.

---

# 🌿 Git Strategy

Recommended workflow:

```text
main
 │
 ├── develop
 │
 ├── feature/*
 │
 └── release/*
```

Pull requests should require:

* Code review
* Automated tests
* Security checks
* Successful CI
* Required status checks

Direct pushes to `main` should be restricted.

---

# 🔄 Complete Deployment Lifecycle

```text
Developer
    │
    ▼
Feature Branch
    │
    ▼
Pull Request
    │
    ├── Unit Tests
    ├── Integration Tests
    ├── CodeQL
    ├── SonarQube
    ├── Checkov
    ├── Trivy
    ├── Helm Lint
    └── kubeconform
    │
    ▼
Merge
    │
    ▼
Docker BuildKit
    │
    ├── SBOM → Syft
    └── Signature → Cosign
    │
    ▼
GHCR
    │
    ▼
GitOps Repository
    │
    ▼
Argo CD
    │
    ▼
Kubernetes
    │
    ▼
Argo Rollouts
    │
    ▼
Application
    │
    ▼
OpenTelemetry
    │
    ▼
Grafana Alloy
    │
 ┌──┼──────────┐
 ▼  ▼          ▼
Metrics Logs  Traces
 │  │          │
 ▼  ▼          ▼
Prometheus Loki Tempo
 └──┼──────────┘
    ▼
 Grafana
    │
    ▼
Alertmanager
```

---

# 🔐 Supply Chain Security

The project follows a software supply-chain security workflow:

```text
Source
  │
  ├── Secret Scanning
  ├── Dependabot
  └── CodeQL
  │
  ▼
CI Security
  │
  ├── SonarQube
  ├── Checkov
  └── Trivy
  │
  ▼
Container
  │
  ├── Syft → SBOM
  └── Cosign → Signature
  │
  ▼
GHCR
  │
  ▼
Kyverno
  │
  ▼
Kubernetes
```

---

# 💻 Local Development

## Prerequisites

Install:

```text
Git
Docker
Node.js
npm
kubectl
kind
Helm
Terraform
Checkov
GitHub CLI
```

Additional platform tools will be introduced during implementation.

---

# 🐳 Run Existing Application

Docker Compose can continue to be used for application development.

```bash
docker compose up -d
```

Check running containers:

```bash
docker ps
```

---

# ☸️ Create Kubernetes Cluster

Example:

```bash
kind create cluster --name ecommerce
```

Verify:

```bash
kubectl cluster-info
```

```bash
kubectl get nodes
```

---

# 📦 Helm Deployment

Validate the chart:

```bash
helm lint ./helm/ecommerce
```

Deploy:

```bash
helm install ecommerce ./helm/ecommerce
```

Check workloads:

```bash
kubectl get pods
```

---

# 🔄 GitOps Deployment

After Argo CD is configured:

```text
GitHub
   │
   ▼
Argo CD
   │
   ▼
Kubernetes
```

Application changes should be delivered through Git rather than manually changing production resources.

---

# 🔍 Kubernetes Troubleshooting

Check nodes:

```bash
kubectl get nodes
```

Check all pods:

```bash
kubectl get pods -A
```

Check services:

```bash
kubectl get svc -A
```

Check deployments:

```bash
kubectl get deployments -A
```

Check events:

```bash
kubectl get events -A
```

View logs:

```bash
kubectl logs <pod-name>
```

Describe a pod:

```bash
kubectl describe pod <pod-name>
```

---

# 🧪 Failure Testing

Production engineering requires testing failure scenarios.

Examples include:

### Pod failure

```bash
kubectl delete pod <pod-name>
```

Expected:

```text
Pod Failure
    ↓
Kubernetes Detects Failure
    ↓
New Pod Created
    ↓
Service Recovers
```

### Deployment failure

```text
Deployment
    ↓
Canary
    ↓
Metrics Failure
    ↓
Automatic Rollback
```

### Kafka failure

Observe:

```text
Consumer Lag
    ↓
Alert
    ↓
KEDA Scaling
    ↓
Recovery
```

---

# 💾 Disaster Recovery Test

The project will periodically perform:

```text
1. Deploy application
2. Create Velero backup
3. Simulate failure
4. Delete namespace
5. Restore namespace
6. Verify workloads
7. Verify services
8. Verify application
9. Verify data
10. Document recovery time
```

---

# 📚 Documentation

Documentation is maintained under:

```text
docs/
├── architecture/
├── adr/
├── security/
├── observability/
├── runbooks/
└── disaster-recovery/
```

Architecture Decision Records will document decisions such as:

* Why Kubernetes?
* Why kind?
* Why Nginx?
* Why Cilium?
* Why Helm?
* Why Terraform?
* Why GitHub Actions?
* Why Argo CD?
* Why OpenTelemetry?
* Why Grafana Alloy?
* Why Kyverno?
* Why no service mesh initially?
* Why no Ansible?

---

# 🧠 Engineering Principles

## 1. Preserve working application functionality

The existing e-commerce application is enhanced rather than unnecessarily rewritten.

## 2. Production-grade over tool count

Every technology should solve a real operational problem.

## 3. Git is the source of truth

Deployment configuration is managed through GitOps.

## 4. Security is part of CI/CD

Security scanning happens before deployment.

## 5. Observability is built in

Metrics, logs, and traces are first-class platform capabilities.

## 6. Automate repetitive operations

CI/CD, deployments, scaling, certificates, policies, and backups are automated.

## 7. Test failure

The platform demonstrates recovery from real failure scenarios.

## 8. Avoid unnecessary overlapping tools

The project deliberately does **not** introduce tools simply to increase the technology count.

---

# 🚫 Technologies Intentionally Not Used

The following technologies are not part of the core architecture:

| Technology                   | Decision    |
| ---------------------------- | ----------- |
| Minikube                     | ❌           |
| k3s                          | ❌           |
| Traefik                      | ❌           |
| Jenkins                      | ❌           |
| Ansible                      | ❌           |
| Istio                        | ❌ Initially |
| Linkerd                      | ❌           |
| Promtail                     | ❌ EOL       |
| Falco                        | ❌ Initially |
| Rancher                      | ❌           |
| Multiple ingress controllers | ❌           |
| Multiple service meshes      | ❌           |

### Why no Ansible?

This project is Kubernetes-first.

The responsibilities are already covered by:

```text
Terraform
   ↓
Infrastructure

Helm
   ↓
Application Packaging

Argo CD
   ↓
Application Deployment

GitHub Actions
   ↓
CI/CD Automation

Kubernetes
   ↓
Runtime
```

Adding Ansible would introduce overlapping automation without a strong requirement.

---

# 🗺️ Implementation Roadmap

## Phase 1 — Containerization & Kubernetes

* [ ] Review existing Dockerfiles
* [ ] Optimize container images
* [ ] Enable BuildKit
* [ ] Create kind cluster
* [ ] Deploy Kubernetes workloads
* [ ] Configure Nginx
* [ ] Configure Gateway API
* [ ] Create Helm charts

---

## Phase 2 — Infrastructure as Code

* [ ] Terraform structure
* [ ] Terraform validation
* [ ] Checkov
* [ ] Platform configuration
* [ ] Documentation

---

## Phase 3 — CI/CD

* [ ] GitHub Actions
* [ ] Unit tests
* [ ] Integration tests
* [ ] CodeQL
* [ ] SonarQube
* [ ] Trivy
* [ ] Helm lint
* [ ] kubeconform
* [ ] Docker BuildKit
* [ ] GHCR

---

## Phase 4 — Supply Chain Security

* [ ] Syft
* [ ] SBOM
* [ ] Cosign
* [ ] Image signing
* [ ] Image verification
* [ ] Kyverno policies

---

## Phase 5 — GitOps

* [ ] Argo CD
* [ ] GitOps repository
* [ ] Automated synchronization
* [ ] Deployment rollback

---

## Phase 6 — Networking & Security

* [ ] Cilium
* [ ] Hubble
* [ ] NetworkPolicy
* [ ] Kyverno
* [ ] cert-manager
* [ ] External Secrets Operator
* [ ] RBAC
* [ ] Pod Security Standards
* [ ] Tetragon

---

## Phase 7 — Observability

* [ ] OpenTelemetry
* [ ] Grafana Alloy
* [ ] Prometheus
* [ ] Loki
* [ ] Tempo
* [ ] Grafana
* [ ] Alertmanager
* [ ] Application metrics
* [ ] Centralized logging
* [ ] Distributed tracing
* [ ] Dashboards
* [ ] Alerts

---

## Phase 8 — Scaling & Reliability

* [ ] HPA
* [ ] KEDA
* [ ] Kafka consumer scaling
* [ ] PodDisruptionBudgets
* [ ] Topology spread
* [ ] Resource tuning
* [ ] k6 load testing
* [ ] SLOs / SLIs

---

## Phase 9 — Progressive Delivery

* [ ] Argo Rollouts
* [ ] Canary deployment
* [ ] Blue/Green deployment
* [ ] Automated rollback

---

## Phase 10 — Disaster Recovery

* [ ] Velero
* [ ] Backup
* [ ] Restore
* [ ] Namespace recovery
* [ ] RTO/RPO validation
* [ ] DR documentation

---

# ☁️ Future AWS Architecture

The local platform is designed with a future AWS migration path.

| Local            | AWS                            |
| ---------------- | ------------------------------ |
| kind             | Amazon EKS                     |
| MinIO            | Amazon S3                      |
| PostgreSQL       | Amazon RDS / Aurora PostgreSQL |
| Redis            | Amazon ElastiCache             |
| Kafka            | Amazon MSK                     |
| GHCR             | Amazon ECR                     |
| External Secrets | AWS Secrets Manager            |
| Terraform        | Terraform                      |
| Argo CD          | Argo CD on EKS                 |

The application architecture should remain largely unchanged.

---

# 💰 Cost Strategy

The initial implementation is **local-first**.

Core development can run using:

```text
Docker
kind
Kubernetes
PostgreSQL
Redis
Kafka
MinIO
```

This allows DevOps, DevSecOps, GitOps, Kubernetes, security, and observability practices to be demonstrated without requiring expensive AWS infrastructure.

AWS can be introduced later.

---

# 🎓 Skills Demonstrated

## Linux

* Process management
* Networking
* Permissions
* Troubleshooting
* Shell scripting

## Git

* Branching
* Pull requests
* Repository protection
* CODEOWNERS
* GitOps

## Docker

* Containerization
* Multi-stage builds
* BuildKit
* Image optimization
* Image security

## Kubernetes

* Pods
* Deployments
* Services
* ConfigMaps
* Secrets
* Gateway API
* RBAC
* NetworkPolicy
* HPA
* PDB
* Probes
* Scheduling

## Terraform

* Infrastructure as Code
* Validation
* Planning
* Security scanning

## CI/CD

* GitHub Actions
* Automated testing
* Security gates
* Container publishing

## GitOps

* Argo CD
* Declarative deployments
* Reconciliation
* Rollbacks

## DevSecOps

* SAST
* Dependency scanning
* Secret scanning
* Container scanning
* IaC scanning
* SBOM
* Image signing
* Admission policies
* Runtime security

## Observability

* OpenTelemetry
* Metrics
* Logs
* Distributed tracing
* Grafana
* Alerting
* SLOs

## Reliability

* Autoscaling
* Failure recovery
* Canary deployment
* Backup
* Disaster recovery

---

# 🏆 Portfolio Demonstrations

## 1. CI/CD

```text
Git Push
   ↓
GitHub Actions
   ↓
Tests + Security
   ↓
Docker Build
   ↓
GHCR
```

---

## 2. GitOps

```text
Git Change
    ↓
Argo CD
    ↓
Kubernetes
```

---

## 3. DevSecOps

```text
Code
 ↓
CodeQL
 ↓
SonarQube
 ↓
Checkov
 ↓
Trivy
 ↓
SBOM
 ↓
Cosign
 ↓
Kyverno
 ↓
Kubernetes
```

---

## 4. Observability

```text
Request
   ↓
Nginx
   ↓
Order
   ↓
Payment
   ↓
Inventory
   ↓
Kafka
   ↓
Notification
```

Trace the complete request in Grafana/Tempo.

---

## 5. Network Observability

```text
Service A
    ↓
Cilium
    ↓
Hubble
    ↓
Network Visibility
```

---

## 6. Autoscaling

```text
Traffic
   ↓
Metrics
   ↓
HPA
   ↓
Pods ↑
```

Kafka:

```text
Consumer Lag
   ↓
KEDA
   ↓
Consumers ↑
```

---

## 7. Canary Deployment

```text
v1 → 90%
v2 → 10%
     ↓
Metrics
     ↓
Promote / Rollback
```

---

## 8. Disaster Recovery

```text
Backup
   ↓
Failure
   ↓
Delete
   ↓
Restore
   ↓
Verify
```

---

# 🎯 Final Goal

The project demonstrates the complete lifecycle of a production application:

```text
                    ┌──────────────┐
                    │   DEVELOP    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │     TEST     │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │    SECURE    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │    BUILD     │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │    DEPLOY    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   OBSERVE    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │    SCALE     │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   RECOVER    │
                    └──────┬───────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   IMPROVE    │
                    └──────────────┘
```

---

# 📌 Project Status

> 🚧 **Actively being productionized**

The existing e-commerce application is progressively being transformed into a production-grade cloud-native platform.

Current target:

```text
Existing E-Commerce Application
              ↓
         Dockerized
              ↓
          Kubernetes
              ↓
        CI/CD + Security
              ↓
           GitOps
              ↓
        Observability
              ↓
        Autoscaling
              ↓
    Progressive Delivery
              ↓
      Backup / Recovery
```

---

# 👩‍💻 Author

**Swapna Adhav**

### DevOps • Cloud • DevSecOps Portfolio Project

Core technologies:

`AWS • Kubernetes • Docker • Terraform • GitHub Actions • Argo CD • Cilium • DevSecOps • Observability • CI/CD`

