# this is the root module
module "infra" {
  for_each = var.components
  source = "/home/ec2-user/Terraform/moduletest"
  name = each.key
  ami = var.ami
  zoneid = var.zid
  instance = each.value["instance"]
  sgs = var.sg
}



