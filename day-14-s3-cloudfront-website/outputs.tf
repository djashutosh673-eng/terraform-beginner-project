
output "s3_bucket_name" {
  description = "Name of the S3 bucket hosting the website files"
  value       = aws_s3_bucket.website.bucket
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.website.id
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.website.domain_name
}

output "website_url" {
  description = "HTTPS URL of the deployed static website"
  value       = "https://${aws_cloudfront_distribution.website.domain_name}"
}
