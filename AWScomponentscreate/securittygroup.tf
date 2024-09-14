provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "terraformtest" {
  name        = "terraformsg"                                # name of the security group.
  description = "My security group"                                # description.
  vpc_id      = "vpc-0848a04da02f353c5"                                      # VPC id in which the SG should be created.

  ingress {                                       ## inbound rule 
    from_port   = 80                                                    
    to_port     = 80
    protocol    = "tcp"                            
    cidr_blocks = ["0.0.0.0/0"]
  }

# from_port: The starting port for the inbound rule.
# to_port: The ending port for the inbound rule.
# protocol: The protocol for the rule (e.g., "tcp", "udp", "icmp").
# cidr_blocks: The CIDR blocks that are allowed to access the specified ports.

  ingress {                                       ## inbound rule 
    from_port   = 22                                                    
    to_port     = 22
    protocol    = "TCP"                            
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0                               # when from port and to port is set to 0 then it means the this engress rules is applicable to all avaible ports.
    to_port     = 0
    protocol    = "-1"           # -1 means all protocol tcp,udp and another one.
    cidr_blocks = ["0.0.0.0/0"]
  }

# from_port: The starting port for the outbound rule.
# to_port: The ending port for the outbound rule.
# protocol: The protocol for the rule ("-1" means all protocols).
# cidr_blocks: The CIDR blocks that are allowed for outbound traffic.

  tags = {
    Name = "my-security-group"
  }
}

