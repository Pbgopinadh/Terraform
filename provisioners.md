# provisioners

these are used to execute commands after a specifc resource creation in the terraform.

provisioners are some what like a user data in instances. where the script will run depending on resource.

there are 2 ways to do use provisoners staright forward and using the null resource:

_________________________________________________________________________________________________________________________________________________________________________________________

resource "aws_instance" "web" {
 

  <!-- Establishes connection to be used by all
  generic remote provisioners (i.e. file/remote-exec) -->

  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.publicip
  }

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}


resource "null_resource" "app" {
  depends_on = [aws_route53_record.main, aws_instance.main]

  triggers = {
    always_run = timestamp()
  }
  connection { # Enables connection to the remote host
    host     = aws_instance.main.private_ip
    user     = "ec2-user"
    password = var.ssh_pwd
    type     = "ssh"
  }
  provisioner "remote-exec" { # This let's the execution to happen on the remote node
    inline = [
      "pip3.11 install hvac",
      "ansible-pull -U https://github.com/B58-CloudDevOps/ansible.git -e vault_token=${var.vault_token} -e COMPONENT=${var.name} -e ENV=${var.env} expense-pull.yml"
    ]
  }
}