# deploy-wiremock

A repo to provision a wiremock server into AWS

1. Ensure terraform and ansible are installed.
2. Add a `variables.tf` to the root folder with the following info:

```javascript
variable "secret_key" {
  default = "..."               // Your AWS secret key
}

variable "access_key" {
  default = "..."               // Your AWS access key
}

variable "aws_ssh_key_name" {
  default = "..."               // The name of your ssh key pair from AWS  (e.g. 'masterkey')
}

variable "aws_ssh_key_path" {
  default = "..."               // The path to your ssh key pair .pem 
                                // file (e.g. '/vagrant/masterkey.pem')
}
```

3. Run `terraform apply` from the root folder.