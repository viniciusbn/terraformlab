resource "aws_security_group" "terraformlab1_SG" {
  name        = "terraformlab1_SG"
  description = "SG for terraform lab1"

  ingress {
    description = "SSH  from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_security_group" "terraformlab1_SG-us-east-2" {
  provider    = aws.us-east-2
  name        = "terraformlab1_SG-us-east-2"
  description = "SG for terraform lab1"

  ingress {
    description = "SSH  from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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