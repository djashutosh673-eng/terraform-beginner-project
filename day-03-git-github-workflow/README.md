# Day 03 — Git and GitHub Workflow

## Objective

Practice tracking and publishing daily project work with Git and GitHub.

## What this project contains

The Terraform example in `main.tf` configures the AWS provider for `eu-west-2` and declares an S3 bucket with development tags. The repository itself is the workspace for practicing version control and sharing project progress.

The Terraform configuration uses a fixed bucket name. Check that it is available and belongs to this exercise before applying; S3 bucket names must be globally unique.

## Terraform workflow

If you are running the infrastructure example, use Terraform and AWS credentials with permission to manage S3:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

Review the plan before applying it. Use Git to record the learning project and its progress in the repository.
