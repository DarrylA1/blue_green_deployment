resource "aws_s3_bucket" "terraform_blue_green_bucket" {
  bucket = "da-blue-green-project-123456-tfstates"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "da-blue-green-project-123456-tfstates"
    Environment = "Test"
  }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.terraform_blue_green_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_blue_green_tbl" {
  name           = "terraform-blue-green-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "terraform-lock"
  }
}
