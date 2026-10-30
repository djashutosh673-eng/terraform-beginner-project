resource "aws_s3_bucket" "input_bucket" {
  bucket = var.input_bucket_name

  tags = {
    Name        = "Image Processing Input"
    Environment = "Learning"
    Project     = var.project_name
  }
}

resource "aws_s3_bucket" "output_bucket" {
  bucket = var.output_bucket_name

  tags = {
    Name        = "Image Processing Output"
    Environment = "Learning"
    Project     = var.project_name
  }
}
