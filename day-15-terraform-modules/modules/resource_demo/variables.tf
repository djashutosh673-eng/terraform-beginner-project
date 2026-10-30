variable "project_name" {
  description = "Name of the project using this module"
  type        = string
}

variable "environment" {
  description = "Environment name for the demonstration"
  type        = string
}

variable "demo_message" {
  description = "Message to store in the local demonstration resource"
  type        = string
}
