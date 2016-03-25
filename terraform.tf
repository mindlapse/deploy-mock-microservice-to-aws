
variable "instance_size" {
  default = "t2.nano"
}

variable "region" {
  default = "us-west-2"
}


module "wiremock" {
  source = "github.com/mindlapse/terraform-wiremock.git"
  repo = "https://github.com/mindlapse/redesigned-pancake.git"
  branch = "master"
  aws_security_group  = "${var.aws_security_group}"
  aws_secret_key      = "${var.aws_secret_key}"
  aws_access_key      = "${var.aws_access_key}"
  aws_ssh_key_name    = "${var.aws_ssh_key_name}"
  aws_ssh_key_path    = "${var.aws_ssh_key_path}"
}