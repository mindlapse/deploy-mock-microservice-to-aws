# deploy-mock-microservice-to-aws

##  Use case:  
To deploy a mock JSON based microservice into Amazon (a [WireMock](http://wiremock.org/)  server),
configured with mock request/response pairs from a git repo of your choice.  The server will automatically
reload itself whenever a new commit is detected on your repo.

For example, suppose you have a repo like https://github.com/mindlapse/redesigned-pancake.git with a mappings
folder containing JSON files with request/response pairs that you want to mock.  You can deploy that into a live
server in Amazon by following the steps below


## Setup

1. You have an [Amazon AWS](https://aws.amazon.com/) user account with an access key, secret access key, and SSH .pem file for that user.

2. Vagrant is installed: https://www.vagrantup.com/downloads.html

3. The project is cloned: `git clone https://github.com/mindlapse/deploy-mock-microservice-to-aws.git`

4. The `terraform.tf` file in the root of the project is configured with Amazon access keys and 
SSH keys, the location of the Git repo containing your request/response samples for the [WireMock](http://wiremock.org/)
server, and your preferred ec2 instance size.

## Launch

Open a console, and from the project folder issue the following command to deploy the mock server:
```bash
vagrant up
```
The mock server should be live in about 10-15 minutes.


## Destroy
To take down the environment, run this from the checkout folder:

```bash
vagrant ssh
cd /vagrant
terraform destroy
```


If you need support, please open a ticket and I'll respond as soon as possible.
