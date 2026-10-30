
# Day 15 - Terraform Modules Explained

## Objective

Learn how to create and reuse a Terraform child module using a local-only demonstration.

## Project Structure

- `main.tf` - Calls the child module.
- `variables.tf` - Defines root module input variables.
- `outputs.tf` - Exposes outputs returned by the child module.
- `versions.tf` - Specifies the required Terraform version.
- `modules/resource_demo/main.tf` - Defines the terraform_data demonstration resource.
- `modules/resource_demo/variables.tf` - Defines child module inputs.
- `modules/resource_demo/outputs.tf` - Defines child module outputs.

## Key Concepts

- Root modules and child modules
- Module source paths
- Input variables
- Output values
- Reusable Terraform configuration

## Safety

This demonstration uses Terraform's built-in terraform_data resource.
It does not create AWS resources.

## Commands

Run these commands from the day-15-terraform-modules directory:

```bash
terraform fmt -recursive
terraform init
terraform validate
terraform plan
```

Review the plan before deciding whether to apply it.

