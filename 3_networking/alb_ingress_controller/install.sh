#!/bin/bash

set -euo pipefail

CLUSTER_NAME="<your-cluster-name>"
AWS_REGION="<your-region>"
ACCOUNT_ID="<your-account-id>"
VPC_ID="<your-vpc-id>"

# IAM Policy 생성
echo "Creating IAM policy for AWS Load Balancer Controller..."
aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy \
  --policy-document file://iam-policy.json || true

# 서비스 계정 생성 (IRSA)
echo "Creating IAM service account for AWS Load Balancer Controller..."
eksctl create iamserviceaccount \
  --cluster $CLUSTER_NAME \
  --namespace kube-system \
  --name aws-load-balancer-controller \
  --attach-policy-arn arn:aws:iam::$ACCOUNT_ID:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve || true

# CRD 설치
echo "Installing CRDs for AWS Load Balancer Controller..."
wget https://raw.githubusercontent.com/aws/eks-charts/master/stable/aws-load-balancer-controller/crds/crds.yaml
kubectl apply -f crds.yaml

# Helm 설치
echo "Adding EKS Helm repository..."
helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=$CLUSTER_NAME \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=$AWS_REGION \
  --set vpcId=$VPC_ID