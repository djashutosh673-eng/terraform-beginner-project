resource "aws_iam_policy" "s3_read_only" {
  name        = "terraform-day17-s3-read-only"
  description = "Read-only access to Amazon S3 for Terraform Day 17"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:ListAllMyBuckets",
          "s3:GetBucketLocation",
          "s3:ListBucket"
        ]

        Resource = "*"
      }
    ]
  })

  tags = {
    Project   = "Terraform-Day-17"
    ManagedBy = "Terraform"
  }
}

resource "aws_iam_user_policy_attachment" "developer_s3_read_only" {
  user       = aws_iam_user.developer.name
  policy_arn = aws_iam_policy.s3_read_only.arn
}
