# Azure Container Hackfest Challenge Guide 

Below is a series of "challenges" or guided exercises to help attendees learn about Azure Containers and Kubernetes. These are not meant the be "hands-on labs" or step-by-step guides. The goal is to provide a series of exercises that have an expected outcome. Some steps and code will be provided. In the end, the hands-on experience should lead to a deeper level of learning. 

## Environment Setup

For our Hackfest events, attendees will be provided a VM student environment hosted in Azure. For those setting up their machines manually, the prerequisites are below. 

-> Note: This has only been tested on Mac OS.

* Azure Account with access to deploy at least 10 cores
* [Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
* [Azure Service Principal with at Least Contributor Rights](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?toc=%2Fazure%2Fazure-resource-manager%2Ftoc.json&view=azure-cli-latest#create-a-service-principal-for-your-application)
* Visual Studio Code
* Install and configure Golang https://golang.org/doc/install
* Bash (Windows users will require "Windows Subsystem for Linux")
* Docker

    * [Docker for Mac](https://docs.docker.com/docker-for-mac/install)
    * [Docker for Windows](https://docs.docker.com/docker-for-windows/install)

* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl)
* [helm](https://docs.helm.sh/using_helm)

## Challenges:
 
### Challenge #1: Installing Azure Container Service / ACS Engine
 
### Challenge #2: Kubernetes Basics (Pods, Deployments, Services, Namespaces, Health Checks)
 
### Challenge #3: Deploy app end-to-end (Docker->ACR->ACS)

### Challenge #4: Service Discovery and Networking
 
### Challenge #5: Ingress Controllers

### Challenge #6: Secrets and ConfigMaps
 
### Challenge #7: Helm Deployment
 
### Challenge #8: CI/CD

### Challenge #9: Persistent Storage
 
### Challenge #10: Scaling
 
### Challenge #11: Monitoring & Logging
 
### Challenge #12: Troubleshooting & Debugging
 
### Challenge #13: Kubernetes Advanced (DaemonSets, StatefulSets, Jobs, InitContainers)
 