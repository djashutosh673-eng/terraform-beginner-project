output "bucket_name" {
  description = "Created S3 bucket name"
  value       = aws_s3_bucket.learning_bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.learning_bucket.arn
}

output "versioning_status" {
  description = "Configured bucket versioning status"
  value       = var.enable_versioning ? "Enabled" : "Suspended"
}