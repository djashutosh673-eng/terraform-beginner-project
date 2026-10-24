# Day 08 — Terraform Meta-Arguments

## Objective

Use the `count` meta-argument to create multiple instances of a resource from one resource block.

## What this project does

`main.tf` defines `bucket_count` and uses it as the `count` value for an S3 bucket resource. Each bucket name includes its zero-based `count.index`. `outputs.tf` uses a splat expression to return the names of all created buckets.

The example defaults to three buckets. S3 bucket names must be globally unique, so make sure the configured names are available before applying.

## Run

With Terraform and suitable AWS credentials configured:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

Review the plan before applying it. Use `terraform destroy` to remove resources created by this exercise.
