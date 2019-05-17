#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source common.sh
source common-cluster.sh || exit 1


if helm version --kubeconfig $KUBECONFIG 2> /dev/null | grep Server > /dev/null ; then
    echo "Tiller already installed"
    exit 0
else
    echo "Tiller is not installed"
    kubectl apply -f ../common/tiller-rbac.yaml --kubeconfig $KUBECONFIG
    helm init --service-account tiller --kubeconfig $KUBECONFIG
fi
