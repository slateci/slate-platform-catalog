#!/bin/bash

CLUSTER=$1
KUBECONFIG=~/conf/$CLUSTER.conf
NAMESPACE=slate-monitoring

if [ ! -f $KUBECONFIG ]; then
    echo "Configuration file for $CLUSTER not found"
    exit 1
fi

kubectl get pods --namespace $NAMESPACE --kubeconfig $KUBECONFIG
kubectl get services --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo
echo To kill pod use:
echo kubectl delete pod [podname] --force --grace-period=0 --namespace $NAMESPACE --kubeconfig $KUBECONFIG
