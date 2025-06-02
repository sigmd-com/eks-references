#!/bin/bash

set -e

# 설정값 - 필요한 경우 수정
CLUSTER_NAME="ds-eks-cluster"
REGION="ap-northeast-2"
VPC_ID="vpc-09c6cc36952e42c56"
SERVICE_ACCOUNT_NAMESPACE="kube-system"
SERVICE_ACCOUNT_NAME="aws-load-balancer-controller"

eksctl utils associate-iam-oidc-provider \
  --region "$REGION" \
  --cluster "$CLUSTER_NAME" \
  --approve

helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n "$SERVICE_ACCOUNT_NAMESPACE" \
  --set clusterName="$CLUSTER_NAME" \
  --set region="$REGION" \
  --set vpcId="$VPC_ID" \
  --set serviceAccount.create=false \
  --set serviceAccount.name="$SERVICE_ACCOUNT_NAME" \
  --set ingressClass=alb \
  --set enableShield=true \
  --set enableWaf=false \
  --set enableWafv2=true

kubectl get deployment -n "$SERVICE_ACCOUNT_NAMESPACE" aws-load-balancer-controller
