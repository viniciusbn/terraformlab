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
resource "aws_instance" "dev" {
  count         = 3
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name      = "terraformlab1"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids =["${aws_security_group.terraformlab1_SG.id}"]
}

resource "aws_instance" "dev4" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name      = "terraformlab1"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids =["${aws_security_group.terraformlab1_SG.id}"]
  depends_on = [
    aws_s3_bucket.terraformlab1bucket
  ]
}

resource "aws_instance" "dev5" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name      = "terraformlab1"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids =["${aws_security_group.terraformlab1_SG.id}"]
}

resource "aws_s3_bucket" "terraformlab1bucket" {
  bucket = "terraformlab1bucket"
  tags = {
    Name        = "terraformlab1bucket"
    Environment = "terraformlab1"
  }
}

resource "aws_s3_bucket_acl" "terraformlab1bucket_acl" {
  bucket = aws_s3_bucket.terraformlab1bucket.id
  acl    = "private"
}