# this is the root module

module "infra" {
  source = "/home/ec2-user/Terraform/moduletest"
  arguments = var.components
}

variable "components" {}
output "name" {
  value = module.infra.main #syntax is module.(name of the module).(local name of the output)
}