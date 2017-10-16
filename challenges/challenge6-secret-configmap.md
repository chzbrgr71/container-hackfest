# Secrets and ConfigMaps

## Expected outcome

In this lab we will use Secrets and ConfigMaps in Kubernetes to store application configuration settings and secrets needed for external services.

## How to

1. Create a simple ConfigMap

    * Use the SolutionHelperFiles in this repo (redis-config)
    * Create a ConfigMap resource in your cluster

    ```
    kubectl create configmap example-redis-config --from-file=./redis-config

    kubectl get configmap

    kubectl describe configmap example-redis-config
    ```

2. Create a Redis Pod that utilizes the ConfigMap

    ```
    kubectl create -f redis-pod.yaml
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

4. Update the Microsmack sample web app and replace environment variables with a ConfigMap

5. Create a Secret and use it to deploy a Postgres DB

    * Base64 encode values for secret and add them to a secret.yaml file
        
        ```
        echo -n "admin" | base64 | pbcopy
        echo -n "Your@Password" | base64 | pbcopy
        echo -n "secret_key" | base64 | pbcopy
        ```

    * Deploy the secret.yaml into kubernetes
    * Deploy the modified Postgres container that utlizes the secret. Use the "chzbrgr71/postgres:secret" image
    * Test connectivity

    ```
    $ kubectl exec db -it bash
    root@db:/#
    root@db:/# psql -U admin -W
    Password for user admin:
    psql (9.4.14)
    Type "help" for help.

    admin=#
    CREATE SCHEMA test;
    CREATE TABLE test.test (coltest varchar(20));
    INSERT into test.test (coltest) values ('It works!');
    SELECT * from test.test;

    # Use "\q" to exit psql
    ```

## Advanced areas to explore

1. Create a secret for an Azure Container Registry. Use "imagePullSecrets" to deploy Pod
2. Use HashiCorp Vault to store/encrypt secrets