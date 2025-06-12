## Internal ALB Ingress 구성

### 1. 내부용 ALB 설정 적용
```yaml
alb.ingress.kubernetes.io/scheme: internal
```

### 2. 배포
```bash
kubectl apply -f internal-ingress.yaml
```
