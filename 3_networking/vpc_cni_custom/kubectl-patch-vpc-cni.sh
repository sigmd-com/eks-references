#!/bin/bash
set -euo pipefail

kubectl -n kube-system set env daemonset/aws-node \
  ENABLE_PREFIX_DELEGATION=true \
  WARM_ENI_TARGET=1 \
  WARM_IP_TARGET=4 \
  ENI_CONFIG_LABEL_DEF=topology.kubernetes.io/zone