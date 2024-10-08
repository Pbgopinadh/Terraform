# Terraform

## AWS services used until now -> EC2, S3, Route53, VPC,2
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

 sudo growpart /dev/xvda 4
 sudo lvextend -r -L +4G /dev/mapper/RootVG-homeVol

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

functions in terraform -> functions cannot be created but can be consumed. we cannot create our own functions.

[1,2,3]

[2,3,1]

do you think the above are same in terraform -> no, even though the numbers are same terraform consider there are changes and it will destory and recreate in the modified order.

so always make sure to check these things.

when using lists order is very important.

for loop = for_each

try

Modules in terraform for DRY methodlogy. we can create them unlike functions.

modules in terraform are of 2 types:

1. Root Module - The path/folder from where we are calling actual module and also where we are running the terraform command.
2. child/calling/backened module - the actual module which is called from anothe module.

when we run terraform init

1. it is going to intialize the backend.
2. intiliase any modules.
2. intiliase plugin providers.

Module is simple way to call one terraform script from one another similar to roles in ansible.

how to get the output from clhild to root

syntax is module.(name of the module).(local name of the output)

it is always better to have different files for diferent components of terraform.

main.tf -> where the infra script is present
variables.tf -> where variables and there values are present
output.tf -> where the outputs are present. 

by following we can have organised structure.

the resource of the module should be a directory not a file.

how to read the already exisiting resources in AWS using terraform

using Data block we can filter and see all the properties of AWS existing resoures.

in modulev2 and moduletestv2 we have used the data concept to retreive the ami-id based on the name and sg based on the sg name

for AMIs the ami id may change but the name will not change.
for sg we have filtered it by the security group name.

depends_on: this depends_on is used to create dependecy between resources. lets say we have a requirement where. records are to be created after the instances are created. by default we cannot gurantee certain things.

so we use depends_on to tell terraform before creating this you create depends_on infra and then proceed with current one

depends_on is a list.

in any resource block mention depends_on = [resourcetype.resourcename,resourcetype1.resourcename1]

we dont use provisioners.

whenever we run a Terraform plan command. Terraform is going to create a state file which is a single source of truth. 

so whenever we run the terraform plan command the terraform is going to compare the current code and the statefile. there is also a backup of statefile as it is that importnat to the terraform.

whenever there are any differences we call it drift. a drift in infrastrucutre.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

The Terraform state file is a critical component of Terraform's infrastructure-as-code management. It maintains the mapping between the resources in your Terraform configuration and the real-world infrastructure that Terraform manages. Here’s an overview of its purpose and how it works:

Purpose of the Terraform State File
Tracking Resources: The state file keeps track of the resources that Terraform manages and their current state. This allows Terraform to understand what has been created, updated, or deleted in your infrastructure.

Performance: By storing resource data locally, the state file allows Terraform to efficiently determine the changes needed during operations like terraform plan and terraform apply without having to query the infrastructure provider repeatedly.

Dependency Management: It helps Terraform manage dependencies between resources. For example, if one resource depends on another, the state file tracks these relationships so Terraform can apply changes in the correct order.

Metadata Storage: The state file stores metadata about the resources, such as resource IDs and other attributes required for managing resources.

State File Structure
Location: By default, the state file is named terraform.tfstate and is stored in the root directory of your Terraform configuration. For remote state management, it can be stored in backends like AWS S3, Azure Storage, Google Cloud Storage, etc.

Format: The state file is typically in JSON format, which allows it to be easily read and written by Terraform.

Working with State Files
Viewing State: You can use commands like terraform show to view the contents of the state file and understand the current state of your infrastructure.

Modifying State: Occasionally, you may need to make manual changes to the state file. Terraform provides commands like terraform state rm, terraform state mv, and terraform state pull for managing and modifying the state.

Remote State: For teams or more complex setups, using a remote state backend is recommended. This ensures state consistency, locking, and sharing among team members.

State Locking: When using remote backends like AWS S3 with DynamoDB for locking, Terraform can prevent concurrent modifications by multiple users.

what are the cases, i need to do manual changes 

Modifying State: Occasionally, you may need to make manual changes to the state file. Terraform provides commands like terraform state rm, terraform state mv, and terraform state pull for managing and modifying the state.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

so when in a team, we have to make sure that everyone is using/refering to the same terraform state file. becuz if they are refering to their locally saved state file then obvs when we run terrafrom plan and apply even though the same infra is present. terraform will create same infra as it considers the locally saved statefile.

so in order to aviod duplication/complications it is a best practice for all the users to refer to a single statefile.

intializing backend is the first thing we see when running the terraform plan. backend is from which the state file is reffered or backed is where the terraform store its consistent data.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

check on provisioners concept.

we use the s3 bucket to store the statefile to refer as the backend.

We can direclty mention the backend detials as a block like below

terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

or we can use a option called  -backend-config=path where we can just give the below details in a path and give this path to the -backend-config parameter but we shouldn't forget to declare a empty backend terraform resource block in the configuration file. 

    bucket = "demodevops1"
    key    = "test/terraform.tfstate"
    region = "us-east-1"

terraform {
  backend "s3" {
  }
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## An important note: tf.state file in s3 will only be created if the terraform apply is executed and the resources are created.

terraform providers and the backend will be same so it is better to mention these over the root level instead of folder level/path level hope you got the point.

Another thing is it is better to declare empty for the S3 backend and then provide the parameters as -backend-config so that we can have multi-environment creation control and code can be DRY.


## Terraform commands only consider .tf files in the current directory and dont consider from subdirectories unless they are mentioned in modules.

th backend configuration is for that specific directory and not to all the terraform files.

so there is no concept of inheritence for the backend in terraform. each directory will have its own backend. even though the parent dorectory is configured with another backedn.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

we have multiple stages and for each stage we can have a seperate repo or branch of 1 repo. but seperate repo is suggested.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Generic Git Repository
Arbitrary Git repositories can be used by prefixing the address with the special git:: prefix. After this prefix, any valid Git URL can be specified to select one of the protocols supported by Git.

For example, to use HTTPS or SSH:

module "vpc" {
  source = "git::https://example.com/vpc.git"
}

module "storage" {
  source = "git::ssh://username@example.com/storage.git"

}
check on the above more

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

whenever we destroy a resource the paramteric values of those resources becomes null.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

see how we can use and run a AMI which is specific to our account ??

how to create various infra using terraform ??

concept of provisioners ??

see how to run a user data in the terraform ??

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# hashi corp vault

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install vault

seal: lock.

unseal: unlock.

we have to configure a file to start and access the UI version of vault.

---------------------------------------------------------------------------------------------------------------

so a token should be present in the script which is used to access the vault for the stored secrets. so, we need to encrpyt the token with the secret management of the software we are using in this jenkins.

in side we can multiple work spaces where each one is dedicated to a team for stroing their secrets.

we have vault policies and othere access policies. usually vault is manged by LDAP so the access and secrets are specific to certian team.

there are different type of secret engine where each engine is specific to a software/tech examplt kubernetes has its own secret engine and similar.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

To retrieve secrets from HashiCorp Vault in Terraform, you typically use the vault provider to interact with Vault and fetch secrets. Here's a step-by-step guide on how to do this:

1. Setup Vault Provider

First, you need to configure the Vault provider in your Terraform configuration. This allows Terraform to communicate with Vault and access secrets.

Example Configuration:
hcl
Copy code
provider "vault" {
  address = "https://vault.example.com"  # URL of your Vault server
  token   = var.vault_token               # Vault token or other authentication method
}
You can use different methods for authentication, such as:

Token Authentication: Set the token directly in the provider configuration.
Environment Variables: Set VAULT_ADDR and VAULT_TOKEN environment variables.
Other Authentication Methods: Configure methods like AWS IAM, Kubernetes, etc., as needed.

2. Retrieve Secrets
Once the provider is set up, you can use the vault_generic_secret data source to retrieve secrets from Vault.

Example Usage:
hcl
Copy code
data "vault_generic_secret" "example" {
  path = "secret/my-secret"  # Path to the secret in Vault
}

output "my_secret_value" {
  value = data.vault_generic_secret.example.data["my_key"]
}
Explanation:
path: The path to the secret in Vault. This path corresponds to the secret engine and specific secret you want to retrieve.
data: Contains the key-value pairs of the secret. You can access specific keys within the secret.
3. Use the Retrieved Secret
Once you’ve retrieved the secret, you can use it in other Terraform resources or outputs. For example:

hcl
Copy code
resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  tags = {
    Name = data.vault_generic_secret.example.data["instance_name"]
  }
}
Additional Data Sources
Depending on your use case and the type of secret engine in Vault, you might use other data sources:

Key-Value (KV) Secrets Engine: vault_generic_secret
Database Secrets Engine: vault_database_secret_backend_credentials
PKI Secrets Engine: vault_pki_secret_backend_cert
Example for a KV Secret Engine:
If you’re using the KV (Key-Value) secrets engine, you might access it like this:

hcl
Copy code
data "vault_kv_secret_v2" "example" {
  path = "secret/data/my-secret"  # Use "secret/data" for KV v2 secrets engine
}

output "my_secret_value" {
  value = data.vault_kv_secret_v2.example.data["my_key"]
}
Notes and Best Practices
Secure Tokens: Be careful with how you manage and expose your Vault token. Avoid hardcoding sensitive values directly in your Terraform files.
Environment Variables: For better security, consider using environment variables or secure methods to pass sensitive data.
Access Policies: Ensure that the Vault token or credentials used have appropriate policies and permissions to access only the secrets required.
By following these steps, you can securely retrieve and use

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\
## vault usage in terraform
### below is a example script on how to use a vault in terraform

make sure to execute the export VAULT_SKIP_VERIFY=true before running the terraform commands. becuz if not, you will recieve certificate validation error.


provider "aws" {}
provider "vault" {
    address = "https://54.160.38.144:8200"  # URL of your Vault server
    token   = var.token
}

data "vault_generic_secret" "example" {
  path = "kv/sshpwd"  # Path to the secret in Vault. dont need to include Secrets as per the below screen shot just ignore the Secrets and provide it as path from next.
}

![alt text](image.png)

output "my_secret_value" {
  value = data.vault_generic_secret.example.data["SSH_PWD"]
  sensitive = true
}

variable "token" {
    default = "value"
}

 resource "null_resource" "provisi" {

  connection { # this connection is used to remotly connect using SSH protocal and with user name and password.
    type     = "ssh"
    user     = "ec2-user"
    password = data.vault_generic_secret.example.data["SSH_PWD"]
    host     = "54.160.38.144" # we dont need data.resources if its the resources that is going to be created with the current infra code.
  }

   provisioner "remote-exec" { # remote-exec is say that the below commands should run on the remote host.
    inline = ["touch provsioner1.txt", "echo 'this is sampple1' > provsioner1.txt" ]
  }
    
  }

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


When to Use Lifecycle Policies of terraform:

Use create_before_destroy when you have resources that should not experience downtime.
Use prevent_destroy for critical resources that need extra protection against accidental deletion.
Use ignore_changes when external changes to resource attributes should not trigger Terraform updates.

example:

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = true
    ignore_changes        = [tags]
  }

  tags = {
    Name = "ExampleInstance"
  }
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


