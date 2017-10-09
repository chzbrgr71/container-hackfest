# Kubernetes Advanced (DaemonSets, StatefulSets, Jobs, InitContainers)

## Expected outcome

In this lab you will create some advanced Kubernetes resources.

## How to

### DaemonSet

A DaemonSet ensures that all (or some) nodes run a copy of a pod. As nodes are added to the cluster, pods are added to them. As nodes are removed from the cluster, those pods are garbage collected.

1. Lookup a sample DaemonSet and create in your cluster
2. Test pods and experiment with solutions for communicating

### StatefulSet

Manage the deployment and scaling of a set of Pods, and provide guarantees about ordering. They do so by maintaining a unique, sticky identity for each of their Pods

1. Try deploying a MongoDB or Redis cache StatefulSet. Eg - https://github.com/kubernetes/charts/tree/master/stable/mongodb-replicaset 
2. Deploy a Consul StatefulSet. Eg - https://github.com/kelseyhightower/consul-on-kubernetes 

### Jobs

A job creates one or more pods and ensures that a specified number of them successfully terminate.

1. Create a simple job task

### InitContainers

InitContainers are specialized containers that run before app containers and can contain utilities or setup scripts not present in an app image.

