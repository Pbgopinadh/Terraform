# this is the root module
module "infra1" {
  for_each = var.components
  source = "../moduletestv2"
  name = each.key
  ami = var.ami
  zoneid = data.aws_route53_zone.selected.id
  instance = each.value["instance"]
  sgs = var.sg
}



