resource "aws_s3_bucket" "v1_retained_data" {
  bucket = "${var.env}-${var.prefix}-v1-retained-data"
}

resource "aws_s3_bucket_policy" "v1_retained_data" {
  bucket = aws_s3_bucket.v1_retained_data.bucket
  policy = data.aws_iam_policy_document.v1_retained_data_bucket.json
}

resource "aws_s3_bucket_server_side_encryption_configuration" "v1_retained_data" {
  bucket = aws_s3_bucket.v1_retained_data.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = module.v1_retained_data_bucket_kms_key.kms_key_arn
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "v1_retained_data" {
  bucket = aws_s3_bucket.v1_retained_data.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "v1_retained_data" {
  bucket                  = aws_s3_bucket.v1_retained_data.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
