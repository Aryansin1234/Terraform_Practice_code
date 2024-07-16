provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "eu-west-1"
  alias = "ireland"
}

resource "aws_s3_bucket" "virginia-bucket" {
    bucket = "terraform-multi-provider-virginia"
}

resource "aws_s3_bucket" "london-bucket" {
    bucket = "terraform-multi-provider-irelands"
    provider = aws.ireland
}