#!/bin/bash

KUBECONFIG=~/conf/platform
NAMESPACE=slate-platform

kubectl apply -f ../platform/thanos-compactor.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG
