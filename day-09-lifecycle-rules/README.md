# Day 9/30 — AWS Terraform Lifecycle Rules

## Objective

Learn how Terraform lifecycle rules control resource updates, replacements, and destruction.

## Lifecycle Rules Covered

### 1. prevent_destroy

Prevents Terraform from planning the destruction of a configured resource while the lifecycle rule remains in the configuration.

Practised on an AWS S3 bucket.

### 2. create_before_destroy

Instructs Terraform to create a replacement before destroying the old resource, when supported by the resource and its constraints.

Practised using `terraform_data`.

### 3. ignore_changes

Ignores changes to specified resource attributes when Terraform plans updates.

Practised using the `input` attribute of `terraform_data`.

### 4. replace_triggered_by

Triggers replacement of a resource when a referenced resource or resource attribute changes.

Practised using two `terraform_data` resources.

### 5. precondition and postcondition

- Precondition: validates a requirement before the relevant operation proceeds.
- Postcondition: validates an expected result after a resource is created or refreshed.

Practised using a local value and the `terraform_data` resource.

## Commands Practised

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform state list
```

## Validation Results

- Terraform configuration validation succeeded.
- The final Terraform plan reported no changes.
- The S3 bucket remained managed by Terraform.
- Lifecycle behaviour was demonstrated with test resources.

## Key Learning

Terraform lifecycle rules help control resource replacement, protect resources against accidental destruction, ignore selected differences, and enforce configuration requirements.

## Safety Notes

- Review every Terraform plan before applying it.
- `prevent_destroy` is not a substitute for backups or AWS access controls.
- Use `ignore_changes` selectively to avoid concealing configuration drift.
- Never commit Terraform state files, saved plan files, credentials, or secrets to Git.

