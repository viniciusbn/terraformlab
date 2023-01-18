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
  vpc_security_group_ids =["${aws_security_group.terraformlab1_SG.id}"]
}

resource "aws_instance" "terraformlab1-dev1" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name      = "terraformlab1"
  tags = {
    Name = "terraformlab1-dev1"
  }
  vpc_security_group_ids =["${aws_security_group.terraformlab1_SG.id}"]
}

resource "aws_instance" "terraformlab1-dev2" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name      = "terraformlab1"
  tags = {
    Name = "terraformlab1-dev2"
  }
  vpc_security_group_ids =["${aws_security_group.terraformlab1_SG.id}"]
}

resource "aws_security_group" "terraformlab1_SG" {
  name        = "terraformlab1_SG"
  description = "SG for terraform lab1"

  ingress {
    description      = "SSH  from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_s3_bucket" "terraformlab1_bucket" {
  bucket = "terraformlab1_bucket"
  tags = {
    Name        = "terraformlab1_bucket"
    Environment = "terraformlab1"
  }
}

resource "aws_s3_bucket_acl" "terraformlab1_bucket_acl" {
  bucket = aws_s3_bucket.terraformlab1_bucket.id
  acl    = "private"
}