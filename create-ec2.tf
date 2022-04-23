provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "/Users/$USER/.aws/creds"
}

resource "aws_instance" "my-ec2" {
  ami = "ami-0c6a6b0e75b2b6ce7"
  instance_type = "t2.micro"
  tags = {
    Name = "my-ec2"
  }
}
