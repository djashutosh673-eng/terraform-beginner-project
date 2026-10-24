# Day 05 — Terraform Variables

## Objective

Make an AWS S3 bucket configuration reusable with input variables and local values.

## What this project does

- `variables.tf` defines the AWS region, required bucket name, and deployment environment.
- `main.tf` uses locals to build a project name, purpose, and common tags, then merges those tags onto an S3 bucket.
- `outputs.tf` reports the bucket name, ARN, region, and environment.

The bucket name must be globally unique. Supply it with a `terraform.tfvars` file or a `-var` argument.

## Run

With Terraform and suitable AWS credentials configured:

```bash
terraform init
terraform fmt
terraform validate
terraform plan -var="bucket_name=your-globally-unique-bucket-name"
```

Review the plan before applying it. Use `terraform destroy` to remove resources created by this exercise.
