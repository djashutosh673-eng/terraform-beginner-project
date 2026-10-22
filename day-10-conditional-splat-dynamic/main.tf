
terraform {
  required_version = ">= 1.0.0"

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

variable "environment" {
  description = "Environment for the application"
  type        = string
  default     = "prod"
}

locals {
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
}

output "environment" {
  description = "Selected environment"
  value       = var.environment
}

output "selected_instance_type" {
  description = "Instance type selected by the conditional expression"
  value       = local.instance_type
}
