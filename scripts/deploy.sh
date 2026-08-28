#!/usr/bin/env bash

set -euo pipefail

NAMESPACE="cloud-native-app"
RELEASE="cloud-native-app"
CHART="./helm/cloud-native-app"

echo "==> Deploying ${RELEASE}"

helm upgrade --install "$RELEASE" "$CHART" \
  --namespace "$NAMESPACE" \
  --create-namespace

echo "==> Waiting for deployment"

kubectl rollout status \
  deployment/"$RELEASE" \
  --namespace "$NAMESPACE" \
  --timeout=120s

echo "==> Deployment status"

kubectl get deployment "$RELEASE" \
  --namespace "$NAMESPACE"

echo "==> Pods"

kubectl get pods \
  --namespace "$NAMESPACE" \
  -o wide

echo "==> Deployment image"

kubectl get deployment "$RELEASE" \
  --namespace "$NAMESPACE" \
  -o jsonpath='{.spec.template.spec.containers[0].image}{"\n"}'

echo "==> Deployment completed successfully"
