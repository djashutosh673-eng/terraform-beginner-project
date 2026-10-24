# Day 10 — Conditionals, Splat Expressions, and Dynamic Blocks

## Objective

Explore three Terraform expression patterns for selecting values, projecting collections, and generating repeated nested blocks.

## What this project does

- `main.tf` uses a conditional expression to select an instance type from the environment value and outputs the selection. It does not create an instance.
- `splat.tf` applies splat expressions to a list of server objects to output their names and types.
- `dynamic.tf` uses a dynamic block to generate security group ingress rules for the configured list of ports.

The provider is configured for `eu-west-2`. The dynamic-block example creates an AWS security group, so AWS credentials and permissions are needed to apply the whole configuration.

## Run

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

Review the plan before applying it. Use `terraform destroy` to remove resources created by this exercise.
