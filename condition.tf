resource "aws_instance" "instance2" { 
  ami           = "ami-066784287e358dad1"
  instance_type = var.comp == "dev" ? "t3.medium" : "t3.micro"  # conditional statement expression ? true : false
  vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] 

  tags = {
        name  = "condtion"
  }
  }

variable "comp" {
    default = "dev"
}



