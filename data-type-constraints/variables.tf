#constrain variable to a specific data type
/*
using this syntax will prompt the user for a value.data 
it will not do any input validation at a data type level
this variable needs to be a number and it can recieve any input

variable "usernumber" {}
*/

#use the following syntax to enforce data type

#variable "usernumber" {
#  type = number
#}

variable "elb_name" {
  type = string
}

variable "az" {
  type = list
}

variable "timeout" {
  type = number
}