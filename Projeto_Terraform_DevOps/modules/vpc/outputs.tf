output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID da Subnet Pública"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID da Subnet Privada"
  value       = aws_subnet.private.id
}
