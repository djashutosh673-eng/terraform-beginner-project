variable "aws_region" {
  description = "AWS region for deploying resources"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name of the image processing project"
  type        = string
  default     = "day19-image-processing"
}

variable "input_bucket_name" {
  description = "S3 bucket for uploading original images"
  type        = string
}

variable "output_bucket_name" {
  description = "S3 bucket for storing processed images"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the image processing Lambda function"
  type        = string
  default     = "day19-image-processor"
}
