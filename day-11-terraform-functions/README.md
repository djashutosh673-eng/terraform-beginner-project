# Day 11 — Terraform Functions

## Objective

Practice Terraform's built-in functions for working with strings, collections, maps, files, dates, and types.

## What this project does

`main.tf` uses `lower` and `replace` to create a project identifier; `distinct` and `length` to process availability zones; `lookup` to select an instance type; `file` to read `files/message.txt`; `formatdate` and `timestamp` to create a date output; `tostring` to convert a number; and `merge` to combine tags. Outputs expose the calculated values.

This is an expression exercise and does not configure a provider or create cloud resources.

## Run

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```
