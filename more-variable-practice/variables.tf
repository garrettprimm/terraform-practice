/*
normal way of setting a default value for the instance type value
*/
variable "instance_type" {
  default = "t2.micro"
}

/*
use this command to override default variable value at the command line

terraform plan -var="instance_type=t2.small"
*/

/*
use the following varible syntax to force a prompt for variable value at apply/plan

variable "instance_type" {
}
*/

/*
In production use a variables.tf file for the default config 
and use terraform.tfvars for overriding default config


file naming is important for varibles.tf and terraform.tfvars.
without specific naming you have to specify the custom .tfvars

to specify the custom .tfvars file at the command line

terraform plan -var-file="custom.tfvars"
*/

/*
Using environment variables is possible with terraform

Specify 
export TF_VAR_<variable name>=<value>
*/
