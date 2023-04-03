resource "aws_cloudfront_distribution" "s3_distribution" {
    origin {
        domain_name = var.s3_regional_domain_name
        origin_id   = "s3-${var.frontend_name}"
    
        s3_origin_config {
        origin_access_identity = ""
    }
  }

    enabled             = true
    is_ipv6_enabled     = true
    # default_root_object = "index.html"

    default_cache_behavior {
        compress         = true
        allowed_methods  = ["GET", "HEAD", "OPTIONS"]
        cached_methods   = ["GET", "HEAD", "OPTIONS"]
        target_origin_id = "s3-${var.frontend_name}"

        forwarded_values {
            query_string = false

            cookies {
                forward = "none"
            }
        }

        viewer_protocol_policy = "redirect-to-https"
        min_ttl                = 0
        default_ttl            = 3600
        max_ttl                = 86400
    }

    custom_error_response {
        error_code         = 404
        response_code      = 200
        response_page_path = "/404.html"
    }

    aliases = ["*.vickynryan.click"] # ${var.frontend_name}

    viewer_certificate {
        acm_certificate_arn      = var.acm_certificate_arn
        ssl_support_method       = "sni-only"
        minimum_protocol_version = "TLSv1.2_2018"
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    price_class = "PriceClass_100"
}