# Basic Deployment
---
기본적인 K8s Deployment 예제입니다.

## 포함된 리소스
- ConfigMap
- Deployment
- Service
- Ingress (ALB / NGINX)

## 배포 순서 및 명령어

```bash
kubectl apply -f configmap.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress-alb.yaml or kubectl apply -f ingress-nginx.yaml
```

## 주의사항
ECR Image를 Pull하기 위한 regcred Credential을 등록해야 합니다.  
아래 명령어를 실행하면 됩니다.
```bash
chmod +x ./create-regcred.sh
. ./create-regcred.sh
```
