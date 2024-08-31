resource "aws_instance" "instance" { 
  for_each = var.components
  ami           = "ami-066784287e358dad1"
  instance_type = "${each.value["instance"]}" # these are arugments and this whole {.........} is called a block
  vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] #so if a arugments can have multiple values then we should mention them like this

  tags = {
        name  = "${each.key}"
  }
  }

variable "components" {

  default = {
      frontend = {                                          # this is each.key 
        instance = "t2.micro" ,                              # all the values o fthe keys are each.values.
        bu = 100,
      }

      backend = {
        instance = "t2.micro" ,
        bu = 50,
      }

      database = {
        instance = "t2.micro" ,
        bu = 20,
      }

  }
  
}



