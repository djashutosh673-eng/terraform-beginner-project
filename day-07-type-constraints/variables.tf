variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}

variable "allowed_regions" {
  description = "List of AWS regions for this learning project"
  type        = list(string)
  default     = ["eu-west-2", "eu-north-1"]
}

variable "bucket_tags" {
  description = "Tags assigned to the S3 bucket"
  type        = map(string)

  default = {
    Project     = "Terraform-Learning"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}