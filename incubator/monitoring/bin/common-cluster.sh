#!/bin/bash

CLUSTER=$1
KUBECONFIG=~/conf/$CLUSTER.conf

if [ ! -f $KUBECONFIG ]; then
    echo "Configuration file for $CLUSTER not found"
    exit 1
fi



