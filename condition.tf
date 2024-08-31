resource "aws_instance" "instance1" { 
  ami           = "ami-066784287e358dad1"
  instance_type = var.comp == "dev" ? t3.medium : "t3.micro" # here for each key there can be multiple values so for that key the are taken as each.value["value to be retreived"]
  vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] #so if a arugments can have multiple values then we should mention them like this

  tags = {
        name  = "condtion" #so here each.key will take the keys of the map 
  }
  }

variable "comp" {
    default = "dev"
}



