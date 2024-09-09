# this is the root module
module "infra1" {
  for_each = var.components
  source = "../moduletestv2"
  name = each.key
  ami = data.aws_ami.ids.image_id
  # zoneid = data.aws_route53_zone.selected.id
  instance = each.value["instance"]
  sgs = var.sg
}


## using the s3 baucket as backend to store the terraform state file.

terraform {
  backend "s3" {
  }
}
