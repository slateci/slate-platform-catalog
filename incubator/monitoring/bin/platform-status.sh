#!/bin/bash

SITE=$1
KUBECONFIG=~/conf/platform

kubectl get pods --namespace slate-platform --kubeconfig $KUBECONFIG
kubectl get services --namespace slate-platform --kubeconfig $KUBECONFIG
