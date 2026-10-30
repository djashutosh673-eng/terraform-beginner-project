
# Get the current AWS account ID
data "aws_caller_identity" "current" {}

# Create a unique S3 deployment bucket
resource "aws_s3_bucket" "deployment_artifacts" {
  bucket = "terraform-day18-artifacts-${data.aws_caller_identity.current.account_id}-${var.aws_region}"

  tags = {
    Project = "Terraform-Day18"
    Purpose = "ElasticBeanstalkDeployment"
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "deployment_artifacts" {
  bucket = aws_s3_bucket.deployment_artifacts.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable bucket versioning
resource "aws_s3_bucket_versioning" "deployment_artifacts" {
  bucket = aws_s3_bucket.deployment_artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "deployment_artifacts" {
  bucket = aws_s3_bucket.deployment_artifacts.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Upload application ZIP
resource "aws_s3_object" "application" {
  bucket = aws_s3_bucket.deployment_artifacts.id
  key    = "application.zip"
  source = "${path.module}/application.zip"

  etag = filemd5("${path.module}/application.zip")

  content_type = "application/zip"
}

