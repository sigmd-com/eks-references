#!/bin/bash
set -e

NAMESPACE="kube-system"
SERVICE_ACCOUNT="external-dns"
VALUES_FILE="./values.yaml"
RELEASE_NAME="external-dns"

echo "[1/3] Helm repo 추가 및 업데이트..."
helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
helm repo update

echo "[2/3] Helm으로 ExternalDNS 배포..."
helm upgrade --install ${RELEASE_NAME} external-dns/external-dns \
  --namespace ${NAMESPACE} \
  -f ./values.yaml

echo "[3/3] 배포 상태 확인..."
kubectl get pods -n ${NAMESPACE} -l app.kubernetes.io/name=external-dns
