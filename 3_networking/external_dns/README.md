## External DNS 배포 가이드
---
K8s 리소스를 AWS Route53과 연동하여 외부 접속이 가능하게 해주는 도구입니다.

### 1. IAM 정책 구성 및 IRSA 설정
- 클러스터 생성 과정에서 기본적으로 IRSA 세팅을 진행했습니다.  


### 2. ExternalDNS Helm Repo 추가
```bash
helm repo add external-dns https://kubernetes-sigs.github.io/external-dns/
helm repo update
```

### 3. Helm을 통해 ExternalDNS 배포
```bash
helm upgrade --install external-dns external-dns/external-dns \
  --namespace <ur-system-ns; kube-system> \
  -f ./values.yaml
```

### 4. 배포 결과 확인
```bash
kubectl get pods -n <ur-system-ns; kube-system> -l external-dns
```
<br />
Helm을 통한 배포 시, values.yaml 파일을 통해 옵션을 관리하고 있습니다. 반드시 values.yaml 파일을 본인의 옵션에 맞게 수정해주세요. 