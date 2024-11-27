output "instance_public_dns" {
  value = module.ec2.instance_public_dns
}

output "cloudfront_url" {
  value = module.cloudfront.url
}
