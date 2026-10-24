# Day 06 — Terraform Project Structure

## Objective

Organize a small Terraform project into files for resources, input variables, outputs, and documentation.

## What this project does

- `main.tf` configures the AWS provider and declares an S3 bucket with project tags.
- `variables.tf` defines the region, required bucket name, and environment.
- `outputs.tf` exposes the created bucket's name and ARN.

The bucket name must be globally unique. Set it through a `terraform.tfvars` file or a `-var` argument.

## Run

With Terraform and suitable AWS credentials configured:

```bash
terraform init
terraform fmt
terraform validate
terraform plan -var="bucket_name=your-globally-unique-bucket-name"
```

Review the plan before applying it. Use `terraform destroy` to remove resources created by this exercise.
