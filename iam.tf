# S3 Policy

data "aws_iam_policy_document" "v1_retained_data_bucket" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket"
    ]

    principals {
      type        = "AWS"
      identifiers = var.tre_support_user_roles
    }
    resources = ["${aws_s3_bucket.v1_retained_data.arn}/*", aws_s3_bucket.v1_retained_data.arn]
  }

  statement {
    actions = [
      "s3:GetBucketAcl",
    ]
    principals {
      type        = "Service"
      identifiers = "logs.eu-west-2.amazonaws.com"
    }
    resources = [aws_s3_bucket.v1_retained_data.arn]
    condition {
      test     = "StringEquals"
      values   = [var.account_id]
      variable = "aws:SourceAccount"
    }
    condition {
      test     = "ArnLike"
      values   = ["arn:aws:logs:eu-west-2:${var.account_id}:log-group:*"]
      variable = "aws:SourceArn"
    }
  }

  statement {
    actions = [
      "s3:PutObject",
    ]
    principals {
      type        = "Service"
      identifiers = "logs.eu-west-2.amazonaws.com"
    }
    resources = ["${aws_s3_bucket.v1_retained_data.arn}/*"]
    condition {
      test     = "StringEquals"
      values   = [var.account_id]
      variable = "aws:SourceAccount"
    }
    condition {
      test     = "StringEquals"
      values   = ["bucket-owner-full-control"]
      variable = "s3:x-amz-acl"
    }
    condition {
      test     = "ArnLike"
      values   = ["arn:aws:logs:eu-west-2:${var.account_id}:log-group:*"]
      variable = "aws:SourceArn"
    }
  }
}
