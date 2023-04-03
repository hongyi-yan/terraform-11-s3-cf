# aws_s3_bucket_acl w/ ACL
resource "aws_s3_bucket" "pn-app_s3" {
  bucket = "${var.env_prefix}.${var.domain_name}"
}

# config
resource "aws_s3_bucket_website_configuration" "pn-app_s3_website" {
  bucket = aws_s3_bucket.pn-app_s3.id # ?

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "pn-app_bucket_acl" {
  bucket = aws_s3_bucket.pn-app_s3.id
  acl    = var.acl
  }

# aws_s3_bucket_website_configuration w/ routing_rule configured
resource "aws_s3_bucket_website_configuration" "pn-penny_bucket_website_configuration" {
  bucket = aws_s3_bucket.pn-app_s3.id
  
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": ""
    }
}]
EOF
}

# aws_s3_bucket_policy
resource "aws_s3_bucket_policy" "pn-penny_bucket_policy" {
  bucket = aws_s3_bucket.pn-app_s3.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "ExampleStatement01"
        Effect   = "Allow"
        Principal = "*"
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.pn-app_s3.arn}/*"
      }
    ]
  })
}
