# Scaling

## Expected outcome

In this lab you will use both imperative and declarative methods to scale a ReplicaSet or Deployment. You will then learn to use the Horizontal Pod Autoscaler ``hpa`` to leverage heapster based metrics to scale a deployment. 

## How to

1. Deploy the kaur application from evillgenius/kuar:1 into a deployment with the service exposed on port 80 and create 2 replicas.
2. Once the pods have been deployed and the service is accessible use the ``kubectl scale`` command to scale the deployment to 4.
3. While using the ``kubectl scale`` command is good for emergency type situations or one off scaling. In a declarative world, we make changes by editing the manifest file directly then applying the changes to the api:
```yaml
...
spec:
  replicas: 4
...
```
4. Modify your kuar deployment to have 4 replicas and then use the ``kubectl apply -f`` to update the deployment.
5. Now set the Horizontal Pod Autoscaler to scale the deployment based on cpu. Use the ``kubectl autoscale deploy`` with a min, max and cpu-percent options to scale the service based on cpu usage above 80%. Set the minimum pods as 5 and max as 10. Use ``kubectl get hpa`` to determine the status of the autoscaler.

## Advanced areas to explore

1. Take a look at the acs-engine-autoscaler project which will allow you to scale the underlying infrastructure in Azure.
2. 