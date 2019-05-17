#!/bin/bash

SITE=$1
KUBECONFIG=~/conf/$SITE.conf

if [ ! -f $KUBECONFIG ]; then
    echo "Configuration file for $SITE not found"
    exit 1
fi

kubectl get pods --namespace slate-monitoring --kubeconfig $KUBECONFIG
kubectl get services --namespace slate-monitoring --kubeconfig $KUBECONFIG
