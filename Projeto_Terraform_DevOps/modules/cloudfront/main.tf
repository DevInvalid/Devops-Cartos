resource "aws_cloudfront_distribution" "main" {
  origin {
    domain_name = "meu-bucket.s3.amazonaws.com"  # Substitua pelo nome do bucket S3 correto
    origin_id   = "S3Origin"

    s3_origin_config {
      origin_access_identity = ""  # Use uma identidade de acesso se o bucket for privado
    }
  }

  enabled         = true
  is_ipv6_enabled = true

  default_cache_behavior {
    target_origin_id       = "S3Origin"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"  # Permitir acesso global
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Name = "MainCloudFrontDistribution"
  }
}
