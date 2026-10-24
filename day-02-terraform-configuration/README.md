# Day 02 — Terraform Configuration

## Objective

Introduce Terraform's AWS provider and resource configuration.

## What this project does

`main.tf` configures the AWS provider for `us-east-1` and declares an AWS VPC with the CIDR range `10.0.0.0/16`. The provider version constraint is `~> 6.0`.

## Run

Terraform and AWS credentials with permission to manage VPC resources are required. From this folder:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

Review the plan before applying it. Use `terraform destroy` to remove resources created by this exercise.
