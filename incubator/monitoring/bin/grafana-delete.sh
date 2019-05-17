#!/bin/bash

KUBECONFIG=~/conf/platform

helm delete --purge grafana-slate --kubeconfig $KUBECONFIG
