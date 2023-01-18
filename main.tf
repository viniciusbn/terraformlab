terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "terraformlab1" {
  count         = 3
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name      = "terraformlab1"

  tags = {
    Name = "terraformlab1-${count.index}"
  }
}