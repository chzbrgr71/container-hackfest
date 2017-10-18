# Kubernetes Basics (Pods, Deployments, Services, Namespaces, Health Checks)

## Expected outcome

In this lab you will deploy some basic kubernetes resources for a sample application.

## How to

1. Create a Pod manifest file that has the following parameters
    * Uses 2 Labels zone = prod and version = v1
    * Uses the evillgenius\kuar:1 image
    * Exposes port 8080

    Verify Pod is operational by using ``kubectl port-forward`` command to forward port 8080 on your local host to port 8080 on the pod and checking with you browser ``http://localhost:8080``

3. Create a Deployment manifest using the same parameters as above but add
    * make 3 replicas of the app
    * use a RollingUpdate strategy with no less than 1 pod avaialble and no more than 1 pod extra during updates

    Verify deployment is operational by using ``kubectl port-forward`` command to forward port 8080 on your local host to port 8080 on any of the pods in the deployment and checking with you browser ``http://localhost:8080``

4. Create a Service manifest that exposes the Deployment above using a LoadBalancer
    *  **NOTE** Getting an external IP may take some time initially. use ``kubectl get service -w`` until an external IP is shown. 

5. Combine the deployment Manifest and the Service Manifest into a single file and deploy to a new Namespace

6. Add a Liveness and Readiness probe to your deployment.
    * The kuar app has an http /healthy path listening on port 8080 for Liveness
    * The kuar app has an http /ready path listening on port 8080 for Readiness
    * configure the differnet timeouts on each to determine cause and effect.
    * On the kuar app page, go to the Liveness and Readiness probe tabs to test failures and ensure probe is being received 


## Advanced areas to explore

1. Deploy a Pod that has multiple containers in a single Pod.
2. Change the image version of your deployment and casue a RollingUpdate.
3. Rollback an update
