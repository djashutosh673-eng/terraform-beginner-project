
resource "terraform_data" "demo" {
  input = {
    project_name = var.project_name
    environment  = var.environment
    message      = var.demo_message
  }
}

