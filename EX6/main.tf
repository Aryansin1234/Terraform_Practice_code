provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "terrraform-template-testing-bucket-policy"
}

resource "aws_iam_user" "aryan" {
  name = "aryan-singh"
}

data "template_file" "bucket_policy" {
  template = "${file("policy.json")}"

  vars = {
    bucket_arn = "${aws_s3_bucket.my_bucket.arn}"
  }
}

resource "aws_iam_user_policy" "my_bucket_policy" {
  name = "my_policy"
  user = "${aws_iam_user.aryan.name}"
  policy = "${data.template_file.bucket_policy.rendered}"
}

output "policy" {
  value = "${aws_iam_user_policy.my_bucket_policy.policy}"
}