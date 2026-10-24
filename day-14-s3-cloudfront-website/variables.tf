
variable "aws_region" {
  description = "AWS region for the website infrastructure"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name prefix for the static website project"
  type        = string
  default     = "terraform-static-website"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 website bucket"
  type        = string
  default     = "ashutosh-terraform-static-website-20261024-k8m2q7"

}
