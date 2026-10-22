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

resource "aws_s3_bucket" "learning_bucket" {
  bucket = var.bucket_name

  tags = var.bucket_tags
}

resource "aws_s3_bucket_versioning" "learning_versioning" {
  bucket = aws_s3_bucket.learning_bucket.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}