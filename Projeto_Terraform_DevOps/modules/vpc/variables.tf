variable "vpc_cidr" {
  description = "Bloco CIDR para a VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Bloco CIDR para a Subnet Pública"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Bloco CIDR para a Subnet Privada"
  default     = "10.0.2.0/24"
}
