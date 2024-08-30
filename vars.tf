variable "abc1" {
  default = 100
}

output "abc1" {
  value = var.abc1
}

variable "abc2" {
  default = [100, "true" , true]
}

output "abc2" {
  value = "the rumour that you are a ${var.abc2[0]} is ${var.abc2[1]} "
}

variable "abc3" {
  default = {
    name = "gopi",
    bool = true,
    str = "hola"
  }
}

output "abc3" {
  value = "the rumour that you are a ${var.abc3["name"]} is ${var.abc3["bool"]}" 
}

variable "env" { 
}

output "env" {
  value = "the env is ${var.env}" 
}

