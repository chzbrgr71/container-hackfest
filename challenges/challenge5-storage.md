# Persistent Storage

## Expected outcome

In this lab you will use Kubernetes Persistent Storage constructs to mount a persistan volume store for a container. This exercise will use the Dynamic method instead of a static Persistent Volume 

## How to

1. Create a Storage Class
    * Let's create a storage class. Please use storage.k8s.io/v1beta1. You can see the spec in [here](https://github.com/kubernetes/kubernetes/blob/master/docs/api-reference/storage.k8s.io/v1beta1/definitions.html)
    * if you created the cluster with managed disks you muts use ``Managed`` as the StorageClass kind 
2. Create the Persistent Volume Claim
    * You need to add the annotation to the Persistent Volume Claim definition. You need to specify ``storageClassName`` on specification.
3. Deploy the ``microsoft/mssql-server-linux`` container with the volume ``/var/opt/mssql`` mounted from the PersistentVolumeClaim you created. 
    * The mssql container requires 3 environment variables; ``ACCEPT_EULA`` with a value of ``Y``, ``MSSQL_SA_PASSWORD`` with a value of a complex password, and ``MSSQL_PID`` with a value of ``Developer`` 
4. Use ``sqlcmd`` to create a new database and a new table and insert some data into the table.
    * Go to the bash shell of your mssql pod
    * Connect to your service instance on port 1433
        * ``/opt/mssql-tools/bin/sqlcmd -S <IP_OF_SERVICE>,1433 -U SA -P '<YourPassword>'``
    * At the sqlcmd prompt create a new database
        * ``CREATE DATABASE TestDB``
    * Verify the table was created
        * ``SELECT Name from sys.Databases``
    * Execute the above commands
        * ``GO``
    * Set the DB context and create a new table called Inventory
        * ``USE TestDB``
        * ``CREATE TABLE Inventory (id INT, name NVARCHAR(50), quantity INT)``
        * ``GO``
    * Insert data into the new table 
        * ``INSERT INTO Inventory VALUES (1, 'penguins', 150); INSERT INTO Inventory VALUES (2, 'whales', 154);``
        * ``GO``
    * Query the table to verify the data was written
        * ``SELECT * FROM Inventory WHERE quantity > 152;``
        * ``GO``
    * Exit the ``sqlcmd`` tool
        * ``QUIT``
    * Exit your shell session by typeing ``exit``
5. Determine the node the msqql pod is running on and drain the node. You may have to use ``--ignore-DaemonSet`` parameter to properly drain the node.
6. Verify that the new pod can access the data written by the old pod.
    * Use ``kubcetl get all`` to determine when the pod is fisnished recreating. Once the new pod is in a running state on a new node, connect to the database and query the Inventroy table again to verify the data persisted.

## Advanced areas to explore

1. Try make a similar claim using AzureFiles.
2. 