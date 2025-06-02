# How to push image to ECR

---

1. First, Sign in to your AWS Account with awscli.

```bash
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com
```

2. build your App with Docker

```bash
docker build -t your-app .
```

3. Add tag to your image

```bash
docker tag ds-ecr-repo:latest 156041424727.dkr.ecr.ap-northeast-2.amazonaws.com/ds-ecr-repo:<your-version>
```

4. Push to ECR

```bash
docker push <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/<your-namespace>/<your-repo-name>:<version>
```

작성 시 AWS ECR 기본 명령어를 참고했습니다.
<br />

## TroubleShooting

---

Apple Silicon이 탑재된 Mac 기기에서 Docker Image를 빌드하고, K8s에 올릴 경우 아래와 같은 오류가 발생할 수 있습니다.

```
╰─$ kubectl logs -p basic-app-b8dcc8484-ft7hq
exec /usr/local/bin/python: exec format error
```

해당 오류는 Arm 환경에서 빌드된 이미지를 x84_64 환경에서 실행하려고 했기 때문에 발생한 문제입니다.  
이러한 문제를 해결하기 위해, x86_64 형식의 이미지로 새로 빌드해주면 됩니다. 아래 명령어를 참고하세요.

```bash
docker buildx build --platform linux/amd64 -t your-ecr-repo/your-image-name:tag . --push
```

그 후, 다시 Deployments.yaml을 적용해주면, 정상적으로 작동되는 모습을 볼 수 있습니다.
