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
#create ec2 instance
resource "aws_instance" "my-ec2" {
  ami = "ami-0c6a6b0e75b2b6ce7"
  instance_type = "t2.micro"
  tags = {
    Name = "my-ec2"
  }
}
#create elastic IP
resource "aws_eip" "lb" {
  vpc = true
}
#associate elastic IP to ec2 instance
resource "aws_eip_association" "eip_assoc" {
  instance_id = aws_instance.my-ec2.id
  allocation_id = aws_eip.lb.id
}
#create security group. Don't attach to ec2
resource "aws_security_group" "allow_https" {
  name = "primary-security-group"
  
  ingress =  [{
    description = "https from lb"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]
    ipv6_cidr_blocks = ["::1/128"] #terraform is forcing this "optional" attribute
    security_groups = []
    self = false
    prefix_list_ids = []
  } ]
  

}