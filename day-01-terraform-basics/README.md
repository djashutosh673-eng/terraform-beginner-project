# Day 01 — Terraform Basics

## Objective

Use Terraform to manage a simple local resource and learn the basic configuration workflow.

## What this project does

`main.tf` declares a minimum Terraform version and a `local_file` resource. Terraform writes a short greeting to `hello.txt` in this project folder.

## Run

From this folder, initialize Terraform, inspect the plan, and apply it to create the file:

```bash
terraform init
terraform plan
terraform apply
```

Use `terraform destroy` to remove the file managed by this configuration.
