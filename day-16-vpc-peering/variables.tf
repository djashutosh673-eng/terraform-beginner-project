variable "aws_region" {
  description = "AWS region for the VPC peering project"
  type        = string
  default     = "eu-west-2"
}

variable "vpc1_cidr" {
  description = "CIDR block for VPC 1"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc2_cidr" {
  description = "CIDR block for VPC 2"
  type        = string
  default     = "10.1.0.0/16"
}

variable "project_name" {
  description = "Name prefix for project resources"
  type        = string
  default     = "day16-vpc-peering"
}
