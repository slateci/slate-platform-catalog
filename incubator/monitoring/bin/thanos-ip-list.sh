#!/bin/bash

for CLUSTER in `./list-clusters.sh` ; do
    KUBECONFIG=~/conf/$CLUSTER.conf
    echo IP for $CLUSTER:
    kubectl get service thanos-store --namespace slate-monitoring --kubeconfig $KUBECONFIG --output=custom-columns=IP:.status.loadBalancer.ingress[*].ip --no-headers=true 
done
