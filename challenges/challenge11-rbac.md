# RBAC and Azure AD Integration

## Expected outcome

In this lab we will create a RBAC enabled kubernetes cluster and configure it to use Azure Active Directory for identities. In this exercise, we will use acs-engine in order to properly configure kubernetes. 

## How to

1. Ensure access to Azure AD tenant.
2. Build a cluster using acs-engine. Follow the steps in this article. https://github.com/Azure/acs-engine/blob/master/docs/kubernetes/aad.md 
3. Create a ClusterRoleBinding for admin and read-only access

## Helpful links

* https://github.com/kubernetes/kubernetes/blob/7560142e27ba9c0c535695356a14ac169acd7476/staging/src/k8s.io/client-go/plugin/pkg/client/auth/azure/README.md
* https://docs.microsoft.com/en-us/azure/active-directory/active-directory-app-registration 
* https://www.youtube.com/watch?v=giV0WHtp49A 
* https://github.com/colemickens/azure-ad-k8s-oidc-example 