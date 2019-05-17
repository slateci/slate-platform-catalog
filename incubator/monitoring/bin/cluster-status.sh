#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source common.sh
source common-cluster.sh || exit 1

kubectl get pods --namespace $NAMESPACE --kubeconfig $KUBECONFIG
kubectl get services --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo
echo To kill pod use:
echo kubectl delete pod [podname] --force --grace-period=0 --namespace $NAMESPACE --kubeconfig $KUBECONFIG
