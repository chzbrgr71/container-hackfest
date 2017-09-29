# RBAC and Azure AD Integration

## Expected outcome

In this lab we will create a RBAC enabled kubernetes cluster and configure it to use Azure Active Directory for identities. In this exercise, we will use acs-engine in order to properly configure kubernetes. 

You will follow the steps in this article. https://github.com/Azure/acs-engine/blob/master/docs/kubernetes/aad.md

## How to

1. Using these instructions, create two app ID's in your Azure AD tenant https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration 

    1. api-server
    2. kubectl

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

4. Run acs-engine with above json to create ARM template.
5. Deploy ARM template into Azure
6. Create a ClusterRoleBinding for admin and read-only access
7. Test RBAC with kubectl

## Helpful links

* https://github.com/kubernetes/kubernetes/blob/7560142e27ba9c0c535695356a14ac169acd7476/staging/src/k8s.io/client-go/plugin/pkg/client/auth/azure/README.md
* https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration 
* https://www.youtube.com/watch?v=giV0WHtp49A 
* https://github.com/colemickens/azure-ad-k8s-oidc-example 