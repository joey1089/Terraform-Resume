# root-main
# Create a S3 bucket

resource "aws_s3_bucket" "resume_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "Resume-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "bucket_ownership_ctrl" {
  bucket = aws_s3_bucket.resume_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_access_policy" {
  bucket = aws_s3_bucket.resume_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_ownership_ctrl,
    aws_s3_bucket_public_access_block.bucket_access_policy,
  ]

  bucket = aws_s3_bucket.resume_bucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.resume_bucket.id
  key    = "index.html"
  source = "index.html"

  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.resume_bucket.id
  key    = "error.html"
  source = "error.html"

  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "styles" {
  bucket = aws_s3_bucket.resume_bucket.id
  key    = "styles.css"
  source = "styles.css"

  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "resume_pdf" {
  bucket = aws_s3_bucket.resume_bucket.id
  key = "jpresumev2.pdf"
  source = "jpresumev2.pdf"

  acl = "public-read"
  content_type = "text/pdf"
}

resource "aws_s3_bucket_website_configuration" "resume-s3-site" {
  bucket = aws_s3_bucket.resume_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.bucket_acl ]

}