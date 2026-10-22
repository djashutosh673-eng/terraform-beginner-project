
terraform {
  required_version = ">= 1.0"
}

resource "local_file" "first_project" {
  filename = "${path.module}/hello.txt"
  content  = "Hello! This is my first Terraform project."
}
