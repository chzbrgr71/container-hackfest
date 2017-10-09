# Service Discovery and Networking

## Expected outcome

In this lab you should be able to identify how Pods communicate bewteen each other in a cluster and discover other services within different namespaces. At first you will use 2 utility containers to easily identify how DNS Service discovery is resolved within a Pod and then you will deploy a small 2-tier application that uses a web application and a datastore in seperate pods that need to talk to each other.

## How to

1. Deploy the evillgenius/kuar:1 container with a single replica, expose port 8080. Expose the deployment so it has a public IP address. Give it a name of Service1
2.  Deploy the evillgenius/kuar:1 container again with a single replica, expose port 8080. Expose the deployment so it has a public IP address. Give it a name of Service2
3. Verify you can access the web page of each service via the public IP address deployed by Kubernetes. You can check with ```kubectl get svc -w``` until the External-IP filed populates for both services.
4. On the DNS tab of Service 1 try to do a lookup of Service 2 via the service name only. 

## Advanced areas to explore

1. Deploy another version of the service to a different Namespace and investigate how the DNS changes.
2. Investigate a kubernetes Incubator project called [externalDNS](https://github.com/kubernetes-incubator/external-dns) to automatically deploy AzureDNS for Services exposed through the ALB.
