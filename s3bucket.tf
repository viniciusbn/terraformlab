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