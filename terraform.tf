variable "aws_secret_key" {}
variable "aws_access_key" {}
variable "aws_ssh_key_name" {}
variable "aws_ssh_key_path" {}

module "wiremock" {
  source = "github.com/mindlapse/terraform-wiremock.git"
  repo = "https://github.com/mindlapse/redesigned-pancake.git"
  branch = "master"
  aws_secret_key   = "${aws_secret_key}"
  aws_access_key   = "${aws_access_key}"
  aws_ssh_key_name = "${aws_ssh_key_name}"
  aws_ssh_key_path = "${aws_ssh_key_path}"
}