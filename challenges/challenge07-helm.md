# Helm

## Expected outcome

In this lab we will setup Helm and package, deploy, and update applications. Helm is a "package manager" for Kubernetes. Read more about Helm here: https://docs.helm.sh 

## How to

1. Install Helm

    * Installation here. https://docs.helm.sh/using_helm/#installing-helm 
    * Initialize the server side in your cluster (Tiller)
    * Validate your install
    
    ```
    # should see something like
    $ helm version
    Client: &version.Version{SemVer:"v2.5.0", GitCommit:"012cb0ac1a1b2f888144ef5a67b8dab6c2d45be6", GitTreeState:"clean"}
    Server: &version.Version{SemVer:"v2.5.1", GitCommit:"7cf31e8d9a026287041bae077b09165be247ae66", GitTreeState:"clean"}
    ```

2. Create charts

    * Use the sample "Microsmack" application. https://github.com/chzbrgr71/microsmack
    * Create a chart for each application that includes the deployments and services
    * Samples are included in the repo
    * You can use this article as a guide: https://www.influxdata.com/blog/packaged-kubernetes-deployments-writing-helm-chart 

3. Deploy your apps using Helm and the charts from step 2

4. Update, Release, Rollback

5. Delete application

## Advanced areas to explore

1. Helm tests
2. Draft
3. Chart repositories