
resource "aws_instance" "instance1" { 
  ami           = var.ami
  instance_type = var.instance
  vpc_security_group_ids = var.sgs
  tags = {
        name  =  var.name
  }
  }



