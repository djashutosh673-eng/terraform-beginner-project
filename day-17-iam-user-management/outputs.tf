output "simulated_username" {
  description = "The simulated IAM username"
  value       = terraform_data.iam_user_simulation.output.username
}

output "simulated_environment" {
  description = "The simulated environment"
  value       = terraform_data.iam_user_simulation.output.environment
}

output "simulated_permissions" {
  description = "The simulated permissions list"
  value       = terraform_data.iam_user_simulation.output.permissions
}

output "simulation_status" {
  description = "Confirms that this is a local simulation"
  value       = terraform_data.iam_user_simulation.output.status
}
