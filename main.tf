resource "aws_s3_bucket" "data_team_bucket" {
  bucket = var.bucket_name
  acl = "private"
  server_side_encryption_configuration {
    rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "aws:kms"
        }
    }  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Terraform = True
  }
}

resource "aws_kms_key" "mykey" {
  description         = "This key is used to encrypt bucket objects"
  deletion_window_in_days = True
}