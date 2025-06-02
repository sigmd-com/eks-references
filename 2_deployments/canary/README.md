# Canary Deployment
---
EKS에서 Canary 배포를 진행하는 Config 파일입니다.

## 포함 리소스

- Deployment: stable (v1), preview (v2)
- Service
- Ingress (ALB)

## 배포 순서 및 명령어

```bash
kubectl apply -f deployments.yaml
kubectl apply -f service.yaml
kubectl apply -f ingress-alb.yaml
```