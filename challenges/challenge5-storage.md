# Persistent Storage

## Expected outcome

In this lab you will use Kubernetes Persistent Storage constructs to mount a persistan volume store for a container.

## How to

1. Create a Storage Class
    * Let's create a storage class. Please use storage.k8s.io/v1beta1. You can see the spec in [here](https://github.com/kubernetes/kubernetes/blob/master/docs/api-reference/storage.k8s.io/v1beta1/definitions.html)
    * Also, you need to use the same location as your k8s cluster. 
2. Create the Persistent Volume Claim
    * You need to add the annotation to the Persistent Volume Claim definition. You don't need to specify storageClassName on specification.
3. Deploy the evillgenius/kuard:1 container with a volume mounted from the PersistentVolumeClaim you created. Verify the volume was mounted by looking at the file explorer tab of rthe kuard service web page.

## Advanced areas to explore

1. Try make a similar claim using AzureFiles.
2. 