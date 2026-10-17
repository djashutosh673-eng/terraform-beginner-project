
terraform {
  backend "s3" {
    bucket       = "manualy-created"
    key          = "dev/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }

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

resource "aws_s3_bucket" "first_bucket" {
  bucket = "ashutosh-terraform-lab-20261017-a7k9m2"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
