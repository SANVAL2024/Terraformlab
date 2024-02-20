resource "aws_s3_bucket" "bucketweb" {
  bucket = "bucketweb-sandra-aws"
  tags = {
    "Project"   = "hands-on.cloud"
    "ManagedBy" = "Terraform"
  }
  force_destroy = true
}
# create bucket ACL :
resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucketweb.id
  acl    = "private"
}
# block public access :
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket = aws_s3_bucket.bucketweb.id
}
