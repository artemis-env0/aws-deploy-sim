output "instances" {
  value = aws_instance.acme.id
}

output "public_ip" {
  value = aws_instance.acme.public_ip
}

output "private_ip" {
  value = aws_instance.acme.private_ip
}
