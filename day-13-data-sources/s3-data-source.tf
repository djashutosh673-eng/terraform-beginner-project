
data "aws_s3_bucket" "existing" {
  bucket = "ashutosh-terraform-lab-20261017-a7k9m2"
}

output "existing_bucket_name" {
  value = data.aws_s3_bucket.existing.bucket
}

output "existing_bucket_arn" {
  value = data.aws_s3_bucket.existing.arn
}

output "existing_bucket_region" {
  value = data.aws_s3_bucket.existing.region
}
