#!/bin/bash
# Unified Deployment Script
# Version: 2.0.0

set -e

echo "====================================="
echo "DevOps Simulator - Smart Deployment"
echo "====================================="

# Configuration
DEPLOY_ENV=${DEPLOY_ENV:-"development"}
DEPLOY_MODE=${DEPLOY_MODE:-"docker-compose"}
APP_PORT=${APP_PORT:-3000}
ENABLE_DEBUG=${ENABLE_DEBUG:-true}
DEPLOY_REGION=${DEPLOY_REGION:-"us-east-1"}

echo "Environment: $DEPLOY_ENV"
echo "Mode: $DEPLOY_MODE"
echo "Region: $DEPLOY_REGION"
echo "Port: $APP_PORT"
echo "Debug: $ENABLE_DEBUG"

# Pre-deployment checks
echo "Running pre-deployment checks..."
if [ ! -f "config/app-config.yaml" ]; then
    echo "Error: Configuration file not found!"
    exit 1
fi

# Environment-specific deployment
if [ "$DEPLOY_ENV" == "production" ]; then
    echo "Starting production deployment..."
    echo "Pulling latest Docker images..."
    # docker pull devops-simulator:latest

    echo "Rolling update strategy initiated..."
    # kubectl rolling-update devops-simulator

    echo "Deployment completed successfully!"
    echo "Application available at: https://app.example.com"

else
    echo "Installing dependencies..."
    npm install

    echo "Running tests..."
    npm test

    echo "Starting development deployment..."
    echo "Using Docker Compose..."
    docker-compose up -d

    echo "Waiting for application to be ready..."
    sleep 5

    echo "Performing health check..."
    curl -f http://localhost:$APP_PORT/health || exit 1

    echo "Deployment completed successfully!"
    echo "Application available at: http://localhost:$APP_PORT"
    echo "Hot reload enabled - code changes will auto-refresh"
fi
