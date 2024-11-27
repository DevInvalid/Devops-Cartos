resource "aws_instance" "main" {
  ami           = "ami-03c9f388d0b482ba7" # Amazon Linux 2
  instance_type = "t4g.micro"
  subnet_id     = var.public_subnet_id
  key_name      = "id_rsa" # Usando a chave SSH

  # Configuração do Security Group
  vpc_security_group_ids = [aws_security_group.instance_sg.id]

  # Inicialização para instalar Docker e Nginx
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo service docker start
              sudo docker run -d -p 80:80 nginx
              EOF

  tags = {
    Name = "MainEC2Instance"
  }
}

resource "aws_security_group" "instance_sg" {
  name        = "ec2_security_group"
  description = "Allow HTTP and SSH traffic"  # Alterado para texto ASCII

  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2SecurityGroup"
  }
}
