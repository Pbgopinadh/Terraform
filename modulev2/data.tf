# here we use data blocks so using data blocks we can retrieve the already present AWS resources data

data "aws_route53_zone" "selected" {
  name         = "app.internal"
  private_zone = true
}

output "name" {
  value = data.aws_route53_zone.selected
}