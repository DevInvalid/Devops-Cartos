output "url" {
  description = "URL da distribuição do CloudFront"
  value       = aws_cloudfront_distribution.main.domain_name
}
