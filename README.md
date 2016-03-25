# deploy-mock-microservice-to-aws

##  Use case:  
To deploy a mock JSON based microservice into Amazon (a wiremock server),
configured with mock request/response pairs from a git repo of your choice :)

## Prerequisites

0) You have an Amazon AWS user account with an access key and secret access key, and SSH .pem file for that user.

1) [Terraform is installed](https://www.terraform.io/intro/getting-started/install.html)

```bash
  wget -q https://releases.hashicorp.com/terraform/0.6.14/terraform_0.6.14_linux_amd64.zip
  mkdir -p /opt/terraform
  unzip -oq terraform_0.6.14_linux_amd64.zip -d /opt/terraform
  rm -f terraform_0.6.14_linux_amd64.zip
  echo "export PATH=$PATH:/opt/terraform" >> /etc/bash.bashrc
```

2) [Ansible is installed](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-via-pip)

```bash
  # Mac OSX instructions:
    sudo easy_install pip
    sudo pip install ansible
    sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
    
  # Ubuntu instructions:
    sudo apt-get install software-properties-common
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible
```

3) Clone this project to a folder, then add a `variables.tf` file to that folder with the following contents,
after configuring it to match your settings.  You'll need an access and secret key pair from Amazon, along
with a .pem private key from an Amazon user who has sufficient privileges.   The example provided below is pointing to 
a repo with an example set of samples - you can provide your own git repo here with your own samples, provided that it
has the same structure as the example repo (the structure expected by WireMock)


```javascript
variable "region" {
  default = "us-west-2"
}

variable "samples_git_repo" {
  default = "https://github.com/mindlapse/redesigned-pancake.git"
}

variable "samples_git_repo_branch" {
  default = "master"
}

variable "aws_security_group" {
  description = "The name of a security group in AWS with port 443 open and internet access"
  default = "default"
}

variable "aws_secret_key" {
  default = "****************************************"
}

variable "aws_access_key" {
  default = "********************"
}

variable "aws_ssh_key_name" {
  default = "terraform"
}

variable "aws_ssh_key_path" {
  default = "~/terraform.pem"
}
```

## Execution

All set?  Okay, run the following from the checkout folder.  Then log into Amazon and you'll see that the 
instance is deployed with port 80 and 443 open for business.

```bash
terraform get
terraform apply
```

To take down the environment, run this:

```bash
terraform destroy
```


Questions?  Contact: mindlapse@gmail.com
