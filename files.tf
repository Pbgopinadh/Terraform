variable "abc" {
  default = 100
}

output "abc" {
  value = var.abc
}

variable "abc" {
  default = [100, "true" , true]
}

output "abc" {
  value = "the rumour that you are a ${var.abc[0]} is ${var.abc[1]} "
}

variable "abc" {
  default = {
    name = "gopi",
    bool = true ,
    str = "hola"
  }
}

output "abc" {
  value = "the rumour that you are a ${var.abc["name"]} is ${var.abc[bool]}"
}

