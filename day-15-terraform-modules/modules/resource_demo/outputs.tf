
output "resource_id" {
  description = "ID of the local demonstration resource"
  value       = terraform_data.demo.id
}

output "resource_input" {
  description = "Input values stored in the demonstration resource"
  value       = terraform_data.demo.output
}

