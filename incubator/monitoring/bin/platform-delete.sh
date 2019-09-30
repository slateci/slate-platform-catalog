#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source common.sh
NAMESPACE=$PLATFORM_NAMESPACE
KUBECONFIG=~/conf/platform

echo Delete the old grafana installation
helm delete --purge grafana-slate --kubeconfig $KUBECONFIG
sleep 5

echo Delete the thanos-query
kubectl delete -f ../platform/thanos-query.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Delete the thanos-store
kubectl delete -f ../platform/thanos-store.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Delete the secret with access information to the long term storage
kubectl delete secret slate-metrics-bucket --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Deleting platform namespace
kubectl delete namespace $NAMESPACE --kubeconfig $KUBECONFIG


