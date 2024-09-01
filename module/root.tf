# this is the root module

module "infra" {
  source = "/home/ec2-user/Terraform/moduletest"
  arguments = var.components
}

variable "components" {}
