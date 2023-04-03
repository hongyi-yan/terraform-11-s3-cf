variable "s3_regional_domain_name" {
    description = "The domain of the origin server."
    type        = string
}

variable "frontend_name" {
    description = "bucket name for the static website - website domain name" # uatenv.vickynryan.click
    type        = string
}

variable "acm_certificate_arn" {
    description = "acm_certificate_arn"
    type        = string
}