# CI/CD

## Expected outcome

In this challenge, you will create a workflow for continuous integration and continuous delivery into ACS Kubernetes. This will include automation steps in Jenkins for building/testing an app, creating containers, pushing to a private registry, and finally updating the app into Kubernetes.

## How to

1. Clone the repo https://github.com/chzbrgr71/microsmack 
2. Install Jenkins (using Helm)

    a. Review the "jenkins-values.yaml" file to be used for Helm deploy

    b. Install Jenkins
    ```
    helm --namespace jenkins --name jenkins -f ./jenkins-values.yaml install stable/jenkins
    ```
    c. When pod is running, get Jenkins initial password
    ```
    kubectl get secret --namespace jenkins jenkins-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode
    ```
    d. Get the external IP address of your Jenkins service and browse to the IP
    ```
    export SERVICE_IP=$(kubectl get svc jenkins-jenkins --namespace=jenkins -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

    echo http://$SERVICE_IP:8080/login
    ```
    e. Upgrade Jenkins to the latest version and update plug-ins

    f. Add your ACR credentials to Jenkins (ACR instance was created in a prior challenge)

        * Credentials > Jenkins > Global credentials > Add Credentials
        * Username with password
        * ID = acr_creds
        * Description = acr_creds

3. Deploy initial version of app (Microsmack web and api)

    ```
    kubectl create -f kube-api.yaml

    kubectl create -f kube-web.yaml
    ```

4. Create a Jenkins pipeline with Build and Deploy stages (Sample in repo)
    
    * Write a Jenkinsfile for your pipeline
        
        * Add a stage for Golang build and test
        * Add a stage to create Docker containers and push to ACR
        * Add a stage to update kube deployments with new image tag
        * There is a sample Jenkinsfile in the repo

    * Open Jenkins Blue Ocean
    * Create a new Pipeline
    * Select Github and provide an access token
    * Select your org and pick "New Pipeline" then pick your repo
    * Wait for the pipeline to be created and check the results

5. Test the pipeline in Jenkins with "Build Now"
6. Update code and ensure pipeline deploys new version of app
7. Setup webhook to fire pipeline on code change

## Advanced areas to explore

1. Build in steps to handle PR's and dev branches
2. Add a step to security scan images
3. Blue/green Deployment. https://www.ianlewis.org/en/bluegreen-deployments-kubernetes 
3. Spinnaker