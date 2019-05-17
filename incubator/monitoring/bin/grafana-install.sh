#!/bin/bash

KUBECONFIG=~/conf/platform

helm install stable/grafana --name grafana-slate --values ../platform/values-grafana.yaml --namespace slate-platform --kubeconfig $KUBECONFIG
