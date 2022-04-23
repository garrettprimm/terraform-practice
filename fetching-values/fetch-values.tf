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

resource "aws_instance" "myec2" {
  ami = "ami-0c6a6b0e75b2b6ce7"
  #accesssing a map type variable
  #instance_type = var.types["ap-south-1"]
  #accessing a list type variable
  instance_type = var.list[0]

}

variable "list" {
  type = list
  default = ["m5.large","m5.xlarge","t2.medium"]
}

variable "types" {
  type = map
  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.nano"
    ap-south-1 = "t2.small"
    }
}