# Persistent Storage

## Expected outcome

In this lab you will use Kubernetes Persistent Storage constructs to mount a persistan volume store for a container. This exercise will use the Dynamic method instead of a static Persistent Volume 

## How to

1. Create a Storage Class
    * Let's create a storage class. Please use storage.k8s.io/v1beta1. You can see the spec in [here](https://github.com/kubernetes/kubernetes/blob/master/docs/api-reference/storage.k8s.io/v1beta1/definitions.html)
    * if you created the cluster with managed disks you muts use ``Managed`` as the StorageClass kind 
2. Create the Persistent Volume Claim
    * You need to add the annotation to the Persistent Volume Claim definition. You need to specify storageClassName on specification.
3. Deploy the evillgenius/kuard:1 container with the volume /home/pv mounted from the PersistentVolumeClaim you created. Verify the volume was mounted by looking at the file explorer tab of rthe kuard service web page. You can also use ``kubectl exec -it <POD_NAME> df to look at the volumes and space assigned to that volume.

## Advanced areas to explore

1. Try make a similar claim using AzureFiles.
2. 