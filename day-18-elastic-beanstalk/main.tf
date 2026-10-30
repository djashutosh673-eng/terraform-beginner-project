
data "aws_iam_role" "eb_service_role" {
  name = var.service_role
}

resource "aws_elastic_beanstalk_application" "app" {
  name        = var.application_name
  description = "Day 18 Terraform Blue-Green Deployment Demo"

  appversion_lifecycle {
    service_role          = data.aws_iam_role.eb_service_role.arn
    max_count             = 5
    delete_source_from_s3 = false
  }
}

resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = "day18-v1"
  application = aws_elastic_beanstalk_application.app.name
  description = "Day 18 Node.js application version 1"

  bucket = aws_s3_bucket.deployment_artifacts.id
  key    = aws_s3_object.application.key
}

locals {
  environments = {
    blue  = "terraform-day18-blue"
    green = "terraform-day18-green"
  }
}

resource "aws_elastic_beanstalk_environment" "environment" {
  for_each = local.environments

  name                = each.value
  application         = aws_elastic_beanstalk_application.app.name
  version_label       = aws_elastic_beanstalk_application_version.app_version.name
  solution_stack_name = var.solution_stack_name

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = var.service_role
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.ec2_instance_profile
  }

  tags = {
    Project     = "Terraform-Day18"
    Environment = each.key
    Deployment  = "Blue-Green"
  }
}
