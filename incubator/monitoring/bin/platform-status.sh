#!/bin/bash

KUBECONFIG=~/conf/platform

kubectl get pods --namespace slate-platform --kubeconfig $KUBECONFIG
kubectl get services --namespace slate-platform --kubeconfig $KUBECONFIG

echo
echo To check the last 10 lines of log:
echo kubectl logs XXX --namespace slate-platform --kubeconfig $KUBECONFIG --tail=10
