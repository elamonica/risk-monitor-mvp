# Risk Monitor MVP

A risk monitoring application built with Strapi and PostgreSQL using Docker.

## Overview

This project provides a comprehensive risk monitoring solution with:
- Strapi as the headless CMS
- PostgreSQL as the database
- Docker for containerization
- GitFlow as the workflow methodology

## Setup Instructions

1. Clone the repository:
   ```
   git clone [repository-url]
   cd risk-monitor-mvp
   ```

2. Start the Docker containers:
   ```
   docker-compose up -d
   ```

3. Access the Strapi admin panel:
   ```
   http://localhost:1337/admin
   ```

4. Login with the default superadmin credentials:
   - Username: admin
   - Password: password

## Development Workflow

This project follows the GitFlow workflow:

- `main`: Production-ready code
- `develop`: Development branch with the latest features
- `feature/*`: New features
- `release/*`: Preparing for a new production release
- `hotfix/*`: Urgent fixes for production

### Creating a new feature

```bash
git checkout develop
git checkout -b feature/your-feature-name
# Make your changes
git add .
git commit -m "Your commit message"
git push origin feature/your-feature-name
# Create a pull request to merge into develop
```

## Docker Commands

- Start containers: `docker-compose up -d`
- Stop containers: `docker-compose down`
- View logs: `docker-compose logs -f`
- Rebuild containers: `docker-compose build --no-cache`