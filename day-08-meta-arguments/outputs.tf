
output "bucket_names" {
  description = "Names of the buckets created using count"
  value       = aws_s3_bucket.count_buckets[*].bucket
}
