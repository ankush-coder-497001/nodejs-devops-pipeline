# 🚀 CI Pipeline for Node.js Application (DevOps Project)

![CI Pipeline](https://github.com/ankush-coder-497001/nodejs-devops-pipeline/actions/workflows/ci.yml/badge.svg)

## 📌 Project Overview

This project demonstrates a **production-oriented CI (Continuous Integration) pipeline** built using **GitHub Actions** for a Node.js application. The goal of this project is to showcase how modern DevOps practices can be implemented **without relying on cloud infrastructure**, while still following **industry best practices**.

The pipeline focuses on **code quality, security, containerization, validation, and notifications**, making it suitable for **entry-level to mid-level (0–2 years) DevOps roles**.

---

## 🧱 Architecture & Flow

```
Developer Pushes Code
        ↓
GitHub Actions Triggered
        ↓
Install Dependencies
        ↓
Run Tests
        ↓
Build Docker Image
        ↓
Push Image to Docker Hub
        ↓
Validate Kubernetes Manifests (Schema Validation)
        ↓
Send Email Notification on Failure
```

> ⚠️ Note: Kubernetes deployment is **designed and validated**, not executed, due to lack of production infrastructure. This mirrors real-world scenarios where CI and CD responsibilities are often separated.

---

## 🛠️ Tools & Technologies Used

| Category              | Tools                       |
| --------------------- | --------------------------- |
| CI/CD                 | GitHub Actions              |
| Language              | Node.js                     |
| Containerization      | Docker                      |
| Container Registry    | Docker Hub                  |
| Kubernetes Validation | kubeconform                 |
| Notifications         | SMTP Email (GitHub Actions) |
| Secrets Management    | GitHub Secrets              |

---

## 🔐 Secrets Management

All sensitive information is securely managed using **GitHub Secrets**:

* `DOCKER_USERNAME`
* `DOCKER_PASSWORD`
* `EMAIL_USERNAME`
* `EMAIL_PASSWORD`

These secrets are injected into the pipeline at runtime and **never exposed in the repository**.

---

## 🐳 Docker Image Strategy

* Docker images are tagged using:

  * Commit SHA (`ankush-cdoer-497001/devops-app:<commit-sha>`)
  * `latest` tag for easy reference
* This enables:

  * Traceability
  * Rollbacks
  * Clean versioning

---

## ☸️ Kubernetes Strategy (Design-Only)

Since no cloud or Kubernetes cluster is available, the project follows a **design-first approach**:

* Kubernetes manifests are written for:

  * Deployment
  * Service
  * ConfigMap
  * Secret
* Manifests are validated in CI using **kubeconform**, which:

  * Does not require a Kubernetes cluster
  * Validates YAML against official Kubernetes schemas

This approach is commonly used in real-world CI pipelines where infrastructure provisioning is handled separately.

---

## 📩 Failure Notifications

If any step in the CI pipeline fails:

* An automated **email notification** is sent
* The email contains:

  * Repository name
  * Commit SHA
  * Workflow name
  * Job details

This ensures quick feedback and faster issue resolution.

---

## ✅ Why This Project Is Industry-Relevant

* Separates **CI execution** from **CD infrastructure**
* Follows **DevSecOps mindset** (security + validation)
* Avoids fake or forced cloud usage
* Reflects real constraints faced by engineers

---

## 🚧 Limitations

* No live Kubernetes deployment (no cloud/VM)
* No runtime monitoring (designed in later phases)

These are intentional and documented decisions.

---

## 🔮 Future Improvements

* Add Trivy for Docker image vulnerability scanning
* Design CD pipeline with rollout strategies (Blue-Green / Canary)
* Add Prometheus & Grafana monitoring configuration
* Integrate Slack or Teams notifications

---

## 👨‍💻 Author

**Ankush Kumar Gupta**
Aspiring DevOps & Full-Stack Engineer

---

> 💡 This project emphasizes *correct DevOps thinking* over superficial deployments and is built to be interview-ready, honest, and production-aware.
