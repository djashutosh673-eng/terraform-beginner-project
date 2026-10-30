output "application_name" {
  description = "Elastic Beanstalk application name"
  value       = aws_elastic_beanstalk_application.app.name
}

output "blue_environment_name" {
  description = "Blue environment name"
  value       = aws_elastic_beanstalk_environment.environment["blue"].name
}

output "green_environment_name" {
  description = "Green environment name"
  value       = aws_elastic_beanstalk_environment.environment["green"].name
}

output "blue_environment_url" {
  description = "Blue environment URL"
  value       = aws_elastic_beanstalk_environment.environment["blue"].endpoint_url
}

output "green_environment_url" {
  description = "Green environment URL"
  value       = aws_elastic_beanstalk_environment.environment["green"].endpoint_url
}