variable "env_prefix" {
  type        = string
  description = "The environment prefix to use for naming resources."
  default = "uatenv"
}

variable "acl" {
    type        = string
    description = "The ACL to apply to the S3 bucket."
    default = "private"
}

variable "domain_name" {
    type        = string
    description = "The domain name to use for the S3 bucket."
    default = "vickynryan.click"
}

variable "frontend_name" {
    description = "bucket name for the static website - website domain name" # uatenv.vickynryan.click
    type        = string
    default = "uatenv.vickynryan.click"
}

variable "acm_certificate_arn" {
    description = "acm_certificate_arn"
    type        = string
    default = "arn:aws:acm:us-east-1:017359606234:certificate/8eabce09-be7a-428b-b641-7b86af5d9d1c"
}

variable "root_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
  default = "vickynryan.click."
}

variable "record_name" {
  description = "The name of the DNS record to be created"
  type        = string
  default = "uatenv.vickynryan.click"
}