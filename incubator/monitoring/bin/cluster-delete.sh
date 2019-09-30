#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source common.sh
source common-cluster.sh || exit 1

echo Removing port for thanos-store
kubectl delete -f ../cluster/thanos-store.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Delete the old installation
helm delete --purge prometheus-operator --kubeconfig $KUBECONFIG
sleep 5

echo Remove leftover crds
kubectl delete crd alertmanagers.monitoring.coreos.com prometheuses.monitoring.coreos.com  servicemonitors.monitoring.coreos.com prometheusrules.monitoring.coreos.com --kubeconfig $KUBECONFIG

echo Delete the secret with access information to the long term storage
kubectl delete secret slate-metrics-bucket --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Deleting platform namespace
kubectl delete namespace $NAMESPACE --kubeconfig $KUBECONFIG

