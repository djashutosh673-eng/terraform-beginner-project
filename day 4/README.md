# Day 04 — S3 Backend Configuration

## Objective

Configure Terraform to store its state in an S3 backend while managing an S3 bucket with the AWS provider.

## What this project does

`main.tf` configures an S3 backend using the key `dev/terraform.tfstate`, encryption, and S3 lock-file state locking. It also configures the AWS provider for `eu-west-2` and declares a development S3 bucket.

The backend bucket named `manualy-created` must already exist before Terraform can initialize this backend. The backend is configured for `eu-north-1`; the AWS provider for the managed resources uses `eu-west-2`.

## Run

Terraform and AWS credentials with the required S3 permissions are needed. After creating and verifying the backend bucket, run:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

Review plans carefully. This exercise writes Terraform state to the configured S3 bucket.
