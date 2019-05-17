#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source common.sh
source common-cluster.sh || exit 1

helm version --kubeconfig $KUBECONFIG
kubectl get pods --namespace kube-system --kubeconfig $KUBECONFIG | grep tiller
kubectl get deployment --namespace kube-system --kubeconfig $KUBECONFIG | grep tiller

echo
echo To kill pod use:
echo kubectl delete pod [podname] --force --grace-period=0 --namespace kube-system --kubeconfig $KUBECONFIG

echo To kill deployment use:
echo kubectl delete deployment tiller-deploy --namespace kube-system --kubeconfig $KUBECONFIG
