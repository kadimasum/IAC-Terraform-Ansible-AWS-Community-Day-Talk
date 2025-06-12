# Provision And Configure Infrastructure On AWS With Terraform & Ansible

This technical demo showcases how to provision and configure infrastructure on AWS using Terraform and Ansible. It demonstrates the power of Infrastructure as Code (IaC) with Terraform for creating and managing AWS resources, alongside Ansible’s capabilities for automating server configuration and software deployment. The session offers practical insights for DevOps engineers and cloud professionals looking to build scalable, maintainable, and automated cloud environments.

![Event Banner](./images/Samuel_-_Provision_and_Configure_Infrustructure_On_AWS_with_Ansible_and_Terraform_908442.jpeg)

**AWS** is a leading cloud computing platform that provides on-demand access to scalable computing resources such as virtual servers (EC2), networking (VPC), storage (S3), and more. It enables businesses and developers to deploy applications and infrastructure globally with flexibility and cost-efficiency.

**Terraform** is an open-source Infrastructure as Code (IaC) tool that allows users to define and provision cloud resources using declarative configuration files. It enables version-controlled, repeatable infrastructure deployments.

**Ansible** is an open-source automation tool used for configuration management, application deployment, and orchestration. It uses simple YAML-based playbooks to define tasks and manage system configurations.

## Prerequisites (Terraform)

- An [AWS account](https://aws.amazon.com/)
- AWS CLI installed and configured with an IAM user that has EC2, VPC, IAM, and S3 permissions
- Admin access to your system to install Terraform
- Basic knowledge of the command line

---

## 1. Install Terraform

### On Linux / Ubuntu:

```bash
sudo apt update && sudo apt install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/hashicorp.gpg
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform
```
### Verify Installation
```bash
terraform -v
```

## Prerequisites (Ansible)

1. **Control Node**: A machine (your local machine or a CI runner) with Ansible installed.  
   - Supported OS: Linux/macOS (Ansible is not natively supported on Windows as a control node).
2. **Managed Nodes**: Remote machines (e.g., EC2 instances) that Ansible will configure.
   - Requires **Python 3** installed (Amazon Linux, Ubuntu, etc., usually have it preinstalled).
3. **SSH Access**: You must have SSH access from the control node to the managed nodes.
   - Typically done via an SSH key (`.pem` or `.ssh/id_rsa`).
4. **Inventory File**: A list of managed nodes Ansible will operate on.


## 2. Install Ansible

### On Ubuntu/Debian:

```bash
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
```
### Verify Installation
```bash
ansible --version
```
