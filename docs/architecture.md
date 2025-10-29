# System Architecture

## Overview
DevOps Simulator follows a **microservices architecture** designed for high availability, scalability, and ease of development.

This document describes both **Production** and **Development** environments.

---

## 🏭 Production Architecture

### 1. Application Server
- **Technology**: Node.js + Express  
- **Port**: 8080  
- **Scaling**: Horizontal auto-scaling enabled  
- **Deployment Mode**: Rolling updates with zero downtime  

### 2. Database Layer
- **Database**: PostgreSQL 14  
- **Configuration**: Master-slave replication  
- **Backup**: Daily automated backups  
- **Retention**: 30 days  

### 3. Monitoring System
- **Tool**: Prometheus + Grafana  
- **Metrics**: CPU, Memory, Disk, Network  
- **Alerts**: Email notifications for critical issues  

### 4. Security
- SSL/TLS encryption enabled  
- Database connections encrypted  
- Regular security audits performed  
- Automated rollback on deployment failure  

---

## 💻 Development Architecture (v2.0-beta)

### 1. Application Server
- **Technology**: Node.js + Express (with hot reload)  
- **Port**: 3000  
- **Scaling**: Manual (single instance for local development)  
- **Debugging**: Chrome DevTools on port 9229  

### 2. Database Layer
- **Database**: PostgreSQL 14 (local instance)  
- **Configuration**: Single instance, no replication  
- **Backup**: Manual backups  
- **Seeding**: Automatically seeds test data on startup  

### 3. Monitoring System
- **Tool**: Console-based logger + optional Prometheus  
- **Metrics**: CPU, Memory, Disk, Network, Build time  
- **Alerts**: Console warnings only  
- **Dashboard**: Local development dashboard (work in progress)  

### 4. Container Orchestration
- **Tool**: Docker Compose  
- **Services**: App, Database, Redis cache  
- **Volume Mounts**: Code directory for hot reload  

### 5. Authentication System (Beta)
- **Method**: OAuth2 + JWT  
- **Providers**: Google, GitHub (for testing)  
- **Sessions**: Redis-based session storage  

### 6. Development Workflow
1. Make code changes  
2. Auto-reload triggers rebuild  
3. Run unit tests  
4. Check console logs  
5. Commit and push to feature branch  

### 7. Security
- SSL/TLS disabled for local development  
- Plain-text credentials (for dev only)  
- CORS enabled for all origins  
- Debug endpoints exposed  

---

## ⚙️ Experimental Features (Under Testing)
⚠️ These features are in the **R&D stage** and not production-ready:
- Multi-cloud deployment  
- AI-powered log analysis  
- Automatic rollback on anomaly detection  

---

✅ **Status:** Both environments are functional and actively maintained.  
Production ensures reliability and security, while development enables rapid experimentation and testing.
