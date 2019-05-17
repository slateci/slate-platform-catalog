#!/bin/bash

CLUSTER=$1
KUBECONFIG=~/conf/$CLUSTER.conf
NAMESPACE=slate-monitoring

if [ ! -f $KUBECONFIG ]; then
    echo "Configuration file for $CLUSTER not found"
    exit 1
fi

echo Removing port for thanos-store
kubectl delete -f ../cluster/thanos-store.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Delete the old installation
helm delete --purge prometheus-operator --kubeconfig $KUBECONFIG
sleep 5

echo Remove leftover crds
kubectl delete crd alertmanagers.monitoring.coreos.com prometheuses.monitoring.coreos.com  servicemonitors.monitoring.coreos.com prometheusrules.monitoring.coreos.com --kubeconfig $KUBECONFIG


