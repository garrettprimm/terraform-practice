terraform { 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "/Users/$USER/.aws/creds"
}

variable "elb_names" {
  type = list
  default = ["dev-loadbalancer","stage-loadbalancer","prod-loadbalancer"]
}

/*
Typical way of creating two identical ec2 instances by defining 
two or more separate identical resources

resource "aws_instance" "instance-1" {
  ami = "ami-0c6a6b0e75b2b6ce7"
  instance_type = "t2.micro"
}

resource "aws_instance" "instance-2" {
  ami = "ami-0c6a6b0e75b2b6ce7"
  instance_type = "t2.micro"
}
*/

/*
The better way to create identical resources using "count".
notice how all of the resources share the same name ;)
see the next example
"count" acts as a loop

resource "aws_instance" "instance-1" {
  ami = "ami-0c6a6b0e75b2b6ce7"
  instance_type = "t2.micro"
  count = 2
}
*/

/*
use the count.index variable to create 5 different users with different names 

resource "aws_iam_user" "lb" {
  name = "loadbalancer.${count.index}"
  count = 5
  path = " /system/"
}
*/

/*
use the count with another list to access values in the list variable
*/
resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = " /system/"
}