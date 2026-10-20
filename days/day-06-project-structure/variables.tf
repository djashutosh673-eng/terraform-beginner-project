
variable "aws_region" {
  description = "AWS region for the project"
  type        = string
  default     = "eu-west-2"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
