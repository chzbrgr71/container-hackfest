# Secrets and ConfigMaps

## Expected outcome

In this lab we will use Secrets and ConfigMaps in Kubernetes to store application configuration settings and secrets needed for external services.

## How to

1. Create a simple ConfigMap

    * Use the SolutionHelperFiles in this repo (game.properties & ui.properties)
    * Create a ConfigMap resource in your cluster

    ```
    kubectl create configmap example-redis-config --from-file=./redis-config

    kubectl get configmap

    kubectl describe configmap example-redis-config
    ```

2. Create a Redis Pod that utilizes the ConfigMap

    ```
    kubectl create -f sample-app.yaml
    ```

3. Validate Redis

    ```
    $ kubectl exec -it redis redis-cli
    127.0.0.1:6379> CONFIG GET maxmemory
    1) "maxmemory"
    2) "2097152"
    127.0.0.1:6379> CONFIG GET maxmemory-policy
    1) "maxmemory-policy"
    2) "allkeys-lru"
    ```

4. Update the Microsmack sample app and replace environment variables with a ConfigMap

5. Create a Secret and use it to deploy a Postgres DB

    * Base64 encode values for secret
    * Create a secret.yaml file and deploy to cluster
    * Deploy the modified Postgres container that utlizes the secret

## Advanced areas to explore

1. Use HashiCorp Vault to store/encrypt secrets