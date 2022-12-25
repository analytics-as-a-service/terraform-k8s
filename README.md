# terraform-k8s
Create a K8s cluster on AWS with Terraform and Ansible

# Quickstart

## One time setup

- Install terraform, ansible, AWS cli

- Login to your AWS cli

- Clone the repo
    ```
    git clone https://github.com/analytics-as-a-service/terraform-k8s.git
    cd terraform-k8s-ansible
    ```

- Create a private and public key for instances
    ```
    ssh-keygen -t rsa -f terraform.pem -N ""
    ```

- Initialize Terraform
    ```
    terraform init
    ```

- Download the ansible dynamic script
    ```
    wget https://github.com/jtopjian/ansible-terraform-inventory/releases/download/v0.3.0/ansible-terraform-inventory_v0.3.0_linux_amd64.zip

    unzip ansible-terraform-inventory_v0.3.0_linux_amd64.zip && rm ansible-terraform-inventory_v0.3.0_linux_amd64.zip

    mv ansible-terraform-inventory_v0.3.0_x4 ansible-inventory 
    ```

## Spin up your cluster

- Create a k8s cluster
    ```
    terraform apply -auto-approve
    ```

    The k8s config file will be downloaded to `kubeconfig` folder in your workspce.

- You can scale the nodes up and down by changing `aws_nodes` variable.

- Destroy a k8s cluster
    ```
    terraform destroy -auto-approve
    ```
