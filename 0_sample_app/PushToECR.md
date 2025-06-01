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
