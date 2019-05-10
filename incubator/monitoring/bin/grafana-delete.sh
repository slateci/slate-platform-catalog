#!/bin/bash

SITE=$1
KUBECONFIG=~/conf/platform

helm delete --purge grafana-slate --kubeconfig $KUBECONFIG
