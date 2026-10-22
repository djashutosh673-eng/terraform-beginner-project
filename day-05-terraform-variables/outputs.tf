
output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.day5_bucket.bucket
}

output "s3_bucket_arn" {
  description = "Amazon Resource Name of the S3 bucket"
  value       = aws_s3_bucket.day5_bucket.arn
}

output "aws_region" {
  description = "AWS region used by this project"
  value       = var.aws_region
}

output "environment" {
  description = "Deployment environment"
  value       = var.environment
}
