env = "qa"

# so we can use this file for the values of the variables as below

# so we declare empty variables and then pass the values using which helps us to customize things

# empty varaible -> variable "name" {}

# terraform plan --var-file=qa.tfvars 
# terraform apply --var-file=qa.tfvars 

Anime = {
    onepiece = {
        hero = "luffy",
        swordsman = "zoro",
        crewsize = 10
    }

    ssins = {
        hero = "meli"
        joker = "clown"
    }

}