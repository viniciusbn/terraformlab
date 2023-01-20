/*resource "aws_s3_bucket" "terraformlab1bucket" {
  bucket = "terraformlab1bucket"
  tags = {
    Name        = "terraformlab1bucket"
    Environment = "terraformlab1"
  }
}

resource "aws_s3_bucket_acl" "terraformlab1bucket_acl" {
  bucket = aws_s3_bucket.terraformlab1bucket.id
  acl    = "private"
}*/

resource "aws_s3_bucket" "homologacao-vbn" {
  bucket = "homologacao-vbn"
  tags = {
    Name        = "homologacao-vbn"
    Environment = "terraformlab1"
  }
}

resource "aws_s3_bucket_acl" "homologacao-vbn_acl" {
  bucket = aws_s3_bucket.homologacao-vbn.id
  acl    = "private"
}