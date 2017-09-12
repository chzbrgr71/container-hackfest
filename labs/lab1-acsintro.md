# Intro to Azure Container Service

In this lab, you will create a new Azure Container Instance using the Azure CLI to deploy a Kubernetes cluster.  You will deploy a small 1 Master, 2 node Cluster using Standard_D2v2 instances in a Region nearest your location.

## Prerequisites

Azure Account with access to deploy at least 10 cores
[Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
[Azure Service Principal with at Least Contributor Rights](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?toc=%2Fazure%2Fazure-resource-manager%2Ftoc.json&view=azure-cli-latest#create-a-service-principal-for-your-application)

## Expected outcome

When complete you should be able to access your Kubernetes Cluster through the kubectl CLI installed via the az cli.

## Advanced areas to explore

1. If you have time, explore deploying a Kubernetes Cluster using the [ACS-Engine Open Source](https://github.com/Azure/acs-engine) project. 
2. Deploy a cluster with advanced options such as custom Network Range, Azure CNI or Calico Network Policy. 