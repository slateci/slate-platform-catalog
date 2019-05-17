#!/bin/bash

CLUSTER=$1
KUBECONFIG=~/conf/$CLUSTER.conf

if [ ! -f $KUBECONFIG ]; then
    echo "Configuration file for $CLUSTER not found"
    exit 1
fi


if helm version --kubeconfig $KUBECONFIG 2> /dev/null | grep Server > /dev/null ; then
    echo "Tiller already installed"
    exit 0
else
    echo "Tiller is not installed"
    kubectl apply -f ../common/tiller-rbac.yaml --kubeconfig $KUBECONFIG
    helm init --service-account tiller --kubeconfig $KUBECONFIG
fi
