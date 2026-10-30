terraform {
  required_version = ">= 1.6.0"

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

resource "aws_iam_user" "developer" {
  name = "terraform-day17-developer"

  tags = {
    Project     = "Terraform-Day-17"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
