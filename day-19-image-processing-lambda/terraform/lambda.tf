resource "aws_lambda_function" "image_processor" {
  function_name = var.lambda_function_name

  filename         = "${path.module}/../lambda/function.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda/function.zip")

  role    = aws_iam_role.lambda_execution_role.arn
  handler = "image_processor.lambda_handler"
  runtime = "python3.12"

  timeout     = 30
  memory_size = 256

  environment {
    variables = {
      OUTPUT_BUCKET = aws_s3_bucket.output_bucket.bucket
    }
  }

  tags = {
    Project     = var.project_name
    Environment = "Learning"
  }

  depends_on = [
    aws_iam_role_policy.lambda_permissions
  ]
}