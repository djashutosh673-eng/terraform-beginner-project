
# Day 14/30 — Host a Static Website on AWS S3 and CloudFront Using Terraform

## Project Overview

This project deploys a static website using Amazon S3, Amazon CloudFront, and Terraform.

The S3 bucket stores the website files privately. CloudFront delivers the files to visitors over HTTPS using Origin Access Control (OAC).

## Architecture

User Browser → CloudFront CDN → Private S3 Bucket

## Technologies Used

- Terraform
- Amazon S3
- Amazon CloudFront
- CloudFront Origin Access Control (OAC)
- AWS IAM bucket policy
- HTML and CSS

## Project Structure

```text
day-14-s3-cloudfront-website/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
├── website/
│   ├── index.html
│   └── error.html
└── README.md
```

## Prerequisites

- Terraform installed
- AWS CLI installed and configured
- AWS credentials with the required permissions
- A globally unique S3 bucket name

## Deployment Steps

1. Format the Terraform files.
2. Initialize Terraform.
3. Validate the configuration.
4. Review the execution plan.
5. Apply the configuration.
6. Open the CloudFront website URL from Terraform outputs.

## Terraform Commands

```bash
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
```

## Security

- S3 public access is blocked.
- CloudFront uses Origin Access Control.
- The S3 bucket policy permits object reads only from the designated CloudFront distribution.
- HTTPS is enforced for viewer connections.

## Cleanup

After testing, review the resources and run:

```bash
terraform destroy
```

Only destroy resources managed by this project and confirm the proposed changes before approving.

## Learning Objectives

- Provision AWS resources using Terraform.
- Upload static files to Amazon S3.
- Configure CloudFront as a content delivery network.
- Secure an S3 origin using OAC.
- Use Terraform variables, resources, and outputs.
