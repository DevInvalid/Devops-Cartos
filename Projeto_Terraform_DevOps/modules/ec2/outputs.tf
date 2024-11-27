output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.main.id
}

output "instance_public_dns" {
  description = "DNS público da instância EC2"
  value       = aws_instance.main.public_dns
}
