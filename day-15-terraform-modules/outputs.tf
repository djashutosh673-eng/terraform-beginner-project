
output "demo_resource_id" {
  description = "ID returned by the child module"
  value       = module.resource_demo.resource_id
}

output "demo_resource_input" {
  description = "Input data returned by the child module"
  value       = module.resource_demo.resource_input
}

