# StatefulSet Deployment (Redis)

상태 저장 서비스인 Redis를 StatefulSet으로 구성합니다.

## 포함 리소스

- StatefulSet
- Headless Service

## 배포 순서 및 명령어

```bash
kubectl apply -f service.yaml
kubectl apply -f statefulset.yaml
```