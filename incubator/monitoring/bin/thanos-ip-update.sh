#!/bin/bash

KUBECONFIG=~/conf/platform
NAMESPACE=slate-platform

kubectl apply -f ../platform/thanos-query.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG
