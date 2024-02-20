resource "aws_s3_bucket" "bucketweb" {
  bucket = "bucketweb-sandra-aws"
}

resource "aws_s3_bucket_ownership_controls" "ownercontrol" {
  bucket = aws_s3_bucket.bucketweb.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bucketacl" {
  depends_on = [aws_s3_bucket_ownership_controls.ownercontrol]

  bucket = aws_s3_bucket.bucketweb.id
  acl    = "private"
}
