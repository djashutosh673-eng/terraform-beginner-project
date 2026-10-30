output "simulated_username" {
  value = terraform_data.iam_user_simulation.output.username
}

output "simulated_environment" {
  value = terraform_data.iam_user_simulation.output.environment
}

output "simulated_permissions" {
  value = terraform_data.iam_user_simulation.output.permissions
}

output "simulation_status" {
  value = terraform_data.iam_user_simulation.output.status
}
