# Personal Infrastructure Setup

This repository contains the configuration and setup for a personal infrastructure stack, including services like Gitea, Authelia, Grafana, Loki, Promtail, and Nginx. The stack is orchestrated using Docker Compose.

## Table of Contents

- [Overview](#overview)
- [Services](#services)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Usage](#usage)
---

## Overview

This project sets up a secure and self-hosted infrastructure for version control, monitoring, and authentication. The stack includes:

- **Gitea**: A lightweight Git service for version control and project management.
- **Authelia**: An authentication and authorization server for secure access control.
- **Grafana**: A visualization platform for monitoring metrics and logs.
- **Loki**: A log aggregation system for collecting and querying logs.
- **Promtail**: A log shipping agent that sends logs to Loki.
- **Nginx**: A reverse proxy for routing traffic and enforcing HTTPS.

---

## Services

### 1. **Authelia**
- Provides Single Sign-On (SSO) and access control.
- Configuration: [`authelia/config.yml`](authelia/config.yml), [`authelia/users.yml`](authelia/users.yml)

### 2. **Gitea**
- Git service for version control.
- Configuration: [`gitea/app.ini`](gitea/app.ini)

### 3. **Grafana**
- Visualization and monitoring platform.
- Configuration: [`grafana/grafana.ini`](grafana/grafana.ini)

### 4. **Loki**
- Log aggregation system.
- Configuration: [`grafana/loki-config.yaml`](grafana/loki-config.yaml)

### 5. **Promtail**
- Log shipping agent.
- Configuration: [`grafana/promtail-config.yaml`](grafana/promtail-config.yaml)

### 6. **Nginx**
- Reverse proxy for routing traffic and enforcing HTTPS.
- Configuration: [`nginx/nginx.conf`](nginx/nginx.conf)

## Prerequisites

The required dependencies, such as Docker, Docker Compose, will be automatically downloaded and installed during the setup process.



## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/Manjunadh-modak/personal-infra.git
   cd personal-infra

2. Run the setup script to start the services:
   ```bash
   ./setup-services.sh start
   
3. To clean up and remove all services along with their volumes:
   ```bash
   ./setup-services.sh clean      