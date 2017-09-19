# Kubernetes Basics (Pods, Deployments, Services, Namespaces, Health Checks)

## Expected outcome

In this lab you will deploy some basic kubernetes resources for a sample application.

## How to

1. Create a Pod manifest file that has the following parameters
    * Uses 2 Labels zone = prod and version = v1
    * Uses the evillgenius\kuar:1 image
    * Exposes port 8080 on the host to port 80 on the container

2. Verify Pod is operational by using ``kubectl port-foward`` command to foward port 8080 on your local host to port 8080 on the pod and checking with you browser ``http://localhost:8080``

3. 


## Advanced areas to explore

1. 
2. 