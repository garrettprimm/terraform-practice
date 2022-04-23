
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

/*
resource "aws_iam_user" "lb" {
  name = var.usernumber
  path = "/system/"
}*/