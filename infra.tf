resource "aws_instance" "instance" { # resouce is where we declare the type of instance we want to create and the local name of it.
  count = length(var.counts) # lenth gets the lenght of the variable dynamically. #3 instances will be created using this function this can be considered as looping mechanism in Terraform.
  ami           = "ami-066784287e358dad1"
  instance_type = "t2.micro" # these are arugments and this whole {.........} is called a block
  vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] #so if a arugments can have multiple values then we should mention them like this

  tags = {
    Name = "${var.counts[count.index]}" #using this we are dynamically creating the instances using the name
    # Name = "terrcreate-${count.index+1}" # name of the instance. #count is terraform function and this cound has a property known as index where its give the iteration number count.index = 0,1,2,3,4......
    # even arthimetic functions are supported.
  }
}

# count = length(var.counts) This will dynamically gets the no of instances to be created and Name = "${var.counts[count.index]}" this will create the instances with thier respective instances.

variable "counts" {

  default = ["front","back","data"]
  
}
resource "null_resource" "nully" {

count = 3

}


