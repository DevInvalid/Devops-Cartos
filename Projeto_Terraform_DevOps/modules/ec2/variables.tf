variable "instance_type" {
  description = "Tipo de instância EC2"
  default     = "t2.micro"
}

variable "public_subnet_id" {
  description = "ID da subnet pública"
}

variable "vpc_id" {
  description = "ID da VPC"
}

variable "key_name" {
  description = "Nome do par de chaves para acessar a instância EC2"
}
