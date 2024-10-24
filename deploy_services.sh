#!/bin/bash

# Move to the directory containing the Kubernetes
cd k8s-manifests

# Apply Config Server
echo "Applying Config Server manifests..."
kubectl apply -f config-server-deployment.yaml
kubectl apply -f config-server-service.yaml

# Wait for 5 seconds before checking Config Server status
echo "Waiting for 5 seconds to give Config Server time to start..."
sleep 5

# Check if Config Server is available
echo "Checking if Config Server is available..."
kubectl wait --for=condition=available --timeout=120s deployment/config-server
echo "Config Server is ready!"

echo "-------------------------------------------"

# Apply Eureka Server
echo "Applying Eureka Server manifests..."
kubectl apply -f eureka-server-deployment.yaml
kubectl apply -f eureka-server-service.yaml

# Wait for 5 seconds before checking Eureka Server status
echo "Waiting for 5 seconds to give Eureka Server time to start..."
sleep 5

# Check if Eureka Server is available
echo "Checking if Eureka Server is available..."
kubectl wait --for=condition=available --timeout=120s deployment/eureka-server
echo "Eureka Server is ready!"

echo "-------------------------------------------"

# Apply Hello World service
echo "Applying Hello World service manifests..."
kubectl apply -f hello-world-deployment.yaml
kubectl apply -f hello-world-service.yaml

# Wait for 5 seconds before checking Hello World status
echo "Waiting for 5 seconds to give Hello World service time to start..."
sleep 5

# Check if Hello World is available
echo "Checking if Hello World service is available..."
kubectl wait --for=condition=available --timeout=120s deployment/hello-world
echo "Hello World service is ready!"

echo "-------------------------------------------"

# Apply API Gateway
echo "Applying API Gateway manifests..."
kubectl apply -f api-gateway-deployment.yaml
kubectl apply -f api-gateway-service.yaml

# Wait for 5 seconds before checking API Gateway status
echo "Waiting for 5 seconds to give API Gateway time to start..."
sleep 5

# Check if API Gateway is available
echo "Checking if API Gateway is available..."
kubectl wait --for=condition=available --timeout=120s deployment/api-gateway
echo "API Gateway is ready!"

echo "-------------------------------------------"
echo "All services deployed successfully!"
