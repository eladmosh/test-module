# Create s3 bucket

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Input variable definitions

variable "bucket_name" {
  description = "name of the s3 bucket. Must be unique."
  type        = string
}

# Output variable definitions

output "name" {
  description = "name (id) of the bucket"
  value       = aws_s3_bucket.s3_bucket.id
}
