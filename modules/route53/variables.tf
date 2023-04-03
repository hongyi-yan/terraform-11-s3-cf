variable "root_name" {
  description = "The root name for the Route 53 hosted zone"
  type        = string
}

variable "record_name" {
  description = "The name of the DNS record to be created"
  type        = string
}

variable "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  type        = string
}

variable "cloudfront_distribution_hosted_zone_id" {
  description = "The hosted zone ID of the CloudFront distribution"
  type        = string
}