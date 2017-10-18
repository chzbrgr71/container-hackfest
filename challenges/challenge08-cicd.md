# CI/CD

## Expected outcome

In this challenge, you will create a workflow for continuous integration and continuous delivery into ACS Kubernetes. This will include automation steps in Jenkins for building/testing an app, creating containers, pushing to a private registry, and finally updating the app into Kubernetes.

## How to

### Github Repository

1. Fork this repo into your Github account. https://github.com/chzbrgr71/microsmack 
2. Clone your forked copy to your local machine.
3. Replace the contents of jenkins-values.yaml with the details from the file in the [helper folder.](SolutionHelperFiles/ch8/jenkins-values.yaml)
4. In your terminal window, change to the directory where you have cloned the repo.

### Jenkins Setup (via Helm)

1. Review the "jenkins-values.yaml" from above

2. Install Jenkins
```
helm --namespace jenkins --name jenkins -f ./jenkins-values.yaml install stable/jenkins
```

3. When pod is running, get Jenkins initial password
```
kubectl get secret --namespace jenkins jenkins-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode
```

4. Get the external IP address of your Jenkins service and browse to the IP
```
export SERVICE_IP=$(kubectl get svc jenkins-jenkins --namespace=jenkins -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo http://$SERVICE_IP:8080/login
```

5. Upgrade Jenkins to the latest version and update plug-ins

6. Add your ACR credentials to Jenkins (ACR instance was created in a prior challenge)

    * Credentials > Jenkins > Global credentials > Add Credentials
    * Username with password
    * ID = acr_creds
    * Description = acr_creds

### Setup Application

1. Deploy initial version of app (Microsmack web and api)

    ```
    kubectl create -f kube-api.yaml

    kubectl create -f kube-web.yaml
    ```

### Jenkins Pipeline Setup

1. Create a Jenkins pipeline with Build and Deploy stages (Sample in repo)
    
    * Use the microsmack repo that you have forked into your Github account from above.
    * You will then need to modify the Jenkinsfile so the pipeline builds properly. Hint: Upate the Azure Container Registry credentials.
    * The Jenkinsfile performs the following actions:        
        * Add a stage for Golang build and test
        * Add a stage to create Docker containers and push to ACR
        * Add a stage to update kube deployments with new image tag
        * Again, there is a sample Jenkinsfile in the repo
    * Once you have made the changes to the Jenkinsfile in your repo you are ready to setup the pipeline in Jenkins. 
        * Login to Jenkins
        * Open Jenkins Blue Ocean menu option on left-hand side
        * Create a new Pipeline
        * Select Github and provide an access token to the cloned Git Repo
        * Select your org and pick "New Pipeline" then pick your repo
        * Wait for the pipeline to be created and check the results

2. Test the pipeline in Jenkins with "Build Now"
3. Update code and ensure pipeline deploys new version of app
4. Setup webhook to fire pipeline on code change

> Note: It is possible to use a Kubernetes plug-in for Jenkins. At the time of this writing the plug-in had some bugs but has since been released. https://plugins.jenkins.io/kubernetes-cd 



## Advanced areas to explore

1. Build in steps to handle PR's and dev branches
2. Add a step to security scan images
3. Blue/green Deployment. https://www.ianlewis.org/en/bluegreen-deployments-kubernetes 
3. Spinnaker