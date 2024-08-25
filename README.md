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