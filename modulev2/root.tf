# this is the root module
module "infra" {
  for_each = var.components
  source = "/home/ec2-user/Terraform/moduletest"
  name = each.key
  ami = var.ami
  zoneid = data.aws_route53_zone.selected.id
  instance = each.value["instance"]
  sgs = var.sg
}



