#!/bin/bash

SITE=$1
KUBECONFIG=~/conf/$SITE.conf

if [ ! -f $KUBECONFIG ]; then
    echo "Configuration file for $SITE not found"
    exit 1
fi

helm version --kubeconfig $KUBECONFIG
