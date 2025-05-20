fargate only cluster 생성 시 유의 사항

---

기본적으로 Fargate에는 kube-system ns에 있는 pod가 정상적으로 안 올라갑니다.  
이를 해결하기 위해 강제로 올리는 작업을 수행해야 합니다.

```bash
kubectl -n kube-system patch deployment metrics-server -p '{
  "spec": {
    "template": {
      "spec": {
        "tolerations": [
          {
            "key": "eks.amazonaws.com/compute-type",
            "operator": "Equal",
            "value": "fargate",
            "effect": "NoSchedule"
          }
        ]
      }
    }
  }
}'
```

```bash
kubectl delete pod -n kube-system -l app.kubernetes.io/name=metrics-server
```

위 명령어 실행 후 `kubectl get pods -n kube-system`을 수행하면 모든 kube-system 리소스들이 정상적으로 fargate cluster 위에 올라간 모습을 확인할 수 있습니다.
