provider "aws" {
    region = "us-east-1"
}

# two variables
module "pn-app-s3" {
    source      = "../../modules/s3"
    domain_name = var.domain_name
    env_prefix  = var.env_prefix
    acl = var.acl
}

module "pn-app-cloudfront" {
    source = "../../modules/cloudfront"
    frontend_name = var.frontend_name
    acm_certificate_arn = var.acm_certificate_arn
    s3_regional_domain_name = module.pn-app-s3.pn-s3-values-regional_domain_name
}

module "pn-app-53route" {
    source = "../../modules/route53"
    root_name = var.root_name # vickynryan.click.
    record_name = var.record_name # uatenv.vickynryan.click"
    cloudfront_distribution_domain_name  = module.pn-app-cloudfront.cloudfront_s3_domain_name
    cloudfront_distribution_hosted_zone_id = module.pn-app-cloudfront.cloudfront_s3_hosted_zone_id
}