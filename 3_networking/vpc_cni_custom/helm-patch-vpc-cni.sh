helm upgrade --install aws-node aws/aws-vpc-cni \
  -n kube-system \
  -f vpc_cni_custom-values.yaml
