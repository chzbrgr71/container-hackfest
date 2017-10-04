# Intro to Azure Container Service

## Expected outcome

In this lab, you will create a new Azure Container Instance using the Azure CLI to deploy a Kubernetes cluster.  You will deploy a small 1 Master, 2 node Cluster using Standard_D2v2 instances in one of the following Regions: westcentralus, westus2.

## How to

1. Use the ``az acs create`` command to create a cluster with the following parameters
    * Orchestrator type Kubernetes
    * 1 Master Node using a Standard_D2_v2 VM with managed disk with a master OS disk size of 50GB
    * 2 worker nodes using a Standard_D2_v2 VM with managed disks with OS disk size of 120GB
    * Create the cluster in West Central US

2. Use the ``az acs kubernetes`` comand to install the kubectl cli (if you have not done so already)

3. Use the ``az acs kubernetes`` command to get your kube-config information for you cluster

4. Verify access to your cluster with the kubectl cli  

## Advanced areas to explore

1. If you have time, explore deploying a Kubernetes Cluster using the [ACS-Engine Open Source](https://github.com/Azure/acs-engine) project. 
2. Deploy a cluster with advanced options such as custom Network Range, Azure CNI or Calico Network Policy. 
