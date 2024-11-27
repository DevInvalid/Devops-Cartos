module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source           = "./modules/ec2"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  key_name         = "id_rsa"  # Nome da chave SSH
}



module "cloudfront" {
  source  = "./modules/cloudfront"
  origin  = module.ec2.instance_public_dns
}
