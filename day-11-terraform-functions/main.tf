
variable "project_name" {
  type    = string
  default = "Aarogyam-DevOps"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "environments" {
  type = map(string)

  default = {
    development = "t3.micro"
    staging     = "t3.small"
    production  = "t3.medium"
  }
}

variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2a"]
}

locals {
  # String functions
  project_id = lower(replace(var.project_name, "-", ""))

  # Collection functions
  unique_zones = distinct(var.availability_zones)
  zone_count   = length(local.unique_zones)

  # Lookup function
  instance_type = lookup(
    var.environments,
    var.environment,
    "t3.micro"
  )

  # File function
  file_content = file("${path.module}/files/message.txt")

  # Date/time functions
  generated_at = formatdate("YYYY-MM-DD", timestamp())

  # Type conversion
  zone_count_text = tostring(local.zone_count)

  # Merge common project tags with environment tags
  common_tags = {
    Project   = local.project_id
    ManagedBy = "Terraform"
  }

  environment_tags = {
    Environment = var.environment
  }

  final_tags = merge(local.common_tags, local.environment_tags)
}

output "project_id" {
  value = local.project_id
}

output "instance_type" {
  value = local.instance_type
}

output "unique_zones" {
  value = local.unique_zones
}

output "zone_count" {
  value = local.zone_count
}

output "zone_count_text" {
  value = local.zone_count_text
}

output "file_content" {
  value = local.file_content
}

output "generated_at" {
  value = local.generated_at
}

output "final_tags" {
  value = local.final_tags
}
