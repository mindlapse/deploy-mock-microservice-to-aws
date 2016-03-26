# deploy-mock-microservice-to-aws

##  Use case:  
To deploy a mock JSON based microservice into Amazon (a [WireMock](http://wiremock.org/)  server),
configured with mock request/response pairs from a git repo of your choice :)

## Prerequisites

0) [Amazon AWS](https://aws.amazon.com/): You have an AWS user account with an access key and secret access key, and SSH .pem file for that user.

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

3) Clone this project to a folder, then modify the `terraform.tf` file to configure it with your access keys and 
SSH keys, the location of the repo containing your request/response samples for [WireMock](http://wiremock.org/), 
and preferred ec2 instance size.

## Launch

All set?  Okay, run the following from the checkout folder.  Then log into Amazon and you'll see that the 
instance is deployed with port 80 and 443 open for business.

```bash
terraform get
terraform apply
```

To take down the environment, run this from the checkout folder:

```bash
terraform destroy
```


Questions?  Contact: mindlapse@gmail.com
