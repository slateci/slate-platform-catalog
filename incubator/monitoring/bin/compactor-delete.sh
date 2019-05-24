#!/bin/bash

KUBECONFIG=~/conf/platform
NAMESPACE=slate-platform

kubectl delete -f ../platform/thanos-compactor.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG
