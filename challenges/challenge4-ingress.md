# Ingress Controllers

## Expected outcome

In this lab you will use a Ingress Controller primitive in Kubernetes to aroute http/https traffic through. Typically, services and pods have IPs only routable by the cluster network. All traffic that ends up at an edge router is either dropped or forwarded elsewhere. An Ingress is a collection of rules that allow inbound connections to reach the cluster services. It can be configured to give services externally-reachable URLs, load balance traffic, terminate SSL, offer name based virtual hosting etc. Users request ingress by POSTing the Ingress resource to the API server. An Ingress controller is responsible for fulfilling the Ingress, usually with a loadbalancer, though it may also configure your edge router or additional frontends to help handle the traffic in an HA manner.

## How to

1. Open the ingress.yaml file for this challenge in VSCode

## Advanced areas to explore

1. 
2. 