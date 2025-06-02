# Blue-Green Deployment

---

블루그린 배포를 수행합니다.

## 포함 리소스

- Deployment: blue, green
- Service
  필요한 경우 basic 디렉토리에 있는 configmap, ingress 등의 파일을 사용할 수 있습니다.  


## 배포 순서 및 명령어

```bash
kubectl apply -f deployments.yaml
kubectl apply -f service.yaml
```

### 참고사항

1. 트래픽을 green group으로 보내는 방법

```bash
kubectl patch service blue-green-svc -p \
  '{"spec":{"selector":{"app":"blue-green-app","version":"green"}}}'
```
