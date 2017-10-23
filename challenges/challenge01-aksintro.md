# Intro to Azure K(c)ontainer Service

## Expected outcome

In this lab, you will create a new Azure K(c)ontainer Instance using the Azure CLI to deploy a Managed Kubernetes cluster.  You will deploy a 2 node Cluster using Standard_D2v2 instances in one of the following Region: westus2.

## How to

1. Create a resource group to hold your cluster:
   * ``az group create -n mk8s-westus2 -l westus2``

2. Create your first cluster. The example command below launches a single node Kubernetes cluster running 1.7:
   * ``az aks create -n mycluster1 -g mk8s-westus2 --kubernetes-release 1.7 --agent-count 1 --dns-name-prefix mycluster1``
   * View the ``az aks create --help`` text for additional command line arguments. The create command will provision the hosted Kubernetes components and create a new VNET and subnet for your Agent VMs. The create call will return after the agent VMs have been provisioned.

3. After the create command returns, fetch the kubeconfig for your cluster with the Azure CLI:
   * ``az aks get-credentials -n mycluster1 -g mk8s-westus2``
   * The kubeconfig for your cluster will be merged to your ~/.kube/config file, with the context name set to your cluster name.

4. Verify access to your cluster with the kubectl cli  
   * ``kubectl cluster-info``

## Advanced areas to explore

1. If you have time, explore deploying a Kubernetes Cluster using the [ACS-Engine Open Source](https://github.com/Azure/acs-engine) project. 
 
