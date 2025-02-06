resource "aws_s3_bucket" "my-tf-trainning-bucket" {
  bucket = "my-tf-trainnig-bucket"

  tags = {
    Name        = "Bucket Trainnig"
    Environment = "Dev"
  }
}