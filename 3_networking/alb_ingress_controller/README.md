## AWS Load Balancer Controller 설치 가이드

### 1. IAM 정책 생성

```bash
aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy \
  --policy-document file://iam-policy.json
```

### 2. IAM 역할과 서비스 계정 연결 (IRSA)

```bash
eksctl create iamserviceaccount \
  --cluster <CLUSTER_NAME> \
  --namespace kube-system \
  --name aws-load-balancer-controller \
  --attach-policy-arn arn:aws:iam::<ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
```

### 3. CRD 설치

```bash
wget https://raw.githubusercontent.com/aws/eks-charts/master/stable/aws-load-balancer-controller/crds/crds.yaml
kubectl apply -f crds.yaml
```

### 4. Helm 설치

```bash
helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=<CLUSTER_NAME> \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=<AWS_REGION> \
  --set vpcId=<VPC_ID>
```

만약, values.yaml에 있는 값을 사용해서 설치하고 싶을 경우, 아래 명령어를 사용하세요.

```bash
helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  -f values.yaml
```
