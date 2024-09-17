data "aws_ami" "ids" {
  most_recent      = true
  name_regex       = "DevOps-LabImage-RHEL9"
}