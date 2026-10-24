# Day 13 — Terraform Data Sources

## Objective

Use AWS data sources to read information about the current AWS identity and an existing S3 bucket.

## What this project does

- `main.tf` reads the current AWS account identity and outputs the account ID and caller ARN.
- `s3-data-source.tf` looks up the configured existing S3 bucket and outputs its name, ARN, and region.

Data sources read existing information; these configurations do not create the bucket. The bucket named in `s3-data-source.tf` must exist and be accessible to the AWS identity used by Terraform. The provider region is `eu-west-2`.

## Run

With Terraform and AWS credentials configured:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```
