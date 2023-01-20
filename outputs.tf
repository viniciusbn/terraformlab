output "dev5ip" {
  value = aws_instance.dev5.public_ip
}
output "dev5dns" {
  value = aws_instance.dev5.public_dns
}