# Deploy app end-to-end (Docker->ACR->ACS)

## Expected outcome

In this lab you will build a simple set of apps using Docker. You will create an instance of Azure Container Registry and push images to the registry. Then you will deploy these apps to ACS Kubernetes. 

For this lab, we will use the sample applications in the Microsmack repo. https://github.com/chzbrgr71/microsmack 

## How to

1. Create or pull container images

    * Create the container images

        * This will require Golang properly installed and $GOPATH configured
        * Build args are utilized to provide environment variables
        * Dockerfiles for each container are in the subdirectories in the repo

        ```
        # Be sure you are in the right directory:

        # API
        docker build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` --build-arg VERSION=1.0 -t chzbrgr71/smackapi .
        
        # WEB
        docker build --build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` --build-arg VCS_REF=`git rev-parse --short HEAD` --build-arg VERSION=1.0 -t chzbrgr71/smackweb .
        ```

    OR 

    * Pull the images from Docker Hub

        ```
        docker pull chzbrgr71/smackapi
        docker pull chzbrgr71/smackweb
        ```
2. Create an Azure Container Registry

3. Push the images from local image store to ACR

    * Tag images
    * Login to ACR
    * Push

4. Create deployment and service resources in Kubernetes

    * Create .yaml files for deployments and services
    * For both smackapi and smackweb
    * Ensure proper environment variables are supplied

5. Test application, scale out replicas

6. Update application and re-deploy

    * Use a different tag for new version
    * Update variables or code to change application


## Advanced areas to explore

1. Add health checks and validate issues

2. Debug deployment issues

3. Add NGINX and Ingress controller in front of web app
