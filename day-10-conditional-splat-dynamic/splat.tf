
variable "servers" {
  description = "List of application servers"
  type = list(object({
    name = string
    type = string
  }))

  default = [
    {
      name = "web-1"
      type = "t3.micro"
    },
    {
      name = "web-2"
      type = "t3.small"
    },
    {
      name = "web-3"
      type = "t3.medium"
    }
  ]
}

output "all_server_names" {
  description = "Names of all application servers"
  value       = var.servers[*].name
}

output "all_server_types" {
  description = "Instance types of all application servers"
  value       = var.servers[*].type
}
