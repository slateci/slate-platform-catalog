#!/bin/bash

CLUSTER=$1
KUBECONFIG=~/conf/$CLUSTER.conf
CLUSTERVALUES=../cluster/values-$CLUSTER.yaml
NAMESPACE=slate-monitoring

if [ ! -f $KUBECONFIG ]; then
    echo "Configuration file for $CLUSTER not found"
    exit 1
fi

if [ ! -f $CLUSTERVALUES ]; then
    echo "Prometheus values file for $CLUSTER not found"
    exit 1
fi

echo Creating namespace slate-monitoring
kubectl create namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Create the secret with access information to the long term storage
kubectl create secret generic slate-metrics-bucket --from-file=../platform/bucket_aws.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Install the prometheus operator
helm install --values $CLUSTERVALUES --name prometheus-operator --namespace $NAMESPACE stable/prometheus-operator --kubeconfig $KUBECONFIG

echo Expose the thanos-store
kubectl apply -f ../cluster/thanos-store.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG
