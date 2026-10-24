# Terraform & DevOps: Daily Learning Journey

Welcome! This repository records a hands-on journey through Terraform and core DevOps practices. The projects move from creating a local file to provisioning AWS resources, structuring reusable configurations, and deploying a static website.

Each day is a separate Terraform project. The notes below explain what the configuration in that folder is intended to teach and what it actually creates or reads.

## Learning path

- **Days 01–04:** Terraform fundamentals, AWS resources, Git workflow, and remote state.
- **Days 05–08:** Variables, project structure, type constraints, and resource meta-arguments.
- **Days 09–11:** Lifecycle behavior and useful Terraform expressions and functions.
- **Days 12–14:** Day 12 has not been added yet; Days 13–14 cover AWS data sources and a static website.

## Before you start

Install Terraform. AWS projects also need AWS credentials and permissions for the resources they use. Day 01 uses a local file and Day 11 only evaluates Terraform expressions, so those examples do not need AWS credentials.

Run commands from the specific day folder you want to work on. Each folder is its own Terraform configuration; do not run Terraform from the repository root to apply every day together.

Typical workflow:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

Review the plan before running `terraform apply`. Use `terraform destroy` only when you intend to remove the resources managed by that folder. Day 04 uses an S3 backend, so its backend bucket must already exist before `terraform init` can succeed.

## Day 01: Terraform basics

**Project:** [day-01-terraform-basics](day-01-terraform-basics/README.md)

This is the first local Terraform exercise. `main.tf` sets a minimum Terraform version and declares a `local_file` resource. Applying the configuration writes a greeting to `hello.txt` inside the project folder.

It demonstrates the basic initialize, plan, apply, and destroy cycle without creating AWS resources.

## Day 02: Terraform and AWS configuration

**Project:** [day-02-terraform-configuration](day-02-terraform-configuration/README.md)

`main.tf` configures the AWS provider in `us-east-1` and declares a VPC with CIDR block `10.0.0.0/16`. It introduces provider configuration, provider version constraints (`~> 6.0`), and AWS resource declarations.

This project requires AWS credentials and permission to manage VPC resources.

## Day 03: Git and GitHub workflow

**Project:** [day-03-git-github-workflow](day-03-git-github-workflow/README.md)

This day focuses on tracking the learning work in Git and publishing project progress with GitHub. Its `main.tf` also configures the AWS provider in `eu-west-2` and declares an S3 bucket with development tags.

The bucket name is fixed in the configuration and must be globally unique. Check that it is available and belongs to this exercise before applying. The same bucket is looked up by the Day 13 data-source example.

## Day 04: S3 remote state backend

**Project:** [day 4](day%204/README.md)

The configuration in `day 4/main.tf` stores Terraform state in S3 using the key `dev/terraform.tfstate`, encryption, and S3 lock-file state locking. It also configures an AWS provider and declares an S3 bucket.

The backend bucket is named `manualy-created` in `eu-north-1` and must exist before Terraform can initialize the backend. Resources managed by the provider use `eu-west-2`. Backend settings are separate from provider settings, so these regions can differ.

## Day 05: Input variables and locals

**Project:** [day-05-terraform-variables](day-05-terraform-variables/README.md)

This project makes an S3 bucket configuration reusable:

- `variables.tf` defines the AWS region, required bucket name, and environment.
- `main.tf` builds a project name and bucket purpose with locals, then merges common and purpose tags.
- `outputs.tf` returns the bucket name, ARN, region, and environment.

The bucket name has no default and must be globally unique. Supply it with a `terraform.tfvars` file or a `-var` argument, for example:

```bash
terraform plan -var="bucket_name=your-globally-unique-bucket-name"
```

## Day 06: Terraform project structure

**Project:** [day-06-project-structure](day-06-project-structure/README.md)

This day organizes a small project into focused files: `main.tf` configures AWS and declares an S3 bucket; `variables.tf` defines region, bucket name, and environment; and `outputs.tf` exposes the bucket name and ARN. The bucket is tagged with its name, environment, project, and Terraform management metadata.

The configuration requires Terraform `>= 1.5.0` and AWS provider `~> 6.0`. The bucket name is a required, globally unique input.

## Day 07: Type constraints

**Project:** [day-07-type-constraints](day-07-type-constraints/README.md)

The inputs demonstrate Terraform's `string`, `bool`, `list(string)`, and `map(string)` types. The configuration creates an S3 bucket, applies a map of tags, and enables or suspends bucket versioning according to a boolean input. Outputs report the bucket name, ARN, and chosen versioning status.

The `allowed_regions` list is declared to demonstrate a list type, but the current configuration does not use it to select or validate the provider region. The provider is configured for `eu-west-2`.

## Day 08: Meta-arguments with `count`

**Project:** [day-08-meta-arguments](day-08-meta-arguments/README.md)

The S3 bucket resource uses the `count` meta-argument to create three bucket instances by default. Each name includes the zero-based `count.index`, and `outputs.tf` uses a splat expression to return all bucket names.

The example names must be globally unique in S3. Review the names and the plan before applying.

## Day 09: Resource lifecycle rules

**Project:** [day-09-lifecycle-rules](day-09-lifecycle-rules/README.md)

This day explores how lifecycle settings affect resource changes and validation:

- `prevent_destroy` protects the configured S3 bucket from a planned destroy while the rule remains in the configuration.
- The day notes also cover `create_before_destroy` and `ignore_changes` using `terraform_data` examples.
- `replace_triggered_by` ties replacement of one `terraform_data` resource to a source resource.
- Preconditions and postconditions validate assumptions and expected results.

The current `.tf` files directly show `prevent_destroy`, `replace_triggered_by`, and precondition/postcondition examples. The project notes record the additional lifecycle exercises. The day README lists the commands practised: `terraform init`, `terraform fmt`, `terraform validate`, `terraform plan`, `terraform apply`, and `terraform state list`; it records successful validation and a final plan with no changes.

Review plans before applying. `prevent_destroy` is not a substitute for backups or AWS access controls, and `ignore_changes` should be used selectively so it does not conceal drift.

## Day 10: Conditionals, splat expressions, and dynamic blocks

**Project:** [day-10-conditional-splat-dynamic](day-10-conditional-splat-dynamic/README.md)

The project separates three expression examples across its Terraform files:

- `main.tf` uses a conditional expression to choose an instance type from the environment. It outputs the selected type but does not create an EC2 instance.
- `splat.tf` projects server names and types from a list of server objects.
- `dynamic.tf` generates security group ingress blocks from a list of ports. The defaults allow TCP ports 22, 80, and 443 from `10.0.0.0/16`.

The provider region is `eu-west-2`. Applying the whole configuration creates an AWS security group and requires appropriate AWS permissions.

## Day 11: Terraform functions

**Project:** [day-11-terraform-functions](day-11-terraform-functions/README.md)

This expression-only exercise uses built-in Terraform functions to transform and combine values:

- `lower` and `replace` build a normalized project identifier.
- `distinct` and `length` process the availability-zone list.
- `lookup` chooses an instance type from the environment map.
- `file` reads `files/message.txt`.
- `formatdate` and `timestamp` produce a generated date.
- `tostring` converts a number to text, and `merge` combines project and environment tags.

The outputs expose the calculated values. No provider is configured and no cloud resources are created.

## Day 12: Not added yet

There is currently no Day 12 project folder or Terraform configuration in the repository. This section can be filled in when that day's work is added.

## Day 13: AWS data sources

**Project:** [day-13-data-sources](day-13-data-sources/README.md)

Data sources read information about existing AWS objects:

- `main.tf` reads the current AWS caller identity and outputs the account ID and caller ARN.
- `s3-data-source.tf` looks up the existing bucket `ashutosh-terraform-lab-20261017-a7k9m2` and outputs its name, ARN, and region.

This configuration reads the bucket; it does not create it. The bucket must already exist and be accessible to the configured AWS identity. The provider region is `eu-west-2`.

## Day 14: Static website with S3 and CloudFront

**Project:** [day-14-s3-cloudfront-website](day-14-s3-cloudfront-website/README.md)

This project deploys the HTML files in `website/` to a private S3 bucket and serves them through a CloudFront distribution:

```text
Browser → CloudFront → Private S3 bucket
```

The configuration blocks public S3 access, creates a CloudFront Origin Access Control (OAC), and adds a bucket policy that allows the designated distribution to read objects. CloudFront redirects viewers to HTTPS, serves `index.html` by default, and returns the custom `error.html` page for configured 403 and 404 responses. The outputs include the bucket name, distribution ID, CloudFront domain, and website URL.

Terraform requires version `>= 1.6.0`. You need AWS credentials with permissions for S3, CloudFront, and the related bucket policy. The bucket name must be globally unique. After testing, review the plan before running `terraform destroy` to clean up this project's resources.

## Repository and state hygiene

Keep AWS credentials, secrets, Terraform state files, and saved plan files out of Git. Review each plan before applying it, and only destroy resources that belong to the project you are working on.
