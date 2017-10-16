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
3. Create a manifest to deploy 3 different webapp services listening on Port 80 using a NodePort with a port number higher than 30000. Use the image ``evillgenius/simplehttp:latest`` and name the services webapp1-svc, webapp2-svc and webapp3-svc.  
4. Ingress Rules create the configuration for the ingress controller for specified services. The ingress rules use an annotation to tell kubernetes that it should be process by a specific ingress controller type:    
    ```yaml
    ...
      metadata:
        annotations:
          kubernetes.io/ingress.class: nginx
      ...
      ```
    * Open [ingress-rules.yaml](https://github.com/chzbrgr71/container-hackfest/blob/master/challenges/SolutionHelperFiles/ch4/ingress-rules.yaml) with VSCode.
    * Edit the host section and enter the External IP address assigned to your nginx-ingress-svc. We will use xip.io so you do not have to register a domain. The format should be www.xxx.xxx.xxx.xxx.xip.io where the x's are the numbers of the IP address
    * Verify that the paths point to the correctly named services you deployed in Step 3 of this challenge.
    * Deploy the ingress rules to your cluster.
5. Wait a few for the rules to publish and then using a browser navigate to www.xxx.xxx.xxx.xxx.xip.io and the service should return with webapp3 service the request as this was the service selected for the default path /.
    * Test the other paths from the ingress rules file to verify that the ingress controller is properly doing path based routing.
    *  Test to see if you put in a different path that the default backend appears.

## Advanced areas to explore

1. Try deploying an HAProxy ingress controller.
2. If you have your own domain name and can create a wildcard cert try creating a TLS secured site with nginx.