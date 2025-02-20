terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.86.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "default"{

}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id
  key    = "file_8.txt"
  source = "file_8.txt"
  etag = filemd5("file_8.txt")
}