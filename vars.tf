variable "amis" {
  type = map(string)
  default = {
    "us-east-1" = "ami-06878d265978313ca"
    "us-east-2" = "ami-0a606d8395a538502"
  }
}

variable "cdirs_acesso_remoto" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "key_name" {
  default = "terraformlab1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "AWS_SECRET_ACCESS_KEY" {
  default = ""
}

variable "AWS_ACCESS_KEY_ID" {
  default = ""
}