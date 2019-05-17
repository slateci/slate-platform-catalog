#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"
source common.sh
source common-cluster.sh || exit 1

echo Removing Tiller
helm reset --force --kubeconfig $KUBECONFIG
