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
  #shared_credentials_file = "˜/.aws/credentials"
  region                  = "us-east-1"
}

provider "aws" {
  #shared_credentials_file = "˜/.aws/credentials"
  alias                   = "us-east-2"
  region                  = "us-east-2"
}

resource "aws_instance" "dev" {
  count         = 3
  ami           = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.terraformlab1_SG.id}"]
}

/*resource "aws_instance" "dev4" {
  ami           = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.terraformlab1_SG.id}"]
  depends_on = [
    aws_s3_bucket.terraformlab1bucket
  ]
}*/

resource "aws_instance" "dev5" {
  ami           = var.amis["us-east-1"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.terraformlab1_SG.id}"]
}

resource "aws_instance" "dev6" {
  provider      = aws.us-east-2
  ami           = var.amis["us-east-2"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.terraformlab1_SG-us-east-2.id}"]
  depends_on = [
    aws_dynamodb_table.basic-dynamodb-table
  ]
}

resource "aws_instance" "dev7" {
  provider      = aws.us-east-2
  ami           = var.amis["us-east-2"]
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "dev7"
  }
  vpc_security_group_ids = ["${aws_security_group.terraformlab1_SG-us-east-2.id}"]
}