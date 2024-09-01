# resource "aws_instance" "instance1" { 
#   for_each = var.components
#   ami           = "ami-066784287e358dad1"
#   instance_type = "${each.value["instance"]}" # here for each key there can be multiple values so for that key the are taken as each.value["value to be retreived"]
#   vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] #so if a arugments can have multiple values then we should mention them like this

resource "aws_instance" "instance9" { 
  for_each = var.components
  ami           = "ami-066784287e358dad1"
  instance_type = try(each.value["instance"], "null") == "*" ? each.value["instance"] : "t2.small" # .* means the value is not null something is present

  # what happens above is, if the instance value is not present under the key then try function will pass "null" value for this. where null is not something. the first condition fails and second one passess to the instance type

  vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] #so if a arugments can have multiple values then we should mention them like this


  tags = {
        name  = "${each.key}" #so here each.key will take the keys of the map 
  }
  }

variable "components" {

  default = {
      frontend = {                                          # this is each.key 
        instance = "t2.micro" ,                              # all the values of the keys are each.values.
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



