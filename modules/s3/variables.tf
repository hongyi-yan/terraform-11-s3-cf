variable "env_prefix" {
  type        = string
  description = "The environment prefix to use for naming resources."
}

variable "acl" {
  type        = string
  description = "The ACL to apply to the S3 bucket."
}

variable "domain_name" {
  type        = string
  description = "The domain name to use for the S3 bucket."
}