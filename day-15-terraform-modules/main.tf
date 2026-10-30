
module "resource_demo" {
  source = "./modules/resource_demo"

  project_name = var.project_name
  environment  = var.environment
  demo_message = var.demo_message
}
