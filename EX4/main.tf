provider "aws" {
    region = "us-east-1"
}

locals {
    bucket_prefix = "singh-aryan"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "${local.bucket_prefix}-first-bucket"
}