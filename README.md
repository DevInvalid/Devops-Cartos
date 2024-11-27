
# Teste Técnico: DevOps Terraform Deploy  

Este repositório contém a solução para o teste técnico de criação e configuração de infraestrutura na AWS utilizando Terraform. O objetivo é provisionar uma instância EC2 com uma aplicação Docker, configurar redes VPC, implementar um Amazon CloudFront e, opcionalmente, configurar um domínio com SSL.

---

## 📋 Descrição do Projeto  

O projeto realiza as seguintes tarefas:  
1. Provisão de uma instância EC2 no **AWS Free Tier**:  
   - Configurada com uma aplicação Docker simples que expõe um serviço web (ex.: Nginx).  
   - A aplicação é acessível publicamente via HTTP/HTTPS.  

2. Configuração de uma **VPC**:  
   - Subnets públicas e privadas.  
   - NAT Gateway com IP fixo para saída da subnet privada.  
   - Security groups para controle de acesso.  

3. Implementação do **Amazon CloudFront**:  
   - Configurado para distribuir o tráfego HTTP/S para a aplicação.  

4. (Opcional) Configuração de um domínio personalizado:  
   - Apontamento via CloudFront.  
   - SSL provisionado pelo **AWS Certificate Manager (ACM)**.  

---

## 🚀 Como Executar  

### Pré-requisitos  
- Conta na AWS com permissões para provisionamento de recursos.  
- Terraform instalado na máquina local.  
 

### Passo a Passo  

1. Clone este repositório:  
   ```bash
   git clone https://github.com/seuusuario/terraform-deploy.git
   cd terraform-deploy
   ```

2. Configure as variáveis no arquivo `terraform.tfvars` ou defina no ambiente:  
   ```hcl
   aws_region       = "us-east-1"
   vpc_cidr_block   = "10.0.0.0/16"
   public_subnet_cidr  = "10.0.1.0/24"
   private_subnet_cidr = "10.0.2.0/24"
   ec2_instance_type   = "sua_preferencia"
   ```

3. Inicialize o Terraform:  
   ```bash
   terraform init
   ```

4. Execute o plano para visualizar os recursos que serão criados:  
   ```bash
   terraform plan
   ```

5. Aplique o plano para provisionar a infraestrutura:  
   ```bash
   terraform apply
   ```

6. Após a execução, anote os outputs exibidos no terminal, incluindo a URL da aplicação.  

---


```

---

## 🖥️ Descrição da Aplicação Docker  

A aplicação configurada é um servidor **Nginx** básico. Ela serve uma página HTML estática para validar o funcionamento da infraestrutura.

---



## 📦 Estrutura do Projeto  

Projeto_Terraform_DevOps/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── cloudfront/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf



## 🛠️ Tecnologias Utilizadas  

- **Terraform**: Para gerenciar a infraestrutura como código.  
- **AWS EC2**: Instância para execução da aplicação.  
- **AWS VPC**: Para rede segura e escalável.  
- **Amazon CloudFront**: Distribuição de tráfego web.  


---

