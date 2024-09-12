module "terraform_testing" {
  for_each = var.components
  source = "git@github.com:Pbgopinadh/terraform_testing.git"
  name = each.key
  ami = data.aws_ami.ids.image_id
  instance = each.value["instance"]
  sgs = var.sg
}