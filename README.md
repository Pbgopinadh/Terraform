# Terraform
Terraform notes.

doing changes manually is called Toil

Less toil more availabiltiy.

the extension of the file containing the infra as a code should be .tf
all the terraform files end with .tf

we can use multiple files in a folder terraform loads them in alphabetic order and complies them logically as per their dependency.

Terraform has 4 commands/phases:

1.) init - where the terraform files are read and required plugins, dependecies are taken care at this stage
2.) plan - this phase/command where we can see what is going to be created/modified/destoryed
3.) install - this is where the actual plan phase happen. creating infra
4.) destroy - in reality this is used rarely when customer is terminating their contact

in terraform everything is a block:

resouce "abc" "xyz"{
    block = {}
}

there is no concept of applying terraform on a single file. but we can create a directory and move requried .tf file there and execute tf commands.


<!-- below is the example of the all the arguments that can be passed for an ec2-instance

# resource "aws_instance" "example" {
#   ami                   = "ami-0c55b159cbfafe1f0"  # Replace with your AMI ID
#   instance_type         = "t2.micro"  # Replace with your instance type
#   availability_zone    = "us-west-2a"
#   subnet_id             = "subnet-0bb1c79de4EXAMPLE"  # Replace with your subnet ID
#   associate_public_ip_address = true
#   vpc_security_group_ids = ["sg-0a1b2c3d4e5f67890"]  # Replace with your security group ID
#   key_name              = "my-key-pair"  # Replace with your key pair name
#   user_data             = file("path/to/user_data_script.sh")
#   ebs_optimized         = true
#   monitoring            = true
#   tags = {
#     Name        = "MyEC2Instance"
#     Environment = "Development"
#   } -->

terrafor.tfvars is the default varaible values file that terraform is going to take if we dont explicitly mention it. 

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform

order of precendence of variables: 

1. --var-file if only one

if multiple are given then  terraform plan -var="env=command_line" --var-file=dev.tfvars --var-file=qa.tfvars qa varibales will override dev variables if they are same.

2. -var"var=value" 

this will be considered if no --var-file is given.

3. *.auto.tfvars

4. terraform.tfvars default variable value file - if above none is given.

5. present in the script file.

exception handling using lookup

and map inside a map how to retreive the variable value.

Anime = {

    onepiece = {
        hero = "luffy",
        swordsman = "zoro",
        crewsize = 10
    }

    7sins = {
        hero = "meli"
        joker = "clown"
    }

}