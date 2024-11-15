## Prerequisites
1. **Download values.yaml**: Download values.yaml file and set you parameters

   ```
   https://raw.githubusercontent.com/SerPapanin/rsschool-wp-helm/refs/heads/task_5/wordpress/values.yaml
   ```

## Prepare the Cluster
1. **Create Namespace:**

    ```bash
    kubectl create namespace wordpress
    ```

1. **Install WordPress using Helm**

    ```bash
    helm repo add my-wp https://github.io/SerPapanin/rsschool-wp-helm/
    helm install wordpress my-wp/wordpress --version 0.1.3
    ```

2. **Verify WordPress installation:**

    ```bash
    kubectl get pods -n wordpress
    kubectl get deployments -n wordpress
    kubectl get services -n wordpress
    ```
    Ensure all pods are running.

3. **Visit WordPress in the browser**

- Login with the password and the username.
    Add to hosts file <bastionhostIP> wordpress.local

    ```
    # for HTTP
    http://wordpres.local

## Clean Up

- **Run the following command to delete the Helm deployments**
    ```bash
    helm delete wordpress -n wordpress-namespace
    ```
