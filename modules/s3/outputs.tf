output "pn-s3-values-regional_domain_name" {
    value = aws_s3_bucket.pn-app_s3.bucket_regional_domain_name
}

output "pn-s3-values" {
    value = aws_s3_bucket.pn-app_s3
}