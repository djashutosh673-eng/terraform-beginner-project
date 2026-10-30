data "aws_caller_identity" "current" {}

output "aws_account_id" {
  description = "AWS account ID used for deployment"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "AWS deployment region"
  value       = var.aws_region
}