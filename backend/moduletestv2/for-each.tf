# to create the EC2 instances
resource "aws_instance" "instance1" { 
  ami           = var.ami
  instance_type = var.instance
  vpc_security_group_ids = var.sgs
  tags = {
        name  =  var.name
  }
  }

# to create the DNS records

# resource "aws_route53_record" "appinternal" {
#   zone_id = var.zoneid
#   name    = "${var.name}.app.internal"
#   type    = "A"
#   ttl     = 10
#   records = [aws_instance.instance1.private_ip] # this is how we get the attributes aws_instance(tyep of resource).instance1(resource name).private_ip (attribute)
# }

