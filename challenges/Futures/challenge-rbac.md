# RBAC and Azure AD Integration

## Expected outcome

In this lab we will create a RBAC enabled kubernetes cluster and configure it to use Azure Active Directory for identities. In this exercise, we will use acs-engine in order to properly configure kubernetes. 

You will follow the steps in this article. https://github.com/Azure/acs-engine/blob/master/docs/kubernetes/aad.md

## How to

1. Using these instructions, create two app ID's in your Azure AD tenant https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration 

    1. api-server (Web app / API)
    2. kubectl (Native)

    -> Note that the Sign-on URL does not matter

2. Setup acs-engine on your machine

3. Create an acs-engine json template (similar to example). Fill in values for:

    * enableRbac
    * dnsPrefix
    * keyData
    * servicePrincipalProfile
    * Azure AD profile with app ID's from step #1

    ```
    "aadProfile": {
      "serverAppID": "",
      "clientAppID": ""
    },
    ```

4. Run acs-engine with above json to create ARM template
5. Deploy ARM template into Azure (in _output directory)
6. Connect to cluster via ssh and verify /etc/kubernetes/manifests/kube-apiserver.yaml
7. Ensure kubectl is working
8. Modify the kube config and add a user "user1" as follows:

    ```
    kubectl config set-credentials "user1" --auth-provider=azure \
    --auth-provider-arg=environment=AzurePublicCloud \
    --auth-provider-arg=client-id={fill in}\
    --auth-provider-arg=apiserver-id={fill in}\
    --auth-provider-arg=tenant-id={fill in}
    ```

8. Create a ClusterRoleBinding for read-only access for user1

    * Use your AAD user name as described in the article. Eg: --user=https://sts.windows.net/e2917176-1632-47a0-ad18-671d485757a3/#22fa281b-bf62-4b14-972c-0dbca24a25a2 

9. Test access to get or create pods

    ```
    kubectl get pod --user=user1
    kubectl run busybox --image=busybox --user=user1
    ```

10. Delete the read-only binding
11. Create a new ClusterRoleBinding for admin access for user1
12. Re-test access


## Helpful links

* https://github.com/kubernetes/kubernetes/blob/7560142e27ba9c0c535695356a14ac169acd7476/staging/src/k8s.io/client-go/plugin/pkg/client/auth/azure/README.md
* https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration 
* https://www.youtube.com/watch?v=giV0WHtp49A 
* https://github.com/colemickens/azure-ad-k8s-oidc-example 