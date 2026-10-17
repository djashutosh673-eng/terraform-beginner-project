terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
}

# create s3 bucket
resource "aws_s3_bucket" "first_bucket" {
  bucket = "ashutosh-terraform-lab-20261017-a7k9m2"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}