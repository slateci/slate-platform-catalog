#!/bin/bash

SITE=$1
KUBECONFIG=~/conf/platform

helm install stable/grafana --name grafana-slate --values ../platform/values-grafana.yaml --namespace slate-platform --kubeconfig $KUBECONFIG
