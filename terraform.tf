# Configure the following variables to suit your needs
variable "instance_size" {
  default = "t2.nano"
}

variable "region" {
  default = "us-west-2"
}

variable "samples_git_repo" {
  default = "https://github.com/mindlapse/redesigned-pancake.git"
}

variable "samples_git_repo_branch" {
  default = "master"
}

variable "aws_secret_key" {
  default = "########################################"
}

variable "aws_access_key" {
  default = "####################"
}

variable "aws_ssh_key_name" {
  description = "The name of your ssh key pair from AWS  (e.g. 'masterkey')"
  default = "terraform"
}

variable "aws_ssh_key_path" {
  description = "The path to your ssh key pair .pem file (e.g. '/vagrant/masterkey.pem')"
  default = "~/terraform.pem"
}



# Do not modify this section
module "wiremock" {
  source = "github.com/mindlapse/terraform-wiremock.git"
  repo                = "${var.samples_git_repo}"
  branch              = "${var.samples_git_repo_branch}"
  aws_secret_key      = "${var.aws_secret_key}"
  aws_access_key      = "${var.aws_access_key}"
  aws_ssh_key_name    = "${var.aws_ssh_key_name}"
  aws_ssh_key_path    = "${var.aws_ssh_key_path}"
}