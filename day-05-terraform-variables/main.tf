terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = var.aws_region
}

locals {
  project_name = "terraform-learning"

  bucket_purpose = "${local.project_name}-${var.environment}"

  common_tags = {
    Project     = local.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket" "day5_bucket" {
  bucket = var.bucket_name

  tags = merge(
    local.common_tags,
    {
      Purpose = local.bucket_purpose
    }
  )
}