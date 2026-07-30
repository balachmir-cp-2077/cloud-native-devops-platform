# Cloud Native DevOps Platform - Application

## Overview

This is a lightweight Flask application used throughout the Cloud Native DevOps Platform project.

The application exposes two REST endpoints:

- `/` - Returns application information
- `/health` - Returns health status

## Technology Stack

- Python 3.13
- Flask
- Gunicorn
- Docker

## Build

```bash
docker build -t cloud-native-app:v2 .