
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

resource "aws_s3_bucket" "lifecycle_test" {
  bucket = "ashutosh-tf-lifecycle-lab-20261022-x8k3"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "Terraform-Lifecycle-Test"
    Environment = "Learning"
    Day         = "09"
    Owner       = "Ashutosh"
  }
}
