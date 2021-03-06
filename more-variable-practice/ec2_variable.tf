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

resource "aws_instance" "my-ec2" {
  ami = "ami-0c6a6b0e75b2b6ce7"
  instance_type = var.instance_type
  tags = {
    Name = "my-ec2"
  }
}