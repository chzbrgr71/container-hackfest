# Troubleshooting & Debugging

## Expected outcome

In this lab you will use common techniques to troubleshoot issues and debug errors with Kubernetes applications.

## How to

1. Deploy a pod and review logs using "kubectl logs" command
2. Run a deployment with a bad image name. Debug deployment to find error
3. Investigate issues with Pods in "Waiting" or "Pending" state
4. Test inter-pod communication (DNS, ping, etc.) by deploying a busybox pod

    ```
    kubectl run busybox —image=busybox /bin/sh
    ```

5. Debug services by inspecting endpoints. https://kubernetes.io/docs/tasks/debug-application-cluster/debug-service 
6. Find and view the cluster logs

    * api-server
    * kube-scheduler
    * controller-manager
    * kubelet (agent)