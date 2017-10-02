# Ingress Controllers

## Expected outcome

In this lab you will use a Ingress Controller primitive in Kubernetes to route http/https traffic through. Typically, services and pods have IPs only routable by the cluster network. All traffic that ends up at an edge router is either dropped or forwarded elsewhere. An Ingress is a collection of rules that allow inbound connections to reach the cluster services. It can be configured to give services externally-reachable URLs, load balance traffic, terminate SSL, offer name based virtual hosting etc. Users request ingress by POSTing the Ingress resource to the API server. An Ingress controller is responsible for fulfilling the Ingress, usually with a loadbalancer, though it may also configure your edge router or additional frontends to help handle the traffic in an HA manner.

## How to

1. First we will deploy a default backend service that will serve up a 404 on the / of the URL if it is not an expected path based on the ingress rules.
    * Open the [default.yaml](https://github.com/chzbrgr71/container-hackfest/blob/master/challenges/SolutionHelperFiles/ch4/default.yaml) file with VSCode.
    *   Deploy the service to your cluster in the default namespace.
2. Inspect the Ingress manifest file [ingress.yaml](https://github.com/chzbrgr71/container-hackfest/blob/master/challenges/SolutionHelperFiles/ch4/ingress.yaml) with VSCode.
    * This file has a ReplicationController object which deploys a nginx ingress controller with a single replica, but this can be used to deploy an HA service as well.
    * Notice that we pass as an argument to the nginx the name of the default-backend service. This allows nginx to process all non-conforming URLs from the ingress rules to the default-backend service.
    * Deploy the ingress service to your cluster.
3. Ingress Rules create the configuration for the ingress controller for specified services. The ingress rules use an annotation to tell kubernetes that it should be process by a specific ingress controller type:    
    ```...
      metadata:
        annotations:
          kubernetes.io/ingress.class: nginx
      ...
      ```


## Advanced areas to explore

1. 
2. 