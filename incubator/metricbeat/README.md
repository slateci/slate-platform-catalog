# Requirements for metricbeat deployment

## Open kubelet read-only port on the nodes of the cluster

Following the instructions at https://kubernetes.io/docs/setup/independent/kubelet-integration/

Update 

/var/lib/kubelet/kubeadm-flags.env

To read: 

KUBELET_KUBEADM_ARGS=--read-only-port=10255

Or put the —read-only-port=10255 at the end of the list if one already exists: 

KUBELET_KUBEADM_ARGS=--flag1=value1 --flag2=value2 —read-only-port=10255

Restart kubelete:

systemctl daemon-reload && systemctl restart kubelet

Test with this link: http://domain:10255/stats/summary

Repeat this step for each node

## Deploy kube-state-metric through kubernetes

This is a service that talks to kubernetes and exposes metrics through http.
To install, clone the kube-state-metric repository at https://github.com/kubernetes/kube-state-metrics
and follow the instructions at
https://github.com/kubernetes/kube-state-metrics#kubernetes-deployment

