#! /bin/bash

aws ecr get-login-password --region <your-region> | \
  kubectl create secret docker-registry regcred \
  --docker-server=<your-account-id>.dkr.ecr.<your-region>.amazonaws.com \
  --docker-username=AWS \
  --docker-password="$(aws ecr get-login-password --region ap-northeast-2)" \
  --namespace=default
