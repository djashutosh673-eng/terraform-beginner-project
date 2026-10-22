
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

variable "bucket_count" {
  description = "Number of S3 buckets to create"
  type        = number
  default     = 3
}

resource "aws_s3_bucket" "count_buckets" {
  count = var.bucket_count

  bucket = "ashutosh-day8-count-${count.index}-unique-suffix"

  tags = {
    Project = "Terraform-Day-8"
    Method  = "count"
  }
}
