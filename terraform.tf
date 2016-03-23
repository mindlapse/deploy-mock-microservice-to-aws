variable "aws_secret_key" {}
variable "aws_access_key" {}
variable "aws_ssh_key_name" {}
variable "aws_ssh_key_path" {}

module "wiremock" {
  source = "./modules/wiremock"
  repo = "https://github.com/mindlapse/redesigned-pancake.git"
  branch = "master"
  secret_key = "${aws_secret_key}"
  access_key = "${aws_access_key}"
  ssh_key_name = "${aws_ssh_key_name}"
  ssh_key_path = "${aws_ssh_key_path}"
}