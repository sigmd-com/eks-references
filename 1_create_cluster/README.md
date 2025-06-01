## EKS Cluster Creation

---

만약 클러스터 생성 후, 연결 불가 오류가 표시될 경우, 아래 내용을 참고해주세요.

1. 현재 생성된 클러스터 리스트 확인

```bash
aws eks list-clusters --region <your-region>
```

2. 생성된 클러스터를 로컬 k8s context에 등록

```bash
aws eks update-kubeconfig --region <your-region> --name <your-cluster-name>
```
