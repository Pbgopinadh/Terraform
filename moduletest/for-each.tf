# resource "aws_instance" "instance1" { 
#   for_each = var.components
#   ami           = "ami-066784287e358dad1"
#   instance_type = "${each.value["instance"]}" # here for each key there can be multiple values so for that key the are taken as each.value["value to be retreived"]
#   vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] #so if a arugments can have multiple values then we should mention them like this

resource "aws_instance" "instance1" { 
  for_each = var.arguments
  ami           = "ami-066784287e358dad1"
  instance_type = each.value["instance"]  
  vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] 
  tags = {
        name  = "${each.key}" #so here each.key will take the keys of the map 
  }
  }

variable "arguments" {}


