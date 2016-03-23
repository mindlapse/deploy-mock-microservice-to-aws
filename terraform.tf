variable "aws_secret_key" {}
variable "aws_access_key" {}
variable "aws_ssh_key_name" {}
variable "aws_ssh_key_path" {}

module "wiremock" {
  source = "github.com/mindlapse/terraform-wiremock.git"
  repo = "https://github.com/mindlapse/redesigned-pancake.git"
  branch = "master"
  aws_secret_key   = "${var.aws_secret_key}"
  aws_access_key   = "${var.aws_access_key}"
  aws_ssh_key_name = "${var.aws_ssh_key_name}"
  aws_ssh_key_path = "${var.aws_ssh_key_path}"
}