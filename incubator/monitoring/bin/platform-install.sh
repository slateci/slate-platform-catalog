#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source common.sh
NAMESPACE=$PLATFORM_NAMESPACE
KUBECONFIG=~/conf/platform

echo Creating platform namespace
kubectl create namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Create the secret with access information to the long term storage
kubectl create secret generic slate-metrics-bucket --from-file=../platform/bucket_aws.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Install the thanos-store
kubectl apply -f ../platform/thanos-store.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Install the thanos-query
kubectl apply -f ../platform/thanos-query.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG

echo Install grafana
helm install stable/grafana --name grafana-slate --values ../platform/values-grafana.yaml --namespace $NAMESPACE --kubeconfig $KUBECONFIG
