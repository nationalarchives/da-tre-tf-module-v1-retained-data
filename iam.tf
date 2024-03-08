# S3 Policy

data "aws_iam_policy_document" "v1_retained_data_bucket" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket",
    ]

    principals {
      type        = "AWS"
      identifiers = var.tre_support_user_roles
    }

    resources = ["${aws_s3_bucket.v1_retained_data.arn}/*", aws_s3_bucket.v1_retained_data.arn]
  }
}
