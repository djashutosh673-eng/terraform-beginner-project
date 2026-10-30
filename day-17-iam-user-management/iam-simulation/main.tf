terraform {
  required_version = ">= 1.6.0"
}

resource "terraform_data" "iam_user_simulation" {
  input = {
    username    = "terraform-day17-developer"
    environment = "learning"

    permissions = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
      "s3:ListBucket"
    ]

    status = "simulated"
  }
}
