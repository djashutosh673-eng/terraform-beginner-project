# Day 07 — Variable Type Constraints

## Objective

Use Terraform variable types to define the shape of configuration inputs.

## What this project does

`variables.tf` declares a string bucket name, a boolean for versioning, a list of region strings, and a string map for bucket tags. `main.tf` creates an S3 bucket, applies the tags, and enables or suspends bucket versioning according to the boolean. `outputs.tf` reports the bucket name, ARN, and selected versioning status.

The `allowed_regions` list is declared as a type-constraint example; the current configuration does not use it to choose or validate the provider region. The provider region is set to `eu-west-2`.

## Run

With Terraform and suitable AWS credentials configured:

```bash
terraform init
terraform fmt
terraform validate
terraform plan -var="bucket_name=your-globally-unique-bucket-name"
```

Review the plan before applying it. Use `terraform destroy` to remove resources created by this exercise.
