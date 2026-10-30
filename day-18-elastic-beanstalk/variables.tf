variable "aws_region" {
  description = "AWS region for Elastic Beanstalk deployment"
  type        = string
  default     = "eu-west-2"
}

variable "application_name" {
  description = "Name of the Elastic Beanstalk application"
  type        = string
  default     = "terraform-day18-app"
}

variable "environment_name" {
  description = "Name of the Elastic Beanstalk environment"
  type        = string
  default     = "terraform-day18-env"
}

variable "solution_stack_name" {
  description = "Elastic Beanstalk platform version"
  type        = string
  default     = "64bit Amazon Linux 2023 v6.12.0 running Node.js 22"
}

variable "instance_type" {
  description = "EC2 instance type for the environment"
  type        = string
  default     = "t3.micro"
}

variable "ec2_instance_profile" {
  description = "IAM instance profile for EC2 instances"
  type        = string
  default     = "aws-elasticbeanstalk-ec2-role"
}

variable "service_role" {
  description = "IAM service role for Elastic Beanstalk"
  type        = string
  default     = "aws-elasticbeanstalk-service-role"
}