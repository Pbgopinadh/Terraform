resource "aws_instance" "instance" { # resouce is where we declare the type of instance we want to create and the local name of it.
  ami           = "ami-066784287e358dad1"
  instance_type = "t2.micro" # these are arugments and this whole {.........} is called a block
  vpc_security_group_ids = ["sg-0f32ca9e850ae332e"] #so if a arugments can have multiple values then we should mention them like this

  tags = {
    Name = "fromterraform" # name of the instance.
  }
}

resource "null_resource" "nully" {

count = 3

}

