#!/bin/bash

for SITE in `./list-clusters.sh` ; do
    KUBECONFIG=~/conf/$SITE.conf
    echo IP for $SITE:
    kubectl get service thanos-store --namespace slate-monitoring --kubeconfig $KUBECONFIG --output=custom-columns=IP:.status.loadBalancer.ingress[*].ip --no-headers=true 
done
