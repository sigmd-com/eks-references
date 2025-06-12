## NGINX Ingress Controller 설치

### 1. 네임스페이스 생성
```bash
kubectl create namespace ingress-nginx
```
### 2. 배포
```bash
kubectl apply -f nginx-ingress-controller.yaml
```
