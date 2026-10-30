
variable "project_name" {
  description = "Name of the Terraform learning project"
  type        = string
  default     = "terraform-modules-lab"
}

variable "environment" {
  description = "Environment for the local demonstration"
  type        = string
  default     = "dev"
}

variable "demo_message" {
  description = "Message stored in the local demonstration resource"
  type        = string
  default     = "Learning Terraform modules on Day 15"
}

